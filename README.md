# X Subspace Support Vector Data Description
This repository focuses on implementing X-Subspace Support Vector Data Description, specifically addressing the Trustworthiness of X (formerly Twitter) Users through a One-Class Classification Approach. We present an innovative regularization term designed for Subspace Support Vector Data Description (SSVDD) to enhance its performance for X user classification.

The codes are provided as .m (matlab) files to be executed in matlab. The codes are provided without any warranty or guarantee.

# Requirements
S-SVDD requires *LIBSVM for SVDD*. Before executing the codes, make sure that correct version (3.22) of *LIBSVM for SVDD* is installed already. In order to install *LIBSVM for SVDD*  Please download zip file from [HERE](https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/svdd/libsvm-svdd-3.22.zip), put sources into libsvm-3.22 available [HERE](https://www.csie.ntu.edu.tw/~cjlin/libsvm/oldfiles/libsvm-3.22.zip), and make the code. For more details about how to install libsvm, please refer [HERE](https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/#libsvm_for_svdd_and_finding_the_smallest_sphere_containing_all_data)

# Hyperparameters
In our experiments for "Trustworthiness of X Users: A One-Class Classification Approach" We choose the hyperparameter values from the following ranges.

• 𝛽 ∈ {10−2, 10−1, 100, 101, 102},

• 𝐶 ∈ {0.1, 0.2, 0.3, 0.4, 0.5},

• 𝜎 ∈ {10−1, 100, 101, 102, 103},

• 𝑑 ∈ {1, 2, 3, 4, 5, 10, 20},

• 𝜂 ∈ {10−1, 100, 101, 102, 103},

• 𝑘 ∈ {1, 2, 3, . . . , 10},

• C ∈ {1, 2, 3, . . . , 10}.

We fix the number of iterations to 10 for all variants of SSVDD.
