USE stock_market_analysis;

-- Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. (This has to be done for all 6 stocks) 


create table bajaj1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM stock_market_analysis.`bajaj auto`;

select* from bajaj1;


create table eicher1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM stock_market_analysis.`eicher motors`;

select* from eicher1;


create table hero1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM stock_market_analysis.`hero motocorp`;

select* from hero1;


create table infosys1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM stock_market_analysis.`infosys`;

select* from infosys1;


create table tcs1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM stock_market_analysis.`tcs`;

select* from tcs1;

create table tvs1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM stock_market_analysis.`tvs motors`;

select* from tvs1;

-- -- Creating master_table containing the date and close price of all the six stocks

create table master_table as 

select b.date as `Date`, 
b.`Close Price` as `Bajaj`, 
tc.`Close Price` as `TCS`,
tv.`Close Price` as `TVS`,
i.`Close Price` as `Infosys`,
e.`Close Price` as `Eicher`,
h.`Close Price` as `Hero`

from bajaj1 b 

inner join tcs1 tc on tc.date = b.date
inner join tvs1 tv on tv.date = tc.date
inner join infosys1 i on i.date = tv.date
inner join eicher1 e on e.date = i.date
inner join hero1 h on h.date = e.date;

select* from master_table;


-- Use the table created in Part(1) to generate buy and sell signal. 
-- Store this in another table named 'bajaj2'. Perform this operation for all stocks.

create table bajaj2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM stock_market_analysis.bajaj1;


select* from bajaj2;


create table eicher2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM stock_market_analysis.eicher1;


select* from eicher2;


create table hero2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM stock_market_analysis.hero1;


select* from hero2;


create table infosys2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM stock_market_analysis.infosys1;


select* from infosys2;


create table tcs2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM stock_market_analysis.tcs1;


select* from tcs2;


create table tvs2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM stock_market_analysis.tvs1;

select* from tvs2;


-- Create a User defined function, 
-- that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.

DROP function IF EXISTS stock_market_analysis.signalForTheDay;

delimiter $$
create function signalForTheDay ( given_date varchar(10) )
returns varchar(4)
deterministic
begin
declare signal_value varchar(4);
select `Signal` into signal_value from bajaj2 where date=STR_TO_DATE(given_date, "%Y-%m-%d");
return signal_value;
end$$ 
delimiter ;


-- Checking the buy/Sell signal for some dates.

select signalForTheDay('2015-12-11') as `Signal`; -- SELL
select signalForTheDay('2015-05-20') as `Signal`; -- HOLD
select signalForTheDay('2015-08-24') as `Signal`; -- SELL
select signalForTheDay('2015-10-19') as `Signal`; -- BUY
select signalForTheDay('2018-04-24') as `Signal`; -- HOLD
select signalForTheDay('2018-05-09') as `Signal`; -- HOLD



-- For analysis and summary


-- min and max close price and percentage change
select min(bajaj) as bajaj_min, max(bajaj) as bajaj_max,
       100*(max(bajaj)-min(bajaj))/min(bajaj) as percent_change_bajaj,
       
       min(eicher) as eicher_min, max(eicher) as eicher_max,
       100*(max(eicher)-min(eicher))/min(eicher) as percent_change_eicher,
       
       min(hero) as hero_min, max(hero) as hero_max,
       100*(max(hero)-min(hero))/min(hero) as percent_change_hero,
       
       min(infosys) as infosys_min, max(infosys) as infosys_max,
       100*(max(infosys)-min(infosys))/min(infosys) as percent_change_infosys,
       
       min(tcs) as tcs_min, max(tcs) as tcs_max,
       100*(max(tcs)-min(tcs))/min(tcs) as percent_change_tcs,
       
       min(tvs) as tvs_min, max(tvs) as tvs_max,
       100*(max(tvs)-min(tvs))/min(tvs) as percent_change_tvs
       
from master_table;



-- Dayname and signal Analysis

select dayname(Date) as DayName,`Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
from bajaj1;

-- checked for all the six stocks by replacing the table names.
















































