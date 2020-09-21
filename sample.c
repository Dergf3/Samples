#include <stdio.h>

int find(int arr[], int size, int key){
	for(int i = 0; i<size; i++){ 	//Goes through entire array list, using a basic int value, the size int as limit, and increments by 1
		if(key == arr[i]){	//If the key matches array at position i, then it returns i.
			return i;

		}						}
	return -1;			//If the loop does not find a match, return 0.
}

int main(void){
	int arr[] = {5,10,8,2,13};
	int size = 5;
	int key1 = 10;
	int key2 = 20;
	int result = 0;						//The position of the query, later used to be set equal to the int returned by the find function

	printf("Integers in Array: ");
	for(int i = 0; i<size; i++){				//Loop for printing the entire array		
		printf("%d ",arr[i]);
	}

	result = find(arr,size,key1);				//Searches for first query key
	printf("\nResult for query key 10: %d", result);

	result = find(arr,size,key2);//Searches for second query key
	printf("\nResult for query key 20: %d\n", result);
}
