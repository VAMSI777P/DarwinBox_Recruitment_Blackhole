SELECT 
    h.Stage,
    -- Analysis 1: Total Volume
    COUNT(DISTINCT h.CandidateID) AS Total_Candidates,
    
    -- Analysis 2: The Bottleneck (Stuck Count)
    SUM(CASE WHEN h.Status = 'Started' THEN 1 ELSE 0 END) AS Stuck_Count,
    
    -- Analysis 3: Bottleneck % (The "KPI")
    CAST(SUM(CASE WHEN h.Status = 'Started' THEN 1 ELSE 0 END) * 100.0 / 
         COUNT(DISTINCT h.CandidateID) AS DECIMAL(10,2)) AS Stuck_Percentage
FROM Fact_Application_History h
JOIN Dim_Candidates c ON h.CandidateID = c.CandidateID -- Joining the 2 tables
GROUP BY h.Stage
ORDER BY Stuck_Percentage DESC;