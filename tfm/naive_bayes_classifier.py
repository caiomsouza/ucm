# -*- coding: utf-8 -*-
"""
Created on Wed May 25 19:09:36 2016

@author: caiomsouza


naive_bayes
http://scikit-learn.org/stable/modules/naive_bayes.html
http://scikit-learn.org/stable/tutorial/machine_learning_map/index.html


"""

print("GaussianNB()")      

from sklearn import datasets
iris = datasets.load_iris()
from sklearn.naive_bayes import GaussianNB
gnb = GaussianNB()
y_pred = gnb.fit(iris.data, iris.target).predict(iris.data)

print y_pred

print iris.data.shape[0]

print iris.data

print("Number of mislabeled points out of a total %d points : %d"
       % (iris.data.shape[0],(iris.target != y_pred).sum()))
       
       
 
print("BernoulliNB()")      

import numpy as np
X = np.random.randint(2, size=(6, 100))
Y = np.array([1, 2, 3, 4, 4, 5])
from sklearn.naive_bayes import BernoulliNB
clf = BernoulliNB()
clf.fit(X, Y)
BernoulliNB(alpha=1.0, binarize=0.0, class_prior=None, fit_prior=True)
print(clf.predict(X[2:3]))


print("BernoulliNB() 2")      

from sklearn import datasets
iris = datasets.load_iris()
from sklearn.naive_bayes import BernoulliNB
gnb = BernoulliNB()
y_pred = gnb.fit(iris.data, iris.target).predict(iris.data)

print y_pred

#print iris.data.shape[0]
#print iris.data
#print("Number of mislabeled points out of a total %d points : %d"
#       % (iris.data.shape[0],(iris.target != y_pred).sum()))