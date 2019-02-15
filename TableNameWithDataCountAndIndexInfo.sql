;with cte as 
( 
    select 
        table_name = o.name,    
        o.[object_id], 
        i.index_id, 
        i.type, 
        i.type_desc 
    from sys.indexes i 
    inner join sys.objects o on i.[object_id] = o.[object_id] 
    where  o.type in ('U') 
    and  o.is_ms_shipped = 0 and i.is_disabled = 0  and i.is_hypothetical = 0 
    and i.type <= 2 
), cte2 as 
( 
select  * 
from cte c 
pivot (count(type) for type_desc in ([HEAP], [CLUSTERED], [NONCLUSTERED])) pv 
) 
select 
    c2.table_name, 
    [rows] = max(p.rows), 
    is_heap = sum([HEAP]), 
    is_clustered = sum([CLUSTERED]), 
    num_of_nonclustered = sum([NONCLUSTERED]) 
from cte2 c2 
inner join sys.partitions p on c2.[object_id] = p.[object_id] and c2.index_id = p.index_id 
group by  table_name
HAVING sum([NONCLUSTERED]) = 0 AND sum([CLUSTERED]) <> 0