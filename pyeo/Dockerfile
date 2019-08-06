#Built from https://medium.com/@chadlagore/conda-environments-with-docker-82cdc9d25754

FROM continuumio/miniconda3

RUN apt update
RUN apt install python2.7 -y

ADD environment.yml /tmp/environment.yml

RUN conda env create -f /tmp/environment.yml -n eoenv
RUN echo "source activate eoenv" > ~/.bashrc

RUN wget http://step.esa.int/thirdparties/sen2cor/2.5.5/Sen2Cor-02.05.05-Linux64.run
RUN chmod 777 Sen2Cor-02.05.05-Linux64.run
RUN ./Sen2Cor-02.05.05-Linux64.run

ENV PATH /opt/conda/envs/eoenv/bin:$PATH
RUN git clone https://github.com/clcr/pyeo

RUN chmod 777 /pyeo/bin/*
ENV PYEO /pyeo
RUN /opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks

RUN conda install -c conda-forge jupyterhub
RUN conda install -c conda-forge notebook

EXPOSE 8888
