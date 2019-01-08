# StudyPlan_JavaWeb
## 基于Spring+SpringMVC+ajax+SQL Server开发的学习打卡系统介绍和下载
<!-- toc -->

- [一、项目简介](#%E4%B8%80%E9%A1%B9%E7%9B%AE%E7%AE%80%E4%BB%8B)
- [二、业务流程](#%E4%BA%8C%E4%B8%9A%E5%8A%A1%E6%B5%81%E7%A8%8B)
- [三、 系统功能](#%E4%B8%89-%E7%B3%BB%E7%BB%9F%E5%8A%9F%E8%83%BD)
- [四、运行截图](#%E5%9B%9B%E8%BF%90%E8%A1%8C%E6%88%AA%E5%9B%BE)
- [五、项目下载使用](#%E4%BA%94%E9%A1%B9%E7%9B%AE%E4%B8%8B%E8%BD%BD%E4%BD%BF%E7%94%A8)

<!-- tocstop -->
###### 联系方式:
**CSDN博客**:https://blog.csdn.net/weiyang_tang/article/details/86068343

**Email**:702185070@qq.com

在使用中任何问题,可以直接和我们小组团队联系
***********
### 一、项目简介
>这是是我们的一个软件工程的课程设计作业,这个题目是我们大黄同学（才思敏捷）想出来的,他可是软硬件通吃的大佬(1号老板),我们老王同学（劳苦功高,2号老板）负责了软工的各种图(软件结构图,业务流程图,ER图绘制),还有报告的撰写,我是两位老板的小员工,负责完成两位老板的绘制的设计蓝图。
### 二、业务流程
>学习计划打卡系统,顾名思义就是在学习阶段进行打卡,激励学生学习。教师发布学习计划，学生选择学习计划，学生进行每日打卡，学生查看打卡情况，学生提交计划验收的报告成果文件，教师查看自己发布的学习计划学生打卡情况统计，教师验收学生提交的成果报告，并给分，学生查询自己计划验收情况，查看自己的总积分
### 三、 系统功能
功能列表:
1. 首页index.html是对我们这个项目的基本介绍,和系统登录注册的入口
2. 登录注册功能,可以使用学生端和教师端进行注册和登录
3. 学生端和教师端对自身信息进行查看修改(除账号和积分不能修改),修改用户头像
4. 教师端发布学习计划,按学习计划的类型(为简化操作,本项目直接用学科名替代,在数据库有单独的表,可以进行添加修改),提交计划相关资料文件
5. 学生端根据计划类型查询学习计划,查看具体的学习计划的内容,进行计划选择
6. 学生端进入自己的计划列表找到自己的学习计划进行打卡,打卡记录今日学习时长,设定了每日只能打卡0-5小时(不包括0)
7. 学生端进入学习计划列表,完成学习计划的,进行提交计划验收所需的总结报告相关文件上传
8. 教师端对学生提交的验收所需的报告文件进行下载验收评分(评分暂时只要满足大于0即可
9. 教师端查看自己发布的学习计划学生的打卡情况
10. 学生端查看自己的打卡时长
11. 学生端看自己的计划验收情况(教师是否已经验收,验收评分)
12. 学生在个人信息可以查看自己的总积分
### 四、运行截图
1. 首页index.html是对我们这个项目的基本介绍,和系统登录注册的入口
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108120907385.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
2. 登录注册功能,可以使用学生端和教师端进行注册和登录
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108121216747.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108121259710.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
3. 学生端和教师端对自身信息进行查看修改(除账号和积分不能修改),修改用户头像
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108121420521.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
**个人信息展示**
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108121535674.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
**模态框修改个人信息**
4. 教师端发布学习计划,按学习计划的类型(为简化操作,本项目直接用学科名替代,在数据库有单独的表,可以进行添加修改),提交计划相关资料文件
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108121759608.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
**日期选择器My97Date挺好用的,开始日期只能选今天以后的,且不能大于截止日期**
5. 学生端根据计划类型查询学习计划,查看具体的学习计划的内容,进行计划选择
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108122020588.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
**计划类型,分页处理**
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108122214935.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108122307707.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
**计划查看和选择,相关资料下载**
6. 学生端进入自己的计划列表找到自己的学习计划进行打卡,打卡记录今日学习时长,设定了每日只能打卡0-5小时(不包括0)
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108122422182.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108122506841.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
7. 学生端进入学习计划列表,完成学习计划的,进行提交计划验收所需的总结报告相关文件上传
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108122818704.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
8. 教师端对学生提交的验收所需的报告文件进行下载验收评分(评分暂时只要满足大于0即可
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/20190108122927309.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
9. 教师端查看自己发布的学习计划学生的打卡情况
10. 学生端查看自己的打卡时长
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/2019010812265851.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
11. 学生端看自己的计划验收情况(教师是否已经验收,验收评分)
![watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70](https://img-blog.csdnimg.cn/2019010812302796.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXlhbmdfdGFuZw==,size_16,color_FFFFFF,t_70)
12. 学生在个人信息可以查看自己的总积分
### 五、项目下载使用
github :[GitHub - weiyangtang/StudyPlan_JavaWeb: 基于SpringMVC框架开发的学习计划打卡系统,采用SQLserver2014数据库,多人合作项目](https://github.com/weiyangtang/StudyPlan_JavaWeb)
开发工具;Tomcat8.5+eclipse EE+SQL server2014
数据库:会清空,所以需要自己注册账号,自己上传头像等
数据库文件保存在webcontext->webInfo->database 自行附加数据库
