################################################################################
#    HPCC SYSTEMS software Copyright (C) 2012 HPCC Systems.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
################################################################################


# Component: roxiecommlib 
#####################################################
# Description:
# ------------
#    Cmake Input File for roxiecommlib
#####################################################

project( roxiecommlib ) 

include(${HPCC_SOURCE_DIR}/esp/scm/espscm.cmake)

set (    SRCS 
         ${ESPSCM_GENERATED_DIR}/roxiecommlibscm_esp.cpp 
                 ${HPCC_SOURCE_DIR}/esp/scm/roxiecommlibscm.ecm
         roxiecommunicationclient.cpp 
    )

include_directories ( 
         ./../../common/remote 
         ./../../system/mp 
         ./../../common/workunit 
         ./../../common/environment 
         ./../../roxie/ccd 
         ./../../common/fileview2 
         ./../../system/include 
         ./../../system/security/shared
         ./../../system/xmllib
         ./../../dali/base 
         ./../../rtl/include 
         ./../../common/dllserver 
         ./../../esp/platform 
         ./../../esp/bindings 
         ./../../esp/clients 
         ./../../esp/bindings/SOAP/xpp 
         ./../../system/jlib 
         ./../../rtl/eclrtl 
    )

ADD_DEFINITIONS( -D_USRDLL -DROXIECOMMLIB_EXPORTS )

HPCC_ADD_LIBRARY( roxiecommlib SHARED ${SRCS} )
add_dependencies( roxiecommlib espscm )
install ( TARGETS roxiecommlib RUNTIME DESTINATION ${EXEC_DIR} LIBRARY DESTINATION ${LIB_DIR} )
target_link_libraries ( roxiecommlib
         jlib 
    )


