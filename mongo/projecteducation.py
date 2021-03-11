from pymongo import MongoClient
import re
import pprint

pp = pprint.PrettyPrinter(indent=4)

client=MongoClient()
db = client.test
population = db.poptotal
education = db.attain
agetotals = db.agetotals

maxpop = {}
percentages = {}

def setupPercentages():
    for ageGroup in agetotals.find():
        maxpop[ageGroup["_id"]] = ageGroup["count"]
    for entry in education.find():
        ageRange = entry["_id"]["Age"]
        educationalAttainment = entry["_id"]["Educational Attainment"]
        attainTotal = entry["total"]
        if ageRange not in percentages:
            percentages[ageRange] = {}
        percent = (attainTotal/float(maxpop[ageRange]))
        percentages[ageRange][educationalAttainment] = percent
        

# Result to be formatted:
# Year
    # Age Range
        # Educational Attainment

# Iterate through the population entries
# For each entry:
    # Iterate through the age groups
    # For each age group:
        # Get the total for that population from agetotal
        # Iterate through the attainment levels
        # For each attainment level:
            # Determine the percentage for this age group/attainment level

def generateReport():
    result = {}

    print percentages
    for entry in population.find():
        print(entry)
        # We've got the Year and Age set up
        thisYear = entry["_id"]["Year"]
        thisAge = entry["_id"]["Age"]
        thisCount = entry["count"]
        if thisYear not in result:
            result[thisYear] = {}
        result[thisYear][thisAge] = {}

        # Now we need to populate the results
        for level in percentages[thisAge]:
            result[thisYear][thisAge][level] = \
                int(percentages[thisAge][level] * thisCount)

    pp.pprint(result)

if __name__ == "__main__":
    setupPercentages()
    generateReport()