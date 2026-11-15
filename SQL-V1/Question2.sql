-- Second Question : Does hospital size, measured by total discharges, relate to the medicare coverage-to-payment ratio?

With hospital_stats as (
    SELECT
        rndrng_prvdr_ccn,
        SUM(tot_dschrgs) as total_discharges,
        AVG(avg_tot_pymt_amt) as avg_payment,
        AVG(avg_mdcr_pymt_amt) as avg_medicare_payment
    FROM CMS_midwest_data
    GROUP BY rndrng_prvdr_ccn

)
SELECT DISTINCT
    h.rndrng_prvdr_ccn,
    c.rndrng_prvdr_org_name AS hospital,
    c.rndrng_prvdr_city AS city,
    c.rndrng_prvdr_state_abrvtn AS state,
    h.total_discharges,
    h.avg_payment,
    h.avg_medicare_payment,
    ROUND(h.avg_medicare_payment / h.avg_payment, 2) AS medicare_coverage_to_payment_ratio
FROM CMS_midwest_data AS c
JOIN hospital_stats AS h on c.rndrng_prvdr_ccn = h.rndrng_prvdr_ccn
ORDER BY medicare_coverage_to_payment_ratio DESC;

