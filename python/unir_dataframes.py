import csv

import numpy as np
medios = np.array()

with open('../datasets/proporcion_medios.csv', "rb") as f:
    reader = csv.reader(f)
    nombres = reader.next()
    rest = [row for row in reader]

medios


with open('../datasets/proporcion_medios.csv') as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')
    for row in readCSV:
        for (i, column) in enumerate(row):
            print(i)
            if (i > 0) and ((i % 2) == 0):
                medios[lastColumn][i] = column
            lastColumn = column

print(medios)
