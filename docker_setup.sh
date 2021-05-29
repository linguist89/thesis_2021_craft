#! /bin/sh

export data_dir="."
export CHOSEN_MODEL=$1
export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
apt update
apt-get install wget
apt-get install unzip
apt install python-pip
apt-get install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get install python3.6
apt-get install python3-pip
git clone https://github.com/mandarjoshi90/coref.git
cd coref
update-alternatives --install /usr/bin/python python /usr/bin/python3 1
pip install -r requirements.txt --log install-log.txt -q
./setup_all.sh
./download_pretrained.sh $CHOSEN_MODEL
rm ./coref/setup_trainig.sh
wget https://github.com/linguist89/thesis_2021_craft/raw/main/setup_training.sh
./setup_training.sh . .
