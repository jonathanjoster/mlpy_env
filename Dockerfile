# c.f. https://www.kkaneko.jp/tools/ubuntu/gsllinux.html
FROM conda/miniconda3

# gcc and g++ must be the same version
RUN apt-get update && \
    apt-get install -y gcc g++ wget make sudo vim

# GSL installation. It takes several minutes.
WORKDIR /tmp
RUN wget https://ftp.jaist.ac.jp/pub/GNU/gsl/gsl-2.7.1.tar.gz && \
    tar -xvzof gsl-2.7.1.tar.gz
WORKDIR gsl-2.7.1
RUN CFLAGS="-fexceptions -ftree-vectorize" ./configure --prefix=/usr/local --disable-dependency-tracking && \
    make && \
    sudo make install && \
    echo "/usr/local/lib" >> /etc/ld.so.conf && \
    sudo /sbin/ldconfig

# conda create
WORKDIR /workspace
RUN conda update -n base -c defaults conda && \
    conda create -yn mlpy python=3.6 numpy scipy matplotlib && \
    conda init && \
    echo "conda activate mlpy" >> ~/.bashrc
# RUN conda install -y numpy scipy matplotlib

WORKDIR mlpy-3.5.0