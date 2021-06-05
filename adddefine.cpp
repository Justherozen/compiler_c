#include <cstring>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
using namespace std;
string def(string before, string after, string line);
bool same(string before, string line, int i);
string readef(string out,  string line,int count);

//替换
string def(string before,string after,string line)
{
	for (unsigned int i = 0; i < line.size(); i++)
	{
		//#define行与注释行与字符串内不替换
		if (line[i] == '/' || line[i] == '#'||line[i]=='\"')
			break;
		if (line[i] == before[0]&&same(before, line, i))
		{
			line.replace(i,before.size(),after);
			break;
		}

	}
	return line;

}

//判定字符串中的一段是否与宏定义相同
bool same(string defstr, string line, int i) 
{
	bool isame =false;
	string in=defstr;
	for (unsigned int index = 0;( index < defstr.size())&&((i+index)<line.size()); index++)
	{
		in[index] = line[i + index];
	}
	if (defstr == in)
		isame = true;
	return isame;
}

//读取宏定义
string readef(string out,string line,int count)
{
	for (unsigned int index = 0; index < line.size(); index++)
	{
		if (line[index] == '#'&&same("#define", line, index))
		{
			//define行用空格分隔 直到需要的第count个字串  
			istringstream istr(line);
			int number = 1;
			while (istr >> out)
			{
				if (number++ == count)
					break;
			}
			break;
		}
	}
	return out;
}
int main()
{
//打开cpp文件
	ifstream infile;
	ofstream outfile;
	char filename[] = "test.txt";    
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
        cout << before<<endl;
		after=readef(after, line, 3);
        cout << after<<endl;
        allbefore.push_back(before);
        allafter.push_back(after);
    }
    cout<<allafter.size();
	infile.close();
	outfile.close();
	//删除旧文件，将新文件改名
    return 0;
}

