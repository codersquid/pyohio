#!/bin/bash -e

ALL_PROPOSALS=`psql -d pyohio2016 -c 'select id from proposals_proposalbase where id in (select proposalbase_ptr_id from proposals_tutorialproposal) order by submitted desc;' -t`

for id in $ALL_PROPOSALS
do

    /usr/bin/curl "http://www.pyohio.org/reviews/review/$id/" \
    -H 'Origin: http://www.pyohio.org' \
    -H 'Accept-Language: en-US,en;q=0.8' \
    -H 'User-Agent: Mozilla/5.0 (X11; CrOS x86_64 6812.88.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.153 Safari/537.36' \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'Cache-Control: no-cache' \
    -H 'Referer: http://www.pyohio.org/reviews/review/226/' \
    -H 'Cookie: PYOHIO2015=kbh9mnbanx4698l7w66t1x77616awv3d; csrftoken=xNr8YibBoXzbFRiTzCQ5zJ5L1NC5F4RQ' \
    -H 'Connection: keep-alive' \
    -H 'DNT: 1' \
    --data 'csrfmiddlewaretoken=xNr8YibBoXzbFRiTzCQ5zJ5L1NC5F4RQ&result_submit=standby' \
    --compressed \

done;

echo "All done!"
