# gen-preflist
Small script for generating prefix lists for bird using bgpq3

## Requirements
* bgpq3
* bird

## Usage
This script takes a textfile with a list of peers and generates prefix lists using bgpq3.
It generates an output file for every peer with a function "<peername>_v<IP-version>_nets()",
which returns the prefix list. You can use this function for creating a filter.
After all lists are generated, it will do a birdc configure, to apply new prefixes to your filters.

