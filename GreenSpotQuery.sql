Select * From Product;
Select * From Orders;
Select * From Stock;
Select * From Sales;

-- Look up the price of each product unit.
select Item_Number, Description, unit, price
from product a
inner join sales b
on a.Item_Number = b.ItemNumSale
group by item_number, price order by price;

-- Look up total product in stock.
select Item_Number, Description, unit, location, 
	sum(QuantityOnHand) as TotalOnHand
from product a
inner join stock b
on a.Item_Number = b.ItemNumStock
group by Item_Number order by TotalOnHand;

-- Look up total cost of purchased orders organized by date
select Item_Number, Description, Vendor, Unit,
	PurchDate, sum(Quantity*Cost) as TotalCost
from product a
inner join orders b
on a.Item_Number = b.ItemNumOrder
group by Item_Number, Description, Vendor, PurchDate
order by PurchDate;