"""
Convert csv file to utf-8 csv
"""
import csv

ROUTE = "dataset/"

def convert_to_utf_8(file_name):
    target_file_name = file_name.split(".")[0] + "_utf8.csv"
    f_path = ROUTE + file_name
    target_path = ROUTE + target_file_name

    print("Original path: {}".format(f_path))
    print("Target path: {}".format(target_path))

    with open(f_path, 'r', encoding='utf-8') as infile, open(target_path, 'w', encoding='utf-8') as outfile:
        inputs = csv.reader(infile)
        outputs = csv.writer(outfile)

        for index, row in enumerate(inputs):
            # Create file with no header
            outputs.writerow(row)


if __name__ == '__main__':
    csv_file_name = input("Enter the csv file name: ")
    convert_to_utf_8(csv_file_name)

