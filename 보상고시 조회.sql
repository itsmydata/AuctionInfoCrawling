select type, * from bosanggosiinfo b 
where gigwan_nm is not null
and reg_date >= '20231026'
and title not like '%공시송달%'
and title not like '%군계획시설%'
and title not like '%도시계획%'
and title not like '%공유수면%'
and title not like '%사회조사%'
and title not like '%도시개발%'
and title not like '%지적재조사%'
and title not like '%변경%'
and title not like '%견적%'
--and type = '실시계획'
--(
--title not like '%취소%'
--and type = '실시계획'
--) or
--order by reg_date desc, type, gigwan_nm
order by type, gigwan_nm, reg_date desc