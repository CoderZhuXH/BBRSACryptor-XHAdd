//
//  BBRSACryptor+XHCategory.m
//  BBRSACryptor+XHCategory
//
//  Created by xiaohui on 16/5/10.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "BBRSACryptor+XHCategory.h"

@implementation BBRSACryptor (XHCategory)

/**
 *  生成公钥,私钥
 */
+(void)createPublicKeyAndPrivateKey
{
    BBRSACryptor *reaCryptor = [[BBRSACryptor alloc] init];
    [reaCryptor generateRSAKeyPairWithKeySize:1024];
}
/**
 *   公钥加密
 *
 *  @param string 普通字符串
 *
 *  @return  加密后的字符串
 */
+(NSString *)RSAPublicKeyEncryptString:(NSString *)string
{
    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    [rsaCryptor importRSAPublicKeyBase64:RSAPublicKey];
    
    NSData *data = [rsaCryptor encryptWithPublicKeyUsingPadding:RSA_PADDING_TYPE_PKCS1 plainData:[string dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *laterString = [GTMBase64 stringByEncodingData:data];
    //NSLog(@"公钥加密:\n%@",laterString);
    return laterString;
}

/**
 *  公钥解密
 *
 *  @param string 服务器返回的私钥加密字符串
 *
 *  @return 解密后字符串
 */
+(NSString *)RSAPublicKeyDecodingString:(NSString *)string
{
    BBRSACryptor *rsaCryptor = [[BBRSACryptor alloc] init];
    [rsaCryptor importRSAPublicKeyBase64:RSAPublicKey];
    
    NSData *data =[GTMBase64 decodeData:[string dataUsingEncoding:NSUTF8StringEncoding]] ;
    NSData *laterData = [rsaCryptor decryptWithPublicKeyUsingPadding:RSA_PADDING_TYPE_PKCS1 cipherData:data];
    NSString *laterString =[[NSString alloc] initWithData:laterData  encoding:NSUTF8StringEncoding];
    //NSLog(@"公钥解密:\n%@",laterString);
    return laterString;
}
@end
