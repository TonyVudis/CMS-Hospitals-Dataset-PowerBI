-- First Question : How do payments vary across Midwest hospitals with the same DRG?

With drg_stats as (
    SELECT
        drg_cd,
        COUNT(DISTINCT rndrng_prvdr_ccn) as num_hospitals,
        AVG(avg_tot_pymt_amt) as avg_payment,
        MIN(avg_tot_pymt_amt) as min_payment,
        MAX(avg_tot_pymt_amt) as max_payment
    FROM CMS_midwest_data
    GROUP BY drg_cd
    HAVING COUNT(DISTINCT rndrng_prvdr_ccn) > 1

)
SELECT
    h.drg_cd, 
    h.drg_desc,
    h.rndrng_prvdr_org_name AS hospital,
    h.rndrng_prvdr_city AS city,
    h.rndrng_prvdr_state_abrvtn AS state,
    ROUND(h.avg_tot_pymt_amt, 2) AS total_payment_amt,
    ROUND(d.avg_payment, 2) AS drg_avg_payment,
    ROUND(d.min_payment, 2) AS lowest_payment,
    ROUND(d.max_payment, 2) AS highest_payment,
    ROUND(d.max_payment - d.min_payment, 2) AS payment_range,
    d.num_hospitals
FROM CMS_midwest_data AS h
JOIN drg_stats AS d ON h.drg_cd = d.drg_cd
ORDER BY h.drg_cd, h.avg_tot_pymt_amt DESC;