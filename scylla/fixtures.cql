CREATE KEYSPACE IF NOT EXISTS conduit WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy','DC1' : 3};

use conduit;

CREATE TABLE IF NOT EXISTS notice_by_id (
                                          conduit_id uuid,
                                          notice_url text,
                                          PRIMARY KEY(conduit_id)) WITH COMPRESSION = {'sstable_compression': 'SnappyCompressor'};


INSERT INTO notice_by_id ("conduit_id", "notice_url") VALUES (862c10df-2d73-4dde-a0ba-035622a58b09, 'https://springserve.com/notice/id=1');
INSERT INTO notice_by_id ("conduit_id", "notice_url") VALUES (6365b56a-5daa-48ee-8c2b-e78b9d0ff6f0, 'https://springserve.com/notice/id=2');
INSERT INTO notice_by_id ("conduit_id", "notice_url") VALUES (7243621c-bb99-40e5-a2d5-1c0fc048718c, 'https://springserve.com/notice/id=3');
INSERT INTO notice_by_id ("conduit_id", "notice_url") VALUES (6f70c68a-d568-4b97-8848-f9ab39e69305, 'https://springserve.com/notice/id=4');
INSERT INTO notice_by_id ("conduit_id", "notice_url") VALUES (3ff8067b-eec5-49c6-9464-4ee37d7b7323, 'https://springserve.com/notice/id=5');

ALTER KEYSPACE system_auth WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'DC1' : 3 };

CREATE KEYSPACE IF NOT EXISTS bidbucket WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy','DC1' : 3};
use bidbucket;
CREATE TABLE IF NOT EXISTS expired_bids_range(
                                               ts timestamp,
                                               bucket int,
                                               bid_id text,
                                               PRIMARY KEY ((ts,bucket), bid_id)
) WITH COMMENT = 'get expired bids by time range + bucket'
   AND default_time_to_live = 1800;
