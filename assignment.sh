#pkill -9 -f bitcoind (to start over)
# cd /Users/amaliesander/Library/Application\ Support/Bitcoin/regtest/wallets 
#rm -rf mywallet (remove old wallet)
#bitcoind -regtest -daemon
#bitcoin-cli createwallet mywallet
#bitcoin-cli -regtest settxfee 0.00001
#bitcoin-cli -regtest generatetoaddress 101 $(bitcoin-cli -regtest getnewaddress)


echo Check balance: | tee -a terminal.txt
bitcoin-cli -regtest getbalance | tee -a terminal.txt

echo Create new address: | tee -a terminal.txt
bitcoin-cli -regtest getnewaddress | tee -a terminal.txt >> name.txt

echo Send bitcoin to the new address: | tee -a terminal.txt
bitcoin-cli -regtest sendtoaddress "$(<name.txt)" 0.1 | tee -a terminal.txt

echo List unspent transactions | tee -a terminal.txt
bitcoin-cli -regtest listunspent 0 | tee -a terminal.txt


