#include<stdio.h>
int totalnum;
int data[10000];
int QS(int low, int high)
{
    int first;
    int last;
    int key;
    int funtmp;
    int input1;
    int input2;
    int tmpfirst;
    int tmplast;
    first = low;
    last  = high;
    key = data[first];
    if(low >= high){
        return 0;
    }
    while(first < last)
    {
        while((first<last) && (data[last]>=key)){ 
            last=last-1;
            printf("cut1");
        }
        funtmp=data[last];
        data[first] = funtmp;
        while((first<last) && (data[first]<=key)){
            first=first+1;
            printf("cut2");
        }
        printf("cut3");
        funtmp= data[first];
        data[last]=funtmp;
    }
    data[first] = key;
    input1=first-1;
    input2=first+1;
    QS(low, input1);
    QS(input2, high);
    return 0;
}
int main(){
    int tmp;
    int i;
    int indextotalnum;
    scanf("%d",&totalnum);
    i=0;
    indextotalnum=totalnum-1;
    while(i<totalnum){
        scanf("%d",&tmp);
        data[i]=tmp;
        i=i+1;
    }
    QS(0,indextotalnum);
    i=0;
    while(i<totalnum){
        tmp=data[i];
        printf("%d",tmp);
        i=i+1;
    }
    return 0;
}