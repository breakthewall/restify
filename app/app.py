"""
Created on March 7 2019

@author: Melchior du Lac, Joan Hérisson
@description: Run function of REST version of <tool>. The <tool> is available in /home/<tool>.

"""
import subprocess
import tempfile
import logging
import resource
import glob

MAX_VIRTUAL_MEMORY = 20000 * 1024 * 1024 # 20GB -- define what is the best

def limit_virtual_memory():
    resource.setrlimit(resource.RLIMIT_AS, (MAX_VIRTUAL_MEMORY, resource.RLIM_INFINITY))

def run(params):

    file_1 = params['file_1']
    param_1 = params['param_1']

    if params['logger']==None:
        logging.basicConfig(level=logging.DEBUG)
        logger = logging.getLogger(__name__)

    # Process file_1 and param_1
