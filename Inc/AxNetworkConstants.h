#ifndef _AXNETWORKCONSTANTS_H_
#define _AXNETWORKCONSTANTS_H_



// Socket Object - Protocol definitions

#define nwSOCKET_PROTOCOL_RAW					1	// The TCP/IP protocol, without any protocol on top of it 
#define nwSOCKET_PROTOCOL_TELNET				2	// The Telnet protocol 

// Socket Object - Protocol definitions

#define nwSOCKET_CONNSTATE_DISCONNECTED			1	// There´s no connection (anymore) 
#define nwSOCKET_CONNSTATE_LISTENING			2	// Waiting for an incoming client to connect 
#define nwSOCKET_CONNSTATE_CONNECTED			3	// Connection is established 

// Dns Object - Types
// For constants, see: http://en.wikipedia.org/wiki/List_of_DNS_record_types

#define nwDNS_TYPE_UNDEFINED					0	// Empty record
#define nwDNS_TYPE_A							1	// A Record (IPv4)
#define nwDNS_TYPE_NS							2	// Nameserver Record
#define nwDNS_TYPE_CNAME						5	// CNAME Record
#define nwDNS_TYPE_SOA							6	// SOA Record
#define nwDNS_TYPE_PTR							12	// Pointer Record
#define nwDNS_TYPE_MX							15	// Mail Exchange Record
#define nwDNS_TYPE_AAAA							28	// A Record (IPv6)
#define nwDNS_TYPE_SRV							33	// SRV Record
#define nwDNS_TYPE_CERT							37	// CERT Record
#define nwDNS_TYPE_ANY							255	// Any Record

// Snmp Object - Type definitions

#define nwSNMP_TYPE_UNDEFINED					0
#define nwSNMP_TYPE_INTEGER						2
#define nwSNMP_TYPE_INTEGER32					2
#define nwSNMP_TYPE_BITS						3
#define nwSNMP_TYPE_OCTETSTRING					4
#define nwSNMP_TYPE_NULL						5
#define nwSNMP_TYPE_OBJECTIDENTIFIER			6
#define nwSNMP_TYPE_SEQUENCE					48
#define nwSNMP_TYPE_IPADDRESS					64
#define nwSNMP_TYPE_COUNTER32					65
#define nwSNMP_TYPE_GAUGE32						66
#define nwSNMP_TYPE_TIMETICKS					67
#define nwSNMP_TYPE_OPAQUE						68
#define nwSNMP_TYPE_COUNTER64					70
#define nwSNMP_TYPE_UNSIGNED32					71

// Snmp Object - Generic Trap Types - only Snmp V1

#define nwSNMP_TRAP_COLDSTART					0    
#define nwSNMP_TRAP_WARMSTART					1
#define nwSNMP_TRAP_LINKDOWN					2
#define nwSNMP_TRAP_LINKUP						3
#define nwSNMP_TRAP_AUTHFAILURE					4
#define nwSNMP_TRAP_EGPNEIGHLOSS				5
#define nwSNMP_TRAP_ENTERSPECIFIC				6

// Snmp Object - Protocol Version definitions

#define nwSNMP_VERSION_V1						1
#define nwSNMP_VERSION_V2C						2
#define nwSNMP_VERSION_V3						3

// Socket Object - Protocol Versions

#define nwSOCKET_IPVERSION_IP6IP4				0	// Try IPv6, then fallback to IPv4
#define nwSOCKET_IPVERSION_IP6ONLY				1	// Force IPv6
#define nwSOCKET_IPVERSION_IP4ONLY				2	// Force Ipv4

// Snmp Object - V3 Authentication Protocols

#define nwSNMP_AUTH_SHA1						0
#define nwSNMP_AUTH_MD5							1

// Snmp Object - V3 Privacy Protocols

#define nwSNMP_PRIV_DES							0
#define nwSNMP_PRIV_AES							1

// Mib Object - Access

#define	nwMIB_ACCESS_NOACCESS					0
#define	nwMIB_ACCESS_NOTIFY						1
#define	nwMIB_ACCESS_READONLY					2
#define	nwMIB_ACCESS_WRITEONLY					3
#define	nwMIB_ACCESS_READWRITE					4
#define	nwMIB_ACCESS_READCREATE					5

// Mib Object - Status

#define	nwMIB_STATUS_CURRENT					0
#define	nwMIB_STATUS_DEPRECATED					1
#define	nwMIB_STATUS_OBSOLETE					2
#define nwMIB_STATUS_MANDATORY					3


// VM for now
#define	nwVMWARE_CPU_USAGE					100		// CPU usage in percent

#define nwVMWARE_MEMORY_USAGE				200		// Memory usage in percent							
#define nwVMWARE_MEMORY_AVAILABLE			201		// Available memory in Mb
#define nwVMWARE_MEMORY_USED				202		// Memory used in Mb

#define nwVMWARE_NETWORK_PACKETSRX			300		// Received packets during last interval			
#define nwVMWARE_NETWORK_PACKETSTX			301		// Transmitted packets during last interval			

#define nwVMWARE_NETWORK_RATERX				350		// Current Network Receiving rate in kbps			
#define nwVMWARE_NETWORK_RATETX				351		// Current Network Transmitting rate in kbps		
	
#define nwVMWARE_DISK_USAGE					400		// Current Disk usage in percent					
#define nwVMWARE_DISK_AVAILABLE				401		// Available disk space in Mb
#define nwVMWARE_DISK_USED					402		// Used disk space in Mb

#define nwVMWARE_MACHINE_STATE				500		// Determine whether virtual machine is running ( see nwVMWARE_MACHINESTATE_XXXX constants )
#define nwVMWARE_POWER_STATE				501		// Determine whether virtual machine is powered ( see nwVMWARE_POWERSTATE_XXXX constants)
#define nwVMWARE_GUESTTOOLS					502		// Determine whether VM Guest Tools is running on Virtual Machine ( see nwVMWARE_GUESTTOOLS_XXXX constants)

///////////////////////////////////////////////////////////////////////////////////

#define nwVMWARE_POWERSTATE_INVALID			-1L
#define nwVMWARE_POWERSTATE_OFF				 0L
#define nwVMWARE_POWERSTATE_ON				 1L
#define nwVMWARE_POWERSTATE_SUSPENDED		 2L

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define nwVMWARE_MACHINESTATE_INVALID		-1L
#define nwVMWARE_MACHINESTATE_NOTRUNNING	 0L
#define nwVMWARE_MACHINESTATE_RESETTING		 1L	
#define nwVMWARE_MACHINESTATE_RUNNING		 2L
#define nwVMWARE_MACHINESTATE_SHUTTINGDOWN	 3L
#define nwVMWARE_MACHINESTATE_STANDBY		 4L
#define nwVMWARE_MACHINESTATE_UNKNOWN		 5L

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define nwVMWARE_GUESTTOOLS_UNKNOWN			-1L
#define nwVMWARE_GUESTTOOLS_NOTRUNNING		 0L
#define nwVMWARE_GUESTTOOLS_RUNNING			 1L
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define nwVMWARE_MINNOTAPPLICABLE			-99999L
#define nwVMWARE_MAXNOTAPPLICABLE			 99999L

///////////////////////////////////////////////////////////////////////////////////

#define	nmXEN_CPU_USAGE						100		// CPU usage in percent

#define nmXEN_MEMORY_USAGE					200		// Memory usage in percent							
#define nmXEN_MEMORY_AVAILABLE				201		// Available memory in Mb
#define nmXEN_MEMORY_USED					202		// Memory used in Mb

#define nmXEN_NETWORK_RATERX				350		// Current Network Receiving rate in kbps			
#define nmXEN_NETWORK_RATETX				351		// Current Network Transmitting rate in kbps	

#define nmXEN_DISK_USAGE					400		// Current Disk usage in percent (host only)					
#define nmXEN_DISK_AVAILABLE				401		// Available disk space in Mb (host only)
#define nmXEN_DISK_USED						402		// Used disk space in Mb (host only)

#define nmXEN_POWER_STATE					501		// Determine whether virtual machine is powered ( guest only )
#define nmXEN_GUESTTOOLS					502		// Determine whether XenTools are running on Virtual Machine ( see nmXEN_GUESTTOOLS_XXXX constants)

///////////////////////////////////////////////////////////////////////////////////

#define nmXEN_POWERSTATE_HALTED				0L
#define nmXEN_POWERSTATE_PAUSED				1L
#define nmXEN_POWERSTATE_RUNNING			2L
#define nmXEN_POWERSTATE_SUSPENDED			3L
#define nmXEN_POWERSTATE_SHUTTINGDOWN		4L
#define nmXEN_POWERSTATE_CRASHED			5L
#define nmXEN_POWERSTATE_UNKNOWN			6L

///////////////////////////////////////////////////////////////////////////////////

#define nmXEN_GUESTTOOLS_UNKNOWN			-1L
#define nmXEN_GUESTTOOLS_NOTRUNNING			 0L
#define nmXEN_GUESTTOOLS_RUNNING			 1L

///////////////////////////////////////////////////////////////////////////////////

#define nmXEN_MINNOTAPPLICABLE			-99999L
#define nmXEN_MAXNOTAPPLICABLE			 99999L

///////////////////////////////////////////////////////////////////////////////////


// Error codes
/*
   All error codes for all ActiveXperts products are listed on the ActiveXperts web site:
   http://www.activexperts.com/support/errorcodes/ 
*/

#endif // _AXNETWORKCONSTANTS_H_
