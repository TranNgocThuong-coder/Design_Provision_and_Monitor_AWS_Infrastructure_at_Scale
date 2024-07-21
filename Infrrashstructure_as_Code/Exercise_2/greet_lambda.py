import os
import json
def lambda_handler(event, context):

    return {
        'statusCode': 200,
        'body': json.dumps("{} from Lambda!".format(os.environ['greeting']))
    }