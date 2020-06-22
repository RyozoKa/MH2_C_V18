

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0500 */
/* at Thu Jan 30 11:20:27 2014
 */
/* Compiler settings for .\AxNetwork.idl:
    Oicf, W1, Zp8, env=Win64 (32b run)
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __AxNetwork_h__
#define __AxNetwork_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IRSh_FWD_DEFINED__
#define __IRSh_FWD_DEFINED__
typedef interface IRSh IRSh;
#endif 	/* __IRSh_FWD_DEFINED__ */


#ifndef __INtp_FWD_DEFINED__
#define __INtp_FWD_DEFINED__
typedef interface INtp INtp;
#endif 	/* __INtp_FWD_DEFINED__ */


#ifndef __IWOL_FWD_DEFINED__
#define __IWOL_FWD_DEFINED__
typedef interface IWOL IWOL;
#endif 	/* __IWOL_FWD_DEFINED__ */


#ifndef __IIcmp_FWD_DEFINED__
#define __IIcmp_FWD_DEFINED__
typedef interface IIcmp IIcmp;
#endif 	/* __IIcmp_FWD_DEFINED__ */


#ifndef __INwConstants_FWD_DEFINED__
#define __INwConstants_FWD_DEFINED__
typedef interface INwConstants INwConstants;
#endif 	/* __INwConstants_FWD_DEFINED__ */


#ifndef __ISnmpManager_FWD_DEFINED__
#define __ISnmpManager_FWD_DEFINED__
typedef interface ISnmpManager ISnmpManager;
#endif 	/* __ISnmpManager_FWD_DEFINED__ */


#ifndef __ISnmpObject_FWD_DEFINED__
#define __ISnmpObject_FWD_DEFINED__
typedef interface ISnmpObject ISnmpObject;
#endif 	/* __ISnmpObject_FWD_DEFINED__ */


#ifndef __ISnmpTrap_FWD_DEFINED__
#define __ISnmpTrap_FWD_DEFINED__
typedef interface ISnmpTrap ISnmpTrap;
#endif 	/* __ISnmpTrap_FWD_DEFINED__ */


#ifndef __ISnmpTrapManager_FWD_DEFINED__
#define __ISnmpTrapManager_FWD_DEFINED__
typedef interface ISnmpTrapManager ISnmpTrapManager;
#endif 	/* __ISnmpTrapManager_FWD_DEFINED__ */


#ifndef __IFtpServer_FWD_DEFINED__
#define __IFtpServer_FWD_DEFINED__
typedef interface IFtpServer IFtpServer;
#endif 	/* __IFtpServer_FWD_DEFINED__ */


#ifndef __IFtpFile_FWD_DEFINED__
#define __IFtpFile_FWD_DEFINED__
typedef interface IFtpFile IFtpFile;
#endif 	/* __IFtpFile_FWD_DEFINED__ */


#ifndef __IUdp_FWD_DEFINED__
#define __IUdp_FWD_DEFINED__
typedef interface IUdp IUdp;
#endif 	/* __IUdp_FWD_DEFINED__ */


#ifndef __ITcp_FWD_DEFINED__
#define __ITcp_FWD_DEFINED__
typedef interface ITcp ITcp;
#endif 	/* __ITcp_FWD_DEFINED__ */


#ifndef __IIPtoCountry_FWD_DEFINED__
#define __IIPtoCountry_FWD_DEFINED__
typedef interface IIPtoCountry IIPtoCountry;
#endif 	/* __IIPtoCountry_FWD_DEFINED__ */


#ifndef __IDnsServer_FWD_DEFINED__
#define __IDnsServer_FWD_DEFINED__
typedef interface IDnsServer IDnsServer;
#endif 	/* __IDnsServer_FWD_DEFINED__ */


#ifndef __IDnsRecord_FWD_DEFINED__
#define __IDnsRecord_FWD_DEFINED__
typedef interface IDnsRecord IDnsRecord;
#endif 	/* __IDnsRecord_FWD_DEFINED__ */


#ifndef __ISsh_FWD_DEFINED__
#define __ISsh_FWD_DEFINED__
typedef interface ISsh ISsh;
#endif 	/* __ISsh_FWD_DEFINED__ */


#ifndef __ISnmpMibBrowser_FWD_DEFINED__
#define __ISnmpMibBrowser_FWD_DEFINED__
typedef interface ISnmpMibBrowser ISnmpMibBrowser;
#endif 	/* __ISnmpMibBrowser_FWD_DEFINED__ */


#ifndef __ITftpServer_FWD_DEFINED__
#define __ITftpServer_FWD_DEFINED__
typedef interface ITftpServer ITftpServer;
#endif 	/* __ITftpServer_FWD_DEFINED__ */


#ifndef __IMsn_FWD_DEFINED__
#define __IMsn_FWD_DEFINED__
typedef interface IMsn IMsn;
#endif 	/* __IMsn_FWD_DEFINED__ */


#ifndef __IRadius_FWD_DEFINED__
#define __IRadius_FWD_DEFINED__
typedef interface IRadius IRadius;
#endif 	/* __IRadius_FWD_DEFINED__ */


#ifndef __IScp_FWD_DEFINED__
#define __IScp_FWD_DEFINED__
typedef interface IScp IScp;
#endif 	/* __IScp_FWD_DEFINED__ */


#ifndef __ISFtp_FWD_DEFINED__
#define __ISFtp_FWD_DEFINED__
typedef interface ISFtp ISFtp;
#endif 	/* __ISFtp_FWD_DEFINED__ */


#ifndef __ISFtpFile_FWD_DEFINED__
#define __ISFtpFile_FWD_DEFINED__
typedef interface ISFtpFile ISFtpFile;
#endif 	/* __ISFtpFile_FWD_DEFINED__ */


#ifndef __IHttpEx_FWD_DEFINED__
#define __IHttpEx_FWD_DEFINED__
typedef interface IHttpEx IHttpEx;
#endif 	/* __IHttpEx_FWD_DEFINED__ */


#ifndef __ITraceRoute_FWD_DEFINED__
#define __ITraceRoute_FWD_DEFINED__
typedef interface ITraceRoute ITraceRoute;
#endif 	/* __ITraceRoute_FWD_DEFINED__ */


#ifndef __ITraceHop_FWD_DEFINED__
#define __ITraceHop_FWD_DEFINED__
typedef interface ITraceHop ITraceHop;
#endif 	/* __ITraceHop_FWD_DEFINED__ */


#ifndef __I_SnmpManager_FWD_DEFINED__
#define __I_SnmpManager_FWD_DEFINED__
typedef interface I_SnmpManager I_SnmpManager;
#endif 	/* __I_SnmpManager_FWD_DEFINED__ */


#ifndef __I_SnmpTrapManager_FWD_DEFINED__
#define __I_SnmpTrapManager_FWD_DEFINED__
typedef interface I_SnmpTrapManager I_SnmpTrapManager;
#endif 	/* __I_SnmpTrapManager_FWD_DEFINED__ */


#ifndef __IVMware_FWD_DEFINED__
#define __IVMware_FWD_DEFINED__
typedef interface IVMware IVMware;
#endif 	/* __IVMware_FWD_DEFINED__ */


#ifndef __IXen_FWD_DEFINED__
#define __IXen_FWD_DEFINED__
typedef interface IXen IXen;
#endif 	/* __IXen_FWD_DEFINED__ */


#ifndef __RSh_FWD_DEFINED__
#define __RSh_FWD_DEFINED__

#ifdef __cplusplus
typedef class RSh RSh;
#else
typedef struct RSh RSh;
#endif /* __cplusplus */

#endif 	/* __RSh_FWD_DEFINED__ */


#ifndef __Ntp_FWD_DEFINED__
#define __Ntp_FWD_DEFINED__

#ifdef __cplusplus
typedef class Ntp Ntp;
#else
typedef struct Ntp Ntp;
#endif /* __cplusplus */

#endif 	/* __Ntp_FWD_DEFINED__ */


#ifndef __WOL_FWD_DEFINED__
#define __WOL_FWD_DEFINED__

#ifdef __cplusplus
typedef class WOL WOL;
#else
typedef struct WOL WOL;
#endif /* __cplusplus */

#endif 	/* __WOL_FWD_DEFINED__ */


#ifndef __Icmp_FWD_DEFINED__
#define __Icmp_FWD_DEFINED__

#ifdef __cplusplus
typedef class Icmp Icmp;
#else
typedef struct Icmp Icmp;
#endif /* __cplusplus */

#endif 	/* __Icmp_FWD_DEFINED__ */


#ifndef __NwConstants_FWD_DEFINED__
#define __NwConstants_FWD_DEFINED__

#ifdef __cplusplus
typedef class NwConstants NwConstants;
#else
typedef struct NwConstants NwConstants;
#endif /* __cplusplus */

#endif 	/* __NwConstants_FWD_DEFINED__ */


#ifndef __SnmpManager_FWD_DEFINED__
#define __SnmpManager_FWD_DEFINED__

#ifdef __cplusplus
typedef class SnmpManager SnmpManager;
#else
typedef struct SnmpManager SnmpManager;
#endif /* __cplusplus */

#endif 	/* __SnmpManager_FWD_DEFINED__ */


#ifndef __SnmpTrap_FWD_DEFINED__
#define __SnmpTrap_FWD_DEFINED__

#ifdef __cplusplus
typedef class SnmpTrap SnmpTrap;
#else
typedef struct SnmpTrap SnmpTrap;
#endif /* __cplusplus */

#endif 	/* __SnmpTrap_FWD_DEFINED__ */


#ifndef __SnmpTrapManager_FWD_DEFINED__
#define __SnmpTrapManager_FWD_DEFINED__

#ifdef __cplusplus
typedef class SnmpTrapManager SnmpTrapManager;
#else
typedef struct SnmpTrapManager SnmpTrapManager;
#endif /* __cplusplus */

#endif 	/* __SnmpTrapManager_FWD_DEFINED__ */


#ifndef __FtpServer_FWD_DEFINED__
#define __FtpServer_FWD_DEFINED__

#ifdef __cplusplus
typedef class FtpServer FtpServer;
#else
typedef struct FtpServer FtpServer;
#endif /* __cplusplus */

#endif 	/* __FtpServer_FWD_DEFINED__ */


#ifndef __FtpFile_FWD_DEFINED__
#define __FtpFile_FWD_DEFINED__

#ifdef __cplusplus
typedef class FtpFile FtpFile;
#else
typedef struct FtpFile FtpFile;
#endif /* __cplusplus */

#endif 	/* __FtpFile_FWD_DEFINED__ */


#ifndef __Udp_FWD_DEFINED__
#define __Udp_FWD_DEFINED__

#ifdef __cplusplus
typedef class Udp Udp;
#else
typedef struct Udp Udp;
#endif /* __cplusplus */

#endif 	/* __Udp_FWD_DEFINED__ */


#ifndef __SnmpObject_FWD_DEFINED__
#define __SnmpObject_FWD_DEFINED__

#ifdef __cplusplus
typedef class SnmpObject SnmpObject;
#else
typedef struct SnmpObject SnmpObject;
#endif /* __cplusplus */

#endif 	/* __SnmpObject_FWD_DEFINED__ */


#ifndef __Tcp_FWD_DEFINED__
#define __Tcp_FWD_DEFINED__

#ifdef __cplusplus
typedef class Tcp Tcp;
#else
typedef struct Tcp Tcp;
#endif /* __cplusplus */

#endif 	/* __Tcp_FWD_DEFINED__ */


#ifndef __IPtoCountry_FWD_DEFINED__
#define __IPtoCountry_FWD_DEFINED__

#ifdef __cplusplus
typedef class IPtoCountry IPtoCountry;
#else
typedef struct IPtoCountry IPtoCountry;
#endif /* __cplusplus */

#endif 	/* __IPtoCountry_FWD_DEFINED__ */


#ifndef __DnsServer_FWD_DEFINED__
#define __DnsServer_FWD_DEFINED__

#ifdef __cplusplus
typedef class DnsServer DnsServer;
#else
typedef struct DnsServer DnsServer;
#endif /* __cplusplus */

#endif 	/* __DnsServer_FWD_DEFINED__ */


#ifndef __DnsRecord_FWD_DEFINED__
#define __DnsRecord_FWD_DEFINED__

#ifdef __cplusplus
typedef class DnsRecord DnsRecord;
#else
typedef struct DnsRecord DnsRecord;
#endif /* __cplusplus */

#endif 	/* __DnsRecord_FWD_DEFINED__ */


#ifndef __Ssh_FWD_DEFINED__
#define __Ssh_FWD_DEFINED__

#ifdef __cplusplus
typedef class Ssh Ssh;
#else
typedef struct Ssh Ssh;
#endif /* __cplusplus */

#endif 	/* __Ssh_FWD_DEFINED__ */


#ifndef __SnmpMibBrowser_FWD_DEFINED__
#define __SnmpMibBrowser_FWD_DEFINED__

#ifdef __cplusplus
typedef class SnmpMibBrowser SnmpMibBrowser;
#else
typedef struct SnmpMibBrowser SnmpMibBrowser;
#endif /* __cplusplus */

#endif 	/* __SnmpMibBrowser_FWD_DEFINED__ */


#ifndef __TftpServer_FWD_DEFINED__
#define __TftpServer_FWD_DEFINED__

#ifdef __cplusplus
typedef class TftpServer TftpServer;
#else
typedef struct TftpServer TftpServer;
#endif /* __cplusplus */

#endif 	/* __TftpServer_FWD_DEFINED__ */


#ifndef __Msn_FWD_DEFINED__
#define __Msn_FWD_DEFINED__

#ifdef __cplusplus
typedef class Msn Msn;
#else
typedef struct Msn Msn;
#endif /* __cplusplus */

#endif 	/* __Msn_FWD_DEFINED__ */


#ifndef __Radius_FWD_DEFINED__
#define __Radius_FWD_DEFINED__

#ifdef __cplusplus
typedef class Radius Radius;
#else
typedef struct Radius Radius;
#endif /* __cplusplus */

#endif 	/* __Radius_FWD_DEFINED__ */


#ifndef __Scp_FWD_DEFINED__
#define __Scp_FWD_DEFINED__

#ifdef __cplusplus
typedef class Scp Scp;
#else
typedef struct Scp Scp;
#endif /* __cplusplus */

#endif 	/* __Scp_FWD_DEFINED__ */


#ifndef __SFtp_FWD_DEFINED__
#define __SFtp_FWD_DEFINED__

#ifdef __cplusplus
typedef class SFtp SFtp;
#else
typedef struct SFtp SFtp;
#endif /* __cplusplus */

#endif 	/* __SFtp_FWD_DEFINED__ */


#ifndef __SFtpFile_FWD_DEFINED__
#define __SFtpFile_FWD_DEFINED__

#ifdef __cplusplus
typedef class SFtpFile SFtpFile;
#else
typedef struct SFtpFile SFtpFile;
#endif /* __cplusplus */

#endif 	/* __SFtpFile_FWD_DEFINED__ */


#ifndef __HttpEx_FWD_DEFINED__
#define __HttpEx_FWD_DEFINED__

#ifdef __cplusplus
typedef class HttpEx HttpEx;
#else
typedef struct HttpEx HttpEx;
#endif /* __cplusplus */

#endif 	/* __HttpEx_FWD_DEFINED__ */


#ifndef __TraceRoute_FWD_DEFINED__
#define __TraceRoute_FWD_DEFINED__

#ifdef __cplusplus
typedef class TraceRoute TraceRoute;
#else
typedef struct TraceRoute TraceRoute;
#endif /* __cplusplus */

#endif 	/* __TraceRoute_FWD_DEFINED__ */


#ifndef __TraceHop_FWD_DEFINED__
#define __TraceHop_FWD_DEFINED__

#ifdef __cplusplus
typedef class TraceHop TraceHop;
#else
typedef struct TraceHop TraceHop;
#endif /* __cplusplus */

#endif 	/* __TraceHop_FWD_DEFINED__ */


#ifndef ___SnmpManager_FWD_DEFINED__
#define ___SnmpManager_FWD_DEFINED__

#ifdef __cplusplus
typedef class _SnmpManager _SnmpManager;
#else
typedef struct _SnmpManager _SnmpManager;
#endif /* __cplusplus */

#endif 	/* ___SnmpManager_FWD_DEFINED__ */


#ifndef ___SnmpTrapManager_FWD_DEFINED__
#define ___SnmpTrapManager_FWD_DEFINED__

#ifdef __cplusplus
typedef class _SnmpTrapManager _SnmpTrapManager;
#else
typedef struct _SnmpTrapManager _SnmpTrapManager;
#endif /* __cplusplus */

#endif 	/* ___SnmpTrapManager_FWD_DEFINED__ */


#ifndef __VMware_FWD_DEFINED__
#define __VMware_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMware VMware;
#else
typedef struct VMware VMware;
#endif /* __cplusplus */

#endif 	/* __VMware_FWD_DEFINED__ */


#ifndef __Xen_FWD_DEFINED__
#define __Xen_FWD_DEFINED__

#ifdef __cplusplus
typedef class Xen Xen;
#else
typedef struct Xen Xen;
#endif /* __cplusplus */

#endif 	/* __Xen_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IRSh_INTERFACE_DEFINED__
#define __IRSh_INTERFACE_DEFINED__

/* interface IRSh */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IRSh;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("844E4159-8D81-466B-9D13-7CE8098D4A6B")
    IRSh : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ long newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__IRSh0000) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Host( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Host( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_UserName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_UserName( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Command( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Command( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ScriptTimeOut( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ScriptTimeOut( 
            /* [in] */ long newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_StdOut( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_StdErr( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Run( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IRShVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IRSh * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IRSh * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IRSh * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IRSh * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IRSh * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IRSh * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IRSh * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IRSh * This,
            /* [in] */ long newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IRSh * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IRSh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IRSh * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IRSh * This,
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__IRSh0000);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IRSh * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IRSh * This,
            LONG lMilliSeconds);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Host )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Host )( 
            IRSh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UserName )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_UserName )( 
            IRSh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Command )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Command )( 
            IRSh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ScriptTimeOut )( 
            IRSh * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ScriptTimeOut )( 
            IRSh * This,
            /* [in] */ long newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_StdOut )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_StdErr )( 
            IRSh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Run )( 
            IRSh * This);
        
        END_INTERFACE
    } IRShVtbl;

    interface IRSh
    {
        CONST_VTBL struct IRShVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IRSh_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IRSh_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IRSh_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IRSh_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IRSh_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IRSh_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IRSh_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IRSh_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IRSh_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IRSh_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IRSh_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IRSh_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IRSh_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IRSh_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IRSh_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IRSh_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IRSh_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IRSh_GetErrorDescription(This,ErrorCode,__MIDL__IRSh0000)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,ErrorCode,__MIDL__IRSh0000) ) 

#define IRSh_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IRSh_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define IRSh_get_Host(This,pVal)	\
    ( (This)->lpVtbl -> get_Host(This,pVal) ) 

#define IRSh_put_Host(This,newVal)	\
    ( (This)->lpVtbl -> put_Host(This,newVal) ) 

#define IRSh_get_UserName(This,pVal)	\
    ( (This)->lpVtbl -> get_UserName(This,pVal) ) 

#define IRSh_put_UserName(This,newVal)	\
    ( (This)->lpVtbl -> put_UserName(This,newVal) ) 

#define IRSh_get_Command(This,pVal)	\
    ( (This)->lpVtbl -> get_Command(This,pVal) ) 

#define IRSh_put_Command(This,newVal)	\
    ( (This)->lpVtbl -> put_Command(This,newVal) ) 

#define IRSh_get_ScriptTimeOut(This,pVal)	\
    ( (This)->lpVtbl -> get_ScriptTimeOut(This,pVal) ) 

#define IRSh_put_ScriptTimeOut(This,newVal)	\
    ( (This)->lpVtbl -> put_ScriptTimeOut(This,newVal) ) 

#define IRSh_get_StdOut(This,pVal)	\
    ( (This)->lpVtbl -> get_StdOut(This,pVal) ) 

#define IRSh_get_StdErr(This,pVal)	\
    ( (This)->lpVtbl -> get_StdErr(This,pVal) ) 

#define IRSh_Run(This)	\
    ( (This)->lpVtbl -> Run(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IRSh_INTERFACE_DEFINED__ */


#ifndef __INtp_INTERFACE_DEFINED__
#define __INtp_INTERFACE_DEFINED__

/* interface INtp */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_INtp;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("CC932613-BE5F-43B3-9955-A40E1A8D736C")
    INtp : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ long newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__INtp0000) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Year( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Month( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Day( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Hour( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Minute( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Second( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LocalOffsetSeconds( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetTime( 
            /* [in] */ BSTR TimeServer) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct INtpVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            INtp * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            INtp * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            INtp * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            INtp * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            INtp * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            INtp * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            INtp * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            INtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            INtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            INtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            INtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            INtp * This,
            /* [in] */ long newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            INtp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            INtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            INtp * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            INtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            INtp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            INtp * This,
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__INtp0000);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            INtp * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            INtp * This,
            LONG lMilliSeconds);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Year )( 
            INtp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Month )( 
            INtp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Day )( 
            INtp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Hour )( 
            INtp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Minute )( 
            INtp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Second )( 
            INtp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LocalOffsetSeconds )( 
            INtp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetTime )( 
            INtp * This,
            /* [in] */ BSTR TimeServer);
        
        END_INTERFACE
    } INtpVtbl;

    interface INtp
    {
        CONST_VTBL struct INtpVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define INtp_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define INtp_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define INtp_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define INtp_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define INtp_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define INtp_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define INtp_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define INtp_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define INtp_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define INtp_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define INtp_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define INtp_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define INtp_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define INtp_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define INtp_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define INtp_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define INtp_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define INtp_GetErrorDescription(This,ErrorCode,__MIDL__INtp0000)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,ErrorCode,__MIDL__INtp0000) ) 

#define INtp_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define INtp_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define INtp_get_Year(This,pVal)	\
    ( (This)->lpVtbl -> get_Year(This,pVal) ) 

#define INtp_get_Month(This,pVal)	\
    ( (This)->lpVtbl -> get_Month(This,pVal) ) 

#define INtp_get_Day(This,pVal)	\
    ( (This)->lpVtbl -> get_Day(This,pVal) ) 

#define INtp_get_Hour(This,pVal)	\
    ( (This)->lpVtbl -> get_Hour(This,pVal) ) 

#define INtp_get_Minute(This,pVal)	\
    ( (This)->lpVtbl -> get_Minute(This,pVal) ) 

#define INtp_get_Second(This,pVal)	\
    ( (This)->lpVtbl -> get_Second(This,pVal) ) 

#define INtp_get_LocalOffsetSeconds(This,pVal)	\
    ( (This)->lpVtbl -> get_LocalOffsetSeconds(This,pVal) ) 

#define INtp_GetTime(This,TimeServer)	\
    ( (This)->lpVtbl -> GetTime(This,TimeServer) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __INtp_INTERFACE_DEFINED__ */


#ifndef __IWOL_INTERFACE_DEFINED__
#define __IWOL_INTERFACE_DEFINED__

/* interface IWOL */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IWOL;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("18AD1230-A4C9-4A48-98B3-B3C669D28001")
    IWOL : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__IWOL0000) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE WakeUp( 
            BSTR MacAddress) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IWOLVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IWOL * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IWOL * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IWOL * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IWOL * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IWOL * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IWOL * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWOL * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IWOL * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IWOL * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IWOL * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IWOL * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IWOL * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IWOL * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IWOL * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IWOL * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IWOL * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IWOL * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IWOL * This,
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__IWOL0000);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IWOL * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IWOL * This,
            LONG lMilliSeconds);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *WakeUp )( 
            IWOL * This,
            BSTR MacAddress);
        
        END_INTERFACE
    } IWOLVtbl;

    interface IWOL
    {
        CONST_VTBL struct IWOLVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWOL_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWOL_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWOL_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWOL_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWOL_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWOL_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWOL_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWOL_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IWOL_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IWOL_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IWOL_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IWOL_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IWOL_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IWOL_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IWOL_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IWOL_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IWOL_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IWOL_GetErrorDescription(This,ErrorCode,__MIDL__IWOL0000)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,ErrorCode,__MIDL__IWOL0000) ) 

#define IWOL_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IWOL_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define IWOL_WakeUp(This,MacAddress)	\
    ( (This)->lpVtbl -> WakeUp(This,MacAddress) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWOL_INTERFACE_DEFINED__ */


#ifndef __IIcmp_INTERFACE_DEFINED__
#define __IIcmp_INTERFACE_DEFINED__

/* interface IIcmp */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IIcmp;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("A92A390F-E285-4A8E-ACE1-C9981CE951E9")
    IIcmp : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__IIcmp0000) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            long MilliSecs) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_BufferSize( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_BufferSize( 
            /* [in] */ long newval) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Ttl( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Ttl( 
            /* [in] */ long Ttl) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastDuration( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastTtl( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Ping( 
            /* [in] */ BSTR DestinationHost,
            /* [in] */ long TimeoutMsecs) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IIcmpVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IIcmp * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IIcmp * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IIcmp * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IIcmp * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IIcmp * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IIcmp * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IIcmp * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IIcmp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IIcmp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IIcmp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IIcmp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IIcmp * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IIcmp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IIcmp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IIcmp * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IIcmp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IIcmp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IIcmp * This,
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__IIcmp0000);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IIcmp * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IIcmp * This,
            long MilliSecs);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BufferSize )( 
            IIcmp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_BufferSize )( 
            IIcmp * This,
            /* [in] */ long newval);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Ttl )( 
            IIcmp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Ttl )( 
            IIcmp * This,
            /* [in] */ long Ttl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastDuration )( 
            IIcmp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastTtl )( 
            IIcmp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Ping )( 
            IIcmp * This,
            /* [in] */ BSTR DestinationHost,
            /* [in] */ long TimeoutMsecs);
        
        END_INTERFACE
    } IIcmpVtbl;

    interface IIcmp
    {
        CONST_VTBL struct IIcmpVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IIcmp_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IIcmp_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IIcmp_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IIcmp_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IIcmp_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IIcmp_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IIcmp_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IIcmp_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IIcmp_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IIcmp_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IIcmp_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IIcmp_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IIcmp_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IIcmp_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IIcmp_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IIcmp_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IIcmp_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IIcmp_GetErrorDescription(This,ErrorCode,__MIDL__IIcmp0000)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,ErrorCode,__MIDL__IIcmp0000) ) 

#define IIcmp_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IIcmp_Sleep(This,MilliSecs)	\
    ( (This)->lpVtbl -> Sleep(This,MilliSecs) ) 

#define IIcmp_get_BufferSize(This,pVal)	\
    ( (This)->lpVtbl -> get_BufferSize(This,pVal) ) 

#define IIcmp_put_BufferSize(This,newval)	\
    ( (This)->lpVtbl -> put_BufferSize(This,newval) ) 

#define IIcmp_get_Ttl(This,pVal)	\
    ( (This)->lpVtbl -> get_Ttl(This,pVal) ) 

#define IIcmp_put_Ttl(This,Ttl)	\
    ( (This)->lpVtbl -> put_Ttl(This,Ttl) ) 

#define IIcmp_get_LastDuration(This,pVal)	\
    ( (This)->lpVtbl -> get_LastDuration(This,pVal) ) 

#define IIcmp_get_LastTtl(This,pVal)	\
    ( (This)->lpVtbl -> get_LastTtl(This,pVal) ) 

#define IIcmp_Ping(This,DestinationHost,TimeoutMsecs)	\
    ( (This)->lpVtbl -> Ping(This,DestinationHost,TimeoutMsecs) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IIcmp_INTERFACE_DEFINED__ */


#ifndef __INwConstants_INTERFACE_DEFINED__
#define __INwConstants_INTERFACE_DEFINED__

/* interface INwConstants */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_INwConstants;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("37B4E86F-AAE3-48AC-922B-DF90945125B9")
    INwConstants : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSOCKET_PROTOCOL_RAW( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSOCKET_PROTOCOL_TELNET( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSOCKET_CONNSTATE_DISCONNECTED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSOCKET_CONNSTATE_LISTENING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSOCKET_CONNSTATE_CONNECTED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_UNDEFINED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_INTEGER( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_INTEGER32( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_BITS( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_OCTETSTRING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_NULL( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_OBJECTIDENTIFIER( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_SEQUENCE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_IPADDRESS( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_COUNTER32( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_GAUGE32( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_TIMETICKS( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_OPAQUE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_COUNTER64( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TYPE_UNSIGNED32( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TRAP_COLDSTART( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TRAP_WARMSTART( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TRAP_LINKDOWN( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TRAP_LINKUP( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TRAP_AUTHFAILURE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TRAP_EGPNEIGHLOSS( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_TRAP_ENTERSPECIFIC( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_VERSION_V1( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_VERSION_V2C( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_VERSION_V3( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_A( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_NS( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_CNAME( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_SOA( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_PTR( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_MX( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_AAAA( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_ANY( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_UNDEFINED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_SRV( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwDNS_TYPE_CERT( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_ACCESS_NOACCESS( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_ACCESS_NOTIFY( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_ACCESS_READONLY( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_ACCESS_WRITEONLY( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_ACCESS_READWRITE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_ACCESS_READCREATE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_STATUS_CURRENT( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_STATUS_DEPRECATED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_STATUS_OBSOLETE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwMIB_STATUS_MANDATORY( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_AUTH_SHA1( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_AUTH_MD5( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_PRIV_DES( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSNMP_PRIV_AES( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_CPU_USAGE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MEMORY_USAGE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MEMORY_AVAILABLE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MEMORY_USED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_NETWORK_PACKETSRX( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_NETWORK_PACKETSTX( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_NETWORK_RATERX( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_NETWORK_RATETX( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_DISK_USAGE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_DISK_AVAILABLE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_DISK_USED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MACHINE_STATE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_POWER_STATE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_GUESTTOOLS( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_POWERSTATE_INVALID( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_POWERSTATE_OFF( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_POWERSTATE_ON( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_POWERSTATE_SUSPENDED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MACHINESTATE_INVALID( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MACHINESTATE_NOTRUNNING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MACHINESTATE_RESETTING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MACHINESTATE_RUNNING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MACHINESTATE_SHUTTINGDOWN( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MACHINESTATE_STANDBY( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_MACHINESTATE_UNKNOWN( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_GUESTTOOLS_UNKNOWN( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_GUESTTOOLS_NOTRUNNING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwVMWARE_GUESTTOOLS_RUNNING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_CPU_USAGE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_MEMORY_USAGE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_MEMORY_AVAILABLE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_MEMORY_USED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_NETWORK_RATERX( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_NETWORK_RATETX( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_DISK_USAGE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_DISK_AVAILABLE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_DISK_USED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_POWER_STATE( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_GUESTTOOLS( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_POWERSTATE_HALTED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_POWERSTATE_PAUSED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_POWERSTATE_RUNNING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_POWERSTATE_SUSPENDED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_POWERSTATE_SHUTTINGDOWN( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_POWERSTATE_CRASHED( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_POWERSTATE_UNKNOWN( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_GUESTTOOLS_UNKNOWN( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_GUESTTOOLS_NOTRUNNING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nmXEN_GUESTTOOLS_RUNNING( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSOCKET_IPVERSION_IP6IP4( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSOCKET_IPVERSION_IP6ONLY( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nwSOCKET_IPVERSION_IP4ONLY( 
            /* [retval][out] */ LONG *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct INwConstantsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            INwConstants * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            INwConstants * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            INwConstants * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            INwConstants * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            INwConstants * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            INwConstants * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            INwConstants * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSOCKET_PROTOCOL_RAW )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSOCKET_PROTOCOL_TELNET )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSOCKET_CONNSTATE_DISCONNECTED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSOCKET_CONNSTATE_LISTENING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSOCKET_CONNSTATE_CONNECTED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_UNDEFINED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_INTEGER )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_INTEGER32 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_BITS )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_OCTETSTRING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_NULL )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_OBJECTIDENTIFIER )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_SEQUENCE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_IPADDRESS )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_COUNTER32 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_GAUGE32 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_TIMETICKS )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_OPAQUE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_COUNTER64 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TYPE_UNSIGNED32 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TRAP_COLDSTART )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TRAP_WARMSTART )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TRAP_LINKDOWN )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TRAP_LINKUP )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TRAP_AUTHFAILURE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TRAP_EGPNEIGHLOSS )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_TRAP_ENTERSPECIFIC )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_VERSION_V1 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_VERSION_V2C )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_VERSION_V3 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_A )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_NS )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_CNAME )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_SOA )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_PTR )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_MX )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_AAAA )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_ANY )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_UNDEFINED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_SRV )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwDNS_TYPE_CERT )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_ACCESS_NOACCESS )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_ACCESS_NOTIFY )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_ACCESS_READONLY )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_ACCESS_WRITEONLY )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_ACCESS_READWRITE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_ACCESS_READCREATE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_STATUS_CURRENT )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_STATUS_DEPRECATED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_STATUS_OBSOLETE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwMIB_STATUS_MANDATORY )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_AUTH_SHA1 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_AUTH_MD5 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_PRIV_DES )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSNMP_PRIV_AES )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_CPU_USAGE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MEMORY_USAGE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MEMORY_AVAILABLE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MEMORY_USED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_NETWORK_PACKETSRX )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_NETWORK_PACKETSTX )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_NETWORK_RATERX )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_NETWORK_RATETX )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_DISK_USAGE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_DISK_AVAILABLE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_DISK_USED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MACHINE_STATE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_POWER_STATE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_GUESTTOOLS )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_POWERSTATE_INVALID )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_POWERSTATE_OFF )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_POWERSTATE_ON )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_POWERSTATE_SUSPENDED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MACHINESTATE_INVALID )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MACHINESTATE_NOTRUNNING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MACHINESTATE_RESETTING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MACHINESTATE_RUNNING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MACHINESTATE_SHUTTINGDOWN )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MACHINESTATE_STANDBY )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_MACHINESTATE_UNKNOWN )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_GUESTTOOLS_UNKNOWN )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_GUESTTOOLS_NOTRUNNING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwVMWARE_GUESTTOOLS_RUNNING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_CPU_USAGE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_MEMORY_USAGE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_MEMORY_AVAILABLE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_MEMORY_USED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_NETWORK_RATERX )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_NETWORK_RATETX )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_DISK_USAGE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_DISK_AVAILABLE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_DISK_USED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_POWER_STATE )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_GUESTTOOLS )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_POWERSTATE_HALTED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_POWERSTATE_PAUSED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_POWERSTATE_RUNNING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_POWERSTATE_SUSPENDED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_POWERSTATE_SHUTTINGDOWN )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_POWERSTATE_CRASHED )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_POWERSTATE_UNKNOWN )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_GUESTTOOLS_UNKNOWN )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_GUESTTOOLS_NOTRUNNING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nmXEN_GUESTTOOLS_RUNNING )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSOCKET_IPVERSION_IP6IP4 )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSOCKET_IPVERSION_IP6ONLY )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nwSOCKET_IPVERSION_IP4ONLY )( 
            INwConstants * This,
            /* [retval][out] */ LONG *pVal);
        
        END_INTERFACE
    } INwConstantsVtbl;

    interface INwConstants
    {
        CONST_VTBL struct INwConstantsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define INwConstants_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define INwConstants_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define INwConstants_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define INwConstants_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define INwConstants_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define INwConstants_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define INwConstants_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define INwConstants_get_nwSOCKET_PROTOCOL_RAW(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSOCKET_PROTOCOL_RAW(This,pVal) ) 

#define INwConstants_get_nwSOCKET_PROTOCOL_TELNET(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSOCKET_PROTOCOL_TELNET(This,pVal) ) 

#define INwConstants_get_nwSOCKET_CONNSTATE_DISCONNECTED(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSOCKET_CONNSTATE_DISCONNECTED(This,pVal) ) 

#define INwConstants_get_nwSOCKET_CONNSTATE_LISTENING(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSOCKET_CONNSTATE_LISTENING(This,pVal) ) 

#define INwConstants_get_nwSOCKET_CONNSTATE_CONNECTED(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSOCKET_CONNSTATE_CONNECTED(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_UNDEFINED(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_UNDEFINED(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_INTEGER(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_INTEGER(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_INTEGER32(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_INTEGER32(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_BITS(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_BITS(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_OCTETSTRING(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_OCTETSTRING(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_NULL(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_NULL(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_OBJECTIDENTIFIER(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_OBJECTIDENTIFIER(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_SEQUENCE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_SEQUENCE(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_IPADDRESS(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_IPADDRESS(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_COUNTER32(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_COUNTER32(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_GAUGE32(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_GAUGE32(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_TIMETICKS(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_TIMETICKS(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_OPAQUE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_OPAQUE(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_COUNTER64(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_COUNTER64(This,pVal) ) 

#define INwConstants_get_nwSNMP_TYPE_UNSIGNED32(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TYPE_UNSIGNED32(This,pVal) ) 

#define INwConstants_get_nwSNMP_TRAP_COLDSTART(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TRAP_COLDSTART(This,pVal) ) 

#define INwConstants_get_nwSNMP_TRAP_WARMSTART(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TRAP_WARMSTART(This,pVal) ) 

#define INwConstants_get_nwSNMP_TRAP_LINKDOWN(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TRAP_LINKDOWN(This,pVal) ) 

#define INwConstants_get_nwSNMP_TRAP_LINKUP(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TRAP_LINKUP(This,pVal) ) 

#define INwConstants_get_nwSNMP_TRAP_AUTHFAILURE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TRAP_AUTHFAILURE(This,pVal) ) 

#define INwConstants_get_nwSNMP_TRAP_EGPNEIGHLOSS(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TRAP_EGPNEIGHLOSS(This,pVal) ) 

#define INwConstants_get_nwSNMP_TRAP_ENTERSPECIFIC(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_TRAP_ENTERSPECIFIC(This,pVal) ) 

#define INwConstants_get_nwSNMP_VERSION_V1(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_VERSION_V1(This,pVal) ) 

#define INwConstants_get_nwSNMP_VERSION_V2C(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_VERSION_V2C(This,pVal) ) 

#define INwConstants_get_nwSNMP_VERSION_V3(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_VERSION_V3(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_A(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_A(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_NS(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_NS(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_CNAME(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_CNAME(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_SOA(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_SOA(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_PTR(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_PTR(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_MX(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_MX(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_AAAA(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_AAAA(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_ANY(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_ANY(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_UNDEFINED(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_UNDEFINED(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_SRV(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_SRV(This,pVal) ) 

#define INwConstants_get_nwDNS_TYPE_CERT(This,pVal)	\
    ( (This)->lpVtbl -> get_nwDNS_TYPE_CERT(This,pVal) ) 

#define INwConstants_get_nwMIB_ACCESS_NOACCESS(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_ACCESS_NOACCESS(This,pVal) ) 

#define INwConstants_get_nwMIB_ACCESS_NOTIFY(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_ACCESS_NOTIFY(This,pVal) ) 

#define INwConstants_get_nwMIB_ACCESS_READONLY(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_ACCESS_READONLY(This,pVal) ) 

#define INwConstants_get_nwMIB_ACCESS_WRITEONLY(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_ACCESS_WRITEONLY(This,pVal) ) 

#define INwConstants_get_nwMIB_ACCESS_READWRITE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_ACCESS_READWRITE(This,pVal) ) 

#define INwConstants_get_nwMIB_ACCESS_READCREATE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_ACCESS_READCREATE(This,pVal) ) 

#define INwConstants_get_nwMIB_STATUS_CURRENT(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_STATUS_CURRENT(This,pVal) ) 

#define INwConstants_get_nwMIB_STATUS_DEPRECATED(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_STATUS_DEPRECATED(This,pVal) ) 

#define INwConstants_get_nwMIB_STATUS_OBSOLETE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_STATUS_OBSOLETE(This,pVal) ) 

#define INwConstants_get_nwMIB_STATUS_MANDATORY(This,pVal)	\
    ( (This)->lpVtbl -> get_nwMIB_STATUS_MANDATORY(This,pVal) ) 

#define INwConstants_get_nwSNMP_AUTH_SHA1(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_AUTH_SHA1(This,pVal) ) 

#define INwConstants_get_nwSNMP_AUTH_MD5(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_AUTH_MD5(This,pVal) ) 

#define INwConstants_get_nwSNMP_PRIV_DES(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_PRIV_DES(This,pVal) ) 

#define INwConstants_get_nwSNMP_PRIV_AES(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSNMP_PRIV_AES(This,pVal) ) 

#define INwConstants_get_nwVMWARE_CPU_USAGE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_CPU_USAGE(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MEMORY_USAGE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MEMORY_USAGE(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MEMORY_AVAILABLE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MEMORY_AVAILABLE(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MEMORY_USED(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MEMORY_USED(This,pVal) ) 

#define INwConstants_get_nwVMWARE_NETWORK_PACKETSRX(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_NETWORK_PACKETSRX(This,pVal) ) 

#define INwConstants_get_nwVMWARE_NETWORK_PACKETSTX(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_NETWORK_PACKETSTX(This,pVal) ) 

#define INwConstants_get_nwVMWARE_NETWORK_RATERX(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_NETWORK_RATERX(This,pVal) ) 

#define INwConstants_get_nwVMWARE_NETWORK_RATETX(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_NETWORK_RATETX(This,pVal) ) 

#define INwConstants_get_nwVMWARE_DISK_USAGE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_DISK_USAGE(This,pVal) ) 

#define INwConstants_get_nwVMWARE_DISK_AVAILABLE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_DISK_AVAILABLE(This,pVal) ) 

#define INwConstants_get_nwVMWARE_DISK_USED(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_DISK_USED(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MACHINE_STATE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MACHINE_STATE(This,pVal) ) 

#define INwConstants_get_nwVMWARE_POWER_STATE(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_POWER_STATE(This,pVal) ) 

#define INwConstants_get_nwVMWARE_GUESTTOOLS(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_GUESTTOOLS(This,pVal) ) 

#define INwConstants_get_nwVMWARE_POWERSTATE_INVALID(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_POWERSTATE_INVALID(This,pVal) ) 

#define INwConstants_get_nwVMWARE_POWERSTATE_OFF(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_POWERSTATE_OFF(This,pVal) ) 

#define INwConstants_get_nwVMWARE_POWERSTATE_ON(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_POWERSTATE_ON(This,pVal) ) 

#define INwConstants_get_nwVMWARE_POWERSTATE_SUSPENDED(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_POWERSTATE_SUSPENDED(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MACHINESTATE_INVALID(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MACHINESTATE_INVALID(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MACHINESTATE_NOTRUNNING(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MACHINESTATE_NOTRUNNING(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MACHINESTATE_RESETTING(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MACHINESTATE_RESETTING(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MACHINESTATE_RUNNING(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MACHINESTATE_RUNNING(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MACHINESTATE_SHUTTINGDOWN(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MACHINESTATE_SHUTTINGDOWN(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MACHINESTATE_STANDBY(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MACHINESTATE_STANDBY(This,pVal) ) 

#define INwConstants_get_nwVMWARE_MACHINESTATE_UNKNOWN(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_MACHINESTATE_UNKNOWN(This,pVal) ) 

#define INwConstants_get_nwVMWARE_GUESTTOOLS_UNKNOWN(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_GUESTTOOLS_UNKNOWN(This,pVal) ) 

#define INwConstants_get_nwVMWARE_GUESTTOOLS_NOTRUNNING(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_GUESTTOOLS_NOTRUNNING(This,pVal) ) 

#define INwConstants_get_nwVMWARE_GUESTTOOLS_RUNNING(This,pVal)	\
    ( (This)->lpVtbl -> get_nwVMWARE_GUESTTOOLS_RUNNING(This,pVal) ) 

#define INwConstants_get_nmXEN_CPU_USAGE(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_CPU_USAGE(This,pVal) ) 

#define INwConstants_get_nmXEN_MEMORY_USAGE(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_MEMORY_USAGE(This,pVal) ) 

#define INwConstants_get_nmXEN_MEMORY_AVAILABLE(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_MEMORY_AVAILABLE(This,pVal) ) 

#define INwConstants_get_nmXEN_MEMORY_USED(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_MEMORY_USED(This,pVal) ) 

#define INwConstants_get_nmXEN_NETWORK_RATERX(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_NETWORK_RATERX(This,pVal) ) 

#define INwConstants_get_nmXEN_NETWORK_RATETX(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_NETWORK_RATETX(This,pVal) ) 

#define INwConstants_get_nmXEN_DISK_USAGE(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_DISK_USAGE(This,pVal) ) 

#define INwConstants_get_nmXEN_DISK_AVAILABLE(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_DISK_AVAILABLE(This,pVal) ) 

#define INwConstants_get_nmXEN_DISK_USED(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_DISK_USED(This,pVal) ) 

#define INwConstants_get_nmXEN_POWER_STATE(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_POWER_STATE(This,pVal) ) 

#define INwConstants_get_nmXEN_GUESTTOOLS(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_GUESTTOOLS(This,pVal) ) 

#define INwConstants_get_nmXEN_POWERSTATE_HALTED(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_POWERSTATE_HALTED(This,pVal) ) 

#define INwConstants_get_nmXEN_POWERSTATE_PAUSED(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_POWERSTATE_PAUSED(This,pVal) ) 

#define INwConstants_get_nmXEN_POWERSTATE_RUNNING(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_POWERSTATE_RUNNING(This,pVal) ) 

#define INwConstants_get_nmXEN_POWERSTATE_SUSPENDED(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_POWERSTATE_SUSPENDED(This,pVal) ) 

#define INwConstants_get_nmXEN_POWERSTATE_SHUTTINGDOWN(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_POWERSTATE_SHUTTINGDOWN(This,pVal) ) 

#define INwConstants_get_nmXEN_POWERSTATE_CRASHED(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_POWERSTATE_CRASHED(This,pVal) ) 

#define INwConstants_get_nmXEN_POWERSTATE_UNKNOWN(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_POWERSTATE_UNKNOWN(This,pVal) ) 

#define INwConstants_get_nmXEN_GUESTTOOLS_UNKNOWN(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_GUESTTOOLS_UNKNOWN(This,pVal) ) 

#define INwConstants_get_nmXEN_GUESTTOOLS_NOTRUNNING(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_GUESTTOOLS_NOTRUNNING(This,pVal) ) 

#define INwConstants_get_nmXEN_GUESTTOOLS_RUNNING(This,pVal)	\
    ( (This)->lpVtbl -> get_nmXEN_GUESTTOOLS_RUNNING(This,pVal) ) 

#define INwConstants_get_nwSOCKET_IPVERSION_IP6IP4(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSOCKET_IPVERSION_IP6IP4(This,pVal) ) 

#define INwConstants_get_nwSOCKET_IPVERSION_IP6ONLY(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSOCKET_IPVERSION_IP6ONLY(This,pVal) ) 

#define INwConstants_get_nwSOCKET_IPVERSION_IP4ONLY(This,pVal)	\
    ( (This)->lpVtbl -> get_nwSOCKET_IPVERSION_IP4ONLY(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __INwConstants_INTERFACE_DEFINED__ */


#ifndef __ISnmpManager_INTERFACE_DEFINED__
#define __ISnmpManager_INTERFACE_DEFINED__

/* interface ISnmpManager */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_ISnmpManager;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1542A06C-4DBA-407A-B54D-991D13D481AD")
    ISnmpManager : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG Error,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProtocolVersion( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProtocolVersion( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Timeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Timeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_AuthProtocol( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_AuthProtocol( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_PrivProtocol( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_PrivProtocol( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_AuthUsername( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_AuthUsername( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_AuthPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_AuthPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_PrivPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_PrivPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ContextName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ContextName( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Initialize( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Open( 
            BSTR Agent,
            /* [defaultvalue][in] */ BSTR Community = L"public",
            /* [defaultvalue][in] */ LONG Port = 161) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Close( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Get( 
            BSTR OID,
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNext( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Set( 
            VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE LoadMibFile( 
            BSTR bstrMibFile) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISnmpManagerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISnmpManager * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISnmpManager * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISnmpManager * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISnmpManager * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISnmpManager * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISnmpManager * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISnmpManager * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            ISnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ISnmpManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            ISnmpManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ISnmpManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            ISnmpManager * This,
            LONG Error,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            ISnmpManager * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            ISnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProtocolVersion )( 
            ISnmpManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProtocolVersion )( 
            ISnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Timeout )( 
            ISnmpManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Timeout )( 
            ISnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AuthProtocol )( 
            ISnmpManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AuthProtocol )( 
            ISnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PrivProtocol )( 
            ISnmpManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PrivProtocol )( 
            ISnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AuthUsername )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AuthUsername )( 
            ISnmpManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AuthPassword )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AuthPassword )( 
            ISnmpManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PrivPassword )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PrivPassword )( 
            ISnmpManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ContextName )( 
            ISnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ContextName )( 
            ISnmpManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            ISnmpManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            ISnmpManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Open )( 
            ISnmpManager * This,
            BSTR Agent,
            /* [defaultvalue][in] */ BSTR Community,
            /* [defaultvalue][in] */ LONG Port);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Close )( 
            ISnmpManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Get )( 
            ISnmpManager * This,
            BSTR OID,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNext )( 
            ISnmpManager * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Set )( 
            ISnmpManager * This,
            VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *LoadMibFile )( 
            ISnmpManager * This,
            BSTR bstrMibFile);
        
        END_INTERFACE
    } ISnmpManagerVtbl;

    interface ISnmpManager
    {
        CONST_VTBL struct ISnmpManagerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISnmpManager_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISnmpManager_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISnmpManager_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISnmpManager_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISnmpManager_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISnmpManager_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISnmpManager_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISnmpManager_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define ISnmpManager_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define ISnmpManager_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define ISnmpManager_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define ISnmpManager_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define ISnmpManager_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ISnmpManager_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define ISnmpManager_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define ISnmpManager_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define ISnmpManager_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ISnmpManager_GetErrorDescription(This,Error,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,Error,pVal) ) 

#define ISnmpManager_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define ISnmpManager_Sleep(This,newVal)	\
    ( (This)->lpVtbl -> Sleep(This,newVal) ) 

#define ISnmpManager_get_ProtocolVersion(This,pVal)	\
    ( (This)->lpVtbl -> get_ProtocolVersion(This,pVal) ) 

#define ISnmpManager_put_ProtocolVersion(This,newVal)	\
    ( (This)->lpVtbl -> put_ProtocolVersion(This,newVal) ) 

#define ISnmpManager_get_Timeout(This,pVal)	\
    ( (This)->lpVtbl -> get_Timeout(This,pVal) ) 

#define ISnmpManager_put_Timeout(This,newVal)	\
    ( (This)->lpVtbl -> put_Timeout(This,newVal) ) 

#define ISnmpManager_get_AuthProtocol(This,pVal)	\
    ( (This)->lpVtbl -> get_AuthProtocol(This,pVal) ) 

#define ISnmpManager_put_AuthProtocol(This,newVal)	\
    ( (This)->lpVtbl -> put_AuthProtocol(This,newVal) ) 

#define ISnmpManager_get_PrivProtocol(This,pVal)	\
    ( (This)->lpVtbl -> get_PrivProtocol(This,pVal) ) 

#define ISnmpManager_put_PrivProtocol(This,newVal)	\
    ( (This)->lpVtbl -> put_PrivProtocol(This,newVal) ) 

#define ISnmpManager_get_AuthUsername(This,pVal)	\
    ( (This)->lpVtbl -> get_AuthUsername(This,pVal) ) 

#define ISnmpManager_put_AuthUsername(This,newVal)	\
    ( (This)->lpVtbl -> put_AuthUsername(This,newVal) ) 

#define ISnmpManager_get_AuthPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_AuthPassword(This,pVal) ) 

#define ISnmpManager_put_AuthPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_AuthPassword(This,newVal) ) 

#define ISnmpManager_get_PrivPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_PrivPassword(This,pVal) ) 

#define ISnmpManager_put_PrivPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_PrivPassword(This,newVal) ) 

#define ISnmpManager_get_ContextName(This,pVal)	\
    ( (This)->lpVtbl -> get_ContextName(This,pVal) ) 

#define ISnmpManager_put_ContextName(This,newVal)	\
    ( (This)->lpVtbl -> put_ContextName(This,newVal) ) 

#define ISnmpManager_Initialize(This)	\
    ( (This)->lpVtbl -> Initialize(This) ) 

#define ISnmpManager_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#define ISnmpManager_Open(This,Agent,Community,Port)	\
    ( (This)->lpVtbl -> Open(This,Agent,Community,Port) ) 

#define ISnmpManager_Close(This)	\
    ( (This)->lpVtbl -> Close(This) ) 

#define ISnmpManager_Get(This,OID,pVal)	\
    ( (This)->lpVtbl -> Get(This,OID,pVal) ) 

#define ISnmpManager_GetNext(This,pVal)	\
    ( (This)->lpVtbl -> GetNext(This,pVal) ) 

#define ISnmpManager_Set(This,pVal)	\
    ( (This)->lpVtbl -> Set(This,pVal) ) 

#define ISnmpManager_LoadMibFile(This,bstrMibFile)	\
    ( (This)->lpVtbl -> LoadMibFile(This,bstrMibFile) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISnmpManager_INTERFACE_DEFINED__ */


#ifndef __ISnmpObject_INTERFACE_DEFINED__
#define __ISnmpObject_INTERFACE_DEFINED__

/* interface ISnmpObject */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_ISnmpObject;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("C3E4F5F3-C188-4F3B-9A41-9CAE2891150E")
    ISnmpObject : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_OID( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_OID( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Value( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Value( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Type( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Type( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Description( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Description( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_NodeID( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_NodeID( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ParentNodeID( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ParentNodeID( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_OIDNameShort( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_OIDNameShort( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_RequestID( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_RequestID( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Syntax( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Syntax( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Access( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Access( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Status( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Status( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_OIDName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_OIDName( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_IsUserMib( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_IsUserMib( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_IsFolder( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_IsFolder( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_IsTrap( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_IsTrap( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISnmpObjectVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISnmpObject * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISnmpObject * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISnmpObject * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISnmpObject * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISnmpObject * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISnmpObject * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISnmpObject * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ISnmpObject * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OID )( 
            ISnmpObject * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_OID )( 
            ISnmpObject * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Value )( 
            ISnmpObject * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Value )( 
            ISnmpObject * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Type )( 
            ISnmpObject * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Type )( 
            ISnmpObject * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Description )( 
            ISnmpObject * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Description )( 
            ISnmpObject * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NodeID )( 
            ISnmpObject * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_NodeID )( 
            ISnmpObject * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ParentNodeID )( 
            ISnmpObject * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ParentNodeID )( 
            ISnmpObject * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OIDNameShort )( 
            ISnmpObject * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_OIDNameShort )( 
            ISnmpObject * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RequestID )( 
            ISnmpObject * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_RequestID )( 
            ISnmpObject * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Syntax )( 
            ISnmpObject * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Syntax )( 
            ISnmpObject * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Access )( 
            ISnmpObject * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Access )( 
            ISnmpObject * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Status )( 
            ISnmpObject * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Status )( 
            ISnmpObject * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OIDName )( 
            ISnmpObject * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_OIDName )( 
            ISnmpObject * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsUserMib )( 
            ISnmpObject * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IsUserMib )( 
            ISnmpObject * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsFolder )( 
            ISnmpObject * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IsFolder )( 
            ISnmpObject * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsTrap )( 
            ISnmpObject * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IsTrap )( 
            ISnmpObject * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        END_INTERFACE
    } ISnmpObjectVtbl;

    interface ISnmpObject
    {
        CONST_VTBL struct ISnmpObjectVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISnmpObject_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISnmpObject_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISnmpObject_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISnmpObject_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISnmpObject_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISnmpObject_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISnmpObject_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISnmpObject_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ISnmpObject_get_OID(This,pVal)	\
    ( (This)->lpVtbl -> get_OID(This,pVal) ) 

#define ISnmpObject_put_OID(This,newVal)	\
    ( (This)->lpVtbl -> put_OID(This,newVal) ) 

#define ISnmpObject_get_Value(This,pVal)	\
    ( (This)->lpVtbl -> get_Value(This,pVal) ) 

#define ISnmpObject_put_Value(This,newVal)	\
    ( (This)->lpVtbl -> put_Value(This,newVal) ) 

#define ISnmpObject_get_Type(This,pVal)	\
    ( (This)->lpVtbl -> get_Type(This,pVal) ) 

#define ISnmpObject_put_Type(This,newVal)	\
    ( (This)->lpVtbl -> put_Type(This,newVal) ) 

#define ISnmpObject_get_Description(This,pVal)	\
    ( (This)->lpVtbl -> get_Description(This,pVal) ) 

#define ISnmpObject_put_Description(This,newVal)	\
    ( (This)->lpVtbl -> put_Description(This,newVal) ) 

#define ISnmpObject_get_NodeID(This,pVal)	\
    ( (This)->lpVtbl -> get_NodeID(This,pVal) ) 

#define ISnmpObject_put_NodeID(This,newVal)	\
    ( (This)->lpVtbl -> put_NodeID(This,newVal) ) 

#define ISnmpObject_get_ParentNodeID(This,pVal)	\
    ( (This)->lpVtbl -> get_ParentNodeID(This,pVal) ) 

#define ISnmpObject_put_ParentNodeID(This,newVal)	\
    ( (This)->lpVtbl -> put_ParentNodeID(This,newVal) ) 

#define ISnmpObject_get_OIDNameShort(This,pVal)	\
    ( (This)->lpVtbl -> get_OIDNameShort(This,pVal) ) 

#define ISnmpObject_put_OIDNameShort(This,newVal)	\
    ( (This)->lpVtbl -> put_OIDNameShort(This,newVal) ) 

#define ISnmpObject_get_RequestID(This,pVal)	\
    ( (This)->lpVtbl -> get_RequestID(This,pVal) ) 

#define ISnmpObject_put_RequestID(This,newVal)	\
    ( (This)->lpVtbl -> put_RequestID(This,newVal) ) 

#define ISnmpObject_get_Syntax(This,pVal)	\
    ( (This)->lpVtbl -> get_Syntax(This,pVal) ) 

#define ISnmpObject_put_Syntax(This,newVal)	\
    ( (This)->lpVtbl -> put_Syntax(This,newVal) ) 

#define ISnmpObject_get_Access(This,pVal)	\
    ( (This)->lpVtbl -> get_Access(This,pVal) ) 

#define ISnmpObject_put_Access(This,newVal)	\
    ( (This)->lpVtbl -> put_Access(This,newVal) ) 

#define ISnmpObject_get_Status(This,pVal)	\
    ( (This)->lpVtbl -> get_Status(This,pVal) ) 

#define ISnmpObject_put_Status(This,newVal)	\
    ( (This)->lpVtbl -> put_Status(This,newVal) ) 

#define ISnmpObject_get_OIDName(This,pVal)	\
    ( (This)->lpVtbl -> get_OIDName(This,pVal) ) 

#define ISnmpObject_put_OIDName(This,newVal)	\
    ( (This)->lpVtbl -> put_OIDName(This,newVal) ) 

#define ISnmpObject_get_IsUserMib(This,pVal)	\
    ( (This)->lpVtbl -> get_IsUserMib(This,pVal) ) 

#define ISnmpObject_put_IsUserMib(This,newVal)	\
    ( (This)->lpVtbl -> put_IsUserMib(This,newVal) ) 

#define ISnmpObject_get_IsFolder(This,pVal)	\
    ( (This)->lpVtbl -> get_IsFolder(This,pVal) ) 

#define ISnmpObject_put_IsFolder(This,newVal)	\
    ( (This)->lpVtbl -> put_IsFolder(This,newVal) ) 

#define ISnmpObject_get_IsTrap(This,pVal)	\
    ( (This)->lpVtbl -> get_IsTrap(This,pVal) ) 

#define ISnmpObject_put_IsTrap(This,newVal)	\
    ( (This)->lpVtbl -> put_IsTrap(This,newVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISnmpObject_INTERFACE_DEFINED__ */


#ifndef __ISnmpTrap_INTERFACE_DEFINED__
#define __ISnmpTrap_INTERFACE_DEFINED__

/* interface ISnmpTrap */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_ISnmpTrap;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("66673904-CCFB-45C5-8AFA-5C003BFE48FA")
    ISnmpTrap : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Host( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Host( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Community( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Community( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_GenericTrap( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_GenericTrap( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_SpecificTrap( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_SpecificTrap( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Enterprise( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Enterprise( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Uptime( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Uptime( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Port( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Port( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFirstObject( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNextObject( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE AddObject( 
            VARIANT *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISnmpTrapVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISnmpTrap * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISnmpTrap * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISnmpTrap * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISnmpTrap * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISnmpTrap * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISnmpTrap * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISnmpTrap * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ISnmpTrap * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ISnmpTrap * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Host )( 
            ISnmpTrap * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Host )( 
            ISnmpTrap * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Community )( 
            ISnmpTrap * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Community )( 
            ISnmpTrap * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_GenericTrap )( 
            ISnmpTrap * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_GenericTrap )( 
            ISnmpTrap * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SpecificTrap )( 
            ISnmpTrap * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_SpecificTrap )( 
            ISnmpTrap * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Enterprise )( 
            ISnmpTrap * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Enterprise )( 
            ISnmpTrap * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Uptime )( 
            ISnmpTrap * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Uptime )( 
            ISnmpTrap * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Port )( 
            ISnmpTrap * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Port )( 
            ISnmpTrap * This,
            /* [in] */ LONG newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstObject )( 
            ISnmpTrap * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNextObject )( 
            ISnmpTrap * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *AddObject )( 
            ISnmpTrap * This,
            VARIANT *pVal);
        
        END_INTERFACE
    } ISnmpTrapVtbl;

    interface ISnmpTrap
    {
        CONST_VTBL struct ISnmpTrapVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISnmpTrap_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISnmpTrap_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISnmpTrap_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISnmpTrap_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISnmpTrap_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISnmpTrap_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISnmpTrap_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISnmpTrap_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ISnmpTrap_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ISnmpTrap_get_Host(This,pVal)	\
    ( (This)->lpVtbl -> get_Host(This,pVal) ) 

#define ISnmpTrap_put_Host(This,newVal)	\
    ( (This)->lpVtbl -> put_Host(This,newVal) ) 

#define ISnmpTrap_get_Community(This,pVal)	\
    ( (This)->lpVtbl -> get_Community(This,pVal) ) 

#define ISnmpTrap_put_Community(This,newVal)	\
    ( (This)->lpVtbl -> put_Community(This,newVal) ) 

#define ISnmpTrap_get_GenericTrap(This,pVal)	\
    ( (This)->lpVtbl -> get_GenericTrap(This,pVal) ) 

#define ISnmpTrap_put_GenericTrap(This,newVal)	\
    ( (This)->lpVtbl -> put_GenericTrap(This,newVal) ) 

#define ISnmpTrap_get_SpecificTrap(This,pVal)	\
    ( (This)->lpVtbl -> get_SpecificTrap(This,pVal) ) 

#define ISnmpTrap_put_SpecificTrap(This,newVal)	\
    ( (This)->lpVtbl -> put_SpecificTrap(This,newVal) ) 

#define ISnmpTrap_get_Enterprise(This,pVal)	\
    ( (This)->lpVtbl -> get_Enterprise(This,pVal) ) 

#define ISnmpTrap_put_Enterprise(This,newVal)	\
    ( (This)->lpVtbl -> put_Enterprise(This,newVal) ) 

#define ISnmpTrap_get_Uptime(This,pVal)	\
    ( (This)->lpVtbl -> get_Uptime(This,pVal) ) 

#define ISnmpTrap_put_Uptime(This,newVal)	\
    ( (This)->lpVtbl -> put_Uptime(This,newVal) ) 

#define ISnmpTrap_get_Port(This,pVal)	\
    ( (This)->lpVtbl -> get_Port(This,pVal) ) 

#define ISnmpTrap_put_Port(This,newVal)	\
    ( (This)->lpVtbl -> put_Port(This,newVal) ) 

#define ISnmpTrap_GetFirstObject(This,pVal)	\
    ( (This)->lpVtbl -> GetFirstObject(This,pVal) ) 

#define ISnmpTrap_GetNextObject(This,pVal)	\
    ( (This)->lpVtbl -> GetNextObject(This,pVal) ) 

#define ISnmpTrap_AddObject(This,pVal)	\
    ( (This)->lpVtbl -> AddObject(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISnmpTrap_INTERFACE_DEFINED__ */


#ifndef __ISnmpTrapManager_INTERFACE_DEFINED__
#define __ISnmpTrapManager_INTERFACE_DEFINED__

/* interface ISnmpTrapManager */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_ISnmpTrapManager;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("BCB9AFE8-D460-4BA6-AD97-A0ACD4A76E4F")
    ISnmpTrapManager : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG Error,
            /* [retval][out] */ BSTR *Description) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProtocolVersion( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProtocolVersion( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_AuthProtocol( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_AuthProtocol( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_PrivProtocol( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_PrivProtocol( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_AuthUsername( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_AuthUsername( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_AuthPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_AuthPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_PrivPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_PrivPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ContextName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ContextName( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_EngineId( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_EngineId( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Initialize( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE StartListening( 
            BSTR Community,
            /* [defaultvalue][in] */ LONG Port = 162) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE StopListening( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFirstTrap( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNextTrap( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Send( 
            /* [in] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE LoadMibFile( 
            BSTR bstrMibFile) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISnmpTrapManagerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISnmpTrapManager * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISnmpTrapManager * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISnmpTrapManager * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISnmpTrapManager * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISnmpTrapManager * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISnmpTrapManager * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISnmpTrapManager * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            ISnmpTrapManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            ISnmpTrapManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ISnmpTrapManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            ISnmpTrapManager * This,
            LONG Error,
            /* [retval][out] */ BSTR *Description);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            ISnmpTrapManager * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            ISnmpTrapManager * This,
            LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProtocolVersion )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProtocolVersion )( 
            ISnmpTrapManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AuthProtocol )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AuthProtocol )( 
            ISnmpTrapManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PrivProtocol )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PrivProtocol )( 
            ISnmpTrapManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AuthUsername )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AuthUsername )( 
            ISnmpTrapManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AuthPassword )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AuthPassword )( 
            ISnmpTrapManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PrivPassword )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PrivPassword )( 
            ISnmpTrapManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ContextName )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ContextName )( 
            ISnmpTrapManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EngineId )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_EngineId )( 
            ISnmpTrapManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            ISnmpTrapManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            ISnmpTrapManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *StartListening )( 
            ISnmpTrapManager * This,
            BSTR Community,
            /* [defaultvalue][in] */ LONG Port);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *StopListening )( 
            ISnmpTrapManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstTrap )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNextTrap )( 
            ISnmpTrapManager * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Send )( 
            ISnmpTrapManager * This,
            /* [in] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *LoadMibFile )( 
            ISnmpTrapManager * This,
            BSTR bstrMibFile);
        
        END_INTERFACE
    } ISnmpTrapManagerVtbl;

    interface ISnmpTrapManager
    {
        CONST_VTBL struct ISnmpTrapManagerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISnmpTrapManager_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISnmpTrapManager_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISnmpTrapManager_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISnmpTrapManager_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISnmpTrapManager_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISnmpTrapManager_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISnmpTrapManager_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISnmpTrapManager_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define ISnmpTrapManager_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define ISnmpTrapManager_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define ISnmpTrapManager_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define ISnmpTrapManager_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define ISnmpTrapManager_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ISnmpTrapManager_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define ISnmpTrapManager_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define ISnmpTrapManager_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define ISnmpTrapManager_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ISnmpTrapManager_GetErrorDescription(This,Error,Description)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,Error,Description) ) 

#define ISnmpTrapManager_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define ISnmpTrapManager_Sleep(This,newVal)	\
    ( (This)->lpVtbl -> Sleep(This,newVal) ) 

#define ISnmpTrapManager_get_ProtocolVersion(This,pVal)	\
    ( (This)->lpVtbl -> get_ProtocolVersion(This,pVal) ) 

#define ISnmpTrapManager_put_ProtocolVersion(This,newVal)	\
    ( (This)->lpVtbl -> put_ProtocolVersion(This,newVal) ) 

#define ISnmpTrapManager_get_AuthProtocol(This,pVal)	\
    ( (This)->lpVtbl -> get_AuthProtocol(This,pVal) ) 

#define ISnmpTrapManager_put_AuthProtocol(This,newVal)	\
    ( (This)->lpVtbl -> put_AuthProtocol(This,newVal) ) 

#define ISnmpTrapManager_get_PrivProtocol(This,pVal)	\
    ( (This)->lpVtbl -> get_PrivProtocol(This,pVal) ) 

#define ISnmpTrapManager_put_PrivProtocol(This,newVal)	\
    ( (This)->lpVtbl -> put_PrivProtocol(This,newVal) ) 

#define ISnmpTrapManager_get_AuthUsername(This,pVal)	\
    ( (This)->lpVtbl -> get_AuthUsername(This,pVal) ) 

#define ISnmpTrapManager_put_AuthUsername(This,newVal)	\
    ( (This)->lpVtbl -> put_AuthUsername(This,newVal) ) 

#define ISnmpTrapManager_get_AuthPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_AuthPassword(This,pVal) ) 

#define ISnmpTrapManager_put_AuthPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_AuthPassword(This,newVal) ) 

#define ISnmpTrapManager_get_PrivPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_PrivPassword(This,pVal) ) 

#define ISnmpTrapManager_put_PrivPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_PrivPassword(This,newVal) ) 

#define ISnmpTrapManager_get_ContextName(This,pVal)	\
    ( (This)->lpVtbl -> get_ContextName(This,pVal) ) 

#define ISnmpTrapManager_put_ContextName(This,newVal)	\
    ( (This)->lpVtbl -> put_ContextName(This,newVal) ) 

#define ISnmpTrapManager_get_EngineId(This,pVal)	\
    ( (This)->lpVtbl -> get_EngineId(This,pVal) ) 

#define ISnmpTrapManager_put_EngineId(This,newVal)	\
    ( (This)->lpVtbl -> put_EngineId(This,newVal) ) 

#define ISnmpTrapManager_Initialize(This)	\
    ( (This)->lpVtbl -> Initialize(This) ) 

#define ISnmpTrapManager_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#define ISnmpTrapManager_StartListening(This,Community,Port)	\
    ( (This)->lpVtbl -> StartListening(This,Community,Port) ) 

#define ISnmpTrapManager_StopListening(This)	\
    ( (This)->lpVtbl -> StopListening(This) ) 

#define ISnmpTrapManager_GetFirstTrap(This,pVal)	\
    ( (This)->lpVtbl -> GetFirstTrap(This,pVal) ) 

#define ISnmpTrapManager_GetNextTrap(This,pVal)	\
    ( (This)->lpVtbl -> GetNextTrap(This,pVal) ) 

#define ISnmpTrapManager_Send(This,pVal)	\
    ( (This)->lpVtbl -> Send(This,pVal) ) 

#define ISnmpTrapManager_LoadMibFile(This,bstrMibFile)	\
    ( (This)->lpVtbl -> LoadMibFile(This,bstrMibFile) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISnmpTrapManager_INTERFACE_DEFINED__ */


#ifndef __IFtpServer_INTERFACE_DEFINED__
#define __IFtpServer_INTERFACE_DEFINED__

/* interface IFtpServer */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IFtpServer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("B629A000-C7D2-4CFB-94D7-9797545EA6D1")
    IFtpServer : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_HostPort( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_HostPort( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_BinaryTransfer( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_BinaryTransfer( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_PassiveMode( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_PassiveMode( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastResponse( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Connect( 
            BSTR bstrHost,
            BSTR bstrAccount,
            BSTR bstrPassword) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Disconnect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE FindFirstFile( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE FindNextFile( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetCurrentDir( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE ChangeDir( 
            BSTR bstrDir) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE CreateDir( 
            BSTR bstrDir) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE RenameDir( 
            BSTR bstrOld,
            BSTR bstrNew) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE DeleteDir( 
            BSTR bstrDir) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFile( 
            BSTR bstrRemote,
            BSTR bstrLocal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE PutFile( 
            BSTR bstrLocal,
            /* [defaultvalue][in] */ BSTR bstrRemote = L"") = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE FindFile( 
            BSTR bstrSearch,
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE RenameFile( 
            BSTR bstrOld,
            BSTR bstrNew) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE DeleteFile( 
            BSTR bstrFile) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFtpServerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IFtpServer * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IFtpServer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IFtpServer * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IFtpServer * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IFtpServer * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IFtpServer * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IFtpServer * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IFtpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IFtpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IFtpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IFtpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IFtpServer * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IFtpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IFtpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IFtpServer * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IFtpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IFtpServer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IFtpServer * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IFtpServer * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IFtpServer * This,
            LONG lMilliSeconds);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostPort )( 
            IFtpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_HostPort )( 
            IFtpServer * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BinaryTransfer )( 
            IFtpServer * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_BinaryTransfer )( 
            IFtpServer * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PassiveMode )( 
            IFtpServer * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PassiveMode )( 
            IFtpServer * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastResponse )( 
            IFtpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Connect )( 
            IFtpServer * This,
            BSTR bstrHost,
            BSTR bstrAccount,
            BSTR bstrPassword);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Disconnect )( 
            IFtpServer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *FindFirstFile )( 
            IFtpServer * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *FindNextFile )( 
            IFtpServer * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetCurrentDir )( 
            IFtpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ChangeDir )( 
            IFtpServer * This,
            BSTR bstrDir);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *CreateDir )( 
            IFtpServer * This,
            BSTR bstrDir);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *RenameDir )( 
            IFtpServer * This,
            BSTR bstrOld,
            BSTR bstrNew);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *DeleteDir )( 
            IFtpServer * This,
            BSTR bstrDir);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFile )( 
            IFtpServer * This,
            BSTR bstrRemote,
            BSTR bstrLocal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *PutFile )( 
            IFtpServer * This,
            BSTR bstrLocal,
            /* [defaultvalue][in] */ BSTR bstrRemote);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *FindFile )( 
            IFtpServer * This,
            BSTR bstrSearch,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *RenameFile )( 
            IFtpServer * This,
            BSTR bstrOld,
            BSTR bstrNew);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *DeleteFile )( 
            IFtpServer * This,
            BSTR bstrFile);
        
        END_INTERFACE
    } IFtpServerVtbl;

    interface IFtpServer
    {
        CONST_VTBL struct IFtpServerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFtpServer_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IFtpServer_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IFtpServer_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IFtpServer_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IFtpServer_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IFtpServer_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IFtpServer_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IFtpServer_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IFtpServer_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IFtpServer_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IFtpServer_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IFtpServer_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IFtpServer_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IFtpServer_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IFtpServer_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IFtpServer_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IFtpServer_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IFtpServer_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define IFtpServer_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IFtpServer_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define IFtpServer_get_HostPort(This,pVal)	\
    ( (This)->lpVtbl -> get_HostPort(This,pVal) ) 

#define IFtpServer_put_HostPort(This,newVal)	\
    ( (This)->lpVtbl -> put_HostPort(This,newVal) ) 

#define IFtpServer_get_BinaryTransfer(This,pVal)	\
    ( (This)->lpVtbl -> get_BinaryTransfer(This,pVal) ) 

#define IFtpServer_put_BinaryTransfer(This,newVal)	\
    ( (This)->lpVtbl -> put_BinaryTransfer(This,newVal) ) 

#define IFtpServer_get_PassiveMode(This,pVal)	\
    ( (This)->lpVtbl -> get_PassiveMode(This,pVal) ) 

#define IFtpServer_put_PassiveMode(This,newVal)	\
    ( (This)->lpVtbl -> put_PassiveMode(This,newVal) ) 

#define IFtpServer_get_LastResponse(This,pVal)	\
    ( (This)->lpVtbl -> get_LastResponse(This,pVal) ) 

#define IFtpServer_Connect(This,bstrHost,bstrAccount,bstrPassword)	\
    ( (This)->lpVtbl -> Connect(This,bstrHost,bstrAccount,bstrPassword) ) 

#define IFtpServer_Disconnect(This)	\
    ( (This)->lpVtbl -> Disconnect(This) ) 

#define IFtpServer_FindFirstFile(This,pVal)	\
    ( (This)->lpVtbl -> FindFirstFile(This,pVal) ) 

#define IFtpServer_FindNextFile(This,pVal)	\
    ( (This)->lpVtbl -> FindNextFile(This,pVal) ) 

#define IFtpServer_GetCurrentDir(This,pVal)	\
    ( (This)->lpVtbl -> GetCurrentDir(This,pVal) ) 

#define IFtpServer_ChangeDir(This,bstrDir)	\
    ( (This)->lpVtbl -> ChangeDir(This,bstrDir) ) 

#define IFtpServer_CreateDir(This,bstrDir)	\
    ( (This)->lpVtbl -> CreateDir(This,bstrDir) ) 

#define IFtpServer_RenameDir(This,bstrOld,bstrNew)	\
    ( (This)->lpVtbl -> RenameDir(This,bstrOld,bstrNew) ) 

#define IFtpServer_DeleteDir(This,bstrDir)	\
    ( (This)->lpVtbl -> DeleteDir(This,bstrDir) ) 

#define IFtpServer_GetFile(This,bstrRemote,bstrLocal)	\
    ( (This)->lpVtbl -> GetFile(This,bstrRemote,bstrLocal) ) 

#define IFtpServer_PutFile(This,bstrLocal,bstrRemote)	\
    ( (This)->lpVtbl -> PutFile(This,bstrLocal,bstrRemote) ) 

#define IFtpServer_FindFile(This,bstrSearch,pVal)	\
    ( (This)->lpVtbl -> FindFile(This,bstrSearch,pVal) ) 

#define IFtpServer_RenameFile(This,bstrOld,bstrNew)	\
    ( (This)->lpVtbl -> RenameFile(This,bstrOld,bstrNew) ) 

#define IFtpServer_DeleteFile(This,bstrFile)	\
    ( (This)->lpVtbl -> DeleteFile(This,bstrFile) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IFtpServer_INTERFACE_DEFINED__ */


#ifndef __IFtpFile_INTERFACE_DEFINED__
#define __IFtpFile_INTERFACE_DEFINED__

/* interface IFtpFile */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IFtpFile;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0B545BC4-BFB2-4426-8EDF-2F482EA5C511")
    IFtpFile : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Size( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Size( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Name( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_DateSeconds( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_DateSeconds( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Date( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Date( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_IsDirectory( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_IsDirectory( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFtpFileVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IFtpFile * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IFtpFile * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IFtpFile * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IFtpFile * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IFtpFile * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IFtpFile * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IFtpFile * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IFtpFile * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Size )( 
            IFtpFile * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Size )( 
            IFtpFile * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            IFtpFile * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Name )( 
            IFtpFile * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DateSeconds )( 
            IFtpFile * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_DateSeconds )( 
            IFtpFile * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Date )( 
            IFtpFile * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Date )( 
            IFtpFile * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDirectory )( 
            IFtpFile * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IsDirectory )( 
            IFtpFile * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        END_INTERFACE
    } IFtpFileVtbl;

    interface IFtpFile
    {
        CONST_VTBL struct IFtpFileVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFtpFile_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IFtpFile_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IFtpFile_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IFtpFile_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IFtpFile_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IFtpFile_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IFtpFile_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IFtpFile_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IFtpFile_get_Size(This,pVal)	\
    ( (This)->lpVtbl -> get_Size(This,pVal) ) 

#define IFtpFile_put_Size(This,newVal)	\
    ( (This)->lpVtbl -> put_Size(This,newVal) ) 

#define IFtpFile_get_Name(This,pVal)	\
    ( (This)->lpVtbl -> get_Name(This,pVal) ) 

#define IFtpFile_put_Name(This,newVal)	\
    ( (This)->lpVtbl -> put_Name(This,newVal) ) 

#define IFtpFile_get_DateSeconds(This,pVal)	\
    ( (This)->lpVtbl -> get_DateSeconds(This,pVal) ) 

#define IFtpFile_put_DateSeconds(This,newVal)	\
    ( (This)->lpVtbl -> put_DateSeconds(This,newVal) ) 

#define IFtpFile_get_Date(This,pVal)	\
    ( (This)->lpVtbl -> get_Date(This,pVal) ) 

#define IFtpFile_put_Date(This,newVal)	\
    ( (This)->lpVtbl -> put_Date(This,newVal) ) 

#define IFtpFile_get_IsDirectory(This,pVal)	\
    ( (This)->lpVtbl -> get_IsDirectory(This,pVal) ) 

#define IFtpFile_put_IsDirectory(This,newVal)	\
    ( (This)->lpVtbl -> put_IsDirectory(This,newVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IFtpFile_INTERFACE_DEFINED__ */


#ifndef __IUdp_INTERFACE_DEFINED__
#define __IUdp_INTERFACE_DEFINED__

/* interface IUdp */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IUdp;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("96DD0191-EFBF-4C6E-B045-DB33F0D4A72F")
    IUdp : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_NewLine( 
            /* [retval][out] */ BSTR *pbstrNewLine) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_NewLine( 
            /* [in] */ BSTR bstrNewLine) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_IOTimeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_IOTimeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_RemoteAddress( 
            /* [retval][out] */ BSTR *pbstrRemoteIP) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Open( 
            BSTR bstrHost,
            LONG lPort,
            VARIANT_BOOL bListen,
            /* [defaultvalue][in] */ VARIANT_BOOL bVersion6 = ( VARIANT_BOOL  )0) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Close( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE HasData( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE SendByte( 
            short sByte) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE SendBytes( 
            BSTR bstrBytes) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE SendString( 
            BSTR bstrString) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE ReceiveByte( 
            /* [retval][out] */ short *pByte) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE ReceiveBytes( 
            /* [retval][out] */ BSTR *pBytes) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE ReceiveString( 
            /* [retval][out] */ BSTR *bstrString) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IUdpVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IUdp * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IUdp * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IUdp * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IUdp * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IUdp * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IUdp * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IUdp * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IUdp * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IUdp * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IUdp * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IUdp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IUdp * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IUdp * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IUdp * This,
            LONG lMilliSeconds);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NewLine )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pbstrNewLine);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_NewLine )( 
            IUdp * This,
            /* [in] */ BSTR bstrNewLine);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IOTimeout )( 
            IUdp * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IOTimeout )( 
            IUdp * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RemoteAddress )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pbstrRemoteIP);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Open )( 
            IUdp * This,
            BSTR bstrHost,
            LONG lPort,
            VARIANT_BOOL bListen,
            /* [defaultvalue][in] */ VARIANT_BOOL bVersion6);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Close )( 
            IUdp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *HasData )( 
            IUdp * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *SendByte )( 
            IUdp * This,
            short sByte);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *SendBytes )( 
            IUdp * This,
            BSTR bstrBytes);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *SendString )( 
            IUdp * This,
            BSTR bstrString);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ReceiveByte )( 
            IUdp * This,
            /* [retval][out] */ short *pByte);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ReceiveBytes )( 
            IUdp * This,
            /* [retval][out] */ BSTR *pBytes);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ReceiveString )( 
            IUdp * This,
            /* [retval][out] */ BSTR *bstrString);
        
        END_INTERFACE
    } IUdpVtbl;

    interface IUdp
    {
        CONST_VTBL struct IUdpVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IUdp_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IUdp_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IUdp_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IUdp_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IUdp_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IUdp_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IUdp_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IUdp_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IUdp_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IUdp_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IUdp_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IUdp_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IUdp_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IUdp_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IUdp_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IUdp_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IUdp_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IUdp_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define IUdp_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IUdp_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define IUdp_get_NewLine(This,pbstrNewLine)	\
    ( (This)->lpVtbl -> get_NewLine(This,pbstrNewLine) ) 

#define IUdp_put_NewLine(This,bstrNewLine)	\
    ( (This)->lpVtbl -> put_NewLine(This,bstrNewLine) ) 

#define IUdp_get_IOTimeout(This,pVal)	\
    ( (This)->lpVtbl -> get_IOTimeout(This,pVal) ) 

#define IUdp_put_IOTimeout(This,newVal)	\
    ( (This)->lpVtbl -> put_IOTimeout(This,newVal) ) 

#define IUdp_get_RemoteAddress(This,pbstrRemoteIP)	\
    ( (This)->lpVtbl -> get_RemoteAddress(This,pbstrRemoteIP) ) 

#define IUdp_Open(This,bstrHost,lPort,bListen,bVersion6)	\
    ( (This)->lpVtbl -> Open(This,bstrHost,lPort,bListen,bVersion6) ) 

#define IUdp_Close(This)	\
    ( (This)->lpVtbl -> Close(This) ) 

#define IUdp_HasData(This,pVal)	\
    ( (This)->lpVtbl -> HasData(This,pVal) ) 

#define IUdp_SendByte(This,sByte)	\
    ( (This)->lpVtbl -> SendByte(This,sByte) ) 

#define IUdp_SendBytes(This,bstrBytes)	\
    ( (This)->lpVtbl -> SendBytes(This,bstrBytes) ) 

#define IUdp_SendString(This,bstrString)	\
    ( (This)->lpVtbl -> SendString(This,bstrString) ) 

#define IUdp_ReceiveByte(This,pByte)	\
    ( (This)->lpVtbl -> ReceiveByte(This,pByte) ) 

#define IUdp_ReceiveBytes(This,pBytes)	\
    ( (This)->lpVtbl -> ReceiveBytes(This,pBytes) ) 

#define IUdp_ReceiveString(This,bstrString)	\
    ( (This)->lpVtbl -> ReceiveString(This,bstrString) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IUdp_INTERFACE_DEFINED__ */


#ifndef __ITcp_INTERFACE_DEFINED__
#define __ITcp_INTERFACE_DEFINED__

/* interface ITcp */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_ITcp;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4CCDB6A4-1BEE-4D3C-9937-D53CDFB5E1A3")
    ITcp : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Protocol( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Protocol( 
            /* [in] */ long newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_NewLine( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_NewLine( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_IOTimeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_IOTimeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_RemoteAddress( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ConnectionState( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Connect( 
            BSTR HostName,
            long PortNumber) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Disconnect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE StartListening( 
            long PortNumber,
            /* [defaultvalue][in] */ VARIANT_BOOL bVersion6 = ( VARIANT_BOOL  )0) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE StopListening( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE HasData( 
            /* [retval][out] */ VARIANT_BOOL *__MIDL__ITcp0000) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE ReceiveString( 
            /* [retval][out] */ BSTR *__MIDL__ITcp0001) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE SendString( 
            BSTR DataString) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE SendByte( 
            short Byte) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE ReceiveByte( 
            /* [retval][out] */ short *__MIDL__ITcp0002) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE SendBytes( 
            BSTR Bytes) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE ReceiveBytes( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetHostName( 
            /* [in] */ BSTR Host,
            /* [retval][out] */ BSTR *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITcpVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ITcp * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ITcp * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ITcp * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ITcp * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ITcp * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ITcp * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITcp * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            ITcp * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ITcp * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            ITcp * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ITcp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            ITcp * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            ITcp * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            ITcp * This,
            LONG lMilliSeconds);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Protocol )( 
            ITcp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Protocol )( 
            ITcp * This,
            /* [in] */ long newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NewLine )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_NewLine )( 
            ITcp * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IOTimeout )( 
            ITcp * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IOTimeout )( 
            ITcp * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RemoteAddress )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ConnectionState )( 
            ITcp * This,
            /* [retval][out] */ long *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Connect )( 
            ITcp * This,
            BSTR HostName,
            long PortNumber);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Disconnect )( 
            ITcp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *StartListening )( 
            ITcp * This,
            long PortNumber,
            /* [defaultvalue][in] */ VARIANT_BOOL bVersion6);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *StopListening )( 
            ITcp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *HasData )( 
            ITcp * This,
            /* [retval][out] */ VARIANT_BOOL *__MIDL__ITcp0000);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ReceiveString )( 
            ITcp * This,
            /* [retval][out] */ BSTR *__MIDL__ITcp0001);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *SendString )( 
            ITcp * This,
            BSTR DataString);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *SendByte )( 
            ITcp * This,
            short Byte);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ReceiveByte )( 
            ITcp * This,
            /* [retval][out] */ short *__MIDL__ITcp0002);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *SendBytes )( 
            ITcp * This,
            BSTR Bytes);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ReceiveBytes )( 
            ITcp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetHostName )( 
            ITcp * This,
            /* [in] */ BSTR Host,
            /* [retval][out] */ BSTR *pVal);
        
        END_INTERFACE
    } ITcpVtbl;

    interface ITcp
    {
        CONST_VTBL struct ITcpVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITcp_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITcp_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITcp_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITcp_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITcp_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITcp_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITcp_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITcp_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define ITcp_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define ITcp_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define ITcp_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define ITcp_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define ITcp_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ITcp_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define ITcp_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define ITcp_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define ITcp_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ITcp_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define ITcp_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define ITcp_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define ITcp_get_Protocol(This,pVal)	\
    ( (This)->lpVtbl -> get_Protocol(This,pVal) ) 

#define ITcp_put_Protocol(This,newVal)	\
    ( (This)->lpVtbl -> put_Protocol(This,newVal) ) 

#define ITcp_get_NewLine(This,pVal)	\
    ( (This)->lpVtbl -> get_NewLine(This,pVal) ) 

#define ITcp_put_NewLine(This,newVal)	\
    ( (This)->lpVtbl -> put_NewLine(This,newVal) ) 

#define ITcp_get_IOTimeout(This,pVal)	\
    ( (This)->lpVtbl -> get_IOTimeout(This,pVal) ) 

#define ITcp_put_IOTimeout(This,newVal)	\
    ( (This)->lpVtbl -> put_IOTimeout(This,newVal) ) 

#define ITcp_get_RemoteAddress(This,pVal)	\
    ( (This)->lpVtbl -> get_RemoteAddress(This,pVal) ) 

#define ITcp_get_ConnectionState(This,pVal)	\
    ( (This)->lpVtbl -> get_ConnectionState(This,pVal) ) 

#define ITcp_Connect(This,HostName,PortNumber)	\
    ( (This)->lpVtbl -> Connect(This,HostName,PortNumber) ) 

#define ITcp_Disconnect(This)	\
    ( (This)->lpVtbl -> Disconnect(This) ) 

#define ITcp_StartListening(This,PortNumber,bVersion6)	\
    ( (This)->lpVtbl -> StartListening(This,PortNumber,bVersion6) ) 

#define ITcp_StopListening(This)	\
    ( (This)->lpVtbl -> StopListening(This) ) 

#define ITcp_HasData(This,__MIDL__ITcp0000)	\
    ( (This)->lpVtbl -> HasData(This,__MIDL__ITcp0000) ) 

#define ITcp_ReceiveString(This,__MIDL__ITcp0001)	\
    ( (This)->lpVtbl -> ReceiveString(This,__MIDL__ITcp0001) ) 

#define ITcp_SendString(This,DataString)	\
    ( (This)->lpVtbl -> SendString(This,DataString) ) 

#define ITcp_SendByte(This,Byte)	\
    ( (This)->lpVtbl -> SendByte(This,Byte) ) 

#define ITcp_ReceiveByte(This,__MIDL__ITcp0002)	\
    ( (This)->lpVtbl -> ReceiveByte(This,__MIDL__ITcp0002) ) 

#define ITcp_SendBytes(This,Bytes)	\
    ( (This)->lpVtbl -> SendBytes(This,Bytes) ) 

#define ITcp_ReceiveBytes(This,pVal)	\
    ( (This)->lpVtbl -> ReceiveBytes(This,pVal) ) 

#define ITcp_GetHostName(This,Host,pVal)	\
    ( (This)->lpVtbl -> GetHostName(This,Host,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITcp_INTERFACE_DEFINED__ */


#ifndef __IIPtoCountry_INTERFACE_DEFINED__
#define __IIPtoCountry_INTERFACE_DEFINED__

/* interface IIPtoCountry */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IIPtoCountry;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D886339C-6F33-49AC-9FA8-73FC5A227769")
    IIPtoCountry : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Host( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Host( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_CountryCode( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_CountryCodeEx( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_CountryName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Query( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IIPtoCountryVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IIPtoCountry * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IIPtoCountry * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IIPtoCountry * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IIPtoCountry * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IIPtoCountry * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IIPtoCountry * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IIPtoCountry * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IIPtoCountry * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IIPtoCountry * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IIPtoCountry * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IIPtoCountry * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IIPtoCountry * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IIPtoCountry * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IIPtoCountry * This,
            LONG lMilliSeconds);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Host )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Host )( 
            IIPtoCountry * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CountryCode )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CountryCodeEx )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CountryName )( 
            IIPtoCountry * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Query )( 
            IIPtoCountry * This);
        
        END_INTERFACE
    } IIPtoCountryVtbl;

    interface IIPtoCountry
    {
        CONST_VTBL struct IIPtoCountryVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IIPtoCountry_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IIPtoCountry_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IIPtoCountry_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IIPtoCountry_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IIPtoCountry_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IIPtoCountry_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IIPtoCountry_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IIPtoCountry_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IIPtoCountry_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IIPtoCountry_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IIPtoCountry_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IIPtoCountry_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IIPtoCountry_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IIPtoCountry_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IIPtoCountry_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IIPtoCountry_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IIPtoCountry_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IIPtoCountry_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define IIPtoCountry_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IIPtoCountry_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define IIPtoCountry_get_Host(This,pVal)	\
    ( (This)->lpVtbl -> get_Host(This,pVal) ) 

#define IIPtoCountry_put_Host(This,newVal)	\
    ( (This)->lpVtbl -> put_Host(This,newVal) ) 

#define IIPtoCountry_get_CountryCode(This,pVal)	\
    ( (This)->lpVtbl -> get_CountryCode(This,pVal) ) 

#define IIPtoCountry_get_CountryCodeEx(This,pVal)	\
    ( (This)->lpVtbl -> get_CountryCodeEx(This,pVal) ) 

#define IIPtoCountry_get_CountryName(This,pVal)	\
    ( (This)->lpVtbl -> get_CountryName(This,pVal) ) 

#define IIPtoCountry_Query(This)	\
    ( (This)->lpVtbl -> Query(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IIPtoCountry_INTERFACE_DEFINED__ */


#ifndef __IDnsServer_INTERFACE_DEFINED__
#define __IDnsServer_INTERFACE_DEFINED__

/* interface IDnsServer */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IDnsServer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D51DDAA9-6264-4ED7-82DF-1A46DE9D1C37")
    IDnsServer : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Server( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Server( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ServerPort( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ServerPort( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ActivityFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ActivityFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_IsAuthoritative( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Lookup( 
            BSTR bstrHost,
            LONG lType) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFirstRecord( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNextRecord( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IDnsServerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IDnsServer * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IDnsServer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IDnsServer * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IDnsServer * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IDnsServer * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IDnsServer * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IDnsServer * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IDnsServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IDnsServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IDnsServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IDnsServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IDnsServer * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IDnsServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IDnsServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IDnsServer * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IDnsServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IDnsServer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IDnsServer * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IDnsServer * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Server )( 
            IDnsServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Server )( 
            IDnsServer * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServerPort )( 
            IDnsServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ServerPort )( 
            IDnsServer * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ActivityFile )( 
            IDnsServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ActivityFile )( 
            IDnsServer * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsAuthoritative )( 
            IDnsServer * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Lookup )( 
            IDnsServer * This,
            BSTR bstrHost,
            LONG lType);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstRecord )( 
            IDnsServer * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNextRecord )( 
            IDnsServer * This,
            /* [retval][out] */ VARIANT *pVal);
        
        END_INTERFACE
    } IDnsServerVtbl;

    interface IDnsServer
    {
        CONST_VTBL struct IDnsServerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDnsServer_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IDnsServer_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IDnsServer_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IDnsServer_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IDnsServer_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IDnsServer_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IDnsServer_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IDnsServer_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IDnsServer_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IDnsServer_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IDnsServer_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IDnsServer_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IDnsServer_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IDnsServer_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IDnsServer_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IDnsServer_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IDnsServer_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IDnsServer_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define IDnsServer_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IDnsServer_get_Server(This,pVal)	\
    ( (This)->lpVtbl -> get_Server(This,pVal) ) 

#define IDnsServer_put_Server(This,newVal)	\
    ( (This)->lpVtbl -> put_Server(This,newVal) ) 

#define IDnsServer_get_ServerPort(This,pVal)	\
    ( (This)->lpVtbl -> get_ServerPort(This,pVal) ) 

#define IDnsServer_put_ServerPort(This,newVal)	\
    ( (This)->lpVtbl -> put_ServerPort(This,newVal) ) 

#define IDnsServer_get_ActivityFile(This,pVal)	\
    ( (This)->lpVtbl -> get_ActivityFile(This,pVal) ) 

#define IDnsServer_put_ActivityFile(This,newVal)	\
    ( (This)->lpVtbl -> put_ActivityFile(This,newVal) ) 

#define IDnsServer_get_IsAuthoritative(This,pVal)	\
    ( (This)->lpVtbl -> get_IsAuthoritative(This,pVal) ) 

#define IDnsServer_Lookup(This,bstrHost,lType)	\
    ( (This)->lpVtbl -> Lookup(This,bstrHost,lType) ) 

#define IDnsServer_GetFirstRecord(This,pVal)	\
    ( (This)->lpVtbl -> GetFirstRecord(This,pVal) ) 

#define IDnsServer_GetNextRecord(This,pVal)	\
    ( (This)->lpVtbl -> GetNextRecord(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IDnsServer_INTERFACE_DEFINED__ */


#ifndef __IDnsRecord_INTERFACE_DEFINED__
#define __IDnsRecord_INTERFACE_DEFINED__

/* interface IDnsRecord */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IDnsRecord;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("CFCFF8CA-30EA-44F8-856E-52AD9A971024")
    IDnsRecord : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Name( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Class( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Class( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Type( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Type( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_TTL( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_TTL( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Preference( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Preference( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_NameServer( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_NameServer( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_MailExchange( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_MailExchange( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Address( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Address( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_MailBox( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_MailBox( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_SerialNumber( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_SerialNumber( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_RefreshInterval( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_RefreshInterval( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_RetryInterval( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_RetryInterval( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ExpirationLimit( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ExpirationLimit( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_MinimumTTL( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_MinimumTTL( 
            /* [in] */ LONG newVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IDnsRecordVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IDnsRecord * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IDnsRecord * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IDnsRecord * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IDnsRecord * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IDnsRecord * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IDnsRecord * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IDnsRecord * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IDnsRecord * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            IDnsRecord * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Name )( 
            IDnsRecord * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Class )( 
            IDnsRecord * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Class )( 
            IDnsRecord * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Type )( 
            IDnsRecord * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Type )( 
            IDnsRecord * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TTL )( 
            IDnsRecord * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_TTL )( 
            IDnsRecord * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Preference )( 
            IDnsRecord * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Preference )( 
            IDnsRecord * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NameServer )( 
            IDnsRecord * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_NameServer )( 
            IDnsRecord * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MailExchange )( 
            IDnsRecord * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_MailExchange )( 
            IDnsRecord * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Address )( 
            IDnsRecord * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Address )( 
            IDnsRecord * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MailBox )( 
            IDnsRecord * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_MailBox )( 
            IDnsRecord * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SerialNumber )( 
            IDnsRecord * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_SerialNumber )( 
            IDnsRecord * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RefreshInterval )( 
            IDnsRecord * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_RefreshInterval )( 
            IDnsRecord * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RetryInterval )( 
            IDnsRecord * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_RetryInterval )( 
            IDnsRecord * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ExpirationLimit )( 
            IDnsRecord * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ExpirationLimit )( 
            IDnsRecord * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MinimumTTL )( 
            IDnsRecord * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_MinimumTTL )( 
            IDnsRecord * This,
            /* [in] */ LONG newVal);
        
        END_INTERFACE
    } IDnsRecordVtbl;

    interface IDnsRecord
    {
        CONST_VTBL struct IDnsRecordVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDnsRecord_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IDnsRecord_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IDnsRecord_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IDnsRecord_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IDnsRecord_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IDnsRecord_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IDnsRecord_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IDnsRecord_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IDnsRecord_get_Name(This,pVal)	\
    ( (This)->lpVtbl -> get_Name(This,pVal) ) 

#define IDnsRecord_put_Name(This,newVal)	\
    ( (This)->lpVtbl -> put_Name(This,newVal) ) 

#define IDnsRecord_get_Class(This,pVal)	\
    ( (This)->lpVtbl -> get_Class(This,pVal) ) 

#define IDnsRecord_put_Class(This,newVal)	\
    ( (This)->lpVtbl -> put_Class(This,newVal) ) 

#define IDnsRecord_get_Type(This,pVal)	\
    ( (This)->lpVtbl -> get_Type(This,pVal) ) 

#define IDnsRecord_put_Type(This,newVal)	\
    ( (This)->lpVtbl -> put_Type(This,newVal) ) 

#define IDnsRecord_get_TTL(This,pVal)	\
    ( (This)->lpVtbl -> get_TTL(This,pVal) ) 

#define IDnsRecord_put_TTL(This,newVal)	\
    ( (This)->lpVtbl -> put_TTL(This,newVal) ) 

#define IDnsRecord_get_Preference(This,pVal)	\
    ( (This)->lpVtbl -> get_Preference(This,pVal) ) 

#define IDnsRecord_put_Preference(This,newVal)	\
    ( (This)->lpVtbl -> put_Preference(This,newVal) ) 

#define IDnsRecord_get_NameServer(This,pVal)	\
    ( (This)->lpVtbl -> get_NameServer(This,pVal) ) 

#define IDnsRecord_put_NameServer(This,newVal)	\
    ( (This)->lpVtbl -> put_NameServer(This,newVal) ) 

#define IDnsRecord_get_MailExchange(This,pVal)	\
    ( (This)->lpVtbl -> get_MailExchange(This,pVal) ) 

#define IDnsRecord_put_MailExchange(This,newVal)	\
    ( (This)->lpVtbl -> put_MailExchange(This,newVal) ) 

#define IDnsRecord_get_Address(This,pVal)	\
    ( (This)->lpVtbl -> get_Address(This,pVal) ) 

#define IDnsRecord_put_Address(This,newVal)	\
    ( (This)->lpVtbl -> put_Address(This,newVal) ) 

#define IDnsRecord_get_MailBox(This,pVal)	\
    ( (This)->lpVtbl -> get_MailBox(This,pVal) ) 

#define IDnsRecord_put_MailBox(This,newVal)	\
    ( (This)->lpVtbl -> put_MailBox(This,newVal) ) 

#define IDnsRecord_get_SerialNumber(This,pVal)	\
    ( (This)->lpVtbl -> get_SerialNumber(This,pVal) ) 

#define IDnsRecord_put_SerialNumber(This,newVal)	\
    ( (This)->lpVtbl -> put_SerialNumber(This,newVal) ) 

#define IDnsRecord_get_RefreshInterval(This,pVal)	\
    ( (This)->lpVtbl -> get_RefreshInterval(This,pVal) ) 

#define IDnsRecord_put_RefreshInterval(This,newVal)	\
    ( (This)->lpVtbl -> put_RefreshInterval(This,newVal) ) 

#define IDnsRecord_get_RetryInterval(This,pVal)	\
    ( (This)->lpVtbl -> get_RetryInterval(This,pVal) ) 

#define IDnsRecord_put_RetryInterval(This,newVal)	\
    ( (This)->lpVtbl -> put_RetryInterval(This,newVal) ) 

#define IDnsRecord_get_ExpirationLimit(This,pVal)	\
    ( (This)->lpVtbl -> get_ExpirationLimit(This,pVal) ) 

#define IDnsRecord_put_ExpirationLimit(This,newVal)	\
    ( (This)->lpVtbl -> put_ExpirationLimit(This,newVal) ) 

#define IDnsRecord_get_MinimumTTL(This,pVal)	\
    ( (This)->lpVtbl -> get_MinimumTTL(This,pVal) ) 

#define IDnsRecord_put_MinimumTTL(This,newVal)	\
    ( (This)->lpVtbl -> put_MinimumTTL(This,newVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IDnsRecord_INTERFACE_DEFINED__ */


#ifndef __ISsh_INTERFACE_DEFINED__
#define __ISsh_INTERFACE_DEFINED__

/* interface ISsh */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_ISsh;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("CF6C8D3D-1ACE-4111-AE15-724CB21DAC08")
    ISsh : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Host( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Host( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Port( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Port( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_RequireHostVerification( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_RequireHostVerification( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_UserName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_UserName( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Password( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Password( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_PrivateKeyFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_PrivateKeyFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Command( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Command( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ScriptTimeOut( 
            /* [retval][out] */ long *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ScriptTimeOut( 
            /* [in] */ long newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_StdOut( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_StdErr( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_AcceptHostKey( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_AcceptHostKey( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_HostFingerprint( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Run( void) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_sysTmpFileRes( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_sysTmpFileRes( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_sysTmpFileOut( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_sysTmpFileOut( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_sysTmpFileErr( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_sysTmpFileErr( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProtocolError( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISshVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISsh * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISsh * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISsh * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISsh * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISsh * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISsh * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISsh * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            ISsh * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ISsh * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ISsh * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            ISsh * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            ISsh * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            ISsh * This,
            LONG lMilliSeconds);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Host )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Host )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Port )( 
            ISsh * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Port )( 
            ISsh * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RequireHostVerification )( 
            ISsh * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_RequireHostVerification )( 
            ISsh * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UserName )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_UserName )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Password )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Password )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PrivateKeyFile )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PrivateKeyFile )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Command )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Command )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ScriptTimeOut )( 
            ISsh * This,
            /* [retval][out] */ long *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ScriptTimeOut )( 
            ISsh * This,
            /* [in] */ long newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_StdOut )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_StdErr )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AcceptHostKey )( 
            ISsh * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AcceptHostKey )( 
            ISsh * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostFingerprint )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Run )( 
            ISsh * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_sysTmpFileRes )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_sysTmpFileRes )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_sysTmpFileOut )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_sysTmpFileOut )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_sysTmpFileErr )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_sysTmpFileErr )( 
            ISsh * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProtocolError )( 
            ISsh * This,
            /* [retval][out] */ BSTR *pVal);
        
        END_INTERFACE
    } ISshVtbl;

    interface ISsh
    {
        CONST_VTBL struct ISshVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISsh_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISsh_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISsh_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISsh_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISsh_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISsh_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISsh_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISsh_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define ISsh_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define ISsh_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define ISsh_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define ISsh_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define ISsh_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ISsh_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define ISsh_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define ISsh_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define ISsh_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ISsh_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define ISsh_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define ISsh_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define ISsh_get_Host(This,pVal)	\
    ( (This)->lpVtbl -> get_Host(This,pVal) ) 

#define ISsh_put_Host(This,newVal)	\
    ( (This)->lpVtbl -> put_Host(This,newVal) ) 

#define ISsh_get_Port(This,pVal)	\
    ( (This)->lpVtbl -> get_Port(This,pVal) ) 

#define ISsh_put_Port(This,newVal)	\
    ( (This)->lpVtbl -> put_Port(This,newVal) ) 

#define ISsh_get_RequireHostVerification(This,pVal)	\
    ( (This)->lpVtbl -> get_RequireHostVerification(This,pVal) ) 

#define ISsh_put_RequireHostVerification(This,newVal)	\
    ( (This)->lpVtbl -> put_RequireHostVerification(This,newVal) ) 

#define ISsh_get_UserName(This,pVal)	\
    ( (This)->lpVtbl -> get_UserName(This,pVal) ) 

#define ISsh_put_UserName(This,newVal)	\
    ( (This)->lpVtbl -> put_UserName(This,newVal) ) 

#define ISsh_get_Password(This,pVal)	\
    ( (This)->lpVtbl -> get_Password(This,pVal) ) 

#define ISsh_put_Password(This,newVal)	\
    ( (This)->lpVtbl -> put_Password(This,newVal) ) 

#define ISsh_get_PrivateKeyFile(This,pVal)	\
    ( (This)->lpVtbl -> get_PrivateKeyFile(This,pVal) ) 

#define ISsh_put_PrivateKeyFile(This,newVal)	\
    ( (This)->lpVtbl -> put_PrivateKeyFile(This,newVal) ) 

#define ISsh_get_Command(This,pVal)	\
    ( (This)->lpVtbl -> get_Command(This,pVal) ) 

#define ISsh_put_Command(This,newVal)	\
    ( (This)->lpVtbl -> put_Command(This,newVal) ) 

#define ISsh_get_ScriptTimeOut(This,pVal)	\
    ( (This)->lpVtbl -> get_ScriptTimeOut(This,pVal) ) 

#define ISsh_put_ScriptTimeOut(This,newVal)	\
    ( (This)->lpVtbl -> put_ScriptTimeOut(This,newVal) ) 

#define ISsh_get_StdOut(This,pVal)	\
    ( (This)->lpVtbl -> get_StdOut(This,pVal) ) 

#define ISsh_get_StdErr(This,pVal)	\
    ( (This)->lpVtbl -> get_StdErr(This,pVal) ) 

#define ISsh_get_AcceptHostKey(This,pVal)	\
    ( (This)->lpVtbl -> get_AcceptHostKey(This,pVal) ) 

#define ISsh_put_AcceptHostKey(This,newVal)	\
    ( (This)->lpVtbl -> put_AcceptHostKey(This,newVal) ) 

#define ISsh_get_HostFingerprint(This,pVal)	\
    ( (This)->lpVtbl -> get_HostFingerprint(This,pVal) ) 

#define ISsh_Run(This)	\
    ( (This)->lpVtbl -> Run(This) ) 

#define ISsh_get_sysTmpFileRes(This,pVal)	\
    ( (This)->lpVtbl -> get_sysTmpFileRes(This,pVal) ) 

#define ISsh_put_sysTmpFileRes(This,newVal)	\
    ( (This)->lpVtbl -> put_sysTmpFileRes(This,newVal) ) 

#define ISsh_get_sysTmpFileOut(This,pVal)	\
    ( (This)->lpVtbl -> get_sysTmpFileOut(This,pVal) ) 

#define ISsh_put_sysTmpFileOut(This,newVal)	\
    ( (This)->lpVtbl -> put_sysTmpFileOut(This,newVal) ) 

#define ISsh_get_sysTmpFileErr(This,pVal)	\
    ( (This)->lpVtbl -> get_sysTmpFileErr(This,pVal) ) 

#define ISsh_put_sysTmpFileErr(This,newVal)	\
    ( (This)->lpVtbl -> put_sysTmpFileErr(This,newVal) ) 

#define ISsh_get_ProtocolError(This,pVal)	\
    ( (This)->lpVtbl -> get_ProtocolError(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISsh_INTERFACE_DEFINED__ */


#ifndef __ISnmpMibBrowser_INTERFACE_DEFINED__
#define __ISnmpMibBrowser_INTERFACE_DEFINED__

/* interface ISnmpMibBrowser */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_ISnmpMibBrowser;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3FEF0C60-A4D8-4740-A6B7-5DF4388996B0")
    ISnmpMibBrowser : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE LoadMibFile( 
            BSTR bstrFileName) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Get( 
            BSTR bstrParent,
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNext( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE LookupOIDName( 
            BSTR bstrOID,
            /* [retval][out] */ BSTR *pbstrOIDName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISnmpMibBrowserVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISnmpMibBrowser * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISnmpMibBrowser * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISnmpMibBrowser * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISnmpMibBrowser * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISnmpMibBrowser * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISnmpMibBrowser * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISnmpMibBrowser * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            ISnmpMibBrowser * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            ISnmpMibBrowser * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            ISnmpMibBrowser * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            ISnmpMibBrowser * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            ISnmpMibBrowser * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ISnmpMibBrowser * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            ISnmpMibBrowser * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            ISnmpMibBrowser * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            ISnmpMibBrowser * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ISnmpMibBrowser * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            ISnmpMibBrowser * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            ISnmpMibBrowser * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *LoadMibFile )( 
            ISnmpMibBrowser * This,
            BSTR bstrFileName);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Get )( 
            ISnmpMibBrowser * This,
            BSTR bstrParent,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNext )( 
            ISnmpMibBrowser * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *LookupOIDName )( 
            ISnmpMibBrowser * This,
            BSTR bstrOID,
            /* [retval][out] */ BSTR *pbstrOIDName);
        
        END_INTERFACE
    } ISnmpMibBrowserVtbl;

    interface ISnmpMibBrowser
    {
        CONST_VTBL struct ISnmpMibBrowserVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISnmpMibBrowser_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISnmpMibBrowser_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISnmpMibBrowser_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISnmpMibBrowser_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISnmpMibBrowser_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISnmpMibBrowser_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISnmpMibBrowser_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISnmpMibBrowser_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define ISnmpMibBrowser_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define ISnmpMibBrowser_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define ISnmpMibBrowser_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define ISnmpMibBrowser_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define ISnmpMibBrowser_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ISnmpMibBrowser_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define ISnmpMibBrowser_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define ISnmpMibBrowser_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define ISnmpMibBrowser_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ISnmpMibBrowser_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define ISnmpMibBrowser_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define ISnmpMibBrowser_LoadMibFile(This,bstrFileName)	\
    ( (This)->lpVtbl -> LoadMibFile(This,bstrFileName) ) 

#define ISnmpMibBrowser_Get(This,bstrParent,pVal)	\
    ( (This)->lpVtbl -> Get(This,bstrParent,pVal) ) 

#define ISnmpMibBrowser_GetNext(This,pVal)	\
    ( (This)->lpVtbl -> GetNext(This,pVal) ) 

#define ISnmpMibBrowser_LookupOIDName(This,bstrOID,pbstrOIDName)	\
    ( (This)->lpVtbl -> LookupOIDName(This,bstrOID,pbstrOIDName) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISnmpMibBrowser_INTERFACE_DEFINED__ */


#ifndef __ITftpServer_INTERFACE_DEFINED__
#define __ITftpServer_INTERFACE_DEFINED__

/* interface ITftpServer */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_ITftpServer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("411DBA2E-A588-4F74-AD8B-4E426E63894A")
    ITftpServer : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_HostPort( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_HostPort( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_BinaryTransfer( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_BinaryTransfer( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Timeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Timeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_PacketsSent( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_BytesSent( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_PacketsReceived( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_BytesReceived( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Get( 
            /* [in] */ BSTR Host,
            /* [in] */ BSTR RemoteFile,
            /* [defaultvalue][in] */ BSTR LocalFile = L"") = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Put( 
            /* [in] */ BSTR Host,
            /* [in] */ BSTR LocalFile,
            /* [defaultvalue][in] */ BSTR RemoteFile = L"") = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITftpServerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ITftpServer * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ITftpServer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ITftpServer * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ITftpServer * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ITftpServer * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ITftpServer * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITftpServer * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            ITftpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            ITftpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            ITftpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            ITftpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            ITftpServer * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ITftpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            ITftpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            ITftpServer * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            ITftpServer * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ITftpServer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            ITftpServer * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            ITftpServer * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostPort )( 
            ITftpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_HostPort )( 
            ITftpServer * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BinaryTransfer )( 
            ITftpServer * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_BinaryTransfer )( 
            ITftpServer * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Timeout )( 
            ITftpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Timeout )( 
            ITftpServer * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PacketsSent )( 
            ITftpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BytesSent )( 
            ITftpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PacketsReceived )( 
            ITftpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BytesReceived )( 
            ITftpServer * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Get )( 
            ITftpServer * This,
            /* [in] */ BSTR Host,
            /* [in] */ BSTR RemoteFile,
            /* [defaultvalue][in] */ BSTR LocalFile);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Put )( 
            ITftpServer * This,
            /* [in] */ BSTR Host,
            /* [in] */ BSTR LocalFile,
            /* [defaultvalue][in] */ BSTR RemoteFile);
        
        END_INTERFACE
    } ITftpServerVtbl;

    interface ITftpServer
    {
        CONST_VTBL struct ITftpServerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITftpServer_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITftpServer_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITftpServer_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITftpServer_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITftpServer_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITftpServer_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITftpServer_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITftpServer_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define ITftpServer_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define ITftpServer_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define ITftpServer_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define ITftpServer_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define ITftpServer_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ITftpServer_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define ITftpServer_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define ITftpServer_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define ITftpServer_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ITftpServer_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define ITftpServer_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define ITftpServer_get_HostPort(This,pVal)	\
    ( (This)->lpVtbl -> get_HostPort(This,pVal) ) 

#define ITftpServer_put_HostPort(This,newVal)	\
    ( (This)->lpVtbl -> put_HostPort(This,newVal) ) 

#define ITftpServer_get_BinaryTransfer(This,pVal)	\
    ( (This)->lpVtbl -> get_BinaryTransfer(This,pVal) ) 

#define ITftpServer_put_BinaryTransfer(This,newVal)	\
    ( (This)->lpVtbl -> put_BinaryTransfer(This,newVal) ) 

#define ITftpServer_get_Timeout(This,pVal)	\
    ( (This)->lpVtbl -> get_Timeout(This,pVal) ) 

#define ITftpServer_put_Timeout(This,newVal)	\
    ( (This)->lpVtbl -> put_Timeout(This,newVal) ) 

#define ITftpServer_get_PacketsSent(This,pVal)	\
    ( (This)->lpVtbl -> get_PacketsSent(This,pVal) ) 

#define ITftpServer_get_BytesSent(This,pVal)	\
    ( (This)->lpVtbl -> get_BytesSent(This,pVal) ) 

#define ITftpServer_get_PacketsReceived(This,pVal)	\
    ( (This)->lpVtbl -> get_PacketsReceived(This,pVal) ) 

#define ITftpServer_get_BytesReceived(This,pVal)	\
    ( (This)->lpVtbl -> get_BytesReceived(This,pVal) ) 

#define ITftpServer_Get(This,Host,RemoteFile,LocalFile)	\
    ( (This)->lpVtbl -> Get(This,Host,RemoteFile,LocalFile) ) 

#define ITftpServer_Put(This,Host,LocalFile,RemoteFile)	\
    ( (This)->lpVtbl -> Put(This,Host,LocalFile,RemoteFile) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITftpServer_INTERFACE_DEFINED__ */


#ifndef __IMsn_INTERFACE_DEFINED__
#define __IMsn_INTERFACE_DEFINED__

/* interface IMsn */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IMsn;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6EA3B1C3-71BA-4404-AA01-BB39CE2A3423")
    IMsn : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Server( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Server( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ServerPort( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ServerPort( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ServerTimeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ServerTimeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_MsnAccount( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_MsnAccount( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_MsnPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_MsnPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_MsnDisplayName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_MsnDisplayName( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Message( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Message( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE AddRecipient( 
            /* [in] */ BSTR bstrRecipient) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Send( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMsnVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMsn * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMsn * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMsn * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IMsn * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IMsn * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IMsn * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IMsn * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IMsn * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IMsn * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IMsn * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IMsn * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IMsn * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Server )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Server )( 
            IMsn * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServerPort )( 
            IMsn * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ServerPort )( 
            IMsn * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServerTimeout )( 
            IMsn * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ServerTimeout )( 
            IMsn * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MsnAccount )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_MsnAccount )( 
            IMsn * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MsnPassword )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_MsnPassword )( 
            IMsn * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MsnDisplayName )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_MsnDisplayName )( 
            IMsn * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Message )( 
            IMsn * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Message )( 
            IMsn * This,
            /* [in] */ BSTR newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *AddRecipient )( 
            IMsn * This,
            /* [in] */ BSTR bstrRecipient);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Send )( 
            IMsn * This);
        
        END_INTERFACE
    } IMsnVtbl;

    interface IMsn
    {
        CONST_VTBL struct IMsnVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMsn_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMsn_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMsn_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMsn_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IMsn_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IMsn_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IMsn_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IMsn_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IMsn_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IMsn_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IMsn_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IMsn_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IMsn_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IMsn_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IMsn_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IMsn_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IMsn_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IMsn_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define IMsn_get_Server(This,pVal)	\
    ( (This)->lpVtbl -> get_Server(This,pVal) ) 

#define IMsn_put_Server(This,newVal)	\
    ( (This)->lpVtbl -> put_Server(This,newVal) ) 

#define IMsn_get_ServerPort(This,pVal)	\
    ( (This)->lpVtbl -> get_ServerPort(This,pVal) ) 

#define IMsn_put_ServerPort(This,newVal)	\
    ( (This)->lpVtbl -> put_ServerPort(This,newVal) ) 

#define IMsn_get_ServerTimeout(This,pVal)	\
    ( (This)->lpVtbl -> get_ServerTimeout(This,pVal) ) 

#define IMsn_put_ServerTimeout(This,newVal)	\
    ( (This)->lpVtbl -> put_ServerTimeout(This,newVal) ) 

#define IMsn_get_MsnAccount(This,pVal)	\
    ( (This)->lpVtbl -> get_MsnAccount(This,pVal) ) 

#define IMsn_put_MsnAccount(This,newVal)	\
    ( (This)->lpVtbl -> put_MsnAccount(This,newVal) ) 

#define IMsn_get_MsnPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_MsnPassword(This,pVal) ) 

#define IMsn_put_MsnPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_MsnPassword(This,newVal) ) 

#define IMsn_get_MsnDisplayName(This,pVal)	\
    ( (This)->lpVtbl -> get_MsnDisplayName(This,pVal) ) 

#define IMsn_put_MsnDisplayName(This,newVal)	\
    ( (This)->lpVtbl -> put_MsnDisplayName(This,newVal) ) 

#define IMsn_get_Message(This,pVal)	\
    ( (This)->lpVtbl -> get_Message(This,pVal) ) 

#define IMsn_put_Message(This,newVal)	\
    ( (This)->lpVtbl -> put_Message(This,newVal) ) 

#define IMsn_AddRecipient(This,bstrRecipient)	\
    ( (This)->lpVtbl -> AddRecipient(This,bstrRecipient) ) 

#define IMsn_Send(This)	\
    ( (This)->lpVtbl -> Send(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMsn_INTERFACE_DEFINED__ */


#ifndef __IRadius_INTERFACE_DEFINED__
#define __IRadius_INTERFACE_DEFINED__

/* interface IRadius */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IRadius;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8218765A-2229-40DF-B600-A8A64AF09AC5")
    IRadius : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Port( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Port( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Timeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Timeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CheckAccess( 
            BSTR Host,
            BSTR User,
            BSTR Password,
            BSTR Secret) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IRadiusVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IRadius * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IRadius * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IRadius * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IRadius * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IRadius * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IRadius * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IRadius * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IRadius * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IRadius * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IRadius * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IRadius * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IRadius * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IRadius * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IRadius * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IRadius * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IRadius * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IRadius * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IRadius * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IRadius * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Port )( 
            IRadius * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Port )( 
            IRadius * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Timeout )( 
            IRadius * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Timeout )( 
            IRadius * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CheckAccess )( 
            IRadius * This,
            BSTR Host,
            BSTR User,
            BSTR Password,
            BSTR Secret);
        
        END_INTERFACE
    } IRadiusVtbl;

    interface IRadius
    {
        CONST_VTBL struct IRadiusVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IRadius_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IRadius_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IRadius_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IRadius_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IRadius_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IRadius_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IRadius_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IRadius_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IRadius_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IRadius_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IRadius_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IRadius_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IRadius_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IRadius_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IRadius_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IRadius_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IRadius_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IRadius_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define IRadius_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IRadius_get_Port(This,pVal)	\
    ( (This)->lpVtbl -> get_Port(This,pVal) ) 

#define IRadius_put_Port(This,newVal)	\
    ( (This)->lpVtbl -> put_Port(This,newVal) ) 

#define IRadius_get_Timeout(This,pVal)	\
    ( (This)->lpVtbl -> get_Timeout(This,pVal) ) 

#define IRadius_put_Timeout(This,newVal)	\
    ( (This)->lpVtbl -> put_Timeout(This,newVal) ) 

#define IRadius_CheckAccess(This,Host,User,Password,Secret)	\
    ( (This)->lpVtbl -> CheckAccess(This,Host,User,Password,Secret) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IRadius_INTERFACE_DEFINED__ */


#ifndef __IScp_INTERFACE_DEFINED__
#define __IScp_INTERFACE_DEFINED__

/* interface IScp */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IScp;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4116F2EA-0122-496A-A70E-AFFD0A9B5F6A")
    IScp : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliseconds) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Host( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Host( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Port( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Port( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_UserName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_UserName( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Password( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Password( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_PrivateKeyFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_PrivateKeyFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_AcceptHostKey( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_AcceptHostKey( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Recursive( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Recursive( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_PreserveAttributes( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_PreserveAttributes( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Compression( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Compression( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_sysTempPath( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_sysTempPath( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_HostFingerprint( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProtocolError( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CopyToRemote( 
            BSTR localPath,
            BSTR remotePath) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CopyToLocal( 
            BSTR remotePath,
            BSTR localPath) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IScpVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IScp * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IScp * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IScp * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IScp * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IScp * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IScp * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IScp * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IScp * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IScp * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IScp * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IScp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IScp * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IScp * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IScp * This,
            LONG lMilliseconds);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Host )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Host )( 
            IScp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Port )( 
            IScp * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Port )( 
            IScp * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UserName )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_UserName )( 
            IScp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Password )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Password )( 
            IScp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PrivateKeyFile )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PrivateKeyFile )( 
            IScp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AcceptHostKey )( 
            IScp * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AcceptHostKey )( 
            IScp * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Recursive )( 
            IScp * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Recursive )( 
            IScp * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PreserveAttributes )( 
            IScp * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PreserveAttributes )( 
            IScp * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Compression )( 
            IScp * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Compression )( 
            IScp * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_sysTempPath )( 
            IScp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_sysTempPath )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostFingerprint )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProtocolError )( 
            IScp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CopyToRemote )( 
            IScp * This,
            BSTR localPath,
            BSTR remotePath);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CopyToLocal )( 
            IScp * This,
            BSTR remotePath,
            BSTR localPath);
        
        END_INTERFACE
    } IScpVtbl;

    interface IScp
    {
        CONST_VTBL struct IScpVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IScp_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IScp_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IScp_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IScp_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IScp_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IScp_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IScp_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IScp_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IScp_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IScp_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IScp_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IScp_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IScp_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IScp_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IScp_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IScp_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IScp_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IScp_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define IScp_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define IScp_Sleep(This,lMilliseconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliseconds) ) 

#define IScp_get_Host(This,pVal)	\
    ( (This)->lpVtbl -> get_Host(This,pVal) ) 

#define IScp_put_Host(This,newVal)	\
    ( (This)->lpVtbl -> put_Host(This,newVal) ) 

#define IScp_get_Port(This,pVal)	\
    ( (This)->lpVtbl -> get_Port(This,pVal) ) 

#define IScp_put_Port(This,newVal)	\
    ( (This)->lpVtbl -> put_Port(This,newVal) ) 

#define IScp_get_UserName(This,pVal)	\
    ( (This)->lpVtbl -> get_UserName(This,pVal) ) 

#define IScp_put_UserName(This,newVal)	\
    ( (This)->lpVtbl -> put_UserName(This,newVal) ) 

#define IScp_get_Password(This,pVal)	\
    ( (This)->lpVtbl -> get_Password(This,pVal) ) 

#define IScp_put_Password(This,newVal)	\
    ( (This)->lpVtbl -> put_Password(This,newVal) ) 

#define IScp_get_PrivateKeyFile(This,pVal)	\
    ( (This)->lpVtbl -> get_PrivateKeyFile(This,pVal) ) 

#define IScp_put_PrivateKeyFile(This,newVal)	\
    ( (This)->lpVtbl -> put_PrivateKeyFile(This,newVal) ) 

#define IScp_get_AcceptHostKey(This,pVal)	\
    ( (This)->lpVtbl -> get_AcceptHostKey(This,pVal) ) 

#define IScp_put_AcceptHostKey(This,newVal)	\
    ( (This)->lpVtbl -> put_AcceptHostKey(This,newVal) ) 

#define IScp_get_Recursive(This,pVal)	\
    ( (This)->lpVtbl -> get_Recursive(This,pVal) ) 

#define IScp_put_Recursive(This,newVal)	\
    ( (This)->lpVtbl -> put_Recursive(This,newVal) ) 

#define IScp_get_PreserveAttributes(This,pVal)	\
    ( (This)->lpVtbl -> get_PreserveAttributes(This,pVal) ) 

#define IScp_put_PreserveAttributes(This,newVal)	\
    ( (This)->lpVtbl -> put_PreserveAttributes(This,newVal) ) 

#define IScp_get_Compression(This,pVal)	\
    ( (This)->lpVtbl -> get_Compression(This,pVal) ) 

#define IScp_put_Compression(This,newVal)	\
    ( (This)->lpVtbl -> put_Compression(This,newVal) ) 

#define IScp_put_sysTempPath(This,newVal)	\
    ( (This)->lpVtbl -> put_sysTempPath(This,newVal) ) 

#define IScp_get_sysTempPath(This,pVal)	\
    ( (This)->lpVtbl -> get_sysTempPath(This,pVal) ) 

#define IScp_get_HostFingerprint(This,pVal)	\
    ( (This)->lpVtbl -> get_HostFingerprint(This,pVal) ) 

#define IScp_get_ProtocolError(This,pVal)	\
    ( (This)->lpVtbl -> get_ProtocolError(This,pVal) ) 

#define IScp_CopyToRemote(This,localPath,remotePath)	\
    ( (This)->lpVtbl -> CopyToRemote(This,localPath,remotePath) ) 

#define IScp_CopyToLocal(This,remotePath,localPath)	\
    ( (This)->lpVtbl -> CopyToLocal(This,remotePath,localPath) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IScp_INTERFACE_DEFINED__ */


#ifndef __ISFtp_INTERFACE_DEFINED__
#define __ISFtp_INTERFACE_DEFINED__

/* interface ISFtp */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ISFtp;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("06B4D9C1-3A2D-43C3-8E1E-72BD1EBA6B4D")
    ISFtp : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG newVal,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliseconds) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Host( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Host( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Port( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Port( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_UserName( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_UserName( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Password( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Password( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_PrivateKeyFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_PrivateKeyFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_AcceptHostKey( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_AcceptHostKey( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Compression( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Compression( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_sysTempPath( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_sysTempPath( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_HostFingerprint( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProtocolError( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Connect( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Disconnect( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetCurrentDir( 
            /* [retval][out] */ BSTR *bstrCwd) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ChangeDir( 
            BSTR bstrNewDir) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateDir( 
            BSTR bstrDirName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RenameDir( 
            BSTR bstrOldName,
            BSTR bstrNewName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteDir( 
            BSTR bstrDirName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FindFile( 
            BSTR bstrSearch,
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FindFirstFile( 
            BSTR bstrSearch,
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FindNextFile( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFile( 
            BSTR bstrRemotePath,
            BSTR bstrLocalPath) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PutFile( 
            BSTR bstrLocalPath,
            BSTR bstrRemotePath) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RenameFile( 
            BSTR bstrOldFile,
            BSTR bstrNewFile) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DeleteFile( 
            BSTR bstrFileName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISFtpVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISFtp * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISFtp * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISFtp * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISFtp * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISFtp * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISFtp * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISFtp * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            ISFtp * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ISFtp * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            ISFtp * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ISFtp * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            ISFtp * This,
            LONG newVal,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            ISFtp * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            ISFtp * This,
            LONG lMilliseconds);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Host )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Host )( 
            ISFtp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Port )( 
            ISFtp * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Port )( 
            ISFtp * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UserName )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_UserName )( 
            ISFtp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Password )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Password )( 
            ISFtp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PrivateKeyFile )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PrivateKeyFile )( 
            ISFtp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AcceptHostKey )( 
            ISFtp * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_AcceptHostKey )( 
            ISFtp * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Compression )( 
            ISFtp * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Compression )( 
            ISFtp * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_sysTempPath )( 
            ISFtp * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_sysTempPath )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostFingerprint )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProtocolError )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Connect )( 
            ISFtp * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Disconnect )( 
            ISFtp * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetCurrentDir )( 
            ISFtp * This,
            /* [retval][out] */ BSTR *bstrCwd);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ChangeDir )( 
            ISFtp * This,
            BSTR bstrNewDir);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateDir )( 
            ISFtp * This,
            BSTR bstrDirName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RenameDir )( 
            ISFtp * This,
            BSTR bstrOldName,
            BSTR bstrNewName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteDir )( 
            ISFtp * This,
            BSTR bstrDirName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *FindFile )( 
            ISFtp * This,
            BSTR bstrSearch,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *FindFirstFile )( 
            ISFtp * This,
            BSTR bstrSearch,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *FindNextFile )( 
            ISFtp * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetFile )( 
            ISFtp * This,
            BSTR bstrRemotePath,
            BSTR bstrLocalPath);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *PutFile )( 
            ISFtp * This,
            BSTR bstrLocalPath,
            BSTR bstrRemotePath);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RenameFile )( 
            ISFtp * This,
            BSTR bstrOldFile,
            BSTR bstrNewFile);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DeleteFile )( 
            ISFtp * This,
            BSTR bstrFileName);
        
        END_INTERFACE
    } ISFtpVtbl;

    interface ISFtp
    {
        CONST_VTBL struct ISFtpVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISFtp_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISFtp_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISFtp_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISFtp_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISFtp_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISFtp_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISFtp_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISFtp_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define ISFtp_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define ISFtp_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define ISFtp_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define ISFtp_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define ISFtp_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ISFtp_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define ISFtp_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define ISFtp_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define ISFtp_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ISFtp_GetErrorDescription(This,newVal,pVal)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,newVal,pVal) ) 

#define ISFtp_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define ISFtp_Sleep(This,lMilliseconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliseconds) ) 

#define ISFtp_get_Host(This,pVal)	\
    ( (This)->lpVtbl -> get_Host(This,pVal) ) 

#define ISFtp_put_Host(This,newVal)	\
    ( (This)->lpVtbl -> put_Host(This,newVal) ) 

#define ISFtp_get_Port(This,pVal)	\
    ( (This)->lpVtbl -> get_Port(This,pVal) ) 

#define ISFtp_put_Port(This,newVal)	\
    ( (This)->lpVtbl -> put_Port(This,newVal) ) 

#define ISFtp_get_UserName(This,pVal)	\
    ( (This)->lpVtbl -> get_UserName(This,pVal) ) 

#define ISFtp_put_UserName(This,newVal)	\
    ( (This)->lpVtbl -> put_UserName(This,newVal) ) 

#define ISFtp_get_Password(This,pVal)	\
    ( (This)->lpVtbl -> get_Password(This,pVal) ) 

#define ISFtp_put_Password(This,newVal)	\
    ( (This)->lpVtbl -> put_Password(This,newVal) ) 

#define ISFtp_get_PrivateKeyFile(This,pVal)	\
    ( (This)->lpVtbl -> get_PrivateKeyFile(This,pVal) ) 

#define ISFtp_put_PrivateKeyFile(This,newVal)	\
    ( (This)->lpVtbl -> put_PrivateKeyFile(This,newVal) ) 

#define ISFtp_get_AcceptHostKey(This,pVal)	\
    ( (This)->lpVtbl -> get_AcceptHostKey(This,pVal) ) 

#define ISFtp_put_AcceptHostKey(This,newVal)	\
    ( (This)->lpVtbl -> put_AcceptHostKey(This,newVal) ) 

#define ISFtp_get_Compression(This,pVal)	\
    ( (This)->lpVtbl -> get_Compression(This,pVal) ) 

#define ISFtp_put_Compression(This,newVal)	\
    ( (This)->lpVtbl -> put_Compression(This,newVal) ) 

#define ISFtp_put_sysTempPath(This,newVal)	\
    ( (This)->lpVtbl -> put_sysTempPath(This,newVal) ) 

#define ISFtp_get_sysTempPath(This,pVal)	\
    ( (This)->lpVtbl -> get_sysTempPath(This,pVal) ) 

#define ISFtp_get_HostFingerprint(This,pVal)	\
    ( (This)->lpVtbl -> get_HostFingerprint(This,pVal) ) 

#define ISFtp_get_ProtocolError(This,pVal)	\
    ( (This)->lpVtbl -> get_ProtocolError(This,pVal) ) 

#define ISFtp_Connect(This)	\
    ( (This)->lpVtbl -> Connect(This) ) 

#define ISFtp_Disconnect(This)	\
    ( (This)->lpVtbl -> Disconnect(This) ) 

#define ISFtp_GetCurrentDir(This,bstrCwd)	\
    ( (This)->lpVtbl -> GetCurrentDir(This,bstrCwd) ) 

#define ISFtp_ChangeDir(This,bstrNewDir)	\
    ( (This)->lpVtbl -> ChangeDir(This,bstrNewDir) ) 

#define ISFtp_CreateDir(This,bstrDirName)	\
    ( (This)->lpVtbl -> CreateDir(This,bstrDirName) ) 

#define ISFtp_RenameDir(This,bstrOldName,bstrNewName)	\
    ( (This)->lpVtbl -> RenameDir(This,bstrOldName,bstrNewName) ) 

#define ISFtp_DeleteDir(This,bstrDirName)	\
    ( (This)->lpVtbl -> DeleteDir(This,bstrDirName) ) 

#define ISFtp_FindFile(This,bstrSearch,pVal)	\
    ( (This)->lpVtbl -> FindFile(This,bstrSearch,pVal) ) 

#define ISFtp_FindFirstFile(This,bstrSearch,pVal)	\
    ( (This)->lpVtbl -> FindFirstFile(This,bstrSearch,pVal) ) 

#define ISFtp_FindNextFile(This,pVal)	\
    ( (This)->lpVtbl -> FindNextFile(This,pVal) ) 

#define ISFtp_GetFile(This,bstrRemotePath,bstrLocalPath)	\
    ( (This)->lpVtbl -> GetFile(This,bstrRemotePath,bstrLocalPath) ) 

#define ISFtp_PutFile(This,bstrLocalPath,bstrRemotePath)	\
    ( (This)->lpVtbl -> PutFile(This,bstrLocalPath,bstrRemotePath) ) 

#define ISFtp_RenameFile(This,bstrOldFile,bstrNewFile)	\
    ( (This)->lpVtbl -> RenameFile(This,bstrOldFile,bstrNewFile) ) 

#define ISFtp_DeleteFile(This,bstrFileName)	\
    ( (This)->lpVtbl -> DeleteFile(This,bstrFileName) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISFtp_INTERFACE_DEFINED__ */


#ifndef __ISFtpFile_INTERFACE_DEFINED__
#define __ISFtpFile_INTERFACE_DEFINED__

/* interface ISFtpFile */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ISFtpFile;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("5479FBF8-C8BD-4DC0-9967-AAA27F768994")
    ISFtpFile : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Name( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SizeBytes( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_SizeBytes( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SizeBytesHigh( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_SizeBytesHigh( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SizeKB( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SizeMB( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IsDirectory( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_IsDirectory( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Date( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Date( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DateSeconds( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_DateSeconds( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISFtpFileVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISFtpFile * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISFtpFile * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISFtpFile * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ISFtpFile * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ISFtpFile * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ISFtpFile * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISFtpFile * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            ISFtpFile * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Name )( 
            ISFtpFile * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SizeBytes )( 
            ISFtpFile * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_SizeBytes )( 
            ISFtpFile * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SizeBytesHigh )( 
            ISFtpFile * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_SizeBytesHigh )( 
            ISFtpFile * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SizeKB )( 
            ISFtpFile * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SizeMB )( 
            ISFtpFile * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDirectory )( 
            ISFtpFile * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IsDirectory )( 
            ISFtpFile * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Date )( 
            ISFtpFile * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Date )( 
            ISFtpFile * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DateSeconds )( 
            ISFtpFile * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_DateSeconds )( 
            ISFtpFile * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ISFtpFile * This);
        
        END_INTERFACE
    } ISFtpFileVtbl;

    interface ISFtpFile
    {
        CONST_VTBL struct ISFtpFileVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISFtpFile_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISFtpFile_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISFtpFile_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISFtpFile_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISFtpFile_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISFtpFile_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISFtpFile_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISFtpFile_get_Name(This,pVal)	\
    ( (This)->lpVtbl -> get_Name(This,pVal) ) 

#define ISFtpFile_put_Name(This,newVal)	\
    ( (This)->lpVtbl -> put_Name(This,newVal) ) 

#define ISFtpFile_get_SizeBytes(This,pVal)	\
    ( (This)->lpVtbl -> get_SizeBytes(This,pVal) ) 

#define ISFtpFile_put_SizeBytes(This,newVal)	\
    ( (This)->lpVtbl -> put_SizeBytes(This,newVal) ) 

#define ISFtpFile_get_SizeBytesHigh(This,pVal)	\
    ( (This)->lpVtbl -> get_SizeBytesHigh(This,pVal) ) 

#define ISFtpFile_put_SizeBytesHigh(This,newVal)	\
    ( (This)->lpVtbl -> put_SizeBytesHigh(This,newVal) ) 

#define ISFtpFile_get_SizeKB(This,pVal)	\
    ( (This)->lpVtbl -> get_SizeKB(This,pVal) ) 

#define ISFtpFile_get_SizeMB(This,pVal)	\
    ( (This)->lpVtbl -> get_SizeMB(This,pVal) ) 

#define ISFtpFile_get_IsDirectory(This,pVal)	\
    ( (This)->lpVtbl -> get_IsDirectory(This,pVal) ) 

#define ISFtpFile_put_IsDirectory(This,newVal)	\
    ( (This)->lpVtbl -> put_IsDirectory(This,newVal) ) 

#define ISFtpFile_get_Date(This,pVal)	\
    ( (This)->lpVtbl -> get_Date(This,pVal) ) 

#define ISFtpFile_put_Date(This,newVal)	\
    ( (This)->lpVtbl -> put_Date(This,newVal) ) 

#define ISFtpFile_get_DateSeconds(This,pVal)	\
    ( (This)->lpVtbl -> get_DateSeconds(This,pVal) ) 

#define ISFtpFile_put_DateSeconds(This,newVal)	\
    ( (This)->lpVtbl -> put_DateSeconds(This,newVal) ) 

#define ISFtpFile_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISFtpFile_INTERFACE_DEFINED__ */


#ifndef __IHttpEx_INTERFACE_DEFINED__
#define __IHttpEx_INTERFACE_DEFINED__

/* interface IHttpEx */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IHttpEx;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("805D87DC-5860-4562-BE30-802A47A2F7E0")
    IHttpEx : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            /* [in] */ LONG lErrorCode,
            /* [retval][out] */ BSTR *bstrErrorDescription) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Activate( 
            /* [in] */ BSTR bstrKey,
            /* [in] */ VARIANT_BOOL bPersistent) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            /* [in] */ LONG lTime) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_HttpLibrary( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_HttpLibrary( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_WebAccount( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_WebAccount( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_WebPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_WebPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyServer( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyServer( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyAccount( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyAccount( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ConnectionPoolSize( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ConnectionPoolSize( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ConnectionExpireTimeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ConnectionExpireTimeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_RequestTimeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_RequestTimeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ResponseTimeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ResponseTimeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_UserAgent( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_UserAgent( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FollowRedirect( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_FollowRedirect( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MaxRedirectionDepth( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_MaxRedirectionDepth( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LastResponseCode( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Get( 
            /* [in] */ BSTR bstrUrl,
            /* [retval][out] */ BSTR *bstrResponse) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Post( 
            /* [in] */ BSTR bstrUrl,
            /* [in] */ BSTR bstrData,
            /* [retval][out] */ BSTR *bstrResponse) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Head( 
            /* [in] */ BSTR bstrUrl,
            /* [retval][out] */ BSTR *bstrResponse) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFile( 
            /* [in] */ BSTR vsUrl,
            /* [in] */ BSTR bstrFileName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetHeader( 
            /* [in] */ BSTR bstrHeader,
            /* [in] */ BSTR bstrValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE UrlEncode( 
            /* [in] */ BSTR bstrIn,
            /* [retval][out] */ BSTR *bstrOut) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IHttpExVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IHttpEx * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IHttpEx * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IHttpEx * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IHttpEx * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IHttpEx * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IHttpEx * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IHttpEx * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IHttpEx * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IHttpEx * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IHttpEx * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IHttpEx * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IHttpEx * This,
            /* [in] */ LONG lErrorCode,
            /* [retval][out] */ BSTR *bstrErrorDescription);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IHttpEx * This,
            /* [in] */ BSTR bstrKey,
            /* [in] */ VARIANT_BOOL bPersistent);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IHttpEx * This,
            /* [in] */ LONG lTime);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HttpLibrary )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_HttpLibrary )( 
            IHttpEx * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_WebAccount )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_WebAccount )( 
            IHttpEx * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_WebPassword )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_WebPassword )( 
            IHttpEx * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyServer )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyServer )( 
            IHttpEx * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyAccount )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyAccount )( 
            IHttpEx * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyPassword )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyPassword )( 
            IHttpEx * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ConnectionPoolSize )( 
            IHttpEx * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ConnectionPoolSize )( 
            IHttpEx * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ConnectionExpireTimeout )( 
            IHttpEx * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ConnectionExpireTimeout )( 
            IHttpEx * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RequestTimeout )( 
            IHttpEx * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_RequestTimeout )( 
            IHttpEx * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ResponseTimeout )( 
            IHttpEx * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ResponseTimeout )( 
            IHttpEx * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UserAgent )( 
            IHttpEx * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_UserAgent )( 
            IHttpEx * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FollowRedirect )( 
            IHttpEx * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_FollowRedirect )( 
            IHttpEx * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MaxRedirectionDepth )( 
            IHttpEx * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_MaxRedirectionDepth )( 
            IHttpEx * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastResponseCode )( 
            IHttpEx * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Get )( 
            IHttpEx * This,
            /* [in] */ BSTR bstrUrl,
            /* [retval][out] */ BSTR *bstrResponse);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Post )( 
            IHttpEx * This,
            /* [in] */ BSTR bstrUrl,
            /* [in] */ BSTR bstrData,
            /* [retval][out] */ BSTR *bstrResponse);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Head )( 
            IHttpEx * This,
            /* [in] */ BSTR bstrUrl,
            /* [retval][out] */ BSTR *bstrResponse);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetFile )( 
            IHttpEx * This,
            /* [in] */ BSTR vsUrl,
            /* [in] */ BSTR bstrFileName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetHeader )( 
            IHttpEx * This,
            /* [in] */ BSTR bstrHeader,
            /* [in] */ BSTR bstrValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *UrlEncode )( 
            IHttpEx * This,
            /* [in] */ BSTR bstrIn,
            /* [retval][out] */ BSTR *bstrOut);
        
        END_INTERFACE
    } IHttpExVtbl;

    interface IHttpEx
    {
        CONST_VTBL struct IHttpExVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IHttpEx_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IHttpEx_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IHttpEx_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IHttpEx_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IHttpEx_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IHttpEx_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IHttpEx_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IHttpEx_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IHttpEx_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IHttpEx_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IHttpEx_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IHttpEx_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IHttpEx_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IHttpEx_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IHttpEx_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IHttpEx_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IHttpEx_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IHttpEx_GetErrorDescription(This,lErrorCode,bstrErrorDescription)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,lErrorCode,bstrErrorDescription) ) 

#define IHttpEx_Activate(This,bstrKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrKey,bPersistent) ) 

#define IHttpEx_Sleep(This,lTime)	\
    ( (This)->lpVtbl -> Sleep(This,lTime) ) 

#define IHttpEx_get_HttpLibrary(This,pVal)	\
    ( (This)->lpVtbl -> get_HttpLibrary(This,pVal) ) 

#define IHttpEx_put_HttpLibrary(This,newVal)	\
    ( (This)->lpVtbl -> put_HttpLibrary(This,newVal) ) 

#define IHttpEx_get_WebAccount(This,pVal)	\
    ( (This)->lpVtbl -> get_WebAccount(This,pVal) ) 

#define IHttpEx_put_WebAccount(This,newVal)	\
    ( (This)->lpVtbl -> put_WebAccount(This,newVal) ) 

#define IHttpEx_get_WebPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_WebPassword(This,pVal) ) 

#define IHttpEx_put_WebPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_WebPassword(This,newVal) ) 

#define IHttpEx_get_ProxyServer(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyServer(This,pVal) ) 

#define IHttpEx_put_ProxyServer(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyServer(This,newVal) ) 

#define IHttpEx_get_ProxyAccount(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyAccount(This,pVal) ) 

#define IHttpEx_put_ProxyAccount(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyAccount(This,newVal) ) 

#define IHttpEx_get_ProxyPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyPassword(This,pVal) ) 

#define IHttpEx_put_ProxyPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyPassword(This,newVal) ) 

#define IHttpEx_get_ConnectionPoolSize(This,pVal)	\
    ( (This)->lpVtbl -> get_ConnectionPoolSize(This,pVal) ) 

#define IHttpEx_put_ConnectionPoolSize(This,newVal)	\
    ( (This)->lpVtbl -> put_ConnectionPoolSize(This,newVal) ) 

#define IHttpEx_get_ConnectionExpireTimeout(This,pVal)	\
    ( (This)->lpVtbl -> get_ConnectionExpireTimeout(This,pVal) ) 

#define IHttpEx_put_ConnectionExpireTimeout(This,newVal)	\
    ( (This)->lpVtbl -> put_ConnectionExpireTimeout(This,newVal) ) 

#define IHttpEx_get_RequestTimeout(This,pVal)	\
    ( (This)->lpVtbl -> get_RequestTimeout(This,pVal) ) 

#define IHttpEx_put_RequestTimeout(This,newVal)	\
    ( (This)->lpVtbl -> put_RequestTimeout(This,newVal) ) 

#define IHttpEx_get_ResponseTimeout(This,pVal)	\
    ( (This)->lpVtbl -> get_ResponseTimeout(This,pVal) ) 

#define IHttpEx_put_ResponseTimeout(This,newVal)	\
    ( (This)->lpVtbl -> put_ResponseTimeout(This,newVal) ) 

#define IHttpEx_get_UserAgent(This,pVal)	\
    ( (This)->lpVtbl -> get_UserAgent(This,pVal) ) 

#define IHttpEx_put_UserAgent(This,newVal)	\
    ( (This)->lpVtbl -> put_UserAgent(This,newVal) ) 

#define IHttpEx_get_FollowRedirect(This,pVal)	\
    ( (This)->lpVtbl -> get_FollowRedirect(This,pVal) ) 

#define IHttpEx_put_FollowRedirect(This,newVal)	\
    ( (This)->lpVtbl -> put_FollowRedirect(This,newVal) ) 

#define IHttpEx_get_MaxRedirectionDepth(This,pVal)	\
    ( (This)->lpVtbl -> get_MaxRedirectionDepth(This,pVal) ) 

#define IHttpEx_put_MaxRedirectionDepth(This,newVal)	\
    ( (This)->lpVtbl -> put_MaxRedirectionDepth(This,newVal) ) 

#define IHttpEx_get_LastResponseCode(This,pVal)	\
    ( (This)->lpVtbl -> get_LastResponseCode(This,pVal) ) 

#define IHttpEx_Get(This,bstrUrl,bstrResponse)	\
    ( (This)->lpVtbl -> Get(This,bstrUrl,bstrResponse) ) 

#define IHttpEx_Post(This,bstrUrl,bstrData,bstrResponse)	\
    ( (This)->lpVtbl -> Post(This,bstrUrl,bstrData,bstrResponse) ) 

#define IHttpEx_Head(This,bstrUrl,bstrResponse)	\
    ( (This)->lpVtbl -> Head(This,bstrUrl,bstrResponse) ) 

#define IHttpEx_GetFile(This,vsUrl,bstrFileName)	\
    ( (This)->lpVtbl -> GetFile(This,vsUrl,bstrFileName) ) 

#define IHttpEx_SetHeader(This,bstrHeader,bstrValue)	\
    ( (This)->lpVtbl -> SetHeader(This,bstrHeader,bstrValue) ) 

#define IHttpEx_UrlEncode(This,bstrIn,bstrOut)	\
    ( (This)->lpVtbl -> UrlEncode(This,bstrIn,bstrOut) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IHttpEx_INTERFACE_DEFINED__ */


#ifndef __ITraceRoute_INTERFACE_DEFINED__
#define __ITraceRoute_INTERFACE_DEFINED__

/* interface ITraceRoute */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ITraceRoute;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("081790B5-1D5D-4FFF-9F46-6B5F2E144BFF")
    ITraceRoute : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__ITraceRoute0000) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG lMilliSeconds) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ResolveHostName( 
            /* [retval][out] */ VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ResolveHostName( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MaxHops( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_MaxHops( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_BufferSize( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_BufferSize( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Timeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Timeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FindFirstHop( 
            /* [in] */ BSTR Hostname,
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE FindNextHop( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITraceRouteVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ITraceRoute * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ITraceRoute * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ITraceRoute * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ITraceRoute * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ITraceRoute * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ITraceRoute * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITraceRoute * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            ITraceRoute * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            ITraceRoute * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            ITraceRoute * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            ITraceRoute * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            ITraceRoute * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            ITraceRoute * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            ITraceRoute * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            ITraceRoute * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            ITraceRoute * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ITraceRoute * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            ITraceRoute * This,
            long ErrorCode,
            /* [retval][out] */ BSTR *__MIDL__ITraceRoute0000);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            ITraceRoute * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            ITraceRoute * This,
            LONG lMilliSeconds);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ResolveHostName )( 
            ITraceRoute * This,
            /* [retval][out] */ VARIANT_BOOL *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ResolveHostName )( 
            ITraceRoute * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MaxHops )( 
            ITraceRoute * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_MaxHops )( 
            ITraceRoute * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BufferSize )( 
            ITraceRoute * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_BufferSize )( 
            ITraceRoute * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Timeout )( 
            ITraceRoute * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Timeout )( 
            ITraceRoute * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *FindFirstHop )( 
            ITraceRoute * This,
            /* [in] */ BSTR Hostname,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *FindNextHop )( 
            ITraceRoute * This,
            /* [retval][out] */ VARIANT *pVal);
        
        END_INTERFACE
    } ITraceRouteVtbl;

    interface ITraceRoute
    {
        CONST_VTBL struct ITraceRouteVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITraceRoute_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITraceRoute_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITraceRoute_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITraceRoute_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITraceRoute_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITraceRoute_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITraceRoute_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITraceRoute_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define ITraceRoute_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define ITraceRoute_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define ITraceRoute_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define ITraceRoute_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define ITraceRoute_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define ITraceRoute_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define ITraceRoute_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define ITraceRoute_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define ITraceRoute_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ITraceRoute_GetErrorDescription(This,ErrorCode,__MIDL__ITraceRoute0000)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,ErrorCode,__MIDL__ITraceRoute0000) ) 

#define ITraceRoute_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define ITraceRoute_Sleep(This,lMilliSeconds)	\
    ( (This)->lpVtbl -> Sleep(This,lMilliSeconds) ) 

#define ITraceRoute_get_ResolveHostName(This,pVal)	\
    ( (This)->lpVtbl -> get_ResolveHostName(This,pVal) ) 

#define ITraceRoute_put_ResolveHostName(This,newVal)	\
    ( (This)->lpVtbl -> put_ResolveHostName(This,newVal) ) 

#define ITraceRoute_get_MaxHops(This,pVal)	\
    ( (This)->lpVtbl -> get_MaxHops(This,pVal) ) 

#define ITraceRoute_put_MaxHops(This,newVal)	\
    ( (This)->lpVtbl -> put_MaxHops(This,newVal) ) 

#define ITraceRoute_get_BufferSize(This,pVal)	\
    ( (This)->lpVtbl -> get_BufferSize(This,pVal) ) 

#define ITraceRoute_put_BufferSize(This,newVal)	\
    ( (This)->lpVtbl -> put_BufferSize(This,newVal) ) 

#define ITraceRoute_get_Timeout(This,pVal)	\
    ( (This)->lpVtbl -> get_Timeout(This,pVal) ) 

#define ITraceRoute_put_Timeout(This,newVal)	\
    ( (This)->lpVtbl -> put_Timeout(This,newVal) ) 

#define ITraceRoute_FindFirstHop(This,Hostname,pVal)	\
    ( (This)->lpVtbl -> FindFirstHop(This,Hostname,pVal) ) 

#define ITraceRoute_FindNextHop(This,pVal)	\
    ( (This)->lpVtbl -> FindNextHop(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITraceRoute_INTERFACE_DEFINED__ */


#ifndef __ITraceHop_INTERFACE_DEFINED__
#define __ITraceHop_INTERFACE_DEFINED__

/* interface ITraceHop */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ITraceHop;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("601A723F-F66D-4129-91D5-AD1B5E9CB590")
    ITraceHop : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Host( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Host( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IP( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_IP( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ResponseTime( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ResponseTime( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Hop( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Hop( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITraceHopVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ITraceHop * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ITraceHop * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ITraceHop * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            ITraceHop * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            ITraceHop * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            ITraceHop * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITraceHop * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Host )( 
            ITraceHop * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Host )( 
            ITraceHop * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IP )( 
            ITraceHop * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IP )( 
            ITraceHop * This,
            /* [in] */ BSTR newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ResponseTime )( 
            ITraceHop * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ResponseTime )( 
            ITraceHop * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Hop )( 
            ITraceHop * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Hop )( 
            ITraceHop * This,
            /* [in] */ LONG newVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            ITraceHop * This);
        
        END_INTERFACE
    } ITraceHopVtbl;

    interface ITraceHop
    {
        CONST_VTBL struct ITraceHopVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITraceHop_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITraceHop_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITraceHop_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITraceHop_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITraceHop_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITraceHop_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITraceHop_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITraceHop_get_Host(This,pVal)	\
    ( (This)->lpVtbl -> get_Host(This,pVal) ) 

#define ITraceHop_put_Host(This,newVal)	\
    ( (This)->lpVtbl -> put_Host(This,newVal) ) 

#define ITraceHop_get_IP(This,pVal)	\
    ( (This)->lpVtbl -> get_IP(This,pVal) ) 

#define ITraceHop_put_IP(This,newVal)	\
    ( (This)->lpVtbl -> put_IP(This,newVal) ) 

#define ITraceHop_get_ResponseTime(This,pVal)	\
    ( (This)->lpVtbl -> get_ResponseTime(This,pVal) ) 

#define ITraceHop_put_ResponseTime(This,newVal)	\
    ( (This)->lpVtbl -> put_ResponseTime(This,newVal) ) 

#define ITraceHop_get_Hop(This,pVal)	\
    ( (This)->lpVtbl -> get_Hop(This,pVal) ) 

#define ITraceHop_put_Hop(This,newVal)	\
    ( (This)->lpVtbl -> put_Hop(This,newVal) ) 

#define ITraceHop_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITraceHop_INTERFACE_DEFINED__ */


#ifndef __I_SnmpManager_INTERFACE_DEFINED__
#define __I_SnmpManager_INTERFACE_DEFINED__

/* interface I_SnmpManager */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_I_SnmpManager;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("F46A9413-336E-4E18-A2C3-CD4068C25A0A")
    I_SnmpManager : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG Error,
            /* [retval][out] */ BSTR *Description) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ BOOL bPersistent = -1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProtocolVersion( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProtocolVersion( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Timeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Timeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Initialize( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Open( 
            BSTR Agent,
            BSTR Community,
            /* [defaultvalue][in] */ LONG Port = 161) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Close( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Get( 
            BSTR OID,
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNext( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Set( 
            VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE LoadMibFile( 
            BSTR bstrMibFile) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct I_SnmpManagerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            I_SnmpManager * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            I_SnmpManager * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            I_SnmpManager * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            I_SnmpManager * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            I_SnmpManager * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            I_SnmpManager * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            I_SnmpManager * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            I_SnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            I_SnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            I_SnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            I_SnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            I_SnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            I_SnmpManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            I_SnmpManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            I_SnmpManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            I_SnmpManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            I_SnmpManager * This,
            LONG Error,
            /* [retval][out] */ BSTR *Description);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            I_SnmpManager * This,
            BSTR bstrRegKey,
            /* [defaultvalue][in] */ BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            I_SnmpManager * This,
            LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProtocolVersion )( 
            I_SnmpManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProtocolVersion )( 
            I_SnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Timeout )( 
            I_SnmpManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Timeout )( 
            I_SnmpManager * This,
            /* [in] */ LONG newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            I_SnmpManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            I_SnmpManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Open )( 
            I_SnmpManager * This,
            BSTR Agent,
            BSTR Community,
            /* [defaultvalue][in] */ LONG Port);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Close )( 
            I_SnmpManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Get )( 
            I_SnmpManager * This,
            BSTR OID,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNext )( 
            I_SnmpManager * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Set )( 
            I_SnmpManager * This,
            VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *LoadMibFile )( 
            I_SnmpManager * This,
            BSTR bstrMibFile);
        
        END_INTERFACE
    } I_SnmpManagerVtbl;

    interface I_SnmpManager
    {
        CONST_VTBL struct I_SnmpManagerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define I_SnmpManager_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define I_SnmpManager_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define I_SnmpManager_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define I_SnmpManager_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define I_SnmpManager_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define I_SnmpManager_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define I_SnmpManager_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define I_SnmpManager_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define I_SnmpManager_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define I_SnmpManager_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define I_SnmpManager_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define I_SnmpManager_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define I_SnmpManager_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define I_SnmpManager_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define I_SnmpManager_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define I_SnmpManager_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define I_SnmpManager_GetErrorDescription(This,Error,Description)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,Error,Description) ) 

#define I_SnmpManager_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define I_SnmpManager_Sleep(This,newVal)	\
    ( (This)->lpVtbl -> Sleep(This,newVal) ) 

#define I_SnmpManager_get_ProtocolVersion(This,pVal)	\
    ( (This)->lpVtbl -> get_ProtocolVersion(This,pVal) ) 

#define I_SnmpManager_put_ProtocolVersion(This,newVal)	\
    ( (This)->lpVtbl -> put_ProtocolVersion(This,newVal) ) 

#define I_SnmpManager_get_Timeout(This,pVal)	\
    ( (This)->lpVtbl -> get_Timeout(This,pVal) ) 

#define I_SnmpManager_put_Timeout(This,newVal)	\
    ( (This)->lpVtbl -> put_Timeout(This,newVal) ) 

#define I_SnmpManager_Initialize(This)	\
    ( (This)->lpVtbl -> Initialize(This) ) 

#define I_SnmpManager_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#define I_SnmpManager_Open(This,Agent,Community,Port)	\
    ( (This)->lpVtbl -> Open(This,Agent,Community,Port) ) 

#define I_SnmpManager_Close(This)	\
    ( (This)->lpVtbl -> Close(This) ) 

#define I_SnmpManager_Get(This,OID,pVal)	\
    ( (This)->lpVtbl -> Get(This,OID,pVal) ) 

#define I_SnmpManager_GetNext(This,pVal)	\
    ( (This)->lpVtbl -> GetNext(This,pVal) ) 

#define I_SnmpManager_Set(This,pVal)	\
    ( (This)->lpVtbl -> Set(This,pVal) ) 

#define I_SnmpManager_LoadMibFile(This,bstrMibFile)	\
    ( (This)->lpVtbl -> LoadMibFile(This,bstrMibFile) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __I_SnmpManager_INTERFACE_DEFINED__ */


#ifndef __I_SnmpTrapManager_INTERFACE_DEFINED__
#define __I_SnmpTrapManager_INTERFACE_DEFINED__

/* interface I_SnmpTrapManager */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_I_SnmpTrapManager;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("07316FD5-B0E6-4A17-9015-9ABC7FECAEB4")
    I_SnmpTrapManager : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG Error,
            /* [retval][out] */ BSTR *Description) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrRegKey,
            BOOL bPersistent) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProtocolVersion( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProtocolVersion( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Initialize( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE StartListening( 
            BSTR Community,
            LONG Port) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE StopListening( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFirstTrap( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNextTrap( 
            /* [retval][out] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Send( 
            /* [in] */ VARIANT *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE LoadMibFile( 
            BSTR bstrMibFile) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct I_SnmpTrapManagerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            I_SnmpTrapManager * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            I_SnmpTrapManager * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            I_SnmpTrapManager * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            I_SnmpTrapManager * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            I_SnmpTrapManager * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            I_SnmpTrapManager * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            I_SnmpTrapManager * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            I_SnmpTrapManager * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            I_SnmpTrapManager * This,
            /* [in] */ BSTR newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            I_SnmpTrapManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            I_SnmpTrapManager * This,
            LONG Error,
            /* [retval][out] */ BSTR *Description);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            I_SnmpTrapManager * This,
            BSTR bstrRegKey,
            BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            I_SnmpTrapManager * This,
            LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProtocolVersion )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProtocolVersion )( 
            I_SnmpTrapManager * This,
            /* [in] */ LONG newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            I_SnmpTrapManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            I_SnmpTrapManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *StartListening )( 
            I_SnmpTrapManager * This,
            BSTR Community,
            LONG Port);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *StopListening )( 
            I_SnmpTrapManager * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstTrap )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNextTrap )( 
            I_SnmpTrapManager * This,
            /* [retval][out] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Send )( 
            I_SnmpTrapManager * This,
            /* [in] */ VARIANT *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *LoadMibFile )( 
            I_SnmpTrapManager * This,
            BSTR bstrMibFile);
        
        END_INTERFACE
    } I_SnmpTrapManagerVtbl;

    interface I_SnmpTrapManager
    {
        CONST_VTBL struct I_SnmpTrapManagerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define I_SnmpTrapManager_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define I_SnmpTrapManager_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define I_SnmpTrapManager_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define I_SnmpTrapManager_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define I_SnmpTrapManager_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define I_SnmpTrapManager_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define I_SnmpTrapManager_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define I_SnmpTrapManager_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define I_SnmpTrapManager_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define I_SnmpTrapManager_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define I_SnmpTrapManager_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define I_SnmpTrapManager_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define I_SnmpTrapManager_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define I_SnmpTrapManager_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define I_SnmpTrapManager_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define I_SnmpTrapManager_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define I_SnmpTrapManager_GetErrorDescription(This,Error,Description)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,Error,Description) ) 

#define I_SnmpTrapManager_Activate(This,bstrRegKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrRegKey,bPersistent) ) 

#define I_SnmpTrapManager_Sleep(This,newVal)	\
    ( (This)->lpVtbl -> Sleep(This,newVal) ) 

#define I_SnmpTrapManager_get_ProtocolVersion(This,pVal)	\
    ( (This)->lpVtbl -> get_ProtocolVersion(This,pVal) ) 

#define I_SnmpTrapManager_put_ProtocolVersion(This,newVal)	\
    ( (This)->lpVtbl -> put_ProtocolVersion(This,newVal) ) 

#define I_SnmpTrapManager_Initialize(This)	\
    ( (This)->lpVtbl -> Initialize(This) ) 

#define I_SnmpTrapManager_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#define I_SnmpTrapManager_StartListening(This,Community,Port)	\
    ( (This)->lpVtbl -> StartListening(This,Community,Port) ) 

#define I_SnmpTrapManager_StopListening(This)	\
    ( (This)->lpVtbl -> StopListening(This) ) 

#define I_SnmpTrapManager_GetFirstTrap(This,pVal)	\
    ( (This)->lpVtbl -> GetFirstTrap(This,pVal) ) 

#define I_SnmpTrapManager_GetNextTrap(This,pVal)	\
    ( (This)->lpVtbl -> GetNextTrap(This,pVal) ) 

#define I_SnmpTrapManager_Send(This,pVal)	\
    ( (This)->lpVtbl -> Send(This,pVal) ) 

#define I_SnmpTrapManager_LoadMibFile(This,bstrMibFile)	\
    ( (This)->lpVtbl -> LoadMibFile(This,bstrMibFile) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __I_SnmpTrapManager_INTERFACE_DEFINED__ */


#ifndef __IVMware_INTERFACE_DEFINED__
#define __IVMware_INTERFACE_DEFINED__

/* interface IVMware */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMware;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("EB3954ED-BAF8-4623-9B38-811C6894E87F")
    IVMware : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG lError,
            /* [retval][out] */ BSTR *pbstrDescription) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Server( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Server( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ServerAccount( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ServerAccount( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ServerPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ServerPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyServer( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyServer( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyAccount( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyAccount( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_RequestTimeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_RequestTimeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Initialize( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Connect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Disconnect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFirstVirtualMachine( 
            /* [retval][out] */ BSTR *pbstrVirtualMachine) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNextVirtualMachine( 
            /* [retval][out] */ BSTR *pbstrVirtualMachine) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetOperatingSystem( 
            BSTR bstrObject,
            /* [retval][out] */ BSTR *pbstrOS) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFirstCounterID( 
            /* [retval][out] */ LONG *plVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNextCounterID( 
            /* [retval][out] */ LONG *plValue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetCounterDescription( 
            LONG lCounter,
            /* [retval][out] */ BSTR *pbstrDescription) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetCounterUnits( 
            LONG lCounter,
            /* [retval][out] */ BSTR *pbstrUnits) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE IsContextAllowed( 
            LONG lCounterID,
            /* [retval][out] */ VARIANT_BOOL *pbVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetPerfData( 
            BSTR bstrObject,
            LONG lCounterID,
            BSTR bstrContext,
            /* [retval][out] */ LONG *plValue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE TranslatePerfData( 
            LONG lCounterID,
            LONG lValue,
            /* [retval][out] */ BSTR *pbstrValue) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMwareVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IVMware * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IVMware * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IVMware * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IVMware * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IVMware * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IVMware * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMware * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IVMware * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IVMware * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IVMware * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IVMware * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IVMware * This,
            LONG lError,
            /* [retval][out] */ BSTR *pbstrDescription);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IVMware * This,
            BSTR bstrKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IVMware * This,
            LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Server )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Server )( 
            IVMware * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServerAccount )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ServerAccount )( 
            IVMware * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServerPassword )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ServerPassword )( 
            IVMware * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyServer )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyServer )( 
            IVMware * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyAccount )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyAccount )( 
            IVMware * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyPassword )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyPassword )( 
            IVMware * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RequestTimeout )( 
            IVMware * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_RequestTimeout )( 
            IVMware * This,
            /* [in] */ LONG newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            IVMware * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            IVMware * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Connect )( 
            IVMware * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Disconnect )( 
            IVMware * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstVirtualMachine )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pbstrVirtualMachine);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNextVirtualMachine )( 
            IVMware * This,
            /* [retval][out] */ BSTR *pbstrVirtualMachine);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetOperatingSystem )( 
            IVMware * This,
            BSTR bstrObject,
            /* [retval][out] */ BSTR *pbstrOS);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstCounterID )( 
            IVMware * This,
            /* [retval][out] */ LONG *plVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNextCounterID )( 
            IVMware * This,
            /* [retval][out] */ LONG *plValue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetCounterDescription )( 
            IVMware * This,
            LONG lCounter,
            /* [retval][out] */ BSTR *pbstrDescription);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetCounterUnits )( 
            IVMware * This,
            LONG lCounter,
            /* [retval][out] */ BSTR *pbstrUnits);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *IsContextAllowed )( 
            IVMware * This,
            LONG lCounterID,
            /* [retval][out] */ VARIANT_BOOL *pbVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetPerfData )( 
            IVMware * This,
            BSTR bstrObject,
            LONG lCounterID,
            BSTR bstrContext,
            /* [retval][out] */ LONG *plValue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *TranslatePerfData )( 
            IVMware * This,
            LONG lCounterID,
            LONG lValue,
            /* [retval][out] */ BSTR *pbstrValue);
        
        END_INTERFACE
    } IVMwareVtbl;

    interface IVMware
    {
        CONST_VTBL struct IVMwareVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMware_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMware_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMware_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMware_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMware_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMware_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMware_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMware_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IVMware_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IVMware_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IVMware_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IVMware_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IVMware_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IVMware_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IVMware_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IVMware_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IVMware_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IVMware_GetErrorDescription(This,lError,pbstrDescription)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,lError,pbstrDescription) ) 

#define IVMware_Activate(This,bstrKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrKey,bPersistent) ) 

#define IVMware_Sleep(This,newVal)	\
    ( (This)->lpVtbl -> Sleep(This,newVal) ) 

#define IVMware_get_Server(This,pVal)	\
    ( (This)->lpVtbl -> get_Server(This,pVal) ) 

#define IVMware_put_Server(This,newVal)	\
    ( (This)->lpVtbl -> put_Server(This,newVal) ) 

#define IVMware_get_ServerAccount(This,pVal)	\
    ( (This)->lpVtbl -> get_ServerAccount(This,pVal) ) 

#define IVMware_put_ServerAccount(This,newVal)	\
    ( (This)->lpVtbl -> put_ServerAccount(This,newVal) ) 

#define IVMware_get_ServerPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_ServerPassword(This,pVal) ) 

#define IVMware_put_ServerPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_ServerPassword(This,newVal) ) 

#define IVMware_get_ProxyServer(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyServer(This,pVal) ) 

#define IVMware_put_ProxyServer(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyServer(This,newVal) ) 

#define IVMware_get_ProxyAccount(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyAccount(This,pVal) ) 

#define IVMware_put_ProxyAccount(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyAccount(This,newVal) ) 

#define IVMware_get_ProxyPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyPassword(This,pVal) ) 

#define IVMware_put_ProxyPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyPassword(This,newVal) ) 

#define IVMware_get_RequestTimeout(This,pVal)	\
    ( (This)->lpVtbl -> get_RequestTimeout(This,pVal) ) 

#define IVMware_put_RequestTimeout(This,newVal)	\
    ( (This)->lpVtbl -> put_RequestTimeout(This,newVal) ) 

#define IVMware_Initialize(This)	\
    ( (This)->lpVtbl -> Initialize(This) ) 

#define IVMware_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#define IVMware_Connect(This)	\
    ( (This)->lpVtbl -> Connect(This) ) 

#define IVMware_Disconnect(This)	\
    ( (This)->lpVtbl -> Disconnect(This) ) 

#define IVMware_GetFirstVirtualMachine(This,pbstrVirtualMachine)	\
    ( (This)->lpVtbl -> GetFirstVirtualMachine(This,pbstrVirtualMachine) ) 

#define IVMware_GetNextVirtualMachine(This,pbstrVirtualMachine)	\
    ( (This)->lpVtbl -> GetNextVirtualMachine(This,pbstrVirtualMachine) ) 

#define IVMware_GetOperatingSystem(This,bstrObject,pbstrOS)	\
    ( (This)->lpVtbl -> GetOperatingSystem(This,bstrObject,pbstrOS) ) 

#define IVMware_GetFirstCounterID(This,plVal)	\
    ( (This)->lpVtbl -> GetFirstCounterID(This,plVal) ) 

#define IVMware_GetNextCounterID(This,plValue)	\
    ( (This)->lpVtbl -> GetNextCounterID(This,plValue) ) 

#define IVMware_GetCounterDescription(This,lCounter,pbstrDescription)	\
    ( (This)->lpVtbl -> GetCounterDescription(This,lCounter,pbstrDescription) ) 

#define IVMware_GetCounterUnits(This,lCounter,pbstrUnits)	\
    ( (This)->lpVtbl -> GetCounterUnits(This,lCounter,pbstrUnits) ) 

#define IVMware_IsContextAllowed(This,lCounterID,pbVal)	\
    ( (This)->lpVtbl -> IsContextAllowed(This,lCounterID,pbVal) ) 

#define IVMware_GetPerfData(This,bstrObject,lCounterID,bstrContext,plValue)	\
    ( (This)->lpVtbl -> GetPerfData(This,bstrObject,lCounterID,bstrContext,plValue) ) 

#define IVMware_TranslatePerfData(This,lCounterID,lValue,pbstrValue)	\
    ( (This)->lpVtbl -> TranslatePerfData(This,lCounterID,lValue,pbstrValue) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMware_INTERFACE_DEFINED__ */


#ifndef __IXen_INTERFACE_DEFINED__
#define __IXen_INTERFACE_DEFINED__

/* interface IXen */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IXen;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4D219C63-9EEC-4419-8764-FFC69299B22C")
    IXen : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Build( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Module( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseStatus( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Reserved( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LastError( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_LogFile( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_LicenseKey( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            LONG lError,
            /* [retval][out] */ BSTR *pbstrDescription) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Activate( 
            BSTR bstrKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent = ( VARIANT_BOOL  )-1) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Sleep( 
            LONG newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_Server( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_Server( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ServerAccount( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ServerAccount( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ServerPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ServerPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyServer( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyServer( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyAccount( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyAccount( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_ProxyPassword( 
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_ProxyPassword( 
            /* [in] */ BSTR newVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_RequestTimeout( 
            /* [retval][out] */ LONG *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_RequestTimeout( 
            /* [in] */ LONG newVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Initialize( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Connect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Disconnect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFirstVirtualMachine( 
            /* [retval][out] */ BSTR *pbstrVirtualMachine) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNextVirtualMachine( 
            /* [retval][out] */ BSTR *pbstrVirtualMachine) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetOperatingSystem( 
            BSTR bstrObject,
            /* [retval][out] */ BSTR *pbstrOS) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetFirstCounterID( 
            /* [retval][out] */ LONG *plVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetNextCounterID( 
            /* [retval][out] */ LONG *plValue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetCounterDescription( 
            LONG lCounter,
            /* [retval][out] */ BSTR *pbstrDescription) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetCounterUnits( 
            LONG lCounter,
            /* [retval][out] */ BSTR *pbstrUnits) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE IsContextAllowed( 
            LONG lCounterID,
            /* [retval][out] */ VARIANT_BOOL *pbVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetPerfData( 
            BSTR bstrObject,
            LONG lCounterID,
            BSTR bstrContext,
            /* [retval][out] */ LONG *plValue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE TranslatePerfData( 
            LONG lCounterID,
            LONG lValue,
            /* [retval][out] */ BSTR *pbstrValue) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IXenVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IXen * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IXen * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IXen * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IXen * This,
            /* [out] */ UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IXen * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IXen * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR *rgszNames,
            /* [range][in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IXen * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Build )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Module )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseStatus )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Reserved )( 
            IXen * This,
            /* [in] */ LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LastError )( 
            IXen * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogFile )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_LogFile )( 
            IXen * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LicenseKey )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            IXen * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IXen * This,
            LONG lError,
            /* [retval][out] */ BSTR *pbstrDescription);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Activate )( 
            IXen * This,
            BSTR bstrKey,
            /* [defaultvalue][in] */ VARIANT_BOOL bPersistent);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            IXen * This,
            LONG newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Server )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Server )( 
            IXen * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServerAccount )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ServerAccount )( 
            IXen * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServerPassword )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ServerPassword )( 
            IXen * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyServer )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyServer )( 
            IXen * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyAccount )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyAccount )( 
            IXen * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProxyPassword )( 
            IXen * This,
            /* [retval][out] */ BSTR *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProxyPassword )( 
            IXen * This,
            /* [in] */ BSTR newVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RequestTimeout )( 
            IXen * This,
            /* [retval][out] */ LONG *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_RequestTimeout )( 
            IXen * This,
            /* [in] */ LONG newVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            IXen * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            IXen * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Connect )( 
            IXen * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Disconnect )( 
            IXen * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstVirtualMachine )( 
            IXen * This,
            /* [retval][out] */ BSTR *pbstrVirtualMachine);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNextVirtualMachine )( 
            IXen * This,
            /* [retval][out] */ BSTR *pbstrVirtualMachine);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetOperatingSystem )( 
            IXen * This,
            BSTR bstrObject,
            /* [retval][out] */ BSTR *pbstrOS);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetFirstCounterID )( 
            IXen * This,
            /* [retval][out] */ LONG *plVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetNextCounterID )( 
            IXen * This,
            /* [retval][out] */ LONG *plValue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetCounterDescription )( 
            IXen * This,
            LONG lCounter,
            /* [retval][out] */ BSTR *pbstrDescription);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetCounterUnits )( 
            IXen * This,
            LONG lCounter,
            /* [retval][out] */ BSTR *pbstrUnits);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *IsContextAllowed )( 
            IXen * This,
            LONG lCounterID,
            /* [retval][out] */ VARIANT_BOOL *pbVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetPerfData )( 
            IXen * This,
            BSTR bstrObject,
            LONG lCounterID,
            BSTR bstrContext,
            /* [retval][out] */ LONG *plValue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *TranslatePerfData )( 
            IXen * This,
            LONG lCounterID,
            LONG lValue,
            /* [retval][out] */ BSTR *pbstrValue);
        
        END_INTERFACE
    } IXenVtbl;

    interface IXen
    {
        CONST_VTBL struct IXenVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IXen_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IXen_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IXen_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IXen_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IXen_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IXen_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IXen_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IXen_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IXen_get_Build(This,pVal)	\
    ( (This)->lpVtbl -> get_Build(This,pVal) ) 

#define IXen_get_Module(This,pVal)	\
    ( (This)->lpVtbl -> get_Module(This,pVal) ) 

#define IXen_get_LicenseStatus(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseStatus(This,pVal) ) 

#define IXen_put_Reserved(This,newVal)	\
    ( (This)->lpVtbl -> put_Reserved(This,newVal) ) 

#define IXen_get_LastError(This,pVal)	\
    ( (This)->lpVtbl -> get_LastError(This,pVal) ) 

#define IXen_get_LogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_LogFile(This,pVal) ) 

#define IXen_put_LogFile(This,newVal)	\
    ( (This)->lpVtbl -> put_LogFile(This,newVal) ) 

#define IXen_get_LicenseKey(This,pVal)	\
    ( (This)->lpVtbl -> get_LicenseKey(This,pVal) ) 

#define IXen_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IXen_GetErrorDescription(This,lError,pbstrDescription)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,lError,pbstrDescription) ) 

#define IXen_Activate(This,bstrKey,bPersistent)	\
    ( (This)->lpVtbl -> Activate(This,bstrKey,bPersistent) ) 

#define IXen_Sleep(This,newVal)	\
    ( (This)->lpVtbl -> Sleep(This,newVal) ) 

#define IXen_get_Server(This,pVal)	\
    ( (This)->lpVtbl -> get_Server(This,pVal) ) 

#define IXen_put_Server(This,newVal)	\
    ( (This)->lpVtbl -> put_Server(This,newVal) ) 

#define IXen_get_ServerAccount(This,pVal)	\
    ( (This)->lpVtbl -> get_ServerAccount(This,pVal) ) 

#define IXen_put_ServerAccount(This,newVal)	\
    ( (This)->lpVtbl -> put_ServerAccount(This,newVal) ) 

#define IXen_get_ServerPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_ServerPassword(This,pVal) ) 

#define IXen_put_ServerPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_ServerPassword(This,newVal) ) 

#define IXen_get_ProxyServer(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyServer(This,pVal) ) 

#define IXen_put_ProxyServer(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyServer(This,newVal) ) 

#define IXen_get_ProxyAccount(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyAccount(This,pVal) ) 

#define IXen_put_ProxyAccount(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyAccount(This,newVal) ) 

#define IXen_get_ProxyPassword(This,pVal)	\
    ( (This)->lpVtbl -> get_ProxyPassword(This,pVal) ) 

#define IXen_put_ProxyPassword(This,newVal)	\
    ( (This)->lpVtbl -> put_ProxyPassword(This,newVal) ) 

#define IXen_get_RequestTimeout(This,pVal)	\
    ( (This)->lpVtbl -> get_RequestTimeout(This,pVal) ) 

#define IXen_put_RequestTimeout(This,newVal)	\
    ( (This)->lpVtbl -> put_RequestTimeout(This,newVal) ) 

#define IXen_Initialize(This)	\
    ( (This)->lpVtbl -> Initialize(This) ) 

#define IXen_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#define IXen_Connect(This)	\
    ( (This)->lpVtbl -> Connect(This) ) 

#define IXen_Disconnect(This)	\
    ( (This)->lpVtbl -> Disconnect(This) ) 

#define IXen_GetFirstVirtualMachine(This,pbstrVirtualMachine)	\
    ( (This)->lpVtbl -> GetFirstVirtualMachine(This,pbstrVirtualMachine) ) 

#define IXen_GetNextVirtualMachine(This,pbstrVirtualMachine)	\
    ( (This)->lpVtbl -> GetNextVirtualMachine(This,pbstrVirtualMachine) ) 

#define IXen_GetOperatingSystem(This,bstrObject,pbstrOS)	\
    ( (This)->lpVtbl -> GetOperatingSystem(This,bstrObject,pbstrOS) ) 

#define IXen_GetFirstCounterID(This,plVal)	\
    ( (This)->lpVtbl -> GetFirstCounterID(This,plVal) ) 

#define IXen_GetNextCounterID(This,plValue)	\
    ( (This)->lpVtbl -> GetNextCounterID(This,plValue) ) 

#define IXen_GetCounterDescription(This,lCounter,pbstrDescription)	\
    ( (This)->lpVtbl -> GetCounterDescription(This,lCounter,pbstrDescription) ) 

#define IXen_GetCounterUnits(This,lCounter,pbstrUnits)	\
    ( (This)->lpVtbl -> GetCounterUnits(This,lCounter,pbstrUnits) ) 

#define IXen_IsContextAllowed(This,lCounterID,pbVal)	\
    ( (This)->lpVtbl -> IsContextAllowed(This,lCounterID,pbVal) ) 

#define IXen_GetPerfData(This,bstrObject,lCounterID,bstrContext,plValue)	\
    ( (This)->lpVtbl -> GetPerfData(This,bstrObject,lCounterID,bstrContext,plValue) ) 

#define IXen_TranslatePerfData(This,lCounterID,lValue,pbstrValue)	\
    ( (This)->lpVtbl -> TranslatePerfData(This,lCounterID,lValue,pbstrValue) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IXen_INTERFACE_DEFINED__ */



#ifndef __AxNetwork_LIBRARY_DEFINED__
#define __AxNetwork_LIBRARY_DEFINED__

/* library AxNetwork */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_AxNetwork;

EXTERN_C const CLSID CLSID_RSh;

#ifdef __cplusplus

class DECLSPEC_UUID("5A128291-2445-441C-A8E9-ED886D053019")
RSh;
#endif

EXTERN_C const CLSID CLSID_Ntp;

#ifdef __cplusplus

class DECLSPEC_UUID("9591DC19-DD2F-4AD4-A3B6-65CDC428ABD1")
Ntp;
#endif

EXTERN_C const CLSID CLSID_WOL;

#ifdef __cplusplus

class DECLSPEC_UUID("454BE66D-12D0-43D0-87FE-99EE02E2C05B")
WOL;
#endif

EXTERN_C const CLSID CLSID_Icmp;

#ifdef __cplusplus

class DECLSPEC_UUID("743A672A-9985-4866-BC54-9C89087E01AE")
Icmp;
#endif

EXTERN_C const CLSID CLSID_NwConstants;

#ifdef __cplusplus

class DECLSPEC_UUID("EC4937DE-1B46-4AB4-BE3B-2CEF007F0D36")
NwConstants;
#endif

EXTERN_C const CLSID CLSID_SnmpManager;

#ifdef __cplusplus

class DECLSPEC_UUID("97AAC3BF-BF70-405A-A1CA-1B1AE465F5C6")
SnmpManager;
#endif

EXTERN_C const CLSID CLSID_SnmpTrap;

#ifdef __cplusplus

class DECLSPEC_UUID("E00A6261-0E7E-46FD-AEFF-36995D4F202A")
SnmpTrap;
#endif

EXTERN_C const CLSID CLSID_SnmpTrapManager;

#ifdef __cplusplus

class DECLSPEC_UUID("27F65374-7C6D-4456-824F-1603CF5C8FD8")
SnmpTrapManager;
#endif

EXTERN_C const CLSID CLSID_FtpServer;

#ifdef __cplusplus

class DECLSPEC_UUID("0BBB8BEE-8043-4807-A9D6-8B5AFC8E0308")
FtpServer;
#endif

EXTERN_C const CLSID CLSID_FtpFile;

#ifdef __cplusplus

class DECLSPEC_UUID("B58DEFA2-B1D6-4381-AA80-E746F03F95CF")
FtpFile;
#endif

EXTERN_C const CLSID CLSID_Udp;

#ifdef __cplusplus

class DECLSPEC_UUID("01E89353-9C04-4B25-8CAF-436D147BEA0D")
Udp;
#endif

EXTERN_C const CLSID CLSID_SnmpObject;

#ifdef __cplusplus

class DECLSPEC_UUID("A6174470-3F28-4350-8621-BD0A20A5E0B6")
SnmpObject;
#endif

EXTERN_C const CLSID CLSID_Tcp;

#ifdef __cplusplus

class DECLSPEC_UUID("916C28A2-8314-4AA5-9E25-18E5DEFBE2A3")
Tcp;
#endif

EXTERN_C const CLSID CLSID_IPtoCountry;

#ifdef __cplusplus

class DECLSPEC_UUID("E6645574-3DB3-418F-AF16-229EF24EE2C8")
IPtoCountry;
#endif

EXTERN_C const CLSID CLSID_DnsServer;

#ifdef __cplusplus

class DECLSPEC_UUID("13BE898F-BED8-4DD5-95A8-1D07FC891E5A")
DnsServer;
#endif

EXTERN_C const CLSID CLSID_DnsRecord;

#ifdef __cplusplus

class DECLSPEC_UUID("3506465E-79C9-4486-AB94-D91EFF87CAC0")
DnsRecord;
#endif

EXTERN_C const CLSID CLSID_Ssh;

#ifdef __cplusplus

class DECLSPEC_UUID("EC34BA42-AFDE-4B9C-BDBF-CB994E5493E5")
Ssh;
#endif

EXTERN_C const CLSID CLSID_SnmpMibBrowser;

#ifdef __cplusplus

class DECLSPEC_UUID("895ABC88-39A6-4BA0-9733-2A7392D5AD50")
SnmpMibBrowser;
#endif

EXTERN_C const CLSID CLSID_TftpServer;

#ifdef __cplusplus

class DECLSPEC_UUID("115B3846-4A61-499B-AC97-7ED71862B7A9")
TftpServer;
#endif

EXTERN_C const CLSID CLSID_Msn;

#ifdef __cplusplus

class DECLSPEC_UUID("2F2FA2B6-3391-4BDC-8447-01E62DBCD367")
Msn;
#endif

EXTERN_C const CLSID CLSID_Radius;

#ifdef __cplusplus

class DECLSPEC_UUID("BA61EEFD-EA47-4E5B-BE28-89E71633E226")
Radius;
#endif

EXTERN_C const CLSID CLSID_Scp;

#ifdef __cplusplus

class DECLSPEC_UUID("14EDB06A-7BAF-403C-955A-87E01DD81368")
Scp;
#endif

EXTERN_C const CLSID CLSID_SFtp;

#ifdef __cplusplus

class DECLSPEC_UUID("63C9D46B-2391-4399-8202-EC7464D55526")
SFtp;
#endif

EXTERN_C const CLSID CLSID_SFtpFile;

#ifdef __cplusplus

class DECLSPEC_UUID("0B5F4F80-E099-4158-96A4-54CD81AD212B")
SFtpFile;
#endif

EXTERN_C const CLSID CLSID_HttpEx;

#ifdef __cplusplus

class DECLSPEC_UUID("522D4F3C-0F01-42E1-A22D-19068FDA0EC7")
HttpEx;
#endif

EXTERN_C const CLSID CLSID_TraceRoute;

#ifdef __cplusplus

class DECLSPEC_UUID("04596FB6-AFDF-4997-8CA7-78DF085C1FA5")
TraceRoute;
#endif

EXTERN_C const CLSID CLSID_TraceHop;

#ifdef __cplusplus

class DECLSPEC_UUID("9EF8CC81-5438-4614-89E7-26052B6A9D2F")
TraceHop;
#endif

EXTERN_C const CLSID CLSID__SnmpManager;

#ifdef __cplusplus

class DECLSPEC_UUID("A16CD138-E448-47AA-BFD7-5A6F10C5793B")
_SnmpManager;
#endif

EXTERN_C const CLSID CLSID__SnmpTrapManager;

#ifdef __cplusplus

class DECLSPEC_UUID("634320AF-A7F3-4048-8A52-D1387F44B8CC")
_SnmpTrapManager;
#endif

EXTERN_C const CLSID CLSID_VMware;

#ifdef __cplusplus

class DECLSPEC_UUID("621A76C5-D037-43B7-9EFE-E92E04CF21A9")
VMware;
#endif

EXTERN_C const CLSID CLSID_Xen;

#ifdef __cplusplus

class DECLSPEC_UUID("7EF7E4E7-F6BA-4ED9-B4FE-58633AC378D6")
Xen;
#endif
#endif /* __AxNetwork_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long *, unsigned long            , BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  unsigned long *, unsigned char *, BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(unsigned long *, unsigned char *, BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long *, BSTR * ); 

unsigned long             __RPC_USER  VARIANT_UserSize(     unsigned long *, unsigned long            , VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserMarshal(  unsigned long *, unsigned char *, VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserUnmarshal(unsigned long *, unsigned char *, VARIANT * ); 
void                      __RPC_USER  VARIANT_UserFree(     unsigned long *, VARIANT * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


