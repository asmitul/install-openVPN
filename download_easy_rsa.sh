   #!/bin/bash

   # url easyrsa
   easy_rsa_url='https://github.com./OpenVPN/easy-rsa/releases/download/v3.2.1/EasyRSA-3.2.1.tgz'

   # download easyrsa
   wget -O EasyRSA-3.2.1.tgz "$easy_rsa_url" || curl -Lo EasyRSA-3.2.1.tgz "$easy_rsa_url"