/*
	Special Server-side only code.

*/
#include "MH2_C_V17Private.h"
#include "UnRender.h"
#include "UnRenDev.h"
#define FUNC_Replaced 0x10000000

IMPLEMENT_PACKAGE(MH2_C_V18);
IMPLEMENT_CLASS(AMonsterBasePlus);
IMPLEMENT_FUNCTION(AMonsterBasePlus,1961,execReplaceLastFunction);
IMPLEMENT_FUNCTION(AMonsterBasePlus,1960,execAddState);
IMPLEMENT_FUNCTION(AMonsterBasePlus,1959,execReplaceState);
IMPLEMENT_FUNCTION(AMonsterBasePlus,2036,execDeleteMap);
IMPLEMENT_FUNCTION(AMonsterBasePlus,1962,execCollideSphere);
IMPLEMENT_FUNCTION(AMonsterBasePlus,1963,execAllClasses);
IMPLEMENT_FUNCTION(AMonsterBasePlus,1964,execDrawLine3D);
//Small, simple registry that stores replaced states
struct StateDump
{
	UField* Children;
	UField* VfHash[UField::HASH_COUNT];
	_WORD LabelTableOffset;
	INT PropertiesSize;
	QWORD ProbeMask;
	QWORD IgnoreMask;
	FName Name;
};

//Faster than a dynamic array anyway
StateDump StoredStates[512];
int NumStates = 0;


// For iterating through a linked list of fields (don't search on superfield).
template <class T> class TStrictFieldIterator
{
public:
	TStrictFieldIterator( UStruct* InStruct )
	: Field( InStruct ? InStruct->Children : NULL )
	{
		IterateToNext();
	}
	void operator++()
	{
		Field = Field->Next;
		IterateToNext();
	}
	operator UBOOL()	{	return Field != NULL;	}
	T* operator*()		{	return (T*)Field;	}
	T* operator->()		{	return (T*)Field;	}
protected:
	void IterateToNext()
	{
		while( Field )
		{
			if( Field->IsA(T::StaticClass()) )
				return;
			Field = Field->Next;
		}
	}
	UField* Field;
};

 void 
	 AMonsterBasePlus::execReplaceLastFunction(FFrame& Stack, RESULT_DECL)
 {
		guard(AXC_Engine_Actor::execReplaceFunction);
	P_GET_OBJECT(UClass, ReplaceClass);
	P_GET_OBJECT(UClass, WithClass);
	P_GET_OBJECT(UClass, BaseClass);
	P_GET_NAME(ReplaceFunction);
	P_GET_NAME(WithFunction);
	P_GET_NAME_OPTX(InState, NAME_None);
	P_GET_NAME_OPTX(WithState, NAME_None);
	P_FINISH;


	//Original code by Higor
	//Modified by Chris
	
	*(UBOOL*)Result = 0;

	if(!GIsServer && !GIsClient)
		return;

	if(!BaseClass)
		BaseClass = UObject::StaticClass();
	
	if ( !ReplaceClass || !WithClass || ReplaceFunction == NAME_None || WithFunction == NAME_None)
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: called with bad or null parameters"));
		return;
	}
	
	if(!ReplaceClass->IsChildOf(BaseClass) )
	{
		debugf(L"Replace class %s is not a childclass of superclass %s", *ReplaceClass->GetFName(), *BaseClass->GetFName());
		return;
	}

	UState* AField = WithClass;
	if ( WithState != NAME_None )
	{
		UState* InUState = NULL;
		for( TStrictFieldIterator<UState> It( AField ); It; ++It )
			if( It->GetFName() == WithState )
			{
				InUState = *It;
				break;
			}
		if ( !InUState )
		{
			debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: cannot find WithState=%s in %s"), *InState, ReplaceClass->GetFullName() );
			return;
		}
		AField = InUState;
	}
	//Find template function we want to copy
	UFunction* WithFunc = NULL;
	{for( TStrictFieldIterator<UFunction> It( AField ); It; ++It )
		if( It->GetFName() == WithFunction )
		{
			WithFunc = *It;
			break;
	}	}
	if ( !WithFunc )
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: cannot find WithFunction=%s in %s"), *WithFunction, WithClass->GetFullName() );
		return;
	}

	UFunction* ReplaceFunc = NULL;
	//Iterate over all the classes
	for(UClass* Class = ReplaceClass; Class && Class != BaseClass->GetSuperClass(); Class = Class->GetSuperClass())
	{
		UState* Target = Class;
		//If we're expecting it to be in a state
		if(InState != NAME_None)
		{
			UState* InUState = NULL;
			for( TStrictFieldIterator<UState> It( Class ); It; ++It )
			{
				if( It->GetFName() == InState )
				{
					InUState = *It;
					break;
				}
			}
			if ( !InUState )
				continue;	//Don't continue searching if we didn't find it, as we're expecting a state
			Target = InUState;
		}

		for( TStrictFieldIterator<UFunction> It( Target ); It; ++It )
			if(It->GetFName() == ReplaceFunction)
				ReplaceFunc = *It;
		if(ReplaceFunc) break;
	}
	if ( !ReplaceFunc )
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: cannot find ReplaceFunction=%s in %s"), *ReplaceFunction, ReplaceClass->GetFullName() );
		return;
	}
	
	if(ReplaceFunc->FunctionFlags & FUNC_Replaced)
		return;
	//We have both WithFunc and ReplaceFunc
	//Validate function flags
	static DWORD FlagsForbidden = FUNC_PreOperator | FUNC_Operator;
	static DWORD FlagsKeep = FUNC_Net | FUNC_NetReliable | FUNC_Simulated | FUNC_Exec | FUNC_Event;
	static DWORD FlagsCopy = FUNC_Native | FUNC_Singular;
	static DWORD FlagsMustMatch = FUNC_Iterator | FUNC_Latent | FUNC_Static | FUNC_Const | FUNC_Invariant;
	
	if ( (WithFunc->FunctionFlags ^ ReplaceFunc->FunctionFlags) & FlagsMustMatch )
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: %s and %s have critical mismatching flags (Iterator, Latent, Static, Const, Invariant)"), *ReplaceFunction, *WithFunction );
		return;
	}
	if ( ReplaceFunc->FunctionFlags & FlagsForbidden )
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: Operator %s replacement is forbidden"), *ReplaceFunction);
		return;
	}
	if ( WithFunc->FunctionFlags & FlagsForbidden )
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: Operator %s cannot be used as replacement"), *WithFunction );
		return;
	}
	DWORD NewFlags = (ReplaceFunc->FunctionFlags & (FlagsKeep | FlagsMustMatch)) | (WithFunc->FunctionFlags & FlagsCopy);

	//Validate function parameters (simple)
	if ( WithFunc->NumParms != ReplaceFunc->NumParms )
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: %s and %s parameter count mismatch class %s"), *ReplaceFunction, *WithFunction, *ReplaceFunc->GetOwnerClass()->GetFName());
		return;
	}
	if ( WithFunc->ParmsSize != ReplaceFunc->ParmsSize )
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: %s and %s parameter size mismatch class %s"), *ReplaceFunction, *WithFunction , *ReplaceFunc->GetOwnerClass()->GetFName());
		return;
	}
	if ( WithFunc->ReturnValueOffset != ReplaceFunc->ReturnValueOffset )
	{
		debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: %s and %s have return value offset mismatch"), *ReplaceFunction, *WithFunction );
		return;
	}

	//Net reliable functions need extra care!!
	if ( (ReplaceFunc->FunctionFlags & FUNC_Net) && (ReplaceFunc->ParmsSize != 0) && !(NewFlags & FUNC_Native) )
	{
//		debugf( NAME_Log, TEXT("Net func found: %s"), ReplaceFunc->GetFullName() );
		if ( ReplaceFunc->PropertiesSize != WithFunc->PropertiesSize )
		{
			debugf(NAME_ScriptWarning, TEXT("ReplaceFunction: [NET] %s and %s have different properties size"), *ReplaceFunction, *WithFunction);
			return;
		}
		UProperty* RR = Cast<UProperty>(ReplaceFunc->Children);
		UProperty* WR = Cast<UProperty>(WithFunc->Children);
		while ( true )
		{
			if (!RR && !WR)
				break;

			if ( !RR || !WR )
			{
				debugf( NAME_ScriptWarning, TEXT("ReplaceFunction: [NET] %s and %s have different property count"), *ReplaceFunction, *WithFunction);
				return;
			}
			if ( (RR->PropertyFlags ^ WR->PropertyFlags) & CPF_Parm )
			{
				debugf(NAME_ScriptWarning, TEXT("ReplaceFunction: [NET] %s.%s and %s.%s have mismatching parameter flags"), *ReplaceFunction, *WithFunction, RR->GetName(), WR->GetName() );
				return;
			}
			if ( RR->GetClass() != WR->GetClass() )
			{
				debugf(NAME_ScriptWarning, TEXT("ReplaceFunction: [NET] %s.%s and %s.%s have mismatching class"), *ReplaceFunction, *WithFunction, RR->GetName(), WR->GetName());
				return;
			}
			RR = Cast<UProperty>(RR->Next);
			WR = Cast<UProperty>(WR->Next);
		}
	}

	//Replace!
	ReplaceFunc->FunctionFlags = NewFlags | FUNC_Replaced;
	ReplaceFunc->Func = WithFunc->Func;
	if ( !(NewFlags & FUNC_Native) ) //Script to Script requires extra stuff
	{
		if ( !(NewFlags & FUNC_Net) )
		{
			ReplaceFunc->PropertiesSize = WithFunc->PropertiesSize;
			ReplaceFunc->Children = WithFunc->Children; //CHECK!!
		}
		ReplaceFunc->Script = WithFunc->Script;
	}
	else //Replacing a native function, replace GNatives entry too!!!
	{
		INT iN = ReplaceFunc->iNative;
		if ( iN>0 && iN<4096 && (GNatives[iN] != (Native)&UObject::ProcessInternal) )
			GNatives[iN] = WithFunc->Func;
	}
//	ReplaceFunc->iNative = WithFunc->iNative;

	*(UBOOL*)Result = 1;
	unguard;
 }

 void AMonsterBasePlus::execCollideSphere( FFrame& Stack, RESULT_DECL)
 {
	 guard(CollideSphere);

	 P_GET_VECTOR(Location);
	 P_GET_INT(Radius);
	 P_FINISH;
	 
	 int bResult = 0;

	 bResult += GetLevel()->Model->FastLineCheck(Location - FVector(0, 0, Radius), Location + FVector(0, 0, Radius) );
	 bResult += GetLevel()->Model->FastLineCheck(Location - FVector(0, Radius, 0), Location + FVector(0, Radius, 0) );
	 bResult += GetLevel()->Model->FastLineCheck(Location - FVector(Radius, 0, 0), Location + FVector(Radius, 0, 0) );

	 if(bResult > 1)
		 bResult = 1;

	 *(UBOOL*)Result = bResult;

	 unguard;
 }

 void AMonsterBasePlus::execDeleteMap(FFrame &Stack, RESULT_DECL)
 {
	 P_GET_STR(Map);
	 P_FINISH;

	 if(Map.Len() == 0)
		 return;
	 TCHAR* MapPath = appStaticString1024();
	 appStrcpy(MapPath, L"..\\Maps\\");
	 appStrcat(MapPath, *Map);
	 GFileManager->Delete(MapPath);
 }

 void AMonsterBasePlus::execReplaceState( FFrame& Stack, RESULT_DECL)
{
	guard(ReplaceState);
	P_GET_OBJECT(UClass, Dest);		//To state
	P_GET_OBJECT(UClass, Source);	//From state
	P_GET_NAME(State);
	P_GET_NAME(With);
	P_FINISH;

	//Find the state
	UState* DstState = NULL;
	for( TStrictFieldIterator<UState> It(Dest); It; ++It)
	{
		if(It->GetFName() == State)
		{
			DstState = *It;
			break;
		}
	}
	if(!DstState)
	{
		GLog->Logf(L"Failed to find state %s in class %s", *State, Dest->GetName());
		*(UBOOL*)Result = 0;
		return;
	}

	UState* SourceState = NULL;
	for(TStrictFieldIterator<UState> It(Source); It; ++It)
	{
		if(It->GetFName() == With)
		{
			SourceState = *It;
			break;
		}
	}
	if(!SourceState)
	{
		GLog->Logf(L"Failed to find state %s in class %s", *With, Source->GetName());
		*(UBOOL*)Result = 0;
		return;
	}

	//Do some more magic
	struct FStateRecord
	{
		UObject* Obj;
		FName LastEntry;
	};

	FStateRecord Objects[4096];	//Store the objects currently using this state
	int ObjIndex = 0;

	/*
		There may be objects that are currently using this state
		We therefore have to temporarily take them out of the state, then put them back in.
	*/
#define DELTAENT ( (int)(It->GetStateFrame()->Code - &DstState->Script(0)) - Entry->iCode) //Distance from current Label entry
#define DELTAIT	 ( ((int)(It->GetStateFrame()->Code - &DstState->Script(0))) - FLabel->iCode ) //Distance from iterator label
	//Try this
	
	for(FObjectIterator It; It; ++It)
	{
		if(It && It->IsA(AActor::StaticClass()))
		{
			if(It->GetStateFrame() && It->GetStateFrame()->StateNode && It->GetStateFrame()->StateNode->GetFName() == State)
			{
				//Save relevant object to restore its state
				Objects[ObjIndex].Obj = *It;

				//Entry
				FLabelEntry *Entry = NULL;

				//Find current label.
				if(DstState->LabelTableOffset != MAXWORD)
				{
					for(FLabelEntry* FLabel = (FLabelEntry*)&(DstState->Script(DstState->LabelTableOffset)); FLabel->Name != NAME_None; FLabel++)
					{
						if(DELTAIT >= 0) //Any label that isn't further down
						{
							//Measure the smallest reverse delta to find the previous label
							if(!Entry)
								Entry = FLabel;
							else if(FLabel->iCode > Entry->iCode) //Closer to current code offset
								Entry = FLabel;
							
						}
					}
					if(Entry)
						Objects[ObjIndex].LastEntry = Entry->Name;
					else
						Objects[ObjIndex].LastEntry = NAME_Begin;
				}
				else
					Objects[ObjIndex].LastEntry = NAME_Begin;
				//We have to let the object update its FStateFrame to use the new state. 
				//Therefore skip out of the current state, after saving it. Then jump back later
				It->GotoState(NAME_None);
				++ObjIndex;
			}
		}
	}

	if(!Dest || !Source || State == NAME_None || With == NAME_None)
	{
		*(UBOOL*)Result = 0;
		return;
	}

	//Save destionation state
	StateDump& Dump = StoredStates[NumStates++];
	Dump.Children			= DstState->Children;
	appMemcpy(Dump.VfHash, DstState->VfHash, sizeof(void*) * UField::HASH_COUNT );
	Dump.LabelTableOffset	= DstState->LabelTableOffset;
	Dump.IgnoreMask			= DstState->IgnoreMask;
	Dump.ProbeMask			= DstState->ProbeMask;
	Dump.PropertiesSize		= DstState->PropertiesSize;
	Dump.Name				= DstState->GetFName();

	//States consists of an index to the label entry
	DstState->LabelTableOffset = SourceState->LabelTableOffset;
	appMemcpy(DstState->VfHash, SourceState->VfHash, sizeof(void*) * UField::HASH_COUNT);
	DstState->Children = SourceState->Children;
	DstState->PropertiesSize = SourceState->PropertiesSize;
	DstState->ProbeMask = SourceState->ProbeMask;
	DstState->IgnoreMask = SourceState->IgnoreMask;
	
	//For some reason, VS2010 thinks that it should import template functions when using unsigned char. Template functions will almost always be created in the local DLL, not imported externally
	//Fix added to public headers
	DstState->Script = SourceState->Script;
	
	for(int i = 0; i < ObjIndex; ++i)
	{
		int res = Objects[i].Obj->GotoState(State);	//The state needs to reboot after this
		if(!Objects[i].Obj->GotoLabel(Objects[i].LastEntry));
		{
			Objects[i].Obj->GotoLabel(NAME_Begin);
			GLog->Logf(L"Can't find label, using begin");
		}
	}
	GLog->Logf(L"Sucessfully replaced state %s in class %s with state %s in class %s", *State, Dest->GetName(), *With, Source->GetName());
	*(UBOOL*)Result = 1;
	unguard;
}

void AMonsterBasePlus::execAddState( FFrame& Stack, RESULT_DECL)
{
	guard(AddState);
	P_GET_OBJECT(UClass, Dest);		//To state
	P_GET_OBJECT(UClass, Source);	//From state
	P_GET_NAME(State);
	P_FINISH;

	//!!! Make sure the state doesn't already exist
	for(TStrictFieldIterator<UState> It(Dest); It; ++It)
	{
		if(It->GetFName() == State)
		{
			GLog->Logf(L"State %s already exists in class %s", *State, *Dest->GetFName());
			*(UBOOL*)Result = 0;
			return;
		}
	}

	//Find the state
	UState* SourceState = NULL;
	for(TStrictFieldIterator<UState> It(Source); It; ++It)
	{
		if(It->GetFName() == State)
		{
			SourceState = *It;
			break;
		}
	}
	if(!SourceState)
	{
		GLog->Logf(L"Failed to find state %s in class %s", *State, Source->GetName());
		*(UBOOL*)Result = 0;
		return;
	}

	

	//Add the state to the chain.
	SourceState->Next = Dest->Children;
	Dest->Children = SourceState;
	Dest->VfHash[State.GetIndex() & 0xFF] = SourceState;
	unguard;

}

void AMonsterBasePlus::execAllClasses( FFrame& Stack, RESULT_DECL )
{
	guard(AllClasses);
	P_GET_OBJECT_REF(UClass, OutClass);
	P_GET_OBJECT_OPTX(UClass, BaseClass, UObject::StaticClass());
	P_FINISH;

	TObjectIterator<UClass> It;
	PRE_ITERATOR;
	//Assign OutClass
	while(It && !It->IsChildOf(BaseClass))
		++It;
	*OutClass = *It;
	++It; //Move to the next class

	while(It && !It->IsChildOf(BaseClass))
		It++;//Skip classes that doesn't match the base

	if(!It)
	{
		Stack.Code = &Stack.Node->Script(wEndOffset + 1);	//Jump out of stack
		break;
	}
	POST_ITERATOR;

	unguard;
}

void AMonsterBasePlus::execDrawLine3D( FFrame& Stack, RESULT_DECL )
{
	P_GET_OBJECT(UCanvas, C);
	P_GET_VECTOR(From);
	P_GET_VECTOR(To);
	P_FINISH;
	From.Z = 1;
	To.Z = 1;
	FColor Col(128, 128, 128);
	C->Viewport->RenDev->Draw2DLine(C->Frame, Col.Plane(), 2, From, To);
}


//Debug stack
FString DebugStack = L"";


void AMonsterBasePlus::execNewContext( FFrame& Stack, RESULT_DECL )
{
	guardSlow(AMonsterBasePlus::execNewContext);

	// Get actor variable.
	UObject* NewContext=NULL;
	DebugStack = L"Try Fetching context >> ";
	Stack.Step( this, &NewContext );

	// Execute or skip the following expression in the actor's context.
	if( NewContext != NULL )
	{
		Stack.Code += 3;	//This skips the jump and size data
		Stack.Step( NewContext, Result );
	}
	else
	{
		
		
		INT wSkip = Stack.ReadWord();	//2
		BYTE bSize = *Stack.Code++;		//1
		BYTE* EIP = Stack.Code;
		INT OpCode = *Stack.Code++;	//We'll always start with an opcode
		const TCHAR* Target = L"";
		if(OpCode == EX_InstanceVariable || OpCode == EX_DefaultVariable)	//We'll either have an instance variable, a native function call, a final function call or a virtual function call
			Target = *((UProperty*)Stack.ReadObject())->GetFName();
		else if(OpCode & EX_ExtendedNative || OpCode & EX_FirstNative)	//Extended uses two bytes to describe the opcode
		{
			if(OpCode & EX_ExtendedNative)
			{
				INT ExOp = *Stack.Code++;
				OpCode = ((OpCode - 0x60) * 0x100) + ExOp;
			}
			//This is slow! The only way we can find the function name is to find the UFunction that points to this address
			Native Nat = GNatives[OpCode];
			for(TObjectIterator<UFunction> It; It; ++It)	//Reverse lookup
			{
				if(It->Func == Nat)
					Target = *It->GetFName();
			}
		}
		else if(OpCode & EX_FinalFunction)
		{
			//This one is easy..
			Target = *((UFunction*)Stack.ReadObject())->GetFName();
		}
		else if(OpCode & EX_VirtualFunction)
		{
			//This one too
			Target = *Stack.ReadName();
		}

		Stack.Logf( TEXT("Accessed None '%s' Next Op '%u' Stack: %s"), Target, OpCode,  *DebugStack);
		DebugStack = L"";
		Stack.Code = EIP;
		Stack.Code += wSkip;
		GPropAddr = NULL;
		GProperty = NULL;
		if( Result )
			appMemzero( Result, bSize );
	}
	unguardexecSlow;
}

void AMonsterBasePlus::execDebugDynamicCast( FFrame& Stack, RESULT_DECL )
{
	guardSlow(AMonsterBasePlus::execDebugDynamicCast);

	// Get destination class of dynamic actor class.
	UClass* Class = (UClass *)Stack.ReadObject();

	DebugStack += L"Casting Object Class ";
	if(Class)
		DebugStack += (*Class->GetFName());
	DebugStack += L" >> ( ";

	// Compile object expression.
	UObject* Castee = NULL;
	Stack.Step( Stack.Object, &Castee );
	*(UObject**)Result = (Castee && Castee->IsA(Class)) ? Castee : NULL;

	DebugStack += L" ) << Cast Object's class ";
	if(Castee)
		DebugStack += *Castee->GetClass()->GetFName();
	DebugStack += L" Failed? ";
	DebugStack += *(UObject**)Result ? L"No" : L"Yes";
	DebugStack += L"\n";
	unguardexecSlow;
}

void AMonsterBasePlus::execDebugLocalVariable( FFrame& Stack, RESULT_DECL )
{
	guardSlow(UObject::execLocalVariable);

	checkSlow(Stack.Object==this);
	checkSlow(Stack.Locals!=NULL);

	DebugStack += L" , Local variable: ";
	

	GProperty = (UProperty*)Stack.ReadObject();
	GPropAddr = Stack.Locals + GProperty->Offset;

	if(GProperty->IsA(UObjectProperty::StaticClass()))
	{
		DebugStack += *GProperty->GetFName();
		DebugStack += *(UObject**)GPropAddr ? L" Not null \n" : L" Null \n";
	}

	if( Result )
		GProperty->CopyCompleteValue( Result, GPropAddr );

	unguardexecSlow;
}

void AMonsterBasePlus::execDebugInstanceVariable( FFrame& Stack, RESULT_DECL )
{
	guardSlow(UObject::execInstanceVariable);

	DebugStack += L" , Instance variable: ";

	GProperty = (UProperty*)Stack.ReadObject();
	GPropAddr = (BYTE*)this + GProperty->Offset;

	if(GProperty->IsA(UObjectProperty::StaticClass()))
	{
		DebugStack += *GProperty->GetFName();
		DebugStack += *(UObject**)GPropAddr ? L" Not null \n" : L" Null \n";
	}
	
	if( Result )
		GProperty->CopyCompleteValue( Result, GPropAddr );

	unguardexecSlow;
}

void AMonsterBasePlus::execDebugDefaultVariable( FFrame& Stack, RESULT_DECL )
{
	guardSlow(UObject::execDefaultVariable);

	DebugStack += L" , Default variable: ";

	GProperty = (UProperty*)Stack.ReadObject();
	GPropAddr = (BYTE*)&GetClass()->Defaults(GProperty->Offset);

	if(GProperty->IsA(UObjectProperty::StaticClass()))
	{
		DebugStack += *GProperty->GetFName();
		DebugStack += *(UObject**)GPropAddr ? L" Not null \n" : L" Null \n";
	}

	if( Result )
		GProperty->CopyCompleteValue( Result, GPropAddr );

	unguardexecSlow;
}

void AMonsterBasePlus::execDebugLet( FFrame& Stack, RESULT_DECL )
{
	guardSlow(AMonsterBasePlus::execDebugLet);
	checkSlow(!IsA(UBoolProperty::StaticClass()));

	// Get variable address.
	GPropAddr = NULL;
	Stack.Step( Stack.Object, NULL ); // Evaluate variable.
	if( !GPropAddr )
	{
		Stack.Logf( NAME_ScriptWarning, TEXT("Attempt to assigned variable through None : Var '%s' : Stack >> : %s"), *GetFName(), *DebugStack );
		DebugStack = L"";

		//LOL I see what you did there...
		static BYTE Crud[1024];//!!temp
		GPropAddr = Crud;
		appMemzero( GPropAddr, sizeof(FString) );
	}
	Stack.Step( Stack.Object, GPropAddr ); // Evaluate expression into variable.

	unguardexecSlow;
}

void AMonsterBasePlus::execDebugClassContext( FFrame& Stack, RESULT_DECL )
{
	guard(AMonsterBasePlus::execDebugClassContext);

	// Get class expression.
	UClass* ClassContext=NULL;
	Stack.Step( Stack.Object, &ClassContext );

	// Execute expression in class context.
	if( ClassContext )
	{
		Stack.Code += 3;
		Stack.Step( ClassContext->GetDefaultObject(), Result );
	}
	else
	{
	
		INT wSkip = Stack.ReadWord();
		BYTE bSize = *Stack.Code++;

		BYTE* EIP = Stack.Code;
		INT OpCode = *Stack.Code++;	//We'll always start with an opcode
		const TCHAR* Target = L"";
		if(OpCode == EX_InstanceVariable || OpCode == EX_DefaultVariable)	//We'll either have an instance variable, a native function call, a final function call or a virtual function call
			Target = *((UProperty*)Stack.ReadObject())->GetFName();
		else if(OpCode & EX_ExtendedNative || OpCode & EX_FirstNative)	//Extended uses two bytes to describe the opcode
		{
			if(OpCode & EX_ExtendedNative)
			{
				INT ExOp = *Stack.Code++;
				OpCode = ((OpCode - 0x60) * 0x100) + ExOp;
			}
			//This is slow! The only way we can find the function name is to find the UFunction that points to this address
			Native Nat = GNatives[OpCode];
			for(TObjectIterator<UFunction> It; It; ++It)	//Reverse lookup
			{
				if(It->Func == Nat)
					Target = *It->GetFName();
			}
		}
		else if(OpCode & EX_FinalFunction)
		{
			//This one is easy..
			Target = *((UFunction*)Stack.ReadObject())->GetFName();
		}
		else if(OpCode & EX_VirtualFunction)
		{
			//This one too
			Target = *Stack.ReadName();
		}
		
		Stack.Logf( TEXT("Accessed null class context: Var '%s' : Stack: %s"), Target, *DebugStack );
		DebugStack = L"";

		Stack.Code = EIP;

		Stack.Code += wSkip;
		GPropAddr = NULL;
		GProperty = NULL;
		if( Result )
			appMemzero( Result, bSize );
	}
	unguardexec;
}

bool RegisterOpCodes()
{
	GNatives[EX_Context] = (Native)&AMonsterBasePlus::execNewContext;
	GNatives[EX_DynamicCast] = (Native)&AMonsterBasePlus::execDebugDynamicCast;
	GNatives[EX_DefaultVariable] = (Native)&AMonsterBasePlus::execDebugDefaultVariable;
	GNatives[EX_InstanceVariable] = (Native)&AMonsterBasePlus::execDebugInstanceVariable;
	GNatives[EX_LocalVariable] = (Native)&AMonsterBasePlus::execDebugLocalVariable;
	GNatives[EX_Let] = (Native)&AMonsterBasePlus::execDebugLet;
	GNatives[EX_ClassContext] = (Native)&AMonsterBasePlus::execDebugClassContext;
	
	return true;
}

//bool TRes = RegisterOpCodes();
