-- Third Question : How does cost or volume differ by geography, such as rural vs. urban or by city?

With hospital_stats as (
    SELECT
        rndrng_prvdr_ruca_desc,
        SUM(tot_dschrgs) as total_discharges,
        AVG(avg_tot_pymt_amt) as avg_payment,
        AVG(avg_mdcr_pymt_amt) as avg_medicare_payment
    FROM CMS_midwest_data
    GROUP BY rndrng_prvdr_ruca_desc
)
SELECT DISTINCT
    h.rndrng_prvdr_ruca_desc,
    h.total_discharges,
    h.avg_payment,
    h.avg_medicare_payment
FROM hospital_stats AS h
ORDER BY h.avg_payment DESC;