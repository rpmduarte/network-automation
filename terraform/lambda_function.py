from lib.http_utils import *
from lib.makejson import *

def lambda_handler(event, context):

    import base64, json

    print(event)

    http_request = {
        'host': event['headers']['host'],
        'path': event['path'],
        'query_string': event['queryStringParameters']
    }

    http_response = {
        'statusCode': None,
        'response_headers': { 
            'Content-Type': "text/plain",
            'Cache-Control': "no-cache, no-store",
            'Pragma': "no-cache"
        },
        'body': ""
    }

    try:
        data = main(http_request)
        http_response['statusCode'] = 200
        if type(data) == dict:
            http_response['headers']['Content-Type'] = "application/json"
            body = json.dumps(data)
        else:
            body = format(data)
 
    except Exception as e:

        http_response['statusCode'] = 500
        http_response['body'] = format(e)
     
    print(http_response)
    return http_response 
 