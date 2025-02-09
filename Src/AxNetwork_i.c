

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


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


#ifdef __cplusplus
extern "C"{
#endif 


#include <rpc.h>
#include <rpcndr.h>

#ifdef _MIDL_USE_GUIDDEF_

#ifndef INITGUID
#define INITGUID
#include <guiddef.h>
#undef INITGUID
#else
#include <guiddef.h>
#endif

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        DEFINE_GUID(name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8)

#else // !_MIDL_USE_GUIDDEF_

#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        const type name = {l,w1,w2,{b1,b2,b3,b4,b5,b6,b7,b8}}

#endif !_MIDL_USE_GUIDDEF_

MIDL_DEFINE_GUID(IID, IID_IRSh,0x844E4159,0x8D81,0x466B,0x9D,0x13,0x7C,0xE8,0x09,0x8D,0x4A,0x6B);


MIDL_DEFINE_GUID(IID, IID_INtp,0xCC932613,0xBE5F,0x43B3,0x99,0x55,0xA4,0x0E,0x1A,0x8D,0x73,0x6C);


MIDL_DEFINE_GUID(IID, IID_IWOL,0x18AD1230,0xA4C9,0x4A48,0x98,0xB3,0xB3,0xC6,0x69,0xD2,0x80,0x01);


MIDL_DEFINE_GUID(IID, IID_IIcmp,0xA92A390F,0xE285,0x4A8E,0xAC,0xE1,0xC9,0x98,0x1C,0xE9,0x51,0xE9);


MIDL_DEFINE_GUID(IID, IID_INwConstants,0x37B4E86F,0xAAE3,0x48AC,0x92,0x2B,0xDF,0x90,0x94,0x51,0x25,0xB9);


MIDL_DEFINE_GUID(IID, IID_ISnmpManager,0x1542A06C,0x4DBA,0x407A,0xB5,0x4D,0x99,0x1D,0x13,0xD4,0x81,0xAD);


MIDL_DEFINE_GUID(IID, IID_ISnmpObject,0xC3E4F5F3,0xC188,0x4F3B,0x9A,0x41,0x9C,0xAE,0x28,0x91,0x15,0x0E);


MIDL_DEFINE_GUID(IID, IID_ISnmpTrap,0x66673904,0xCCFB,0x45C5,0x8A,0xFA,0x5C,0x00,0x3B,0xFE,0x48,0xFA);


MIDL_DEFINE_GUID(IID, IID_ISnmpTrapManager,0xBCB9AFE8,0xD460,0x4BA6,0xAD,0x97,0xA0,0xAC,0xD4,0xA7,0x6E,0x4F);


MIDL_DEFINE_GUID(IID, IID_IFtpServer,0xB629A000,0xC7D2,0x4CFB,0x94,0xD7,0x97,0x97,0x54,0x5E,0xA6,0xD1);


MIDL_DEFINE_GUID(IID, IID_IFtpFile,0x0B545BC4,0xBFB2,0x4426,0x8E,0xDF,0x2F,0x48,0x2E,0xA5,0xC5,0x11);


MIDL_DEFINE_GUID(IID, IID_IUdp,0x96DD0191,0xEFBF,0x4C6E,0xB0,0x45,0xDB,0x33,0xF0,0xD4,0xA7,0x2F);


MIDL_DEFINE_GUID(IID, IID_ITcp,0x4CCDB6A4,0x1BEE,0x4D3C,0x99,0x37,0xD5,0x3C,0xDF,0xB5,0xE1,0xA3);


MIDL_DEFINE_GUID(IID, IID_IIPtoCountry,0xD886339C,0x6F33,0x49AC,0x9F,0xA8,0x73,0xFC,0x5A,0x22,0x77,0x69);


MIDL_DEFINE_GUID(IID, IID_IDnsServer,0xD51DDAA9,0x6264,0x4ED7,0x82,0xDF,0x1A,0x46,0xDE,0x9D,0x1C,0x37);


MIDL_DEFINE_GUID(IID, IID_IDnsRecord,0xCFCFF8CA,0x30EA,0x44F8,0x85,0x6E,0x52,0xAD,0x9A,0x97,0x10,0x24);


MIDL_DEFINE_GUID(IID, IID_ISsh,0xCF6C8D3D,0x1ACE,0x4111,0xAE,0x15,0x72,0x4C,0xB2,0x1D,0xAC,0x08);


MIDL_DEFINE_GUID(IID, IID_ISnmpMibBrowser,0x3FEF0C60,0xA4D8,0x4740,0xA6,0xB7,0x5D,0xF4,0x38,0x89,0x96,0xB0);


MIDL_DEFINE_GUID(IID, IID_ITftpServer,0x411DBA2E,0xA588,0x4F74,0xAD,0x8B,0x4E,0x42,0x6E,0x63,0x89,0x4A);


MIDL_DEFINE_GUID(IID, IID_IMsn,0x6EA3B1C3,0x71BA,0x4404,0xAA,0x01,0xBB,0x39,0xCE,0x2A,0x34,0x23);


MIDL_DEFINE_GUID(IID, IID_IRadius,0x8218765A,0x2229,0x40DF,0xB6,0x00,0xA8,0xA6,0x4A,0xF0,0x9A,0xC5);


MIDL_DEFINE_GUID(IID, IID_IScp,0x4116F2EA,0x0122,0x496A,0xA7,0x0E,0xAF,0xFD,0x0A,0x9B,0x5F,0x6A);


MIDL_DEFINE_GUID(IID, IID_ISFtp,0x06B4D9C1,0x3A2D,0x43C3,0x8E,0x1E,0x72,0xBD,0x1E,0xBA,0x6B,0x4D);


MIDL_DEFINE_GUID(IID, IID_ISFtpFile,0x5479FBF8,0xC8BD,0x4DC0,0x99,0x67,0xAA,0xA2,0x7F,0x76,0x89,0x94);


MIDL_DEFINE_GUID(IID, IID_IHttpEx,0x805D87DC,0x5860,0x4562,0xBE,0x30,0x80,0x2A,0x47,0xA2,0xF7,0xE0);


MIDL_DEFINE_GUID(IID, IID_ITraceRoute,0x081790B5,0x1D5D,0x4FFF,0x9F,0x46,0x6B,0x5F,0x2E,0x14,0x4B,0xFF);


MIDL_DEFINE_GUID(IID, IID_ITraceHop,0x601A723F,0xF66D,0x4129,0x91,0xD5,0xAD,0x1B,0x5E,0x9C,0xB5,0x90);


MIDL_DEFINE_GUID(IID, IID_I_SnmpManager,0xF46A9413,0x336E,0x4E18,0xA2,0xC3,0xCD,0x40,0x68,0xC2,0x5A,0x0A);


MIDL_DEFINE_GUID(IID, IID_I_SnmpTrapManager,0x07316FD5,0xB0E6,0x4A17,0x90,0x15,0x9A,0xBC,0x7F,0xEC,0xAE,0xB4);


MIDL_DEFINE_GUID(IID, IID_IVMware,0xEB3954ED,0xBAF8,0x4623,0x9B,0x38,0x81,0x1C,0x68,0x94,0xE8,0x7F);


MIDL_DEFINE_GUID(IID, IID_IXen,0x4D219C63,0x9EEC,0x4419,0x87,0x64,0xFF,0xC6,0x92,0x99,0xB2,0x2C);


MIDL_DEFINE_GUID(IID, LIBID_AxNetwork,0xB52B14BA,0x244B,0x4006,0x86,0xE0,0x29,0x23,0xCB,0x69,0xD8,0x81);


MIDL_DEFINE_GUID(CLSID, CLSID_RSh,0x5A128291,0x2445,0x441C,0xA8,0xE9,0xED,0x88,0x6D,0x05,0x30,0x19);


MIDL_DEFINE_GUID(CLSID, CLSID_Ntp,0x9591DC19,0xDD2F,0x4AD4,0xA3,0xB6,0x65,0xCD,0xC4,0x28,0xAB,0xD1);


MIDL_DEFINE_GUID(CLSID, CLSID_WOL,0x454BE66D,0x12D0,0x43D0,0x87,0xFE,0x99,0xEE,0x02,0xE2,0xC0,0x5B);


MIDL_DEFINE_GUID(CLSID, CLSID_Icmp,0x743A672A,0x9985,0x4866,0xBC,0x54,0x9C,0x89,0x08,0x7E,0x01,0xAE);


MIDL_DEFINE_GUID(CLSID, CLSID_NwConstants,0xEC4937DE,0x1B46,0x4AB4,0xBE,0x3B,0x2C,0xEF,0x00,0x7F,0x0D,0x36);


MIDL_DEFINE_GUID(CLSID, CLSID_SnmpManager,0x97AAC3BF,0xBF70,0x405A,0xA1,0xCA,0x1B,0x1A,0xE4,0x65,0xF5,0xC6);


MIDL_DEFINE_GUID(CLSID, CLSID_SnmpTrap,0xE00A6261,0x0E7E,0x46FD,0xAE,0xFF,0x36,0x99,0x5D,0x4F,0x20,0x2A);


MIDL_DEFINE_GUID(CLSID, CLSID_SnmpTrapManager,0x27F65374,0x7C6D,0x4456,0x82,0x4F,0x16,0x03,0xCF,0x5C,0x8F,0xD8);


MIDL_DEFINE_GUID(CLSID, CLSID_FtpServer,0x0BBB8BEE,0x8043,0x4807,0xA9,0xD6,0x8B,0x5A,0xFC,0x8E,0x03,0x08);


MIDL_DEFINE_GUID(CLSID, CLSID_FtpFile,0xB58DEFA2,0xB1D6,0x4381,0xAA,0x80,0xE7,0x46,0xF0,0x3F,0x95,0xCF);


MIDL_DEFINE_GUID(CLSID, CLSID_Udp,0x01E89353,0x9C04,0x4B25,0x8C,0xAF,0x43,0x6D,0x14,0x7B,0xEA,0x0D);


MIDL_DEFINE_GUID(CLSID, CLSID_SnmpObject,0xA6174470,0x3F28,0x4350,0x86,0x21,0xBD,0x0A,0x20,0xA5,0xE0,0xB6);


MIDL_DEFINE_GUID(CLSID, CLSID_Tcp,0x916C28A2,0x8314,0x4AA5,0x9E,0x25,0x18,0xE5,0xDE,0xFB,0xE2,0xA3);


MIDL_DEFINE_GUID(CLSID, CLSID_IPtoCountry,0xE6645574,0x3DB3,0x418F,0xAF,0x16,0x22,0x9E,0xF2,0x4E,0xE2,0xC8);


MIDL_DEFINE_GUID(CLSID, CLSID_DnsServer,0x13BE898F,0xBED8,0x4DD5,0x95,0xA8,0x1D,0x07,0xFC,0x89,0x1E,0x5A);


MIDL_DEFINE_GUID(CLSID, CLSID_DnsRecord,0x3506465E,0x79C9,0x4486,0xAB,0x94,0xD9,0x1E,0xFF,0x87,0xCA,0xC0);


MIDL_DEFINE_GUID(CLSID, CLSID_Ssh,0xEC34BA42,0xAFDE,0x4B9C,0xBD,0xBF,0xCB,0x99,0x4E,0x54,0x93,0xE5);


MIDL_DEFINE_GUID(CLSID, CLSID_SnmpMibBrowser,0x895ABC88,0x39A6,0x4BA0,0x97,0x33,0x2A,0x73,0x92,0xD5,0xAD,0x50);


MIDL_DEFINE_GUID(CLSID, CLSID_TftpServer,0x115B3846,0x4A61,0x499B,0xAC,0x97,0x7E,0xD7,0x18,0x62,0xB7,0xA9);


MIDL_DEFINE_GUID(CLSID, CLSID_Msn,0x2F2FA2B6,0x3391,0x4BDC,0x84,0x47,0x01,0xE6,0x2D,0xBC,0xD3,0x67);


MIDL_DEFINE_GUID(CLSID, CLSID_Radius,0xBA61EEFD,0xEA47,0x4E5B,0xBE,0x28,0x89,0xE7,0x16,0x33,0xE2,0x26);


MIDL_DEFINE_GUID(CLSID, CLSID_Scp,0x14EDB06A,0x7BAF,0x403C,0x95,0x5A,0x87,0xE0,0x1D,0xD8,0x13,0x68);


MIDL_DEFINE_GUID(CLSID, CLSID_SFtp,0x63C9D46B,0x2391,0x4399,0x82,0x02,0xEC,0x74,0x64,0xD5,0x55,0x26);


MIDL_DEFINE_GUID(CLSID, CLSID_SFtpFile,0x0B5F4F80,0xE099,0x4158,0x96,0xA4,0x54,0xCD,0x81,0xAD,0x21,0x2B);


MIDL_DEFINE_GUID(CLSID, CLSID_HttpEx,0x522D4F3C,0x0F01,0x42E1,0xA2,0x2D,0x19,0x06,0x8F,0xDA,0x0E,0xC7);


MIDL_DEFINE_GUID(CLSID, CLSID_TraceRoute,0x04596FB6,0xAFDF,0x4997,0x8C,0xA7,0x78,0xDF,0x08,0x5C,0x1F,0xA5);


MIDL_DEFINE_GUID(CLSID, CLSID_TraceHop,0x9EF8CC81,0x5438,0x4614,0x89,0xE7,0x26,0x05,0x2B,0x6A,0x9D,0x2F);


MIDL_DEFINE_GUID(CLSID, CLSID__SnmpManager,0xA16CD138,0xE448,0x47AA,0xBF,0xD7,0x5A,0x6F,0x10,0xC5,0x79,0x3B);


MIDL_DEFINE_GUID(CLSID, CLSID__SnmpTrapManager,0x634320AF,0xA7F3,0x4048,0x8A,0x52,0xD1,0x38,0x7F,0x44,0xB8,0xCC);


MIDL_DEFINE_GUID(CLSID, CLSID_VMware,0x621A76C5,0xD037,0x43B7,0x9E,0xFE,0xE9,0x2E,0x04,0xCF,0x21,0xA9);


MIDL_DEFINE_GUID(CLSID, CLSID_Xen,0x7EF7E4E7,0xF6BA,0x4ED9,0xB4,0xFE,0x58,0x63,0x3A,0xC3,0x78,0xD6);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



