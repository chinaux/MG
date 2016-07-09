//
//  MG.h
//  MiGu
//
//  Created by lichen on 16/7/9.
//  Copyright (c) 2016年 lichen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stock : NSObject{
    NSString *stock_code;
    NSString *stock_name;
    NSMutableArray *stock_py_array;
}
-(void) myInit:(NSString*)code sec:(NSString*)name;
-(void) setPYatPos:(NSString *)py sec:(int) idx;
-(bool) Has:(NSString *)py sec:(int) idx;
-(NSString*) stock_name;
-(void) Print;

@end

@interface MG : NSObject {
@public NSString *_name;
@public int _age;
@public NSString *_nation;
@public int height;
@public NSMutableDictionary *zyDict;
@public NSMutableArray *stockArray;
}
//声明一个动态方法，没有返回值
-(void) myInit;
-(void) setName:(NSString *)name;
-(void) loadDictFile:(NSString *) dictFile;
-(void) loadStockFile:(NSString *) stockFile;
//声明一个静态方法，没有返回值
+(void) showMessage:(NSString *)info;

-(NSString*) AB;
-(NSString*) setPoem:(NSString *)poem;
@end
