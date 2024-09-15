select 
cltr_mnmt_no
,ldnm_adrs
,info
,jibun
,many_addr_yn
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
,jimok
,area
,reg_date
,concat('늘 민원처리 해주시느라 고생 많으십니다. 
',ldnm_adrs,'번지에 대해 궁금한 점이 있어 문의 드립니다.

1. 다음 지번이 보상 혹은 매수청구 대상이 되는 토지인지 알고 싶습니다.
(',info,')

2. 매수대상이라면 관련 예산이 대략적으로 어느 정도 책정되는지와
   이미 보상된 건을 제외하고 신청되어 있는 대기건수가 얼마인지 궁금합니다.

3. 매수대상이 맞다면 해당 필지를 지금 보상 신청하게 될 경우 언제 보상받을 수 있는지
   대략적인 보상 시기가 궁금합니다.

4. 해당 필지에 공익사업이 진행되고 있거나 이미 진행되었다면
   결정고시 및 실시계획인가고시문의 파일을 받아보고 싶습니다.
   만약 파일이 존재하지 않는다면, 고시된 일자를 알고 싶습니다.
   (만약 해당 필지에 공익사업이 2번 이상 시행되었다면, 모든 결정고시일을 알고 싶습니다.)

5. 해당 필지가 이미 공익사업이 진행되었던 미지급/미보상용지라면
   당시 필지가 편입되었던 토지편입조서 파일을 받아보고 싶습니다.

6. 만약 해당 필지에 공익사업(도시계획시설 등)이 계획되어 있다면
   해당 공익사업의 집행계획 단계 및 시행예정 년도가 궁금합니다.

7. 위 필지에 대해 기존 소유자의 기부채납 등의 무상제공이 있었는지 궁금합니다.
   또한 해당 필지가 공익사업을 위해 분할되었을 경우 분할된 사유와 분할되기 전 토지의 형상을 알고 싶습니다.

8. 위 필지에 이미 공익사업 등으로 보상금이 지급되었다면 공탁 여부가 궁금합니다.

9. 위 필지가 도로인 경우 도로지정 공고가 난 필지인지 궁금합니다.

10. 해당 필지가 공익사업 등에 일부만 저촉되어 있을 경우 저촉부분만 보상 대상인지 궁금합니다.

11. 위 필지에 대한 정보공개청구 등 민원신청 건수가 궁금합니다. 

늘 민원에 응대해주셔서 감사합니다.
오늘도 좋은 하루 되세요 ^^') as info_open
from(
select
ldnm_adrs
,left(concat(교통시설_도로저촉, 교통시설_도로접합,교통시설_교통광장,교통시설_항만,교통시설_주차장,교통시설_자동차정류장,교통시설_궤도,교통시설_삭도,교통시설_운하,교통시설_검사시설,교통시설_운전학원,교통시설_공항,공간시설_광장,공간시설_공원,공간시설_녹지,공간시설_유원지,공간시설_공공공지,유통공급시설_유통업무설비,유통공급시설_수도공급설비,유통공급시설_전기공급설비,유통공급시설_가스공급설비,유통공급시설_열공급설비,유통공급시설_방송시설,유통공급시설_통신시설,유통공급시설_공동구,공공문화체육시설_학교,공공문화체육시설_운동장,공공문화체육시설_공공청사,공공문화체육시설_문화시설,공공문화체육시설_체육시설,공공문화체육시설_연구시설,공공문화체육시설_공공직업훈련시설,공공문화체육시설_도서관,공공문화체육시설_사회복지시설,공공문화체육시설_청소년수련시설,방재시설_하천,방재시설_유수지,방재시설_저수지,방재시설_방화설비,방재시설_방풍설비,방재시설_방수설비,방재시설_사방설비,방재시설_방조설비,보건위생시설_화장시설,보건위생시설_공동묘지,보건위생시설_봉안시설,보건위생시설_자연장지,보건위생시설_도축장,보건위생시설_장례식장,보건위생시설_종합의료시설,환경기초시설_하수도,환경기초시설_폐기물처리시설,환경기초시설_수질오염방지시설,환경기초시설_폐차장, 지구단위계획, 개발행위허가제한지역, 도로구역, 정비구역, 마을정비구역, 공공주택지구, 도시개발구역, 개발예정지구, 재개발구역, 재정비촉진지구, 산업단지, 농공단지, 농업생산기반정비사업지역, 국립공원, 국가지정문화재구역, 시도지정문화재구역, 택지개발지구, 주거환경개선지구, 백두대간보호지역, 수원함양보호구역, 보안림, 자연재해위험개선지구, 군사기지및군사시설기타, 공공지원민간임대주택, 토지거래허가구역, 도시관리계획입안중, 등록사항정정대상), char_length(concat(교통시설_도로저촉,교통시설_도로접합,교통시설_교통광장,교통시설_항만,교통시설_주차장,교통시설_자동차정류장,교통시설_궤도,교통시설_삭도,교통시설_운하,교통시설_검사시설,교통시설_운전학원,교통시설_공항,공간시설_광장,공간시설_공원,공간시설_녹지,공간시설_유원지,공간시설_공공공지,유통공급시설_유통업무설비,유통공급시설_수도공급설비,유통공급시설_전기공급설비,유통공급시설_가스공급설비,유통공급시설_열공급설비,유통공급시설_방송시설,유통공급시설_통신시설,유통공급시설_공동구,공공문화체육시설_학교,공공문화체육시설_운동장,공공문화체육시설_공공청사,공공문화체육시설_문화시설,공공문화체육시설_체육시설,공공문화체육시설_연구시설,공공문화체육시설_공공직업훈련시설,공공문화체육시설_도서관,공공문화체육시설_사회복지시설,공공문화체육시설_청소년수련시설,방재시설_하천,방재시설_유수지,방재시설_저수지,방재시설_방화설비,방재시설_방풍설비,방재시설_방수설비,방재시설_사방설비,방재시설_방조설비,보건위생시설_화장시설,보건위생시설_공동묘지,보건위생시설_봉안시설,보건위생시설_자연장지,보건위생시설_도축장,보건위생시설_장례식장,보건위생시설_종합의료시설,환경기초시설_하수도,환경기초시설_폐기물처리시설,환경기초시설_수질오염방지시설,환경기초시설_폐차장, 지구단위계획, 개발행위허가제한지역, 도로구역, 정비구역, 마을정비구역, 공공주택지구, 도시개발구역, 개발예정지구, 재개발구역, 재정비촉진지구, 산업단지, 농공단지, 농업생산기반정비사업지역, 국립공원, 국가지정문화재구역, 시도지정문화재구역, 택지개발지구, 주거환경개선지구, 백두대간보호지역, 수원함양보호구역, 보안림, 자연재해위험개선지구, 군사기지및군사시설기타, 공공지원민간임대주택, 토지거래허가구역, 도시관리계획입안중, 등록사항정정대상))-2) as info
,jibun
--,"50퍼센트이상저감"
,cltr_mnmt_no
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
	case when ((c.loca1 like '%소로%' or c.loca1 like '%중로%' or c.loca1 like '%대로%' or c.loca1 like '%광로%' or c.loca1 like '%도로%') and c.loca1 not like '%접합%') then '도시계획시설(도로) 저촉, ' end as 교통시설_도로저촉
	, 	case when ((c.loca1 like '%소로%' or c.loca1 like '%중로%' or c.loca1 like '%대로%' or c.loca1 like '%광로%' or c.loca1 like '%도로%') and c.loca1 like '%접합%') then '도시계획시설(도로) 접합, ' end as 교통시설_도로접합
	, case when (c.loca1 like '%교통광장%') then '도시계획시설(교통광장), ' end as 교통시설_교통광장
	, case when (c.loca1 like '%항만%') then '도시계획시설(항만), ' end as 교통시설_항만
	, case when (c.loca1 like '%주차장%') then '도시계획시설(주차장), ' end as 교통시설_주차장
	, case when (c.loca1 like '%자동차정류장%') then '도시계획시설(자동차정류장), ' end as 교통시설_자동차정류장
	, case when (c.loca1 like '%궤도%') then '도시계획시설(궤도), ' end as 교통시설_궤도
	, case when (c.loca1 like '%삭도%') then '도시계획시설(삭도), ' end as 교통시설_삭도
	, case when (c.loca1 like '%운하%') then '도시계획시설(운하), ' end as 교통시설_운하
	, case when (c.loca1 like '%검사시설%') then '도시계획시설(검사시설), ' end as 교통시설_검사시설
	, case when (c.loca1 like '%운전학원%') then '도시계획시설(운전학원), ' end as 교통시설_운전학원
	, case when (c.loca1 like '%공항%' and c.loca1 not like '%공항고도제한%' and c.loca1 not like '%중요시설물보호지구%') then '도시계획시설(공항), ' end as 교통시설_공항
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
	, case when c.loca1 like '%지구단위계획%' then '지구단위계획, ' end as 지구단위계획
	, case when c.loca1 like '%개발행위허가제한지역%' then '개발행위허가제한지역, ' end as 개발행위허가제한지역
	, case when c.loca2 like '%도로구역%' and c.loca2 like '%<도로법>%' then '도로구역, ' end as 도로구역  
	, case when (c.loca2 like '%정비구역%' and c.loca2 not like '%마을정비구역%') then '정비구역, ' end as 정비구역
	, case when (c.loca2 like '%마을정비구역%' and c.loca2 not like '%정비구역%') then '마을정비구역, ' end as 마을정비구역
	, case when c.loca2 like '%공공주택지구%' then '공공주택지구, ' end as 공공주택지구  
	, case when c.loca2 like '%도시개발구역%' then '도시개발구역, ' end as 도시개발구역  
	, case when c.loca2 like '%개발예정지구%' then '개발예정지구, ' end as 개발예정지구  
	, case when c.loca2 like '%재개발구역%' then '재개발구역, ' end as 재개발구역
	, case when c.loca2 like '%재정비촉진지구%' then '재정비촉진지구, ' end as 재정비촉진지구
	, case when c.loca2 like '%산업단지%' then '산업단지, ' end as 산업단지
	, case when c.loca2 like '%농공단지%' then '농공단지, ' end as 농공단지
	, case when c.loca2 like '%농업생산기반 정비사업지역%' then '농업생산기반 정비사업지역, ' end as 농업생산기반정비사업지역
	, case when c.loca2 like '%국립공원%' then '국립공원, ' end as 국립공원
	, case when c.loca2 like '%국가지정문화재구역%' then '국가지정문화재구역, ' end as 국가지정문화재구역
	, case when c.loca2 like '%시도지정문화재구역%' then '시도지정문화재구역, ' end as 시도지정문화재구역
	, case when c.loca2 like '%택지개발지구%' then '택지개발지구, ' end as 택지개발지구
	, case when c.loca2 like '%주거환경개선지구%' then '주거환경개선지구, ' end as 주거환경개선지구	
	, case when c.loca2 like '%백두대간보호지역%' then '백두대간보호지역, ' end as 백두대간보호지역	
	, case when c.loca2 like '%수원함양보호구역%' then '수원함양보호구역, ' end as 수원함양보호구역	
	, case when c.loca2 like '%보안림%' then '보안림, ' end as 보안림	
	, case when c.loca2 like '%자연재해위험개선지구%' then '자연재해위험개선지구, ' end as 자연재해위험개선지구	
	, case when c.loca2 like '%군사기지 및 군사시설기타%' then '군사기지 및 군사시설기타, ' end as 군사기지및군사시설기타	
	, case when c.loca2 like '%공공지원민간임대주택%' then '공공지원민간임대주택, ' end as 공공지원민간임대주택   
	, case when c.loca3 like '%토지거래%' then '토지거래허가구역, ' end as 토지거래허가구역
	, case when (c.loca3 like '%도시관리계획 입안중%' or c.loca3 like '%도시관리계획입안중%') then '도시관리계획 입안중, ' end as 도시관리계획입안중
	, case when c.loca3 like '%등록사항 정정대상%' then '등록사항 정정대상, ' end as 등록사항정정대상
	, case when goods_nm like '%지분%' then 'Y' end as jibun
--	, case when cast(substring(c.fee_rate,1, char_length(c.fee_rate)-1) as integer) <= 50 then 'Y' end as "50퍼센트이상저감"
	, *
	from courtauctioninfoextract c
) A
where concat(교통시설_도로저촉,교통시설_도로접합,교통시설_교통광장,교통시설_항만,교통시설_주차장,교통시설_자동차정류장,교통시설_궤도,교통시설_삭도,교통시설_운하,교통시설_검사시설,교통시설_운전학원,교통시설_공항,공간시설_광장,공간시설_공원,공간시설_녹지,공간시설_유원지,공간시설_공공공지,유통공급시설_유통업무설비,유통공급시설_수도공급설비,유통공급시설_전기공급설비,유통공급시설_가스공급설비,유통공급시설_열공급설비,유통공급시설_방송시설,유통공급시설_통신시설,유통공급시설_공동구,공공문화체육시설_학교,공공문화체육시설_운동장,공공문화체육시설_공공청사,공공문화체육시설_문화시설,공공문화체육시설_체육시설,공공문화체육시설_연구시설,공공문화체육시설_공공직업훈련시설,공공문화체육시설_도서관,공공문화체육시설_사회복지시설,공공문화체육시설_청소년수련시설,방재시설_하천,방재시설_유수지,방재시설_저수지,방재시설_방화설비,방재시설_방풍설비,방재시설_방수설비,방재시설_사방설비,방재시설_방조설비,보건위생시설_화장시설,보건위생시설_공동묘지,보건위생시설_봉안시설,보건위생시설_자연장지,보건위생시설_도축장,보건위생시설_장례식장,보건위생시설_종합의료시설,환경기초시설_하수도,환경기초시설_폐기물처리시설,환경기초시설_수질오염방지시설,환경기초시설_폐차장,도로구역,지구단위계획,정비구역,공공주택지구,도시개발구역,개발행위허가제한지역) <> ''
and reg_date >= '20240815'
and min_bid_prc < 2000000000
and min_bid_prc > 1000000000
and apsl_ases_avg_amt > 300000000
and ldnm_adrs like '%경기%'
)AA
order by min_bid_prc desc, info, reg_date desc
