# conda deactivate
# conda env remove -n rome -y
conda create -n rome python=3.8 -y
conda activate rome
pip install -r requirements.txt
pip install git+https://github.com/facebookresearch/pytorch3d.git