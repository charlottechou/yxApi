# yxApi

高校迎新系统后端

## 数据库文件

数据库位于 App_Data 下面，将它添加到 Sql Server 服务器。
右击属性查看数据库链接字符串，到 appsettings.json 修改 conStr。

## 新建对应 model 的 DAO

位于 DbHelper 文件夹下的 ModelDao 文件夹，模仿 AdminDao.cs 新建类继承自 DaoBase，实现相应的操作数据库操方法
