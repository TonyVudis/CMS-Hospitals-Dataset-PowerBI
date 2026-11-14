-- First Question : How do charges and payments vary across Midwest hospitals with the same DRG? Does payment vary much less than charges?

SELECT * 
FROM CMS_midwest_data
WHERE avg_tot_pymt_amt > 10000;