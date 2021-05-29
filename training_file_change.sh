#!/bin/bash


sed 's/${data_dir}\/train/..\/$1\/train/g' < experiments.conf > tmp
mv tmp experiments.conf
