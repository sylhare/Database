from pymongo import MongoClient
import re
import cProfile
import pprint
import os

client=MongoClient()
db = client.test
shakespeare = db.shakespeare

with open(os.path.join('resources/datasets/characters.txt', os.pardir) as charfile:
    characters = charfile.readlines()
    characters = [x.strip() for x in characters]

with open(os.path.join('resources/datasets/A_Midsummer_Nights_Dream.txt', os.pardir)) as file:
    lines = file.readlines()
    lines = [x.strip() for x in lines]

def createLines():
    count =0
    speaker=""

    for line in lines:
        count += 1
        if line in characters:
            speaker = line
            continue
        elif speaker=="":
            continue
        else:
            linedoc = {
                'lineNumber':count,
                'speaker':speaker,
                'line':line
            }
            shakespeare.insert(linedoc)

def updateLines():
    for character in characters:
        characterName = character.lower().capitalize()
        for line in shakespeare.find({'line': {'$regex':characterName}}):
            newline = line["line"].replace(characterName, character)
            shakespeare.update( {'_id':line["_id"]},
            {'$set': {"line":newline}})

def deleteLines():
    stringMatch = "^Enter|^Exit|^Exeunt|^Act"
    shakespeare.remove({'line': {'$regex': stringMatch}})

def printLines():
    for line in shakespeare.find().sort([("lineNumber",1)]):
        print(line["line"])

def CRUD():
    createLines()
    updateLines()
    deleteLines()
    printLines()

if __name__ == "__main__":
    cProfile.run('CRUD()')