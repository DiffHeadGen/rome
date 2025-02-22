ml CUDA/11.8.0
conda create -n rome python=3.8 -y
conda activate rome

# 先安装 PyTorch
pip install torch==2.0.0 torchvision==0.15.0 --index-url https://download.pytorch.org/whl/cu118

# 安装基础依赖
pip install -r requirements.txt

# 安装 pytorch3d 的系统依赖
conda install -c fvcore -c iopath -c conda-forge fvcore iopath -y

# 安装预编译的 pytorch3d
pip install --no-index --no-cache-dir pytorch3d -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/py38_cu118_pyt200/download.html

pip install -e ../expdata

# ------------------------------------------------------------
# download data
# 创建目录并下载文件
mkdir -p data MODNet/pretrained
pip install gdown
gdown https://drive.google.com/uc?id=1rLtc037Ra6Z6t0kp-gJ8P1ZKfzkKm070 -O data/
gdown --folder https://drive.google.com/drive/folders/1umYmlCulvIFNaqPjwod1SayFmSRHziyR -O MODNet/pretrained/
source fetch_data.sh