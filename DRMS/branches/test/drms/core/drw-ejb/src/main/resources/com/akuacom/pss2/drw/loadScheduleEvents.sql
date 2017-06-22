SELECT startTime,issueTime,CAST(startTime AS CHAR) startTimeStr,estimatedEndTime,actualEndTime, eventlocations,IF(endtime IS NOT NULL, CAST(endTime AS CHAR), 'TBD') AS endtime , 
 CAST(MD5(CONCAT(CAST(startTime AS CHAR),IF(endtime IS NOT NULL, CAST(endTime AS CHAR),'TBD'))) AS CHAR)eventKey 
 FROM ( 
 SELECT e.startTime startTime,e.issuedTime issueTime,estimatedEndTime,actualEndTime, GROUP_CONCAT(event_detail.uuid) eventlocations 
 , 
 IF(actualEndTime IS NOT NULL,actualEndTime, estimatedEndTime) AS endtime  
 FROM  
 event_detail INNER JOIN event e 
 ON e.uuid=event_detail.event_uuid 
 WHERE startTime > NOW() 
 AND programName=${pram_programName}  AND product IN ${pram_products} 
 GROUP BY startTime,estimatedEndTime,actualEndTime 
 ) temp 
 