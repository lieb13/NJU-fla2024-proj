# <center> FLA实验报告
### <center> 221900133 赖昱萌

## 分析与设计思路
### Class
基础设计是写一个基类AutoMation，然后PDA和TM各写一个类继承它。PDA和TM相似的部分在于状态集，输入符号集，开始状态以及终结状态。他们配套的一些函数放在基类里。

对于转移使用两个tuple组成的map。 对于TM的"*"则是在读取到转移时枚举所有的符号，向map中加入所有可能的转移。
### parser
解析#后的字符串后依次填充对应的元素。

### simulater
每步转移在map中寻找即可。PDA优先走完可能的Epsion边。

### exception
分为illegal input 和 syntax error两种类型，分别建立一个类。然而检查符号/状态不属于符号集/状态集的错误两种错误类型皆有可能发生，故用MyException类继承了两种类

## 实验完成度
完成了TM和PDA的基础模式，完成了TM的verbose模式。完成了要求的一个PDA和两个TM的编写

额外实现了简单的PDAverbose模式，能够指出.pda程序和输入中的具体错误，并对程序的运行细节进行简单展示
## 实验中遇到的问题及解决⽅案
有很多东西是现学的所以搞得不是很明白。本来想把simulater(string input)作为Automation类的虚函数然后让PDA和TM继承并覆写，但是出现了奇怪的vtable报错最后只好放弃

以及linux和windows环境略有不同
## 总结感想
写的还是挺开心的，也感觉到自己的代码水平非常低

## 对课程和实验的意⻅与建议
