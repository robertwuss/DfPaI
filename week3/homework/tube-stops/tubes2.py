import requests
import csv

url = 'http://fezz.in/whg/projects/data/tube-stops.json'

response = requests.get(url)

data = response.json()


lat_Homerton= data['Homerton']['lat']
lon_Homerton = data['Homerton']['lon']
lines_Homerton = data['Homerton']['lines']
#print ('Homerton ' + str(lat_Homerton) + str(lon_Homerton ) + str(lines_Homerton))

lat_HackneyCentral = data ['Hackney Central']['lat']
lon_HackneyCentral = data['Hackney Central']['lon']
lines_HackneyCentral = data ['Homerton']['lines']
#print ('Hackney Central ' + str(lat_HackneyCentral ) + str(lon_HackneyCentral) + str(lines_HackneyCentral))

lat_DalstonKingsland = data ['Dalston Kingsland']['lat']
lon_DalstonKingsland = data['Dalston Kingsland']['lon']
lines_DalstonKingsland = data ['Dalston Kingsland']['lines']
#print ('Dalston Kingsland ' + str(lat_DalstonKingsland) + str(lon_DalstonKingsland) + str(lines_DalstonKingsland))

lat_Canonbury = data ['Canonbury']['lat']
lon_Canonbury = data['Canonbury']['lon']
lines_Canonbury = data ['Canonbury']['lines']
#print ('Canonbury ' + str(lat_Canonbury) + str(lon_Canonbury) + str(lines_Canonbury))

lat_HighburyIslington = data ['Highbury & Islington']['lat']
lon_HighburyIslington = data['Highbury & Islington']['lon']
lines_HighburyIslington = data ['Highbury & Islington']['lines']
#print ('Highbury & Islington' + str(lat_HighburyIslington) + str(lon_HighburyIslington))

lat_KingsCross = data ["King's Cross St.Pancras"]['lat']
lon_KingsCross  = data["King's Cross St.Pancras"]['lon']
#line_data = data['lines']
#lines_KingsCross  = line_data[1]['King''s Cross St.Pancras']
lines_KingsCross = 'Victoria'
#print ('KingsCross' + str(lat_KingsCross + str(lon_KingsCross))

lat_Euston = data ['Euston']['lat']
lon_Euston  = data['Euston']['lon']
lines_Euston  = data ['Euston']['lines']
#print ('Euston ' + str(lat_Euston) + str(lon_Euston) + str(lines_Euston))

lat_WarrenStreet = data ['Warren Street']['lat']
lon_WarrenStreet  = data['Warren Street']['lon']
lines_WarrenStreet  = data ['Warren Street']['lines']
#print ('Warren Street ' + str(lat_WarrenStreet) + str(lon_WarrenStreet))

lat_OxfordCircus= data ['Oxford Circus']['lat']
lon_OxfordCircus = data['Oxford Circus']['lon']
lines_OxfordCircus = data ['Oxford Circus']['lines']
#print ('Oxford Circus ' + str(lat_OxfordCircus) + str(lon_OxfordCircus))

lat_GreenPark = data ['Green Park']['lat']
lon_GreenPark = data['Green Park']['lon']
lines_GreenPark = data ['Green Park']['lines']
#print ('Green Park ' + str(lat_GreenPark) + str(lon_GreenPark))

lat_Victoria = data ['Victoria']['lat']
lon_Victoria = data['Victoria']['lon']
lines_Victoria = data ['Victoria']['lines']
#print ('Victoria ' + str(lat_Victoria) + str(lon_Victoria))

lat_SloaneSquare= data ['Sloane Square']['lat']
lon_SloaneSquare = data['Sloane Square']['lon']
lines_SloaneSquare = data ['Sloane Square']['lines']
#print ('Sloane Square ' + str(lat_SloaneSquare) + str(lon_SloaneSquare))


#create a csv file from the data
csvData = [['Station', 'Lat', 'Lon', 'line'],
['Homerton', lat_Homerton, lon_Homerton, lines_Homerton ],
['HackneyCentral', lat_HackneyCentral, lon_HackneyCentral, lines_HackneyCentral],
['DalstonKingsland', lat_DalstonKingsland, lon_DalstonKingsland, lines_DalstonKingsland],
['Canonbury', lat_Canonbury, lon_Canonbury, lines_Canonbury ],
['HighburyIslington', lat_HighburyIslington, lon_HighburyIslington, lines_HighburyIslington],
['KingsCross', lat_KingsCross, lon_KingsCross, lines_KingsCross],
['Euston', lat_Euston, lon_Euston, lines_Euston],
['WarrenStreet', lat_WarrenStreet, lon_WarrenStreet, lines_WarrenStreet],
['OxfordCircus', lat_OxfordCircus, lon_OxfordCircus, lines_OxfordCircus],
['GreenPark ', lat_GreenPark , lon_GreenPark , lines_GreenPark],
['Victoria ', lat_Victoria  , lon_Victoria  , lines_Victoria],
['SloaneSquare', lat_SloaneSquare , lon_SloaneSquare , lines_SloaneSquare]]

with open('tube_stops.csv', 'w') as csvFile:
    writer = csv.writer(csvFile)
    writer.writerows(csvData)

csvFile.close()
