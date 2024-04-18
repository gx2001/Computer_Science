#include <string.h>
#include "bench.h"
#include "../engine/db.h"
#include "../engine/variant.h"

#define DATAS ("testdb")

DB* db;

void _open_db(){	
	db = db_open(DATAS);
}

void _close_db(){
	db_close(db);
}

long int find_rate(long int count, int threads){
	long int counter;
	counter = count/threads; // to distribute into threads the puts 
	return counter;
}
	

void _write_test(long int count, int r, int threads){
	
	int i;
	long int counter;
	double cost;
	long long start,end;
	Variant sk, sv;
	//DB* db; // already done in bench.c

	char key[KSIZE + 1];
	char val[VSIZE + 1];
	char sbuf[1024];

	//db = db_open(DATAS); // already done in bench.c


	memset(key, 0, KSIZE + 1);
	memset(val, 0, VSIZE + 1);
	memset(sbuf, 0, 1024);

	start = get_ustime_sec();
	//counter = count/threads; // to distribute into threads the puts 
	counter = find_rate(count, threads);
	for (i = 0; i < counter; i++) {
		if (r)
			_random_key(key, KSIZE);
		else
		snprintf(key, KSIZE, "key-%d", i);
		fprintf(stderr, "%d adding %s\n", i, key);
		snprintf(val, VSIZE, "val-%d", i);

		sk.length = KSIZE;
		sk.mem = key;
		sv.length = VSIZE;
		sv.mem = val;

		//db_add(db, &sk, &sv); maybe remove later because of bence.c
		if ((i % 10000) == 0) {
			fprintf(stderr,"random write finished %d ops%30s\r", 
					i, 
					"");

			fflush(stderr);
		}
	}

	//db_close(db); // already done in bench.c

	end = get_ustime_sec();
	cost = end - start; // the time in seconds that a operation needs to be done 

	pthread_mutex_lock(&total_writes);
	cost_of_writes = cost_of_writes+cost; //unknown
	pthread_mutex_unlock(&total_writes);

	/*printf(LINE);
	printf("|Random-Write	(done:%ld): %.6f sec/op; %.1f writes/sec(estimated); cost:%.3f(sec);\n"
		,counter, (double)(cost / counter)
		,(double)(counter / cost)
		,cost);	*/
}

void _read_test(long int count, int r, int threads){
	
	int i;
	long int counter;
	int ret;
	int found = 0;
	double cost;
	long long start,end;
	Variant sk;
	Variant sv;
	//DB* db; // already done in bench.c
	char key[KSIZE + 1];

	//db = db_open(DATAS); //already done in bench.c
	start = get_ustime_sec();
	//counter = count/threads; //to distribute into threads the puts 
	counter = find_rate(count, threads);
	for (i = 0; i < counter; i++) {
		memset(key, 0, KSIZE + 1);

		/* if you want to test random write, use the following */
		if (r)
			_random_key(key, KSIZE);
		else
			snprintf(key, KSIZE, "key-%d", i);
		fprintf(stderr, "%d searching %s\n", i, key);
		sk.length = KSIZE;
		sk.mem = key;
		//sleep(0,10);
		ret = db_get(db, &sk, &sv);
		if (ret) {
			//db_free_data(sv.mem);
			found++;
		} else {
			INFO("not found key#%s", 
					sk.mem);
    	}

		if ((i % 10000) == 0) {
			fprintf(stderr,"random read finished %d ops%30s\r", 
					i, 
					"");

			fflush(stderr);
		}
	}
	//db_close(db); //already done in bench.c
	end = get_ustime_sec();
	cost = end - start;

	pthread_mutex_lock(&total_reads);
	cost_of_reads = cost_of_reads+cost; //unknown
	pthread_mutex_unlock(&total_reads);
	
	/*printf(LINE);
	printf("|Random-Read	(done:%ld, found:%d): %.6f sec/op; %.1f reads /sec(estimated); cost:%.3f(sec)\n",
		counter, found,
		(double)(cost / counter),
		(double)(counter / cost),
		cost);*/
}
