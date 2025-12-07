#!/bin/bash
BUCKET_NAME="thirdpartyapplicationdemo0529"
FOLDER_PATH="ChatDemo/agent"

npm run build
aws s3 sync . s3://$BUCKET_NAME/$FOLDER_PATH/ --exclude "*" --include "index.html" --include "amazon-connect-chat-interface.js" --include "ringtone.mp3"
aws cloudfront create-invalidation --distribution-id E2UE1UWZONLK4Y --paths "/$FOLDER_PATH/*"