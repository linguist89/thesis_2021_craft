#!/bin/bash


ontonotes_path=$1
data_dir=$2

dlx() {
  wget -P $data_dir $1/$2
  tar -xvzf $data_dir/$2 -C $data_dir
  rm $data_dir/$2
}

download_bert(){
  model=$1
  wget -P $data_dir https://storage.googleapis.com/bert_models/2018_10_18/$model.zip
  unzip $data_dir/$model.zip
  rm $data_dir/$model.zip
  mv $model $data_dir/
}

download_spanbert(){
  model=$1
  wget -P $data_dir https://dl.fbaipublicfiles.com/fairseq/models/$model.tar.gz
  mkdir $data_dir/$model
  tar xvfz $data_dir/$model.tar.gz -C $data_dir/$model
  rm $data_dir/$model.tar.gz
}


download_bert cased_L-12_H-768_A-12
download_bert cased_L-24_H-1024_A-16
download_spanbert spanbert_hf
download_spanbert spanbert_hf_base

