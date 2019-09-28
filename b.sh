#!/bin/bash -e 

: '
git branch br1
git checkout br1
git reset --hard d2ef799a9679995f7243f4a86bc009b61974cf5d
git push origin master
git branch br2
git checkout br2
git reset --hard e7690739fcbe51643389852d17ef8f3c34fe91b7
git branch br3
git checkout br3
git reset --hard aba63c773306b225357978ff36638e16fb046e55
git branch br4
git checkout br4
git reset --hard eed4cdc95196df1cc19c56c1e5c2de76a10874ed
git branch br5
git checkout br5
git reset --hard 9eee725198323ef84859b461b39119432ebfc87a

'

for i in d2ef799a9679995f7243f4a86bc009b61974cf5d e7690739fcbe51643389852d17ef8f3c34fe91b7 aba63c773306b225357978ff36638e16fb046e55 
do
        echo $i
	git reset --hard origin/master
	git reset --hard $i
done

