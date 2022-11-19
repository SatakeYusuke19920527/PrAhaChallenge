-- 各月の集計を出すクエリ
select
    sum(OD.amount*PE.price) as 支払い金額,
    DATE_FORMAT(O.order_date, '%Y-%m') as 各月の集計金額
from 
	OrderDetails as OD
inner join 
	sushi.Order as O
on
	OD.od_id = O.od_id
inner join 
	Product as PT
on
	OD.p_id = PT.p_id	
inner join 
	Price as PE
on
	PT.price_id = PE.price_id
group by
  	O.order_date

-- 11月に売れた商品の注文数量を算出するクエリ
select 
	 PT.p_name as 商品名,
	sum(OD.amount) as 売り上げ個数
from 
	sushi.OrderDetails as OD
inner join 
	sushi.Order as O
on
	OD.od_id = O.od_id	
inner join 
	Product as PT
on
	OD.p_id = PT.p_id
inner join 
	Price as PE
on
	PT.price_id = PE.price_id
where
	O.order_date BETWEEN '2022/11/01 00:00:00' AND '2022/11/30 23:59:59'
group by
	 PT.p_name