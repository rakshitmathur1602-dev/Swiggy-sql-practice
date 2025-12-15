create database swiggy ;
 use swiggy ;
select * from restaurants ;

-- 1.  Which restaurant of abohar is visied by least number of people? 
select min(rating_count) from restaurants  where city = 'abohar' ;
select* from restaurants  where city ='abohar' and 
rating_count =(select min(rating_count) from restaurants  where city = 'abohar');

# 2.  Which restaurant has generated maximum revenue all over india?
select  max(cost*rating_count) as revenue from restaurants ;
select * from restaurants
 where  (cost*rating_count) = (select  max(cost*rating_count) as revenue from restaurants);
 
 # 3.How many restaurants are having rating more than the average rating?
 select avg(rating) from restaurants ;
 select count(*) from restaurants where rating > ( select avg(rating) from restaurants );
 
 
-- this is for 2nd highest revenue  
 select *, (cost*rating_count) as revenue from restaurants where
 cost*rating_count <(select max(cost*rating_count) as revenue from restaurants) 
 order by revenue desc limit 1  ;
 
 # 4.  Which restaurant of Delhi has generated most revenue
 select max(cost*rating_count)  from restaurants where city ='delhi';
  select * from restaurants where city = "delhi" and 
  (rating_count*cost) = (select max(cost*rating_count)  from restaurants where city ='delhi');
  

# 5. Which restaurant of more than average cost of an restaurant in Delhi has generated most revenue
  select avg(cost) from restaurants where  city = "delhi";
  select * ,(cost*rating_count) as rev from restaurants where city ="delhi" and 
  cost > (select avg(cost) from restaurants where city = 'delhi')
  order by cost*rating_count desc limit 1;

-- another way   
  select * from restaurants where 
	rating_count * cost = (select max(rating_count * cost) from restaurants where city = 'Delhi' )
							and
							 cost > (select avg(cost) from restaurants where city = 'Delhi')
									and city = 'Delhi';
                                    
                                    
-- 6. Which restaurant of more than average cost of an restaurant in Delhi has generated most revenue
select city , sum(rating_count) from restaurants 
	group by city 
		order by sum(rating_count) 
			desc limit 5;
