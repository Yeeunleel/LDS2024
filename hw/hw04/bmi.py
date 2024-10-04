# Linguistics and Data Science [hw04]
# Release date: 2024-09-24
# Due date: 2023-09-30 1:00 PM
# 반복문(for loop)나 list comprehension을 사용할 수 없다.
# np.array() 외에 다른 numpy 함수나 메소드를 사용할 수 없다.
import numpy as np

# Descriptive Statistics
# mean
def mean(x:np.ndarray):
    return sum(x) / len(x)

# deviation
def dev(x:np.ndarray):
    return x - mean(x) # [Q1]

# standard deviation
def std(x:np.ndarray):
    return (sum(dev(x)**2) / (len(x)-1))**0.5 #[Q2]

# covariance
def cov(x:np.ndarray, y:np.ndarray):
    return sum(dev(x)*dev(y)) / (len(x)-1) #[Q3]

# correlation
def cor(x:np.ndarray, y:np.ndarray):
    return cov(x, y) / (std(x) * std(y))

# Dataset (http://wiki.stat.ucla.edu/socr/index.php/SOCR_Data_Dinov_020108_HeightsWeights)
# height in inches
height = [
    65.78, 71.52, 69.40, 68.22, 67.79,
    68.70, 69.80, 70.01, 67.90, 66.78,
    66.49, 67.62, 68.30, 67.12, 68.28,
    71.09, 66.46, 68.65, 71.23, 67.13,    
]
height = np.array(height)

# weight in pounds
weight = [
    112.99, 136.49, 153.03, 142.34, 144.30,
    123.30, 141.49, 136.46, 112.37, 120.67,
    127.45, 114.14, 125.61, 122.46, 116.09,
    140.00, 129.50, 142.97, 137.90, 124.04,
]
weight = np.array(weight)

print('correlation between height and weight:', cor(height, weight)) 
# [Q4] Write the result
# correlation between height and weight: 0.5709208208072762

# convert inch to (centi)meter
height = height*0.0254 # [Q5]

# convert pound to kilogram
weight = weight/2.205 # [Q6]

# calculate BMI (Body mass index)
bmi = np.array(weight / height**2) # [Q7]

print('who has the lowest BMI:', bmi.argmin()) 
# [Q8] Write the result
# who has the lowest BMI: 8