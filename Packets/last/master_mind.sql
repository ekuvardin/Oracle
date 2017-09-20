select * from 
table(master_mind.calculate_res('12;26;14;11', '+;-;*; div ', 42)) w1,
table(master_mind.calculate_res('6;13;37;22', '+;-;*; div ', 105)) w2
where w1.combination = w2.combination


