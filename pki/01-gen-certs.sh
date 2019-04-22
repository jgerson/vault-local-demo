#!/bin/bash -x 

vault write pki/issue/hashicorp-test-dot-com \
    common_name=db1.hashicorp-test.com \
    format=pem_bundle > db1.hashicorp-test.com

for x in `seq 1 9`; do 
    vault write pki/issue/hashicorp-test-dot-com \
         common_name=app${x}.hashicorp-test.com \
         format=pem_bundle > app${x}.hashicorp-test.com
done
