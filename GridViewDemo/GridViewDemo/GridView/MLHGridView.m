//
//  MLHDataGridView.m
//  DemoMLH
//
//  Created by 啊育 on 2018/5/7.
//  Copyright © 2018年 Helloworld. All rights reserved.
//

#import "MLHGridView.h"
#import "MLHGridCollectionCell.h"

@interface MLHGridView() <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *contentView;
@property(nonatomic,assign) CGFloat columnWidth;
@end

@implementation MLHGridView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if( self ){

    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.contentView.frame  = CGRectMake(0, 0, CGRectGetWidth(rect), CGRectGetHeight(rect));
}

// MARK: - init

// MARK: - init

-(UICollectionView *)contentView{
    if( _contentView == nil ){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing =  0;
        layout.minimumLineSpacing = 0;
        
        _contentView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _contentView.dataSource = self;
        _contentView.delegate = self;
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.scrollEnabled = self.scrollEnabled;
        [_contentView registerNib:[UINib nibWithNibName:@"MLHGridCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"collectionCell"];
        _contentView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self addSubview:_contentView];
    }
    return _contentView;
}

// MARK: -

///计算行高
-(CGFloat)rowHeight:(NSInteger)row{
    CGRect frame = self.frame;
    return [self rowHeightInRect:frame atRow:row];
}

-(CGFloat)rowHeightInRect:(CGRect)rect atRow:(NSInteger)row{
    NSInteger columns = [self.delegate numberOfColumnsForGridView:self row:row];
    //方格文字宽度
    CGFloat textWidth = CGRectGetWidth(rect)/columns;
    textWidth = floor( textWidth - MLH_textToLeft - MLH_textToRight );
    
    UIFont *font = [UIFont systemFontOfSize:MLH_textFontSize];
    NSArray *arr = [self.delegate gridView:self dataForRow:row];
    float maxHeight = 0;
    CGSize maxSize = CGSizeMake(textWidth, MAXFLOAT);
    for (NSString *item in arr) {
        CGSize textSize = [item boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
        CGFloat tempH = ceil(textSize.height);
        if (maxHeight < tempH) {
            maxHeight = tempH ;
        }
    }
    maxHeight = maxHeight + MLH_textToTop + MLH_textToBottom;
    return maxHeight < 44.0 ? 44.0 : maxHeight;
}

-(void)reloadData{
    [self.contentView reloadData];
    [self setNeedsDisplay];
}

// MARK: - private

-(UIColor *)bgColorForRow:(NSInteger)row{
    if ([self.delegate respondsToSelector:@selector(gridView:backgroundColorForRow:)]) {
        return [self.delegate gridView:self backgroundColorForRow:row];
    }
    return [UIColor whiteColor];
}

// MARK: - UICollectionViewDelegate,UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.delegate numberOfRowsForGridView:self];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.delegate numberOfColumnsForGridView:self row:section];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MLHGridCollectionCell *cell = (MLHGridCollectionCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [self bgColorForRow:indexPath.section];
    [cell setFirstRow:(indexPath.section == 0) firstColumn:(indexPath.row == 0)];
    
    if(self.delegate){
        NSArray *arr = [self.delegate gridView:self dataForRow:indexPath.section];
        if (indexPath.row < arr.count) {
            cell.textLabel.text = arr[indexPath.row];
        }else{
            cell.textLabel.text = @"";
        }
        
        //设置字体颜色
        if ([self.delegate respondsToSelector:@selector(gridView:textColorForRow:column:)]) {
            UIColor *textColor = [self.delegate gridView:self textColorForRow:indexPath.section column:indexPath.row];
            if( textColor){
                cell.textLabel.textColor = textColor;
            }
        }
        ///设置flagImage
        if([self.delegate respondsToSelector:@selector(gridView:flagImageForRow:column:)]){
            UIImage *img = [self.delegate gridView:self flagImageForRow:indexPath.section column:indexPath.row];
            cell.flagImg.image = img;
        }
        //设置竖向分隔线的颜色
        if(indexPath.row < (arr.count - 1)){
            if([self.delegate respondsToSelector:@selector(gridView:verticalSeparatorColorForRow:column:)]){
                UIColor *lineColor = [self.delegate gridView:self verticalSeparatorColorForRow:indexPath.section column:indexPath.row];
                if (lineColor) {
                    cell.rightLine.backgroundColor = lineColor;
                }else{
                    cell.rightLine.backgroundColor = MLH_lineColor;
                }
            }
        }else{
            cell.rightLine.backgroundColor = MLH_lineColor;
        }
    }
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger columns = [self collectionView:collectionView numberOfItemsInSection:indexPath.section];
    CGFloat width = CGRectGetWidth(collectionView.bounds)/columns;
    double height = 0.0;
    
    if([self.delegate respondsToSelector:@selector(gridView:heightForRow:)]){
        height = [self.delegate gridView:self heightForRow:indexPath.section];
    }else{
        height = [self rowHeight:indexPath.section];
    }
    
    if(indexPath.row == 0){
        //第一列的width比其他列稍大一些，消除item之间的间隙
        CGFloat realWidth = CGRectGetWidth(collectionView.bounds) - floor(width) * (columns - 1);
        return CGSizeMake(realWidth, height);
    }else{
        return CGSizeMake(floor(width), height);
    }
}

@end
