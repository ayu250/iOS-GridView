# iOS-GridView
iOS自定义网格组件，基于UICollectionView的GridView   
基于前一个组件 [GridView](https://github.com/ayu250/GridView)  的优化，由于发现原先的组件在实际运行中，展示较大量的数据时，对内存占用有点大，于是做了此番优化，结果发现在展示相同数量的多条数据时，优化过后的GridView比之前的版本能节省5M左右的内存，说明此次优化还是有成果的。
  
  1、初始化

MLHGridView *grid = [[MLHGridView alloc]initWithFrame:CGRectMake(10, 64, self.view.frame.size.width-20, CGRectGetHeight(self.view.bounds) - 64)];

grid.delegate = self;

2、实现delegate

- (NSInteger)numberOfColumnsForGridView:(MLHGridView *)gridView row:(NSInteger)row;  


-(NSInteger)numberOfRowsForGridView:(MLHGridView *)gridView;  


-(NSArray *)gridView:(MLHGridView *)gridView dataForRow:(NSInteger)row;  

  
  效果图  
  
![image](https://github.com/ayu250/iOS-GridView/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-05-18%20at%2014.33.25.png)
