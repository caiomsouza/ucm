SELECT 	MAX(
		CASE WHEN product_no='PRO11' THEN 1
			 ELSE 0
		END) PRO11_IND,
	MAX(
		CASE WHEN product_no='PRO12' THEN 1
			 ELSE 0
		END) PRO12_IND,
	MAX(
		CASE WHEN product_no='PRO13' THEN 1
			 ELSE 0
		END) PRO13_IND,
	MAX(
		CASE WHEN product_no='PRO14' THEN 1
			 ELSE 0
		END) PRO14_IND,
	MAX(
		CASE WHEN product_no='PRO15' THEN 1
			 ELSE 0
		END) PRO15_IND,
	MAX(
		CASE WHEN product_no='PRO16' THEN 1
			 ELSE 0
		END) PRO16_IND,
	MAX(
		CASE WHEN product_no='PRO17' THEN 1
			 ELSE 0
		END) PRO17_IND
	FROM FACT_SALESORDERINVENTORY FACT
	JOIN DIM_PRODUCTS PRO ON PRO.PRODUCT_ID=FACT.PRODUCT_ID
GROUP BY FACT.CONTACT_ID