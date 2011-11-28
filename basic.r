library(glpk)
lp <- lpx_read_model("basic.mod", "basic.dat")
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
