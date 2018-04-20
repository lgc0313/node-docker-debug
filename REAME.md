# debug运行在docker中的nodejs应用

## 背景

本文记录了本地开发nodejs应用，并借助webstorm在docker中进行debug的过程。

### 准备一个node工程

创建一个简单的koa2 hello world demo,代码如下：

![koa](http://onpx1lohg.bkt.clouddn.com/FhDX4ge5TDKpeqXgqMJaQvKHgH27.png)

### 增加DockerFile 文件

![dockerfile](/var/folders/nk/wszhvngs6pb2t2kkmk87gqfc0000gn/T/abnerworks.Typora/image-20180420161118470.png)

### 加入docker-compose.yml文件

![yml](/var/folders/nk/wszhvngs6pb2t2kkmk87gqfc0000gn/T/abnerworks.Typora/image-20180420162454216.png)

启动命令—inspect=0.0.0.0:9229，这样就可以远程debug。  

volume:把本地目录挂载到容器中，这样本地修改文件后，nodemon发现文件修改，就会重启服务。

### 配置webstrom debug

![step1](http://onpx1lohg.bkt.clouddn.com/FkoOhDaoSPjMuTz7y5-Kdp0rVfN6.png)

![step2](http://onpx1lohg.bkt.clouddn.com/Fq6W77pE4oKs7wQW7UIHUDwg0-v7.png)

### 开始debug

终端输入命令`docker-compose up`

![debug1](http://onpx1lohg.bkt.clouddn.com/FgkK5qpX0X6hL_ufk4s63HerC7nI.png)

 ![docker started](http://onpx1lohg.bkt.clouddn.com/FilNubqmodx8u_xFWyCOvFrTR6Gx.png)

### 点击debug按钮

![debug2](/var/folders/nk/wszhvngs6pb2t2kkmk87gqfc0000gn/T/abnerworks.Typora/image-20180420162912399.png)

浏览器输入http://localhost:3000,成功进入断点。

![ok](/var/folders/nk/wszhvngs6pb2t2kkmk87gqfc0000gn/T/abnerworks.Typora/image-20180420163044164.png)

### 代码修改实时刷新 

修改代码，输出为`Hello Koa2`,不用重启服务，再次在浏览器中访问`http://localhost:3000`，返回了正确的结果。

![result](http://onpx1lohg.bkt.clouddn.com/FvLTRJHJGtjNKn8eQsLFsrv3gPvf.png)


[实例代码地址](https://github.com/lgc0313/node-docker-debug)