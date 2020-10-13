#!/bin/bash

info_gz_file=$1
min_rsq=$2
out_file_name=`basename $info_gz_file | sed 's/info.gz/_valid_snp_IDs.txt/'`

cat /home/analyst/run_get_valid_snp_ids.R | R --vanilla --args $info_gz_file $min_rsq $out_file_name
