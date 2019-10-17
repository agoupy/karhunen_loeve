# karhunen_loeve

Karhunen-Loeve (KL) decomposition of a gaussian process for different kernels. Performance is evaluated for exponential kernel for which closed form is known.

This code implement the method exposed in the following paper:
[Convergence study of the truncated Karhunen–Loeve expansion for simulation of stochastic processes](https://onlinelibrary.wiley.com/doi/abs/10.1002/nme.255)
by S. P. Huang, S. T. Quek and K. K. Phoon.


## Getting Started

The file `main.m` will execute the code for the exponential kernel and perform the comparison with exact decomposition.

-------------------------------------

The matrix M depends on two stochastic parameters ![f1] and ![f2]: ![f3] 

The code will compute the gPC coefficients of eigenvalues (ev) and eigenvectors (ef) and return the mean and variance for the eigenvalues (computed with the gPC and quasi Monte-Carlo for comparison).

## Files

 * `main.m` 
 * `matrix_eval.m` where the random matrix is defined.
 * `matrix_gPC.m` compute the gPC projection of the matrix using quadrature based formulae (need [TASMANIAN](https://tasmanian.ornl.gov/) for creating quadrature).
 * `construct_gamma.m` build the ![f4] matrix as defined in the article.
 * `newton_raphson.m` run the optimization to find the coefficients using the explicite form of the jacobian given in the article to accelerate. Initial points for the optimisation are the eigenvalues of the mean matrix.
 * `multi_index.m` and `poly1D.m` generate multivariate Hermite polynomials.
 * `Sobol_quasi_random.m` generate quasi random points for the mean and variance comparison.
 * `display_result.m` print the results in a tabular.


## Author

**Alexandre Goupy** - [agoupy](https://github.com/agoupy)

[f1]: http://chart.apis.google.com/chart?cht=tx&chl=\xi_1
[f2]: http://chart.apis.google.com/chart?cht=tx&chl=\xi_2
[f3]: http://chart.apis.google.com/chart?cht=tx&chl=M=C%2BA*\xi_1%2BB*\xi_2
[f4]: http://chart.apis.google.com/chart?cht=tx&chl=\Gamma

