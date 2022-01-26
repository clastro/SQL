###  테이블 B(YT_ads_yn)에 있는 칼럼을 테이블 A(YT_video_lists2)에 추가 UPDATE 하고자 할 때
```
UPDATE YT_video_lists2 
   SET ads_yn=(SELECT ads_yn FROM YT_ads_yn WHERE YT_video_lists2.video_id=YT_ads_yn.video_id);
```
