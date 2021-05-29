#!/bin/bash


sed 's/${data_dir}\/dev/..\/$1\/test/g' < experiments.conf > tmp
mv tmp experiments.conf
