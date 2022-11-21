Point Pattern Matching algorithm

The Point Pattern Matching algorithm is working with coordinates of characters(symbols).
Therefore, before getting to the implementation of the algorithm in MATLAB there should be
a data set of patterns. The dataset is artificially created for some letters by using Excel.
For consistency borders have been defined for size of all letters, i. e. 34x27 matrix of
ones and zeros is used containing 60 ones. The pattern for every ith letter from the
dataset has the form: Pi= {p1, p2, ....p60}. Two sets of letters are created separately. The first
one consists of letters among which we must search the best matching pattern of new coming
character. It contains the letters: a, e ,o ,m, y, q, z. And the second one includes rotated,
shifted, translated, zoomed versions of some of first set’s letters: "a_rotated", "o_shifted",
"y_different", "m_scaled", "q_scaled_shifted_rotated". This will let us to test the efficiency
of our algorithm.

main.m- in this file the testing patterns are kept for which the algorithm must be tested. One
of the letters is chosen and is passed to the function minimization.m to find the letter which
is the most similar to it.

![image](https://user-images.githubusercontent.com/25793193/203106409-fff8264b-b313-42fd-aa38-198a1d82ca70.png)
![image](https://user-images.githubusercontent.com/25793193/203106829-fd5ade84-317d-42b2-9a06-a986cae2e904.png)

minimization.m- the main part is done in this function. The set of letters among which
the new coming character will be searched is stored here (this is the first dataset described
above). After getting the pattern, it is doing the translation and rotation on each pattern of
already stored dataset in order to find the pattern, which is the most similar to the testing
one. Then, after finding the parameters of best fit, for each letter the error is calculated and
passed to the function result.m .

result.m- this function outputs the results in a table form. For transformed version of each letter from the dataset, it outputs the
error which is measuring the dissimilarity with testing letter. Then it chooses the letter with minimum error as final result.

![image](https://user-images.githubusercontent.com/25793193/203107005-1416acdd-597f-46fd-8866-c0efb8352e48.png)
