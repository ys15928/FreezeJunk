import sys
import io

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding='utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding='utf-8')

import os
import json
import googleapiclient.discovery

# url.txt에 저장된  url을 읽어와 split 하여 video_id용 video_id_fromtxt 추출
with open("E:\\FreezeJunk\\src\\main\\webapp\\resources\\youtube\\url.txt", 'r') as urlFile:
    url = urlFile.readline()
video_id_fromtxt = url.split("?v=")


os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"
api_key = "AIzaSyBQyyjxukCf2vzb0tDe1ILeemhFlv1fHzs"
video_id = video_id_fromtxt[1]


comments = list()
api_obj = googleapiclient.discovery.build('youtube', 'v3', developerKey=api_key)
response = api_obj.commentThreads().list(part='snippet,replies', moderationStatus="published", order="relevance", textFormat="plainText", videoId=video_id, maxResults=100).execute()
 
while response:
    for item in response['items']:
        comment = item['snippet']['topLevelComment']['snippet']
        comments.append([comment['textDisplay'], comment['authorDisplayName'], comment['authorChannelUrl']])
 
        if item['snippet']['totalReplyCount'] > 0:
            for reply_item in item['replies']['comments']:
                reply = reply_item['snippet']
                comments.append([reply['textDisplay'], reply['authorDisplayName'], reply['authorChannelUrl']])
 
    if 'nextPageToken' in response:
        response = api_obj.commentThreads().list(part='snippet,replies', moderationStatus="published", order="relevance", textFormat="plainText", videoId=video_id, pageToken=response['nextPageToken'], maxResults=100).execute()
    else:
        break
    
with open("E:\\FreezeJunk\\src\\main\\webapp\\resources\\youtube\\result.json", 'w', encoding='utf-8') as file:
    json.dump(comments, file, indent=4, ensure_ascii=False)
