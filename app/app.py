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


from flask import request, Response, send_file

def post():
    outTar = None
    file_1_bytes = request.files['file_1'].read()
    params = json.load(request.files['data'])
#    args = [rp2_pathways_bytes, params['timeout'], app.logger]
    args = {'bytes': file_1_bytes, 'param_1': params['param_1'], 'logger': None}
    result = run(args)
    # Process result
    return 0
    # if result[2]==b'filenotfounderror':
    #     return Response("FileNotFound Error from rp2paths \n "+str(result[3]), status=400)
    # if result[2]==b'oserror':
    #     return Response("rp2paths has generated an OS error \n"+str(result[3]), status=400)
    # if result[2]==b'memerror':
    #     return Response("Memory allocation error \n"+str(result[3]), status=400)
    # if result[0]==b'' and result[1]==b'':
    #     return Response("Could not find any results \n"+str(result[3]), status=400)
    # if result[2]==b'valueerror':
    #     return Response("Could not setup a RAM limit \n"+str(result[3]), status=400)
    # outTar = io.BytesIO()
    # with tarfile.open(fileobj=outTar, mode='w:xz') as tf:
    #     #make a tar to pass back to the rp2path flask service
    #     out_paths = io.BytesIO(result[0])
    #     out_compounds = io.BytesIO(result[1])
    #     #out_paths = result[0]
    #     #out_compounds = result[1]
    #     info = tarfile.TarInfo(name='rp2paths_pathways')
    #     info.size = len(result[0])
    #     tf.addfile(tarinfo=info, fileobj=out_paths)
    #     info = tarfile.TarInfo(name='rp2paths_compounds')
    #     info.size = len(result[1])
    #     tf.addfile(tarinfo=info, fileobj=out_compounds)
    # ###### IMPORTANT ######
    # outTar.seek(0)
    # #######################
    # return send_file(outTar, as_attachment=True, attachment_filename='rp2paths_result.tar', mimetype='application/x-tar')
