function [inliers_id, H] = runRANSAC(Xs, Xd, ransac_n, eps)
%RUNRANSAC

    num_pts = size(Xs, 1);
    pts_id = 1:num_pts;
    inliers_id = [];
    max_inliers = 0;
    
    for iter = 1:ransac_n
        inlier_count = 0;
        
        points = randperm(num_pts,4);
                    
        sample_Xs = Xs(points,:);
        sample_Xd = Xd(points,:);
    
        % find the homography matrix between the four source points and
        % the four destination points
        new_H = computeHomography(sample_Xs, sample_Xd);

        % get the new destination points 
        new_Xd = applyHomography(new_H,Xs);

        for i=1:1:num_pts

            % calculate distance between the new distination points and the
            % old points 
            dis = pdist2(new_Xd(i,:),Xd(i,:)); 
             
            if(dis <= eps)
                inlier_count = inlier_count + 1;
            end 
        end
        
        if(inlier_count > max_inliers)
            max_inliers = inlier_count;   
            H = new_H;
            
            new_inliers_id = zeros(1,inlier_count);
            index_count = 1;
            for i=1:1:num_pts
                % calculate distance between the new distination points 
                % old points and the
                dis = pdist2(new_Xd(i,:),Xd(i,:));  

                if(dis <= eps)
                    new_inliers_id(index_count) = i;
                    index_count = index_count + 1;
                end 
            end
        end
        inliers_id = new_inliers_id;
    end  
end
