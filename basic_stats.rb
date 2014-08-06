require 'yaml'

def yaml_load filein    # Read a data file
  yaml_string = File.read filein
  YAML::load yaml_string
end

def yaml_save object, fileout  # Save results to a file
  File.open fileout, 'w' do |f|
    f.write(object.to_yaml)
  end
end

def sum array  # Sum the data values
  array.inject(:+)
end

def mean array  # Calculate the mean
  s1 = sum array
  s1/array.length
end

def variance array  # Calculate the variance
  y = mean array
  sumsquares = 0
  array.each do |x|
    sumsquares += (x - y)**2
  end
  sumsquares/(array.length-1)
end

def standard_deviation array  # Calculate the standard deviation
  Math.sqrt(variance array)
end

# Input the data
file = 'Data.txt'
data = yaml_load file

# Calculations
datasum = sum data
xbar = mean data
var = variance data
stdev = standard_deviation data

# Write to Terminal
puts
puts ('The sum is ' + datasum.to_s)
puts ('The mean is ' + xbar.to_s)
puts ('The variance equals ' + var.to_s)
puts ('The standard deviation is ' + stdev.to_s)
puts

# Write to Results file
fileout = 'Results.txt'
  stats = ["The sum is #{datasum},
  The mean equals #{xbar},
  The variance is #{var},
  The standard deviation equals #{stdev}"]
  yaml_save stats, fileout

  