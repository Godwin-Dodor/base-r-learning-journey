# Base R learning journey
This is my journey of learning and documenting base R.  
I am learning base R from scratch to become proficient in data analysis and data manipulation.

## Personal goals
1. Master Base R Fundamentals and advances.
2. Complete at least 10 projects in this journey
3. Build a strong portfolio

## This is my structured learning path and I will keep updating it as I progress

### Topic 1: Fundamentals of R

1. **Lesson01: Environment Setup in R**  
I learned Working directory (`getwd()`, `setwd()`), listing files in the working directory using (`list.files()`), listing hidden files in the working directory by setting `all.files = TRUE`, workspace management (`ls()`, `rm()`), package handling using (`search()`, `.libPaths()`, `install.packages()`, `library()`)

2. **Lesson02: Basic Operations in R**  
I learned Arithmetic operators (`+`, `-`, `*`, `/`, `^`, `%%`, `%/%`), variable assignment (`<-`), comparison operators (`==`, `!=`, `<`, `>`, `<=`, `>=`), logical operators (`&`, `|`, `!`), operator precedence (PEMDAS), variable naming rules

3. **Lesson03: Special Values in R**  
I learned NA (missing values, `is.na()`, `na.rm = TRUE`), NULL (empty objects, `is.null()`), NaN (invalid math, `is.nan()`), Inf and -Inf (infinity, `is.infinite()`, `is.finite()`), as well as handling and removing special values

4. **Lesson04: Vectors Creation in R**  
I learned creating vectors with `c()`, type coercion hierarchy, `vector()`, `numeric()`, `character()`, `logical()`, `complex()`, sequences with the colon operator `:` and `seq()`, `seq_len()`, `seq_along()`, repetitions with `rep()` (`times`, `each`, `length.out`), named vectors

5. **Lesson05: Vectors Sequences**  
I worked with `seq()` patterns such as (decimal steps, `length.out`), `rep()` patterns (nested, times vector, combining `each` and `times`), combining `seq()` and `rep()`, mathematical sequences (arithmetic), sequence manipulation (`rev()`, `sort()`)

6. **Lesson06: Vectors Indexing**  
I learned positive indexing, negative indexing (exclusion), logical indexing with conditions (`&`, `|`), `which()`, `which.min()`, `which.max()`, named indexing, subsetting and replacement, `%in%` operator, `head()`, `tail()`, `unique()`, `duplicated()`, `sample()`

7. **Lesson07: Vectors Operations**
I learned vectorization principles, arithmetic operations on vectors (`+`, `-`, `*`, `/`, `^`, `%%`, `%/%`), vector recycling rules, comparison operations returning logical vectors, combining conditions with `&` and `|`, statistical functions (`sum()`, `mean()`, `median()`, `sd()`, `var()`, `min()`, `max()`, `range()`, `quantile()`), 
cumulative functions (`cumsum()`, `cumprod()`, `cummin()`, `cummax()`, `diff()`), rounding functions (`round()`, `floor()`, `ceiling()`, `trunc()`, `signif()`), transformations (`sqrt()`, `log()`, `exp()`, `abs()`, `sign()`), sorting and ordering (`sort()`, `order()`, `rank()`, `rev()`), set operations (`union()`, `intersect()`, `setdiff()`, `setequal()`), 
testing with `any()` and `all()`, handling duplicates with `unique()` and `duplicated()`