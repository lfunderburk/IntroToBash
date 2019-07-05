import pandas as pd
import os
import matplotlib.pyplot as plt
import argparse


def getArguments():
    # Set up the command line parser
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description=""
    )

    # File name
    parser.add_argument(
        "filename",
        help="Add full path and file name to process")
    # Verbosity flag
    parser.add_argument(
        "-v",
        "--verbose",
        action="store_true",
        help="Run the program in verbose mode.")

    # Parse the command line arguements.
    options = parser.parse_args()
    return options

if __name__ == "__main__":
    
    options = getArguments()
    input_f = options.filename
    
    file = pd.read_csv(input_f,sep=",")
    
    print(file.head())
    
    print(file.describe())
    
    split_lo_la = [file["GeoLoc"].tolist()[i].split(", ") for i in range(100)]
    latitudes = [float(split_lo_la[i][0]) for i in range(100)]
    longitudes = [float(split_lo_la[i][1]) for i in range(100)]
    file["Latitude"] =  latitudes 
    file["Longitude"] =  longitudes 
    
    ax2 = file["Country"].value_counts().plot(kind='bar',figsize=(15,10),title="Frequency of Countries");
    ax2.set_xlabel("Country")
    ax2.set_ylabel("Frequency")
    plt.savefig(input_f + "_" + "CountryFreq.png")


    ax1 = file["Region"].value_counts().plot(kind='bar',figsize=(15,10),title="Frequency of Region");
    ax1.set_xlabel("Region")
    ax1.set_ylabel("Frequency")
    plt.savefig(input_f + "_" + "RegionFreq.png")
    
    
    ax0 = file.plot(kind="scatter", x="Longitude", y="Latitude", alpha=0.4,figsize=(10,10))
    plt.savefig(input_f + "_" + "LatitudeLongitude.png")