if upcase(name) = 'ALLEY' then role = 'REJECTED';
else
if upcase(name) = 'BEDROOM_ABVGR' then role = 'REJECTED';
else
if upcase(name) = 'BLDG_TYPE' then role = 'REJECTED';
else
if upcase(name) = 'BSMTFIN_SF_2' then role = 'REJECTED';
else
if upcase(name) = 'BSMTFIN_TYPE_1' then role = 'REJECTED';
else
if upcase(name) = 'BSMTFIN_TYPE_2' then role = 'REJECTED';
else
if upcase(name) = 'BSMT_COND' then role = 'REJECTED';
else
if upcase(name) = 'BSMT_EXPOSURE' then role = 'REJECTED';
else
if upcase(name) = 'BSMT_HALF_BATH' then role = 'REJECTED';
else
if upcase(name) = 'BSMT_QUAL' then role = 'REJECTED';
else
if upcase(name) = 'BSMT_UNF_SF' then role = 'REJECTED';
else
if upcase(name) = 'CENTRAL_AIR' then role = 'REJECTED';
else
if upcase(name) = 'CONDITION_1' then role = 'REJECTED';
else
if upcase(name) = 'CONDITION_2' then role = 'REJECTED';
else
if upcase(name) = 'ELECTRICAL' then role = 'REJECTED';
else
if upcase(name) = 'ENCLOSED_PORCH' then role = 'REJECTED';
else
if upcase(name) = 'EXTER_COND' then role = 'REJECTED';
else
if upcase(name) = 'EXTERIOR_1ST' then role = 'REJECTED';
else
if upcase(name) = 'EXTERIOR_2ND' then role = 'REJECTED';
else
if upcase(name) = 'FENCE' then role = 'REJECTED';
else
if upcase(name) = 'FIREPLACE_QU' then role = 'REJECTED';
else
if upcase(name) = 'FOUNDATION' then role = 'REJECTED';
else
if upcase(name) = 'FULL_BATH' then role = 'REJECTED';
else
if upcase(name) = 'FUNCTIONAL' then role = 'REJECTED';
else
if upcase(name) = 'GARAGE_AREA' then role = 'REJECTED';
else
if upcase(name) = 'GARAGE_COND' then role = 'REJECTED';
else
if upcase(name) = 'GARAGE_FINISH' then role = 'REJECTED';
else
if upcase(name) = 'GARAGE_QUAL' then role = 'REJECTED';
else
if upcase(name) = 'GARAGE_TYPE' then role = 'REJECTED';
else
if upcase(name) = 'GARAGE_YR_BLT' then role = 'REJECTED';
else
if upcase(name) = 'HALF_BATH' then role = 'REJECTED';
else
if upcase(name) = 'HEATING' then role = 'REJECTED';
else
if upcase(name) = 'HEATING_QC' then role = 'REJECTED';
else
if upcase(name) = 'HOUSE_STYLE' then role = 'REJECTED';
else
if upcase(name) = 'KITCHEN_ABVGR' then role = 'REJECTED';
else
if upcase(name) = 'KITCHEN_QUAL' then role = 'REJECTED';
else
if upcase(name) = 'LAND_SLOPE' then role = 'REJECTED';
else
if upcase(name) = 'LOT_CONFIG' then role = 'REJECTED';
else
if upcase(name) = 'LOT_FRONTAGE' then role = 'REJECTED';
else
if upcase(name) = 'LOT_SHAPE' then role = 'REJECTED';
else
if upcase(name) = 'LOW_QUAL_FIN_SF' then role = 'REJECTED';
else
if upcase(name) = 'MS_SUBCLASS' then role = 'REJECTED';
else
if upcase(name) = 'MS_ZONING' then role = 'REJECTED';
else
if upcase(name) = 'MAS_VNR_TYPE' then role = 'REJECTED';
else
if upcase(name) = 'MISC_FEATURE' then role = 'REJECTED';
else
if upcase(name) = 'MISC_VAL' then role = 'REJECTED';
else
if upcase(name) = 'MO_SOLD' then role = 'REJECTED';
else
if upcase(name) = 'NEIGHBORHOOD' then role = 'REJECTED';
else
if upcase(name) = 'OPEN_PORCH_SF' then role = 'REJECTED';
else
if upcase(name) = 'ORDER' then role = 'REJECTED';
else
if upcase(name) = 'PID' then role = 'REJECTED';
else
if upcase(name) = 'PAVED_DRIVE' then role = 'REJECTED';
else
if upcase(name) = 'POOL_AREA' then role = 'REJECTED';
else
if upcase(name) = 'POOL_QC' then role = 'REJECTED';
else
if upcase(name) = 'ROOF_MATL' then role = 'REJECTED';
else
if upcase(name) = 'ROOF_STYLE' then role = 'REJECTED';
else
if upcase(name) = 'SALE_CONDITION' then role = 'REJECTED';
else
if upcase(name) = 'SALE_TYPE' then role = 'REJECTED';
else
if upcase(name) = 'STREET' then role = 'REJECTED';
else
if upcase(name) = 'TOTRMS_ABVGRD' then role = 'REJECTED';
else
if upcase(name) = 'TOTAL_BSMT_SF' then role = 'REJECTED';
else
if upcase(name) = 'UTILITIES' then role = 'REJECTED';
else
if upcase(name) = 'WOOD_DECK_SF' then role = 'REJECTED';
else
if upcase(name) = 'YEAR_REMOD_ADD' then role = 'REJECTED';
else
if upcase(name) = 'YR_SOLD' then role = 'REJECTED';
else
if upcase(name) = '_SSN_PORCH' then role = 'REJECTED';
else
if upcase(name) = '_ND_FLR_SF' then role = 'REJECTED';
else
if upcase(name) = '_ST_FLR_SF' then role = 'REJECTED';
if upcase(strip(name)) = "G_NEIGHBORHOOD" then level = "NOMINAL";
if upcase(strip(name)) = "G_BSMT_QUAL" then level = "NOMINAL";
if upcase(strip(name)) = "G_KITCHEN_QUAL" then level = "NOMINAL";
if upcase(strip(name)) = "G_MS_SUBCLASS" then level = "NOMINAL";
if upcase(strip(name)) = "G_BSMT_EXPOSURE" then level = "NOMINAL";
if upcase(strip(name)) = "G_EXTERIOR_1ST" then level = "NOMINAL";
if upcase(strip(name)) = "G_SALE_CONDITION" then level = "NOMINAL";
if upcase(strip(name)) = "G_GARAGE_QUAL" then level = "NOMINAL";
if upcase(strip(name)) = "G_HOUSE_STYLE" then level = "NOMINAL";
if upcase(strip(name)) = "G_CONDITION_1" then level = "NOMINAL";
if upcase(strip(name)) = "G_BLDG_TYPE" then level = "NOMINAL";
if upcase(strip(name)) = "G_CONDITION_2" then level = "NOMINAL";
if upcase(strip(name)) = "G_POOL_QC" then level = "NOMINAL";
if upcase(strip(name)) = "G_FUNCTIONAL" then level = "NOMINAL";
if upcase(strip(name)) = "G_ROOF_MATL" then level = "NOMINAL";
