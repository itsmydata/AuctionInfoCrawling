/*지분물건*/
SELECT '지분' as landinfo
, *
from courtauctioninfoextract c
where goods_nm like '%지분%'
union all
/*도시계획시설 도로&도로법상 도로구역*/
SELECT '도로' as landinfo
--, cast(replace(area,' ㎡','') as float) numArea
, *
from courtauctioninfoextract c
where (((c.loca1 like '%소로%' or c.loca1 like '%중로%' or c.loca1 like '%대로%' or c.loca1 like '%광로%') and c.loca1 not like '%접합%')
or c.loca2 like '%도로구역%')
--and min_bid_prc < 200000000
--and ldnm_adrs like '%안창리%'
--and cast(replace(area,' ㎡',null) as numeric) >1000
union all
/*도시계획시설 근린공원*/
SELECT '근린공원' as landinfo
, *
from courtauctioninfoextract c
where c.loca1 like '%근린공원%'
and c.loca1 not like '%접합%'
union all
/*지구단위계획*/
SELECT '지구단위계획' as landinfo
, *
from courtauctioninfoextract c
where c.loca1 like '%지구단위계획%'
union all
/*정비구역*/
SELECT *
from courtauctioninfoextract c
where c.loca2 like '%정비구역%'

/*공공주택지구&도시개발구역*/
SELECT *
from courtauctioninfoextract c
where c.loca2 like '%공공주택지구%'
or c.loca2 like '%도시개발구역%'

/*수도공급설비*/
SELECT *
from courtauctioninfoextract c
where c.loca1 like '%수도공급설비%'

/*개발행위허가제한지역*/
SELECT *
from courtauctioninfoextract c
where c.loca1 like '%개발행위허가제한지역%'

/*토지거래허가구역*/
SELECT *
from courtauctioninfoextract c
where c.loca3 like '%토지거래계약에관한허가구역%'

/*50% 이상 저감물건*/
SELECT *
from courtauctioninfoextract c
where 