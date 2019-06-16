import os
import subprocess

inputs = 'inputs'
outputs = 'outputs'
directory = os.fsencode(inputs)

for file in os.listdir(directory):
    filename_in = os.fsdecode(file)
    filename_out = filename_in[:-2] + "out"
    print(filename_in)
    print(filename_out)
    in_file = open(os.path.join(inputs, filename_in))
    out_file = open(os.path.join(outputs, filename_out), mode='w')
    subprocess.call(["./Interpreter2-exe", inputs + "/" + filename_in], stdout=out_file)