//
//  ViewController.m
//  CharlesProxy
//
//  Created by mchaabani on 20/04/2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CharlesViewController.h"

@interface CharlesViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *charlesSite;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
- (IBAction)refreshWebView:(id)sender;

@end

@implementation CharlesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self refreshWebView];
}

#pragma mark - UIWebview delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    [_spinner startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_spinner stopAnimating];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_spinner stopAnimating];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshWebView:(id)sender {
    [self refreshWebView];
}


- (void)refreshWebView {
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://conecode.com/contact.php"]];
    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:urlRequest];
    [_charlesSite loadRequest:urlRequest];
    
}
@end
