Quantifying the Effect of Transmission Type on Fuel Efficiency
========================================
# 1.0 Synopsis
This analysis addresses whether an automatic or manual transmission is better for MPG. It attempts to quantify the MPG difference between automatic and manual transmissions.

This analysis finds:

* Sample vehicles with automatic transmissions were more fuel efficient than those with manual transmissions

* Controlling for number of carburateurs, whether the engine is a V-shape, and country of manufacture, automatic transmissions add an extra 5.8 MPG, with a confidence interval of 2.4 to 9.2 MPG.

# 2.0 Data Processing
The data consists of 32 observations from the mtcars data within the R package datasets. The mtcars documentation states the data "was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)."

The sole transformation was add a variable, country, which grouped cars by country of manufacture. The models were grouped as:

Sweden: Volvo 142E

England: Lotus Europa

Italy: Fiat 128, Fiat X1-9, Ferrari Dino, Maserati Bora

Japan: Mazda RX4,Mazda RX4 Wag,Datsun 710,Honda Civic, Toyota Corolla,Toyota Corona

Germany: Merc 240D, Merc 230, Merc 280, Merc 280C, Merc 450SE, Merc 450SL, Merc 450SLC, Porsche 914-2

USA: Hornet 4 Drive, Hornet Sportabout, Valiant, Duster 360, Cadillac Fleetwood, Lincoln Continental, Chrysler Imperial, Dodge Challenger, AMC Javelin, Camaro Z28, Pontiac Firebird, Ford Pantera L


## 2.1 Tabulate count, fatalities, and injuries by category
Now we can tabulate by event type the number of instances involving casualties, the sum of fatalities by event type, and the sum of injuries by category.

# 3.0 Results

## 3.1 Tornado is the weather category most harmful to population health. 
Figure 1 below displays the most harmful weather event categories, fatalities vs. injuries, conditional on either injuries or fatalities reported. The size of the bubbles indicate the total count of such events in that category resulting either in fatalities or injuries. 

I plot the data on log10 scales to accommodate such wide ranges of results.
