library(glpk)
lp <- lpx_read_model("portfolio.mod", "portfolio.dat")
numrows <- lpx_get_num_rows(lp)
numrows
for (i in 1:numrows) {
 print(lpx_get_row_name(lp, i))
}
### find the number of columns and print names of variables
numcols <- lpx_get_num_cols(lp)
numcols
for (j in 1:numcols) {
 print(lpx_get_col_name(lp, j))
}
### solve the problem
lpx_simplex(lp)
### value of objective and constraints
for (i in 1:numrows) {
 print(lpx_get_row_name(lp, i))
 print(lpx_get_row_prim(lp, i))
}
### values of variables at optimal solution
for (j in 1:numcols) {
 print(lpx_get_col_name(lp, j))
 print(lpx_get_col_prim(lp, j))
}
### print the solution to a file
lpx_print_sol(lp, "lpsolution.out")


# now modify the data by setting different levels of risk

muv <- array()
muv <- .01*(1:100)

solution <- array()


for ( j in 1:100) {
  lpx_set_row_bnds(lp, 10, LPX_UP, 0, muv[j])
  lpx_simplex(lp)
  solution[j] <- lpx_get_row_prim(lp, 1)
}

plot(muv,solution)

#let's check with a risk level selected from the graph. It 
# looks like we might check muv = .2

lpx_set_row_bnds(lp, 10, LPX_UP, 0, .2)
lpx_simplex(lp)


for (i in 1:numrows) {
 print(lpx_get_row_name(lp, i))
 print(lpx_get_row_prim(lp, i))
}

for (j in 1:numcols) {
 print(lpx_get_col_name(lp, j))
 print(lpx_get_col_prim(lp, j))
}


