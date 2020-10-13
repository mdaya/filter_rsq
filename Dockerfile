FROM r-base:4.0.3

# Install scripts
RUN mkdir /home/analyst
COPY run_get_valid_snp_ids.sh /home/analyst/
RUN chmod a+x /home/analyst/run_get_valid_snp_ids.sh 
COPY run_get_valid_snp_ids.R /home/analyst/
