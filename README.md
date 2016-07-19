### 项目简要介绍
1. 该项目是androider网站的web应用,前后端分离开发,后端是使用采用sparkframework框架开发的,前后端使用json格式的文本进行通信。
2. 后端api采用Restful风格。
3. 项目使用gradle进行构建,有common、model、bbs三个moudle:

``` 
1. bbs : 网站主体的论坛的模块;
2. model模块是所有数据的管理模块,向bbs业务模块提供数据的增删改查服务;
3. common模块是一些常用的工具类、常用业务操作的简单封装;
4. model、common都是业务无关的模块、bbs是业务相关的。
5. bbs模块需要依赖common、model模块,而common和model之间不存在依赖关系。
```


### 项目配置
1. 项目使用gradle构建,使用到了mavenCentral仓库的依赖,所以务必保证开发机器上可以正常使用gradle和mavenCentral。
2. 项目中用到了lombok依赖,必须在intelliJ Idea中安装lombok插件。
3. 项目中使用的JDK版本为1.8+。

### 已完成


### 进行中..
1.基础controller的开发
2.请求分发器

### TODO
1.用户注册功能
2.用户认证功能，独立于业务的认证功能模块
3.解决多个数据库时的配置及使用问题


