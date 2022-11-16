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

-- 9月に売れた寿司ネタを算出するクエリ
select 
	PT.p_name as 商品名,
	sum(OD.amount) as 売り上げ個数
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
where
	PT.pt_id = 5 and OH.order_date BETWEEN '2022/09/01 00:00:00' AND '2022/09/30 23:59:59'
group by
	 PT.p_name