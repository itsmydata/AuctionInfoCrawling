select distinct aa.loca1
from
(select
cltr_mnmt_no
,ldnm_adrs
,loca1
,loca2
,loca3
,토지거래허가구역
,지분
,ctgr_full_nm
,pbct_begn_dtm
,pbct_cls_dtm
,pbct_cltr_stat_nm
,uscbd_cnt
,iqry_cnt
,goods_nm
,bid_mtd_nm
,min_bid_prc
,fee_rate
,apsl_ases_avg_amt
,many_addr_yn
,jimok
,area
,reg_date
from(
	select
	-- 도시계획시설 교통시설
	case when ((c.loca1 like '%소로%' or c.loca1 like '%중로%' or c.loca1 like '%대로%' or c.loca1 like '%광로%' or c.loca1 like '%도로%') and c.loca1 not like '%접합%') then '도시계획시설(도로), ' end as 교통시설_도로
	, case when (c.loca1 like '%교통광장%') then '도시계획시설(교통광장), ' end as 교통시설_교통광장
	, case when (c.loca1 like '%항만%') then '도시계획시설(항만), ' end as 교통시설_항만
	, case when (c.loca1 like '%주차장%') then '도시계획시설(주차장), ' end as 교통시설_주차장
	, case when (c.loca1 like '%자동차정류장%') then '도시계획시설(자동차정류장), ' end as 교통시설_자동차정류장
	, case when (c.loca1 like '%궤도%') then '도시계획시설(궤도), ' end as 교통시설_궤도
	, case when (c.loca1 like '%삭도%') then '도시계획시설(삭도), ' end as 교통시설_삭도
	, case when (c.loca1 like '%운하%') then '도시계획시설(운하), ' end as 교통시설_운하
	, case when (c.loca1 like '%검사시설%') then '도시계획시설(검사시설), ' end as 교통시설_검사시설
	, case when (c.loca1 like '%운전학원%') then '도시계획시설(운전학원), ' end as 교통시설_운전학원
	-- 도시계획시설 공간시설
	, case when (c.loca1 like '%광장%' and c.loca1 not like '%교통광장%') then '도시계획시설(광장), ' end as 공간시설_광장
	, case when (c.loca1 like '%공원%' and c.loca1 not like '%도시자연공원구역%') then '도시계획시설(공원), ' end as 공간시설_공원
	, case when ((c.loca1 like '%완충녹지%' or c.loca1 like '%연결녹지%' or c.loca1 like '%경관녹지%')) then '도시계획시설(녹지), ' end as 공간시설_녹지
	, case when (c.loca1 like '%유원지%') then '도시계획시설(유원지), ' end as 공간시설_유원지
	, case when (c.loca1 like '%공공공지%') then '도시계획시설(공공공지), ' end as 공간시설_공공공지
	-- 도시계획시설 유통공급시설
	, case when (c.loca1 like '%유통업무설비%') then '도시계획시설(유통업무설비), ' end as 유통공급시설_유통업무설비
	, case when (c.loca1 like '%수도공급설비%') then '도시계획시설(수도공급설비), ' end as 유통공급시설_수도공급설비
	, case when (c.loca1 like '%전기공급설비%') then '도시계획시설(전기공급설비), ' end as 유통공급시설_전기공급설비
	, case when (c.loca1 like '%기타수도시설%') then '도시계획시설(기타수도시설), ' end as 유통공급시설_기타수도시설
	, case when (c.loca1 like '%가스공급설비%') then '도시계획시설(가스공급설비), ' end as 유통공급시설_가스공급설비
	, case when (c.loca1 like '%열공급설비%') then '도시계획시설(열공급설비), ' end as 유통공급시설_열공급설비
	, case when (c.loca1 like '%방송시설%') then '도시계획시설(방송시설), ' end as 유통공급시설_방송시설
	, case when (c.loca1 like '%통신시설%') then '도시계획시설(통신시설), ' end as 유통공급시설_통신시설
	, case when (c.loca1 like '%공동구%') then '도시계획시설(공동구), ' end as 유통공급시설_공동구
	-- 도시계획시설 공공문화체육시설
	, case when (c.loca1 like '%학교%') then '도시계획시설(학교), ' end as 공공문화체육시설_학교
	, case when (c.loca1 like '%기타공원시설%') then '기타공원시설, ' end as 공공문화체육시설_기타공원시설
	, case when (c.loca1 like '%운동장%') then '도시계획시설(운동장), ' end as 공공문화체육시설_운동장
	, case when (c.loca1 like '%공공청사%') then '도시계획시설(공공청사), ' end as 공공문화체육시설_공공청사
	, case when (c.loca1 like '%문화시설%') then '도시계획시설(문화시설), ' end as 공공문화체육시설_문화시설
	, case when (c.loca1 like '%체육시설%') then '도시계획시설(체육시설), ' end as 공공문화체육시설_체육시설
	, case when (c.loca1 like '%연구시설%') then '도시계획시설(연구시설), ' end as 공공문화체육시설_연구시설
	, case when (c.loca1 like '%공공직업훈련시설%') then '도시계획시설(공공직업훈련시설), ' end as 공공문화체육시설_공공직업훈련시설
	, case when (c.loca1 like '%도서관%') then '도시계획시설(도서관), ' end as 공공문화체육시설_도서관
	, case when (c.loca1 like '%사회복지시설%') then '도시계획시설(사회복지시설), ' end as 공공문화체육시설_사회복지시설
	, case when (c.loca1 like '%청소년수련시설%') then '도시계획시설(청소년수련시설), ' end as 공공문화체육시설_청소년수련시설
	-- 도시계획시설 방재시설
	, case when (c.loca1 like '%하천%' and c.loca1 not like '%하천구역%') then '도시계획시설(하천), ' end as 방재시설_하천
	, case when (c.loca1 like '%유수지%') then '도시계획시설(유수지), ' end as 방재시설_유수지
	, case when (c.loca1 like '%저수지%') then '도시계획시설(저수지), ' end as 방재시설_저수지
	, case when (c.loca1 like '%방화설비%') then '도시계획시설(방화설비), ' end as 방재시설_방화설비
	, case when (c.loca1 like '%방풍설비%') then '도시계획시설(방풍설비), ' end as 방재시설_방풍설비
	, case when (c.loca1 like '%방수설비%') then '도시계획시설(방수설비), ' end as 방재시설_방수설비
	, case when (c.loca1 like '%사방설비%') then '도시계획시설(사방설비), ' end as 방재시설_사방설비
	, case when (c.loca1 like '%방조설비%') then '도시계획시설(방조설비), ' end as 방재시설_방조설비
	-- 도시계획시설 보건위생시설
	, case when (c.loca1 like '%화장시설%') then '도시계획시설(화장시설), ' end as 보건위생시설_화장시설
	, case when (c.loca1 like '%공동묘지%') then '도시계획시설(공동묘지), ' end as 보건위생시설_공동묘지
	, case when (c.loca1 like '%봉안시설%') then '도시계획시설(봉안시설), ' end as 보건위생시설_봉안시설
	, case when (c.loca1 like '%자연장지%') then '도시계획시설(자연장지), ' end as 보건위생시설_자연장지
	, case when (c.loca1 like '%도축장%') then '도시계획시설(도축장), ' end as 보건위생시설_도축장
	, case when (c.loca1 like '%장례식장%') then '도시계획시설(장례식장), ' end as 보건위생시설_장례식장
	, case when (c.loca1 like '%종합의료시설%') then '도시계획시설(종합의료시설), ' end as 보건위생시설_종합의료시설
	-- 도시계획시설 환경기초시설
	, case when (c.loca1 like '%하수도%') then '도시계획시설(하수도), ' end as 환경기초시설_하수도
	, case when (c.loca1 like '%폐기물처리시설%') then '도시계획시설(폐기물처리시설), ' end as 환경기초시설_폐기물처리시설
	, case when (c.loca1 like '%수질오염방지시설%') then '도시계획시설(수질오염방지시설), ' end as 환경기초시설_수질오염방지시설
	, case when (c.loca1 like '%폐차장%') then '도시계획시설(폐차장), ' end as 환경기초시설_폐차장
	-- 도시계획시설 외
	, case when c.loca2 like '%도로구역%' and c.loca2 like '%<도로법>%' then '도로구역, ' end as 도로구역  
	, case when c.loca1 like '%지구단위계획%' then '지구단위계획, ' end as 지구단위계획
	, case when c.loca2 like '%정비구역%' then '정비구역, ' end as 정비구역
	, case when c.loca2 like '%공공주택지구%' then '공공주택지구, ' end as 공공주택지구  
	, case when c.loca2 like '%도시개발구역%' then '도시개발구역, ' end as 도시개발구역  
	, case when c.loca2 like '%공공지원민간임대주택%' then '공공지원민간임대주택, ' end as 공공지원민간임대주택   
	, case when c.loca1 like '%개발행위허가제한지역%' then '개발행위허가제한지역, ' end as 개발행위허가제한지역
	, case when c.loca3 like '%토지거래%' then 'Y' end as 토지거래허가구역
	, case when goods_nm like '%지분%' then 'Y' end as 지분
--	, case when cast(substring(c.fee_rate,1, char_length(c.fee_rate)-1) as integer) <= 50 then 'Y' end as "50퍼센트이상저감"
	, *
	from courtauctioninfoextract c
) A
where concat(교통시설_도로,교통시설_교통광장,교통시설_항만,교통시설_주차장,교통시설_자동차정류장,교통시설_궤도,교통시설_삭도,교통시설_운하,교통시설_검사시설,교통시설_운전학원,공간시설_광장,공간시설_공원,공간시설_녹지,공간시설_유원지,공간시설_공공공지,유통공급시설_유통업무설비,유통공급시설_수도공급설비,유통공급시설_전기공급설비,유통공급시설_가스공급설비,유통공급시설_열공급설비,유통공급시설_방송시설,유통공급시설_통신시설,유통공급시설_공동구,공공문화체육시설_학교,공공문화체육시설_운동장,공공문화체육시설_공공청사,공공문화체육시설_문화시설,공공문화체육시설_체육시설,공공문화체육시설_연구시설,공공문화체육시설_공공직업훈련시설,공공문화체육시설_도서관,공공문화체육시설_사회복지시설,공공문화체육시설_청소년수련시설,방재시설_하천,방재시설_유수지,방재시설_저수지,방재시설_방화설비,방재시설_방풍설비,방재시설_방수설비,방재시설_사방설비,방재시설_방조설비,보건위생시설_화장시설,보건위생시설_공동묘지,보건위생시설_봉안시설,보건위생시설_자연장지,보건위생시설_도축장,보건위생시설_장례식장,보건위생시설_종합의료시설,환경기초시설_하수도,환경기초시설_폐기물처리시설,환경기초시설_수질오염방지시설,환경기초시설_폐차장,도로구역,지구단위계획,정비구역,공공주택지구,도시개발구역,개발행위허가제한지역) = ''
and min_bid_prc < 200000000
)aa
order by loca1