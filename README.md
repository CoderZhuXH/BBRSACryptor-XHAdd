# BBRSACryptor+XHCategory

## 1.RSA 一般加密流程:
* 0.生成公钥,私钥,客户端保存公钥,服务器保存私钥
* 1.客户端 数据 公钥加密后 发给服务器,
    服务器 收到数据后 利用私钥 解密 还原数据
* 2.服务器 私钥加密 数据 返回给 客户端,
    客户端 收到后数据后 利用公钥解密 还原数据

## 2.使用方法:

```objc
/**
*  生成公钥,私钥 (生成成功后控制台会打印出 公钥,私钥 存储路径)
*/
+(void)createPublicKeyAndPrivateKey;

/**
*  公钥加密
*
*  @param string 普通字符串
*
*  @return  加密后的字符串
*/
+(NSString *)RSAPublicKeyEncryptString:(NSString *)string;

/**
*  公钥解密
*
*  @param string 服务器返回的私钥加密字符串
*
*  @return 解密后字符串
*/
+(NSString *)RSAPublicKeyDecodingString:(NSString *)string;

```
