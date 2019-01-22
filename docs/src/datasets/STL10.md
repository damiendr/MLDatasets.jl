# [STL-10](@id STL10)

Description from the [original
website](https://cs.stanford.edu/~acoates/stl10/)

> The STL-10 dataset is an image recognition dataset
> for developing unsupervised feature learning, deep
> learning, self-taught learning algorithms. It is
> inspired by the CIFAR-10 dataset but with some
> modifications. In particular, each class has fewer
> labeled training examples than in CIFAR-10, but a
> very large set of unlabeled examples is provided to
> learn image models prior to supervised training. The
> primary challenge is to make use of the unlabeled
> data (which comes from a similar but different
> distribution from the labeled data) to build a
> useful prior. We also expect that the higher
> resolution of this dataset (96x96) will make it a
> challenging benchmark for developing more scalable
> unsupervised learning methods.

## Contents

```@contents
Pages = ["STL10.md"]
Depth = 3
```

## Overview

The `MLDatasets.STL10` sub-module provides a programmatic
interface to download, load, and work with the STL-10 dataset.

```julia
using MLDatasets

# read the class names:
STL10.classnames()

# load full training set
train_x, train_y = STL10.traindata()

# load full test set
test_x,  test_y  = STL10.testdata()

# load unlabeled data
unlabeled_x  = STL10.unlabeledtensor()

# display observation 5 as an image:
img = STL10.convert2image(unlabeled_x[:,:,:,5])

# convert the first 1000 observations into a flat feature vector
# of size (96*96*3, 1000):
features = STL10.convert2features(unlabeled_x[:,:,:,1:1000])
```

## References

- **Authors**: Adam Coates, Honglak Lee, Andrew Y. Ng

- **Website**: https://cs.stanford.edu/~acoates/stl10/

- **[Coates, 2011]** Adam Coates, Honglak Lee, Andrew Y. Ng. ["An Analysis of Single Layer Networks in Unsupervised Feature Learning"](http://cs.stanford.edu/~acoates/papers/coatesleeng_aistats_2011.pdf), AISTATS, 2011.
