INSERT INTO zipcode (zipCode, locationType, locationNumber, locationName, cityName, countyNo, countyName, block, creationTime)
SELECT DISTINCT ZIP_CODE, loc.type, loc.number, loc.name, MAILING_CITY_NAME, COUNTY_NO, COUNTY_NAM, zip.Block, NOW() 
FROM location loc, zip_to_location_temp zip
WHERE loc.type='SLAP' AND loc.number=zip.slap_id ORDER BY ZIP_CODE;