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
The following three commands will clone the repository and setup everything required for training the model:

1) apt install git
2) git clone https://github.com/linguist89/thesis_2021_craft.git
