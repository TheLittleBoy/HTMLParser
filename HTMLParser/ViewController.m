//
//  ViewController.m
//  HTMLParser
//
//  Created by MAC_AO on 15/7/12.
//  Copyright (c) 2015年 MAC_AO. All rights reserved.
//

#import "ViewController.h"
#import "DTHTMLParser.h"

@interface ViewController ()<DTHTMLParserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"test" ofType:@"html"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    DTHTMLParser *parser = [[DTHTMLParser alloc] initWithData:data encoding:NSUTF8StringEncoding];
    parser.delegate = self;
    BOOL success = [parser parse];
    
    if (success) {
        NSLog(@"success!");
        
        NSLog(@"lineNumber:%ld",parser.lineNumber);
    }else
    {
        NSLog(@"faile");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark DTHTMLParserDelegate

- (void)parserDidStartDocument:(DTHTMLParser *)parser
{
    NSLog(@"did start");
}

- (void)parserDidEndDocument:(DTHTMLParser *)parser
{
    NSLog(@"did end");
}

- (void)parser:(DTHTMLParser *)parser foundProcessingInstructionWithTarget:(NSString *)target data:(NSString *)data
{
    NSLog(@"target: %@ data: %@", target, data);
}

- (void)parser:(DTHTMLParser *)parser didStartElement:(NSString *)elementName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"elementName:%@   attr:%@",elementName,attributeDict);
}


- (void)parser:(DTHTMLParser *)parser didEndElement:(NSString *)elementName
{
    NSLog(@"end name:%@",elementName);
}

- (void)parser:(DTHTMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"fondCharacter:%@",string);
}


- (void)parser:(DTHTMLParser *)parser foundComment:(NSString *)comment
{
    NSLog(@"fondComment:%@",comment);
}


@end
