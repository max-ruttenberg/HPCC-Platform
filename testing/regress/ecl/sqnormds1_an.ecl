/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2012 HPCC Systems.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */

//nothorlcr
//version multiPart=false

import ^ as root;
multiPart := #IFDEFINED(root.multiPart, false);

//--- end of version configuration ---

import $.setup;
sq := setup.sq(multiPart);

mask:=0xffff;

// the local variants....

//Normalized, no filter
#if (mask & 0x81 = 0x81)
output(allnodes(local(sq.SimplePersonBookDs.books)), { name, author, rating100 });
#end

//Normalized, filter on inner level
#if (mask & 0x84 = 0x84)
output(allnodes(local(sq.SimplePersonBookDs.books(rating100>50))), { name, author, rating100 });
#end

//Normalized, filter on outer level
#if (mask & 0x88 = 0x88)
output(allnodes(local(sq.SimplePersonBookDs.books(sq.SimplePersonBookDs.surname='Halliday'))), { name, author, rating100 });
#end

//Normalized, filter on both levels
#if (mask & 0x90 = 0x90)
output(allnodes(local(sq.SimplePersonBookDs.books(rating100>50, sq.SimplePersonBookDs.surname='Halliday'))), { name, author, rating100 });
#end

//Normalized, filter on both levels - diff syntax, location of filter is optimized.
#if (mask & 0xa0 = 0xa0)
output(allnodes(local(sq.SimplePersonBookDs(surname='Halliday').books(rating100>50))), { name, author, rating100 });
#end

//No filter or project - need to make sure we create correctly
#if (mask & 0xc0 = 0xc0)
output(allnodes(local(sq.SimplePersonBookDs.books)));
#end

#if (mask & 0x82 = 0x82)
//Multiple levels, multiple filters...
output(allnodes(local(sq.HousePersonBookDs(id != 0).persons(id != 0).books(id != 0, sq.HousePersonBookDs.id != 999))), { name, author, rating100 });
#end
