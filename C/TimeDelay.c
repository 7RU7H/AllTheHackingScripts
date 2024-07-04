
// This is function for delay shellcode execution from Jon Guild's Sliver for OSEP talk: https://www.youtube.com/watch?v=YwiSqdIhl9g

int TimeDelayComparison()
{
	clock_t start_t, end_t;
	double total_t;
	int i = 6;

	start_t = clock();
	Sleep(i * 1000);
	end_t = clock();

	if (((double)end_t - start_t) / CLOCKS_PER_SEC) < i) {
		exit(0);
	}
	total_t = (double)(end_t - start_t) / CLOCKS_PER_SEC;

	return(0);
}
