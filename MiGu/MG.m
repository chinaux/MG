//
//  MG.m
//  MiGu
//
//  Created by lichen on 16/7/9.
//  Copyright (c) 2016年 lichen. All rights reserved.
//

#import "MG.h"

@implementation Stock


-(void) myInit:(NSString*)code sec:(NSString*)name{
    
    stock_code = [NSString  stringWithString:code];
    stock_name = [NSString  stringWithString:name];
    
    stock_py_array = [[NSMutableArray alloc] init];
}
-(void) setPYatPos:(NSString *)py sec:(int) idx{
    [stock_py_array insertObject:py atIndex:idx];
}
-(bool) Has:(NSString *)py sec:(int) idx{
    
    if ([stock_py_array[idx] isEqualToString:py]) {
        return true;
    }
    return false;
}

-(void) Print{
    NSLog(@"[code:%@ name:%@ %@ %@ %@ %@]",stock_code,stock_name,stock_py_array[0],stock_py_array[1],stock_py_array[2],stock_py_array[3]);
}

-(NSString*) stock_name{
    return stock_name;
}

@end

@implementation MG

-(void) myInit{
    
    zyDict = [[NSMutableDictionary alloc] init];
    stockArray = [[NSMutableArray alloc] init];
}
//实现一个动态方法
-(void)setName:(NSString *)name{
    _name=name;
}

-(NSString*) AB{
    NSString* abc = [NSString stringWithFormat:@"abc"];
    return abc;
}

-(NSString*)setPoem:(NSString *)poem{
    NSLog(@"\n%@",poem);
    //return @"aaa";
    NSLog(@"%ld",[poem length]);
    NSArray *arrWriterPos =[poem componentsSeparatedByCharactersInSet:
                            [NSMutableCharacterSet whitespaceAndNewlineCharacterSet]];//拆分成数组
    NSLog(@"count:%ld\n",arrWriterPos.count);
    /*
     NSMutableDictionary *peomList[4];
     for (int i=0; i<4; i++) {
     peomList[i] = [[NSMutableDictionary alloc] init];
     }*/
    NSString *poemPY[4][7];
    NSMutableDictionary *muDicAsyncImage = [[NSMutableDictionary alloc] init];
    for (int i=0; i<arrWriterPos.count; i++) {
        NSLog(@"->%d %@ %ld",i,arrWriterPos[i],[arrWriterPos[i] length]);
        for (int j=0; j<7; j++) {
            NSLog(@"%hu",[arrWriterPos[i] characterAtIndex:j]);
            NSString *stock_py = [zyDict objectForKey:[NSNumber numberWithLong:[arrWriterPos[i] characterAtIndex:j]]];
            poemPY[i][j] = stock_py;
        }
    }
    
    //分割每一句诗的每一个字，转换成拼音
    //遍历股票字典，第一个拼音和诗中字拼音一样的结果集
    NSMutableArray * stockArr_0 = [NSMutableArray new];
    for (int j=0; j<7; j++) {
        NSLog(@"shi %@",poemPY[0][j]);
        for (Stock *ss in stockArray) {
            if ([ss Has:poemPY[0][j] sec:0]) {
                [stockArr_0 addObject:ss];
            }
        }
        
    }
    NSLog(@"stockArr_0:%d",stockArr_0.count);
    
    NSMutableArray * stockArr_1 = [NSMutableArray new];
    for (int j=0; j<7; j++) {
        NSLog(@"shi %@",poemPY[1][j]);
        for (Stock *ss in stockArr_0) {
            if ([ss Has:poemPY[1][j] sec:1]) {
                [stockArr_1 addObject:ss];
            }
        }
    }
    NSLog(@"stockArr_1:%d",stockArr_1.count);
    
    NSMutableArray * stockArr_2 = [NSMutableArray new];
    for (int j=0; j<7; j++) {
        NSLog(@"shi %@",poemPY[2][j]);
        for (Stock *ss in stockArr_1) {
            if ([ss Has:poemPY[2][j] sec:2]) {
                [stockArr_2 addObject:ss];
            }
        }
    }
    NSLog(@"stockArr_2:%d",stockArr_2.count);
    
    
    NSMutableArray * stockArr_3 = [NSMutableArray new];
    for (int j=0; j<7; j++) {
        NSLog(@"shi %@",poemPY[3][j]);
        for (Stock *ss in stockArr_2) {
            if ([ss Has:poemPY[3][j] sec:3]) {
                [stockArr_3 addObject:ss];
            }
        }
    }
    NSLog(@"stockArr_3:%d",stockArr_3.count);
    
    if (stockArr_3.count > 0){
        NSMutableString *res = [NSMutableString new];
        for (Stock* stock in stockArr_3 ) {
            [stock Print];
            [res appendString:[stock stock_name]];
        }
        return res;
    }else{
        return @"";
    }
    
    
    //为字典添加对象(键与值都是 id 接受任何类型
    [muDicAsyncImage setObject:@"值1" forKey:@"键1"];
    [muDicAsyncImage setObject:@"值2" forKey:@"键2"];
    //通过键取得值对象
    NSString *str1= [muDicAsyncImage objectForKey:@"键1"];
    NSLog(@"str1:%@",str1);
    NSString *str2= [muDicAsyncImage objectForKey:@"键2"];
    NSLog(@"str2:%@",str2);
    //删除某个对象
    [muDicAsyncImage removeObjectForKey: @"键1"];
    
    return @"";
}

//实现一个静态方法
+(void)showMessage:(NSString *)info{
    NSLog(@"%@",info);
}
-(void) loadStockFile:(NSString *) dictFile{
    
    NSString* fileName = @"stock_simple";
    NSString* fileRoot = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    NSLog(fileRoot);
    NSString* fileContents = [NSString stringWithContentsOfFile:fileRoot encoding:NSUTF8StringEncoding error:nil];
    //NSLog(fileContents);
    NSArray *arr = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSLog(@"%ld",arr.count);
    for (int i=0; i<arr.count; i++) {
        //NSLog(@"->%d %@ %ld",i,arr[i],[arr[i] length]);
        NSString *stock_code = [arr[i] substringToIndex:6];
        NSString *stock_name = [arr[i] substringFromIndex:6];
        //NSLog(@"->%d %@ %@",i,stock_code,stock_name);
        
        long stock_unicode_0 = [stock_name characterAtIndex:0];
        long stock_unicode_1 = [stock_name characterAtIndex:1];
        long stock_unicode_2 = [stock_name characterAtIndex:2];
        long stock_unicode_3 = [stock_name characterAtIndex:3];
        
        
        NSString *stock_py_0 = [zyDict objectForKey:[NSNumber numberWithLong:stock_unicode_0]];
        NSString *stock_py_1 = [zyDict objectForKey:[NSNumber numberWithLong:stock_unicode_1]];
        NSString *stock_py_2 = [zyDict objectForKey:[NSNumber numberWithLong:stock_unicode_2]];
        NSString *stock_py_3 = [zyDict objectForKey:[NSNumber numberWithLong:stock_unicode_3]];
        
        //NSLog(@"->%d %@ %@ [%@ %@ %@ %@]",i,stock_code,stock_name,stock_py_0,stock_py_1,stock_py_2,stock_py_3);
        
        Stock * stock = [[Stock alloc] init];
        [stock myInit:stock_code sec:stock_name];
        [stock setPYatPos:stock_py_0 sec:0];
        [stock setPYatPos:stock_py_1 sec:1];
        [stock setPYatPos:stock_py_2 sec:2];
        [stock setPYatPos:stock_py_3 sec:3];
        
        [stockArray addObject:stock];
        //NSLog(@"%@",stock);
        //if(i > 10)
        //    break;
    }
    
    NSLog(@"%d",stockArray.count);
    //for (Stock* stock in stockArray ) {
    //    [stock Print];
    //}
    
}
-(void) loadDictFile:(NSString *) stockFile{
    
    NSString* fileName = @"convert_utf-8";
    NSString* fileRoot = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    NSLog(fileRoot);
    NSString* fileContents = [NSString stringWithContentsOfFile:fileRoot encoding:NSUTF8StringEncoding error:nil];
    //NSLog(fileContents);
    NSArray *arr = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSLog(@"%ld",arr.count);
    for (int i=0; i<arr.count; i++) {
        NSArray *arr_row = [arr[i] componentsSeparatedByString:@","];
        //NSLog(@"%d %@ %hu",i,arr_row[0],[arr_row[0] characterAtIndex:0]);
        long zi_unicode = [arr_row[0] characterAtIndex:0];
        NSString *zi_py = [arr_row[0] substringFromIndex:1];
        //NSLog(@"%ld %@",zi_unicode,zi_py);
        [zyDict setObject:[zi_py substringToIndex:[zi_py length]-1] forKey:[NSNumber numberWithLong:zi_unicode]];
        //if (i > 10) {
        //   break;
        //}
        //if(25165 == [arr_row[0] characterAtIndex:0]) {
        //    break;
        //}
    }
    
    NSLog(@"zy:%ld",zyDict.count);
    //for (NSNumber *k in [zyDict allKeys]) {
    //    NSLog(@"keyL %@ value:%@", k,[zyDict objectForKey:k]);
    //}
    
}


@end

