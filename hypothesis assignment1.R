Cutlets <- read_csv("C:/Users/DELL/Desktop/hypothesis/Cutlets.txt")
View(Cutlets)
A<-Cutlets$`Unit A`
B<-Cutlets$`Unit B`
t.test(A,B,alternative = "two.sided")
