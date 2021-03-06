NB!

THIS BACKEND HAS BEEN MOVED TO POWERDNS AUTH SERVER REPOSITORY - DO NOT USE THIS 
================================================================================


Remote backend for PowerDNS.

This backend provides unix socket / pipe / http remoting for powerdns.

NB! THIS BACKEND IS EXPERIMENTAL - DO NOT USE IN PRODUCTION ENVIRONMENT

This backend is provided under the same licensing terms as PowerDNS itself. 

1. Compiling

Install following libraries for dependencies: libjsoncpp, libcurl 

To compile this backend, you need to configure --with-modules="remote pipe". 

Also, you need to apply the patch 0001-Added-remotebackend-for-compile.patch
to enable compiling the backend. Then you need to run ./bootstrap and
configure.

2. Usage

The only configuration option for this backend is remote-connection-string.

It comprises of two elements: type of backend, and parameters

remote-connection-string=<type>:<param>=<value>,<param>=<value>...

You can pass as many parameters as you want, for unix and pipe backends, these
are passed along to the remote end as initialization. See API.

2.1. Unix backend

parameters: path 

remote-connection-string=unix:path=/path/to/socket

2.2. Pipe backend

parameters: command

remote-connection-string=unix:command=/path/to/executable

2.3. HTTP backend

parameters: url, url-suffix

HTTP backend tries to do RESTful requests to your server. See examples.

URL should not end with /, and url-suffix is optional, but if you define it, it's
up to you to write the ".php" or ".json". Lack of dot causes lack of dot in
URL. 

3. API

3.1. Queries

Unix and Pipe backend sends JSON formatted string to the remote end. Each 
JSON query has two sections, 'method' and 'parameters'. 

HTTP backend calls methods based on URL and has parameters in the query string.
The calls are always GET calls.

3.2. Replies

You *must* always reply with JSON hash with at least one key, 'result'. This 
must be false if the query failed. Otherwise it must conform to the expected
result.

You can optionally add 'log' array, each line in this array will be logged in
PowerDNS.

3.3. Methods

The following methods are used:

Method: lookup
Parameters: qtype, domain, remote, local, real-remote, zone_id
Reply: array of <qtype,qname,content,ttl,domaind_id,priority,scopeMask>
Optional values: domain_id and scopeMask

Method: list
Parameters: zonename, domain_id
Reply: array of <qtype,qname,content,ttl,domaind_id,priority,scopeMask>
Optional values: domain_id and scopeMask

Method: getBeforeAndAfterNamesAbsolute
Parameters: id, qname
Reply: unhashed, before, after

Method: getBeforeAndAfterNames
Parameters: id, zonename, qname
Reply: before, after

Method: getDomainMetadata
Parameters: name, kind
Reply: array of strings

Method: getDomainKeys
Parameters: name, kind
Reply: array of domain keys <id,flags,active,content>

Method: getTSIGKey
Parameters: name
Reply: algorithm, content

Method: setDomainMetadata
Parameters: name, kind, value
Reply: true or false

Method: addDomainKey
Parameters: flags, active, content
Reply: id-of-key

Method: remoteDomainKey
Parameters: name, id
Reply: true or false

Method: activateDomainKey
Parameters: name, id
Reply: true or false

Method: deactivateDomainKey
Parameters: name, id
Reply: true or false

4. EXAMPLES

Scenario: SOA lookup via pipe or unix

Query: 

{ 
  "method": "lookup",
  "parameters": {
     "qname": "example.com", 
     "qtype": "SOA",
     "zone_id": "-1"
  }
}

Reply:

{
  "result": 
   [ 
     { "qtype": "SOA",
       "qname": "example.com", 
       "content": "dns1.icann.org. hostmaster.icann.org. 2012080849 7200 3600 1209600 3600",
       "ttl": 3600,
       "priority": 0,
       "domain_id": -1
     }
   ]
}


Scenario: SOA lookup via HTTP backend

Query:

/dns/lookup/example.com/SOA

Reply:

{
  "result":
   [
     { "qtype": "SOA",
       "qname": "example.com",
       "content": "dns1.icann.org. hostmaster.icann.org. 2012080849 7200 3600 1209600 3600",
       "ttl": 3600,
       "priority": 0,
       "domain_id": -1
     }
   ]
}

5. TODO

 - Improve error handling and reply validation
 - Code coverage

