#! /bin/bash
export CUDA_VISIBLE_DEVICES=4,5,6,7

for init_seed in 0; do
	for partition in noniid-#label2; do 
		for alg in fedavg; do 
			python experiment_per.py \
				--model=simple-cnn \
				--dataset=mnist \
				--alg=$alg \
				--lr=0.01 \
				--batch-size=64 \
				--epochs=5 \
				--n_parties=10 \
				--rho=0.9 \
				--comm_round=50 \
				--partition=$partition \
				--beta=0.5\
				--device='cuda:0'\
				--datadir='./data/' \
				--logdir='./logs/' \
				--noise=0 \
				--init_seed=$init_seed \
				--per
		done;
		
		# for mu in  0.01
		# do 
		# 	python experiments.py --model=mlp \
		# 		--dataset=femnist \
		# 		--alg=fedprox \
		# 		--lr=0.01 \
		# 		--batch-size=64 \
		# 		--epochs=10 \
		# 		--n_parties=10 \
		# 		--rho=0.9 \
		# 		--mu=$mu
		# 		--comm_round=50 \
		# 		--partition=$partition \
		# 		--beta=0.5\
		# 		--device='cuda:0'\
		# 		--datadir='./data/' \
		# 		--logdir='./logs/' \
		# 		--noise=0\
		# 		--init_seed=$init_seed	
		# done;
		
	done;
done;
