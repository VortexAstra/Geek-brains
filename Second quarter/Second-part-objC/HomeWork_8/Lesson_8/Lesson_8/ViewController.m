//
//  ViewController.m
//  Lesson_8
//
//  Created by artem.ustinov on 10.07.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awake from nib");
}

-(void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    NSLog(@"Prepare for interface builder");
}

-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"Transition");
}

-(void)loadView {
    [super loadView];
    NSLog(@"LoadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View did load");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    NSLog(@"View will appear");
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:true];
    NSLog(@"View did appear");
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"View will layout subviews");
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"View did layout subviews");
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:true];
    NSLog(@"View will disappear");
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:true];
    NSLog(@"View did disappear");
}

@end
