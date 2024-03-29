import os
import subprocess
import shutil

inputsGood = 'good'
inputsBad = 'bad'
outputs = 'outputs'

folder = 'outputs'
for the_file in os.listdir(folder):
    file_path = os.path.join(folder, the_file)
    try:
        if os.path.isfile(file_path):
            os.unlink(file_path)
        #elif os.path.isdir(file_path): shutil.rmtree(file_path)
    except Exception as e:
        print(e)


def runAllInDirectory(inputs):
    for file in os.listdir(os.fsencode(inputs)):
        filename_in = os.fsdecode(file)
        filename_out = filename_in[:-2] + "out"
        print(filename_in)
        print(filename_out)
        in_file = open(os.path.join(inputs, filename_in))
        out_file = open(os.path.join(outputs, filename_out), mode='w')
        subprocess.call(["./interpreter", inputs + "/" + filename_in], stdout=out_file)


runAllInDirectory(inputsGood)
runAllInDirectory(inputsBad)