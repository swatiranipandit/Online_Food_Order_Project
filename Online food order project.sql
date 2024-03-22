use online_food_mini_project;
select * from online_food_project;

-- Q1	Online food order decision based on customer Age

with cte as(select *, case when Age < 20 then 'child' when Age > 20 and age < 25  then 'young' when  Age >=25 and age < 30 then  'Adult'  else 'senior_citizen'
end as age_group from online_food_project)
select Age_group,count(age_group) order_by_age from cte group by 1 order by 2 desc;
   
   -- Q2	Online food order decision based on size of the family
   
select distinct(family_size) from online_food_project;
 alter table online_food_project
add column family_type varchar(50);
UPDATE online_food_project
SET family_type =
    CASE 
        WHEN family_size = 1 THEN 'Single'
        WHEN family_size = 2 THEN 'Couple'
        WHEN family_size > 2 AND family_size <= 4 THEN 'Nuclear Family'
        ELSE 'Joint Family'
    END;
   
    -- Q3	Who orders more Male or Female??
    select gender,count(gender) as total_orders from online_food_project group by 1 order by 2 desc;
    
    -- Who orders more Married or unmarried??
      select marital_status,count(marital_status) as total_orders from online_food_project group by 1 order by 2 desc;
    
    
    -- Q5	Analyze food ordering behaviour across income level
SELECT monthly_income, COUNT( monthly_income) AS total_order, ROUND((COUNT( monthly_income) * 100.0) / SUM(COUNT( monthly_income)) OVER (), 2) AS percentage
FROM online_food_project GROUP BY  monthly_income ORDER BY total_order DESC;
    
    -- Q6	Food ordering pattern based on qualification
       select Educational_Qualifications, count(Educational_Qualifications) as total_orders from online_food_project group by 1 order by 2 desc;
    
    -- Q7	Food ordering pattern based on occupation
    select Occupation,count(Occupation) as total_orders from online_food_project group by 1 order by 2 desc;
    
    -- Q8	Food ordering pattern based on feedback
     select feedback,count(feedback) as response from online_food_project group by 1 order by 2 desc;
    
    