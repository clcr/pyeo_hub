FROM continuumio/miniconda3:latest

ENTRYPOINT [ “/bin/bash”, “-c” ]

RUN git clone https://github.com/clcr/pyeo && \
cd pyeo && \
git checkout restructure && \
conda env create --name pyeo_env --file environment.yml
RUN ["/bin/bash", "-c", "cd pyeo && source activate pyeo_env && python -m pip install . -vv"]
RUN export PYEO=$(pwd) && \
export PATH=$PATH:$PYEO/bin && \
chmod 755 $PYEO/bin
CMD ["source activate pyeo_env && rolling_s2_change_detection"]
