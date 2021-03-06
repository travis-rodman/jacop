include "bin_packing.mzn";

/**  @group globals.packing
  Requires that each item \p i with weight \a w[\p i], be put into \a bin[\p i] such 
  that the sum of the weights of the items in each bin \p b does not exceed the 
  capacity \a c[\p b].

  Assumptions:
  - forall \p i, \a w[\p i] >=0
  - forall \p b, \a c[\p b] >=0
*/
predicate bin_packing_capa(array[int] of int: c,
                           array[int] of var int: bin,
                           array[int] of int: w) =
    assert(index_set(bin) = index_set(w),
        "bin_packing_capa: the bin and weight arrays must have identical index sets",
    assert(lb_array(w) >= 0,
        "bin_packing_capa: the weights must be non-negative",
    assert(lb_array(c) >= 0,
        "bin_packing_capa: the capacities must be non-negative",
    
	 let {
	    set of int: lc = index_set(c),
	    array [lc] of var 0..ub_array(c) : cap
	 }
	 in 
	    forall (i in index_set(c) ) ( cap[i] <= c[i]) /\
	    jacop_bin_packing(bin, cap, w)
    )));

%-----------------------------------------------------------------------------%
