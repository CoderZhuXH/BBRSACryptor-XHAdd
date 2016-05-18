# BBRSACryptor+XHAdd

## 1.RSA算法2个作用:
* 1.加密:客户端使用公钥加密数据,服务器端使用私钥解密数据(主要实现数据加密)。
* 2.加签:客户端用私钥加签,服务器端用公钥验签(主要为了防止别人模拟我们的客户端来攻击我们的服务器,导致瘫痪)。

## 2.RSA客户端与服务器交互流程
### 1.公钥私钥生成,保存
* 1.客户端生成一对公钥私钥,假如叫公钥K、私钥K,<br>
    服务器生成一对公钥私钥,假如叫公钥F、私钥F.
* 2.客服端把公钥K 发给服务器,服务器保存公钥K,<br>
    服务器把公钥F 发给客服端,客服端保存公钥F.<br>
    (公钥都发给对方,自己保留私钥)

### 2.加密交互流程
* 1.客服端用公钥F加密数据,服务器接收后,用私钥F解密.<br>
    服务器用公钥K加密数据,客服端接收后,用私钥k解密.

### 3.签名交互流程
* 1.客服端用私钥k签名,服务器用公钥k验证签名
  
## 3.导入步骤
* 1.将RSALibary文件夹加入工程
* 2.在TARGETAS-Build Settings中配置Header Search Pathes 添加文件搜索相对路径 ./RSALibary/OpenSSL/include
* 3.导入BBRSACryptor+XHAdd.h，使用[BBRSACryptor createPublicKeyAndPrivateKey]生成公钥,私钥
* 4.运行后，在控制台会打印出证书路径，进入路径后，可以看到公钥证书(bb.publicKey.pem)和私钥证书(bb.privateKey.pem),将两证书拷贝到桌面.pem后缀改为.txt并打开,将—–BEGIN PUBLIC KEY—–和—–END PUBLIC KEY—–之间的部分复制，新建一个宏，来保存这个公钥(宏定义时,公钥中若有换行,记得删除),客户端仅保存公钥即可，私钥放在服务器上。

## 4.使用方法:

```objc
/**
*  生成公钥,私钥 (生成成功后控制台会打印出 公钥,私钥 存储路径)
*/
+(void)createPublicKeyAndPrivateKey;

/**
*  公钥加密
*
*  @param string    普通字符串
*  @param publicKey 公钥
*
*  @return 加密后字符串
*/
+(NSString *)encryptString:(NSString *)string publicKey:(NSString *)publicKey;

/**
*  公钥解密
*
*  @param string    私钥加密字符串
*  @param publicKey 公钥
*
*  @return 解密后字符串
*/
+(NSString *)decodingString:(NSString *)string publicKey:(NSString *)publicKey;

/**
*  私钥加密
*
*  @param string     普通字符串
*  @param privateKey 私钥
*
*  @return 加密后字符串
*/
+(NSString *)encryptString:(NSString *)string privateKey:(NSString *)privateKey;

/**
*  私钥解密
*
*  @param string     公钥加密字符串
*  @param privateKey 私钥
*
*  @return 解密后字符串
*/
+(NSString *)decodingString:(NSString *)string privateKey:(NSString *)privateKey;

/**
*  私钥签名
*
*  @param string     普通字符串
*  @param privateKey 私钥
*
*  @return 签名后字符串
*/
+(NSString *)singString:(NSString *)string privateKey:(NSString *)privateKey;

/**
*  私钥签名MD5
*
*  @param string     普通字符串
*  @param privateKey 私钥
*
*  @return 签名后字符串
*/
+(NSString *)singMD5String:(NSString *)string privateKey:(NSString *)privateKey;

/**
*  RSA sha1 验证签名
*
*  @param string     普通字符串
*  @param signString 签名字符串(base64)
*  @param publicKey  公钥
*
*  @return 验证结果
*/
+(BOOL)verifyString:(NSString *)string sign:(NSString *)signString publicKey:(NSString *)publicKey;

/**
*  RSA MD5 验证签名
*
*  @param string     普通字符串
*  @param signString 签名字符串
*  @param publicKey  公钥
*
*  @return 验证结果
*/
+(BOOL)verifyMD5String:(NSString *)string sign:(NSString *)signString publicKey:(NSString *)publicKey;

```
