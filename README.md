# gen-preflist
Small script for generating prefix lists for bird using bgpq3

## Requirements
* bgpq3
* bird

## Usage
This script takes a textfile with a list of peers and generates prefix lists using bgpq3.
It generates an output file for every peer with a function "$peername_v$IP-version_nets()",
which returns the prefix list. You can use this function for creating a filter.
After all lists are generated, it will do a birdc configure, to apply new prefixes to your filters.

### peerlist.txt
Every line defines one peer. First statement is a common name, second is the IP-Version and third is the AS set from where bgpq3 generates the prefix list. If you have both IPv4 and IPv6 peerings, the name can be the same.

### Paths
Of course you can adjust the paths of the output files and the peerlist!
