function c = detectEBBHarrisFeatures(img)

% divide image into 10 by 10 grid
grid = tile(img,10,10,0);

rows_grid = size(grid{1,1},1);
cols_grid = size(grid{1,1},2);

total_entropy = 0;

for i=1:1:10
    for j=1:1:10
        
        if(i == 1)    
            i_start = 1;
            i_end = rows_grid;
        else 
            i_start = rows_grid * (i - 1);
            i_end = rows_grid * (i);
        end 
        
        if(j == 1)
            j_start = 1;
            j_end = cols_grid;
        else 
            j_start = cols_grid * (j - 1);
            j_end = cols_grid * (j);
        end
       
        total_entropy = total_entropy + entropy(img(i_start:i_end,j_start:j_end));
    end 
end

corners_Location = [];
corners_Metric = [];

for i=1:1:10
    for j=1:1:10
        
        if(i == 1)    
            i_start = 1;
            i_end = rows_grid;
        else 
            i_start = rows_grid * (i - 1);
            i_end = rows_grid * (i);
        end 
        
        if(j == 1)
            j_start = 1;
            j_end = cols_grid;
        else 
            j_start = cols_grid * (j - 1);
            j_end = cols_grid * (j);
        end
        
        corners = detectHarrisFeatures(img,'ROI',[j_start,i_start,cols_grid,rows_grid]);

        num_corners = 1000;
        partition_entropy = entropy(img(i_start:i_end,j_start:j_end));
        
        if(partition_entropy == 0) 
           continue;
        end
        
        entropy_corners = num_corners * (partition_entropy/total_entropy);
        entropy_corners = round(entropy_corners);
        
        if(entropy_corners == 0) 
           continue;
        end
        
        corners = corners.selectStrongest(entropy_corners);
        
        corners_Metric = [corners.Metric ; corners_Metric];

        corners_Location = [corners.Location ; corners_Location];
        
    end 
end 

% create the structure to hold to points
c.Location = corners_Location;
c.Metric = corners_Metric;