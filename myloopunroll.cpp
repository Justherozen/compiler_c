#include <cstring>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <stdio.h>
using namespace std;

ifstream infile;
ifstream infile2;
ofstream outfile;  
int findfile(string findstr){
    string line;
    while (getline(infile2,line))
	{
        if (line.find(findstr)!=string::npos){
            return 1;
        }
        
    }
    return 0;
}
int main(){
//打开cpp文件
    char filename[] = "loop_test.txt";
	infile.open(filename);
    infile2.open(filename);
	char newfile[] = "loop_test_new.txt";
	outfile.open(newfile);
	string line;
    int inwhile=0;
    int findwhile=0;
    int findback=0;
    int stopout=0;
    int nextbegin=0;
    string tarstr;
    while (getline(infile,line))
	{   
        string checkwhile=line.substr(0,5);
        if(nextbegin=1){
            stopout=0;
        }
        if(checkwhile=="while"&&findwhile==0){
            inwhile=1;
            findwhile=1;
        }
        else if(checkwhile=="while"&&findwhile==1){
            inwhile=1;
            nextbegin=1;
            continue;
        }

        if(inwhile=1){
            int equalindex=0;
            if(line.find("=")!=string::npos&&line[0]=='a'){
                infile2.open(filename);
                equalindex=line.find("=");
                tarstr=line.substr(0,equalindex);
                if (findfile(tarstr)==0){
                    continue;
                }
            }
        }

        if(line.find("}")!=string::npos&&findback==0){
            inwhile=0;
            stopout=1;
            findback=1;
        }
        if(stopout==0){
         outfile << line<<endl;
         cout<<line<<endl;
        }
    
    }
    infile.close();
    infile2.close();
    outfile.close();
    return 0;
}
    /*ifstream infile;
	ofstream outfile;  
	infile.open(filename);
	char newfile[] = "temp_new.txt";
	outfile.open(newfile);
	string line;
    vector<string>allbefore,allafter;
	// 读取每一行
	while (getline(infile,line))
	{   
        string before, after;
		before=readef(before, line,2); 
        //cout << before<<endl;
		after=readef(after, line, 3);
        //cout << after<<endl;
        if(before!=""){
        allbefore.push_back(before);
        }
        if(after!=""){
            allafter.push_back(after);
        }
    }
    int endindex=0;
    for (int i=0;i<allbefore.size();i++){
        if(i==allbefore.size()-1){

            endindex=1;
        }
        string before, after;
        before=allbefore[i];
        after=allafter[i];
        ifstream infile;
        infile.open(filename);
        ofstream outfile;
	    outfile.open(newfile);
        if(before.find("(")==string::npos){
            //cout<<before;
            while (getline(infile,line))
            {   //cout<<("begin2");
                if(line.substr(0,7)=="#define"){
                    //cout<<"error1";
                    continue;
                }
                if((line.find("\\")!=string::npos)||(line.find("\"")!=string::npos)){
                    //cout<<"error2";
                    continue;
                }
                if(line.find(before)==string::npos){
                    //cout<<"error3";
                    outfile << line<<endl;
                }
                else{
                    //cout<<("begin");
                    int index=0;
                    while(line.find(before,index)!=string::npos){
                        index=line.find(before,index);
                        line=line.replace(index,before.length(),after);
                        index++;
                    }
                    outfile << line<<endl;
                }
            }
            infile.close();
	        outfile.close();
            if(endindex==0){
            remove(filename);
	        int c =rename(newfile, filename);
            }
            
        }
        else{
             vector<string>tokenbefore;
            vector<string>tokenafter;
            int index=before.find("(");
            int index2=before.find(")");
            int commaindex=index;
           // cout<<before;
            //cout<<after;
            do{
                string tempstr;

                if(before.find(",",commaindex+1)!=string::npos){
                tempstr=before.substr(commaindex+1,before.find(",",commaindex+1)-commaindex-1);
                commaindex=before.find(",",commaindex+1);
                }
                else {
                 tempstr=before.substr(commaindex+1,before.find(")",commaindex+1)-commaindex-1);
                 commaindex=before.find(")",commaindex+1);
                }
                
                tokenbefore.push_back(tempstr);
               // cout<<tempstr<<" ";
            }while(before.find(",",commaindex+1)!=string::npos||before.find(")",commaindex+1)!=string::npos);
           

            string beforesymbol;
            beforesymbol=before.substr(0,index+1);
           // cout<<beforesymbol;
            while (getline(infile,line))
            {   //cout<<("begin2");
                if(line.substr(0,7)=="#define"){
                    //cout<<"error1";
                    continue;
                }
                if((line.find("\\")!=string::npos)||(line.find("\"")!=string::npos)){
                    //cout<<"error2";
                    continue;
                }
                if(line.find(beforesymbol)==string::npos){
                    //cout<<"error3";
                    outfile << line<<endl;
                }
                else{
                    //cout<<("begin");
                    //cout<<beforesymbol<<" "<<before;
                    int indexfind=0;
                    while(line.find(beforesymbol,indexfind)!=string::npos){
                        indexfind=line.find(beforesymbol,indexfind);
                        commaindex=indexfind+beforesymbol.length()-1;
                    do{
                        string tempstr;
                        if(line.find(",",commaindex+1)!=string::npos){
                        tempstr=line.substr(commaindex+1,line.find(",",commaindex+1)-commaindex-1);
                        commaindex=line.find(",",commaindex+1);
                        }
                        else {
                            tempstr=line.substr(commaindex+1,line.find(")",commaindex+1)-commaindex-1);
                            commaindex=line.find(")",commaindex+1);
                        }
                        
                        tokenafter.push_back(tempstr);
                        //cout<<tempstr<<" ";
                    }while(line.find(",",commaindex+1)!=string::npos||line.find(")",commaindex+1)!=string::npos);

                            line=line.replace(indexfind,before.length(),after);
                            //cout<<line<<endl;
                    }
                     for (int i=0;i<tokenbefore.size();i++){
                            string nbefore, nafter;
                            nbefore=tokenbefore[i];
                            nafter=tokenafter[i];
                            //cout<<nbefore<<endl;
                            //cout<<nafter<<endl;
                            int index=0;
                            while(line.find(nbefore,index)!=string::npos){
                                index=line.find(nbefore,index);
                                line=line.replace(index,nbefore.length(),nafter);
                                index++;
                            }
                     }
             
                    outfile << line<<endl;
                }
            }
            infile.close();
            outfile.close();
            //删除旧文件，将新文件改名
            
            if(endindex==0){
                remove(filename);
	        int c =rename(newfile, filename);
            }

        }
    }


	//删除旧文件，将新文件改名
    return;
}



}*/