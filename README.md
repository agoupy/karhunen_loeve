# karhunen_loeve

Karhunen-Loeve (KL) decomposition of a gaussian process for different kernels. Performance is evaluated for exponential kernel for which closed form is known.

This code implement the method exposed in the following paper:
[Convergence study of the truncated Karhunen–Loeve expansion for simulation of stochastic processes](https://onlinelibrary.wiley.com/doi/abs/10.1002/nme.255)
by S. P. Huang, S. T. Quek and K. K. Phoon.


## Getting Started

The file `main.m` will execute the code for the exponential kernel and perform the comparison with exact decomposition.

The error in the reconstruction of the covariance kernel is plotted. The convergence seems to be very slow compared to values given in the article.

## Files

 * `main.m` 
 * `kl_numerical.m` compute the decomposition of the covariance function on legendre polynomials and compute the K-L terms (implementation of the article).
 * `kl_exponential.m` compute the exact K-L decomposition for an exponential covariance kernel (see Ghanem & Spanos for formulae).
 * `exp_cov.m` and `sine_cov.m` give two types of covariance kernel.
 * `poly1D.m` compute the legendre polynomials for the numerical decomposition of the eigenvectors.

## Author

**Alexandre Goupy** - [agoupy](https://github.com/agoupy)

