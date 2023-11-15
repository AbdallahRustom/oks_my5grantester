#!/bin/bash

# BSD 2-Clause License

# Copyright (c) 2020, Supreeth Herle
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.

# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

eth0=$(ifconfig eth0 | awk '/inet / {print $2}' | cut -d ':' -f 2)

sed -i 's|eth0|'$eth0'|g' /5grantestercode/config/config.yml
sed -i 's|NGAP_LOCAL_ADDR|'$NGAP_LOCAL_ADDR'|g' /5grantestercode/config/config.yml
sed -i 's|GTPU_LOCAL_ADDR|'$GTPU_LOCAL_ADDR'|g' /5grantestercode/config/config.yml
sed -i 's|MCC|'$MCC'|g' /5grantestercode/config/config.yml
sed -i 's|MNC|'$MNC'|g' /5grantestercode/config/config.yml
sed -i 's|TAC|'$TAC'|g' /5grantestercode/config/config.yml
sed -i 's|GNBID|'$GNBID'|g' /5grantestercode/config/config.yml
sed -i 's|SST_GNB|'$SST_GNB'|g' /5grantestercode/config/config.yml
sed -i 's|SD|'$SD'|g' /5grantestercode/config/config.yml
sed -i 's|MSIN|'$MSIN'|g' /5grantestercode/config/config.yml
sed -i 's|KEY|'$KEY'|g' /5grantestercode/config/config.yml
sed -i 's|OPC|'$OPC'|g' /5grantestercode/config/config.yml
sed -i 's|DNN|'$DNN'|g' /5grantestercode/config/config.yml
sed -i 's|SST_UE|'$SST_UE'|g' /5grantestercode/config/config.yml
sed -i 's|NGAP_REMOTE_ADDR|'$NGAP_REMOTE_ADDR'|g' /5grantestercode/config/config.yml

cat /5grantestercode/config/config.yml


cd /5grantestercode/cmd/
./app load-test -n $NUM_UE

# Sync docker time
#ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone