# Thesis Product
## Instructions for running the filtering notebook
The CRAFT dataset that was used for the experiments are included in this GitHub repo, but in case new data needs to be created [this notebook](https://colab.research.google.com/drive/1TS7PDjWK3bSDwUd3u7TGozFRR4YYGvCD?usp=sharing) can be used. For ease of use it is recommended that the notebook be used, but the code can also be run on a local machine provided all the dependencies function correctly.
## Intructions for running the docker and bash script
The bash script has only been tested on a machine running Ubuntu 20.04 with a 16GB GPU and 40GB of RAM. However, the script should be able to run on any machine that has the same or better hardware and root access privileges. This bash script will create the environment and set the model up for training and/or evaluation. The model being used is the practical implementation of BERT (Joshi, M., Levy, O., Weld, D. S., & Zettlemoyer, L. (2019). BERT for coreference resolution: Baselines and analysis. arXiv preprint arXiv:1908.09091.) and SpanBERT (Joshi, M., Chen, D., Liu, Y., Weld, D. S., Zettlemoyer, L., & Levy, O. (2020). Spanbert: Improving pre-training by representing and predicting spans. Transactions of the Association for Computational Linguistics, 8, 64-77.) which can be found at [this repository](https://github.com/mandarjoshi90/coref.git) 

### Steps for running the docker
Run the following commands from the terminal:

1) sudo docker pull yyq465009551/cuda10_py36_tf114
2) sudo docker run -it yyq465009551/cuda10_py36_tf114:latest

This will create a container that has Python3.6, CUDA 10.0 and Tensorflow 1.14.

### Steps for running the bash script
The following commands will clone the repository and setup everything required for training the model:

3) apt install git
4) git clone https://github.com/linguist89/thesis_2021_craft.git
5) cd thesis_2021_craft
6) chmod u+x ./docker_setup.sh
7) ./docker_setup.sh bert_base
8) unzip data_files_11split_manual_wparts.zip
9) unzip edited_it_11split_manual_wparts.zip

For the above step, you can choose spanbert_base or bert_base depending on which model you want to train. The default is bert_base.

### Setup environment variables
For step two you can choose either bert_base or spanbert_base
10) export data_dir="."
11) export CHOSEN_MODEL="bert_base"
12) export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
13) export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

### Train the model
For step 15 you can change the file directory to 21split or 51 split depending on which segmentation files you want to train 
For step 16 you can change it to train_spanbert_base if you setup for the spanbert model
14) cd coref
15) ../training_file_change.sh data_files_11split_manual_wparts
16) GPU=0 python train.py train_bert_base

### Evalute results on the masked datasets
For step 17 you can change the file directory to 21split or 51 split depending on which segmentation files you want to evaluate on
For step 18 you can change it to train_spanbert_base if you setup for the spanbert model
17) ../evaluating_file_change.sh edited_it_11split_manual_wparts
18) GPU=0 evaluate train.py train_bert_base
