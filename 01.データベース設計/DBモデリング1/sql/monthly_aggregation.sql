-- 各月の集計を出すクエリ
select 
	 sum(OD.amount*PE.price) as 支払い金額,
    DATE_FORMAT(OH.order_date, '%Y-%m') as 各月の集計金額
from 
	OrderDetails as OD
inner join 
	OrderHistory as OH
on
	OD.od_id = OH.od_id
inner join 
	Product as PT
on
	OD.p_id = PT.p_id	
inner join 
	Price as PE
on
	PT.price_id = PE.price_id
group by
  	OH.order_date