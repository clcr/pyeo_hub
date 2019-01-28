#Built from https://medium.com/@chadlagore/conda-environments-with-docker-82cdc9d25754

FROM continuumio/miniconda3

ADD environment.yml /tmp/environment.yml

RUN conda env create -f /tmp/environment.yml -n eoenv
RUN echo "source activate eoenv" > ~/.bashrc
ENV PATH /opt/conda/envs/eoenv/bin:$PATH
RUN git clone https://github.com/clcr/pyeo

