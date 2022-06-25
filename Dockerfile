FROM continuumio/miniconda3

# COPY requirements.txt .
# RUN pip3 install --upgrade pip \
#     && pip3 install -r requirements.txt
# 
# RUN apt update -qq \
#     && apt install -y --no-install-recommends software-properties-common dirmngr \
#     && wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
#     && add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" \
#     && apt install -y --no-install-recommends r-base
# 
# # Rのパッケージのビルドに必要
# RUN apt install -y gfortran r-base-dev
# 
# # Pythonでgraphvizを使うのに必要
# RUN apt install -y graphviz graphviz-dev

COPY conda_requirements.txt .
RUN conda config --append channels conda-forge \
    && conda config --remove channels defaults \
    && conda install --file conda_requirements.txt
