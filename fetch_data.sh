# bin/bash

echo "fetching transkriptions from grocerist-tei"
rm -rf data/editions
wget https://github.com/grocerist/grocerist-tei/archive/refs/heads/main.zip
unzip main
mv ./grocerist-tei-main/tei ./data/editions
rm main.zip
rm -rf ./grocerist-tei-main

echo "update imprint"
./dl_imprint.sh

add-attributes -g "./data/editions/*.xml" -b "https://id.acdh.oeaw.ac.at.at/grocerist"
add-attributes -g "./data/meta/*.xml" -b "https://id.acdh.oeaw.ac.at.at/grocerist"