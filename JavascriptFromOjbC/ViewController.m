//
//  ViewController.m
//  JavascriptFromOjbC
//
//  Created by Jeff Schmitz on 11/19/15.
//  Copyright © 2015 Jeff Schmitz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.webView loadHTMLString:@"<html><body><h1>Hello UIWebView</h1><a href='callnative'>Click me!!</a><h1 id='msg'></h1></body></html>" baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString* path = request.URL.path;
    if ([path isEqualToString:@"/callnative"]) {
        [self.webView stringByEvaluatingJavaScriptFromString:@"document.querySelector('#msg').innerText='calling javascript from Objective-C';"];
        return NO;
    }
    return YES;
}

@end
