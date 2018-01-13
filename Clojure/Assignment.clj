(defn is-prime? [n]
	(if (= n 1) false
	    (if (= n 2) true
	        (empty? (filter #(= 0 (mod n %)) (range 2 n)))))
)
	       
(defn prime-seq [from to]
	(remove nil? (for [from (range from to)] (if (= (is-prime? from) true) from)))
)

(defn doprimes [from to]
	(def seqp (take 10 (reverse (prime-seq from to))))
	(doseq [x seqp] (println x))
	(println (str "Total = " (reduce + seqp)))
)