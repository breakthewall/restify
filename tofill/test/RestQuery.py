#!/usr/bin/env python3

import argparse
import io
import tarfile
import json
import requests
import logging

def upload(file_1, param_2, server_url):
    # Post request
    data = {'timeout': timeout}
    files = {'file_1': open(param_1, 'rb'),
            'data': ('data.json', json.dumps(data))}
    try:
        r = requests.post(server_url+'/Query', files=files)
        r.raise_for_status()
    except requests.exceptions.HTTPError as err:
        logging.error(err)
        logging.error(r.text)
        return False
    return_content = r.content
    # Process return_content
    # ...

if __name__ == "__main__":
    parser = argparse.ArgumentParser('Python wrapper for the python <tool> script')
    parser.add_argument('-file_1', type=str)
    parser.add_argument('-param_2', type=str)
    # ...
    parser.add_argument('-server_url', type=str)
    params = parser.parse_args()
    upload(params.file_1, params.param_2, params.server_url)
