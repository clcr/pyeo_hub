FROM continuumio/miniconda3:latest

RUN git clone https://github.com/clcr/pyeo && \
cd pyeo && \
git checkout restructure && \
conda env create --name pyeo_env --file environment.yml
RUN echo "source activate pyeo_env" > ~/.bashrc && \
cd pyeo && \
python -m pip install . -vv && \
export PYEO=$(pwd) && \
export PATH=$PATH:$PYEO/bin && \
chmod 755 $PYEO/bin && \
rolling_s2_change_detection --help
