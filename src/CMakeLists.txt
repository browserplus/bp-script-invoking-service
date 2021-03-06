#####
# A CMake build file for the ScriptInvoking ruby service which 
# shows custom HTML dialog prompts.
# 
# Copyright 2010, Yahoo!
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
# 
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the
#     distribution.
# 
#  3. Neither the name of Yahoo! nor the names of its
#     contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
# IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# 
# Original Author: Gordon Durand
#####

CMAKE_MINIMUM_REQUIRED(VERSION 2.8.1)

SET(SERVICE_NAME ScriptInvoking)
PROJECT(${SERVICE_NAME}Ruby)

INCLUDE(${CMAKE_CURRENT_SOURCE_DIR}/../external/bp-build-templates/cmake/BuildConfigs.cmake)

# Ship all *.rb files
FILE(GLOB_RECURSE SRCS RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "*.rb")

BPAddRubyService()

# Ship all dialogs
FILE(GLOB DLGS_SRC "${CMAKE_CURRENT_SOURCE_DIR}/dialogs")
SET(DLGS_DST "${OUTPUT_DIR}/dialogs")
MESSAGE("copy dialogs from:    ${DLGS_DST}")
ADD_CUSTOM_COMMAND(
  TARGET ${SERVICE_NAME} POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          \"${CMAKE_CURRENT_SOURCE_DIR}/hello_world.bat\"
          \"${OUTPUT_DIR}\"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          \"${CMAKE_CURRENT_SOURCE_DIR}/hello_world.sh\"
          \"${OUTPUT_DIR}\"
)

