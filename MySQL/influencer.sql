1. 인플루언서 별 영상 평균 조회수 ( 최근 25일)

5000 이하 : 8692
5000 이상 10000 이하 : 15534
10000 이상 50000 이하 : 28699
50000 이상 100000 이하 : 67802
10만 이상 : 317352

쿼리

SELECT video_id,video_title,video_publishDate,video_views,avg(video_views),video_channelId,profile_subscribers
FROM (
    SELECT uvi.video_id,uvi.video_title,uvi.video_publishDate,uvi.video_views,uvi.video_channelId,ui.profile_subscribers,
    RANK() OVER (PARTITION BY uvi.video_channelId ORDER BY uvi.video_publishDate DESC) AS rnk
    FROM hifen.utube_video_info AS uvi INNER JOIN hifen.utuber_info AS ui ON uvi.video_channelId = ui.profile_id 
) AS x 
WHERE rnk <= 25 GROUP BY video_channelId  HAVING profile_subscribers>100000 ORDER BY profile_subscribers ;

#인플루언서의 평균 조회수를 나타내야 하는데 구독자 규모별로 최근 25일간의 평균 조회수를 계산하는 쿼리
두 개의 테이블을 조인하고 서브쿼리를 사용함

2. 인플루언서별 영상 평균조회수/인플루언서 구독자 수 X 100 (규모별 평균)

5000이하 : 195.82939841
5000 이상 10000 이하 : 79.79833967
10000 이상 50000 이하 : 54.23669698
50000 이상 100000 이하 : 42.82358359
10만 이상 : 25.47658881

쿼리

SELECT avg(score) FROM(
SELECT ui.profile_subscribers,(uvi.video_views)/ui.profile_subscribers*100 AS score,ui.profile_id FROM hifen.utube_video_info AS uvi 
INNER JOIN hifen.utuber_info AS ui 
ON uvi.video_channelID = ui.profile_id GROUP BY ui.profile_id HAVING profile_subscribers<=5000 ORDER BY profile_subscribers DESC) SUB_QUERY;

3. 인플루언서별 영상별 (좋아요 + 댓글) / 조회수 X 100 (규모별 평균)

5000이하 : 12.69593042
5000 이상 10000 이하 : 8.40565528
10000 이상 50000 이하 : 7.35114556
50000 이상 100000 이하 : 5.59611680
10만 이상 : 4.97142433

쿼리

SELECT avg(score) FROM(
SELECT ui.profile_subscribers,(uvi.video_likes+uvi.video_comments)/uvi.video_views*100 AS score,ui.profile_id FROM hifen.utube_video_info AS uvi 
INNER JOIN hifen.utuber_info AS ui 
ON uvi.video_channelID = ui.profile_id 
GROUP BY ui.profile_id HAVING profile_subscribers > 5000 and profile_subscribers<=10000 ORDER BY profile_subscribers DESC) SUB_QUERY;
