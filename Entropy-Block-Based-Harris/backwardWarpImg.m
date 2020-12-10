function [mask, result_img] = backwardWarpImg(src_img, resultToSrc_H,...
                                              dest_canvas_width_height)
	src_height = size(src_img, 1);
	src_width = size(src_img, 2);
    src_channels = size(src_img, 3);
    dest_width = dest_canvas_width_height(1);
	dest_height	= dest_canvas_width_height(2);
    
    result_img = zeros(dest_height, dest_width, src_channels);
    mask = false(dest_height, dest_width);
    
    % this is the overall region covered by result_img
    [dest_X, dest_Y] = meshgrid(1:dest_width, 1:dest_height);
    
    % map result_img region to src_img coordinate system using the given
    % homography.
    src_pts = applyHomography(resultToSrc_H, [dest_X(:), dest_Y(:)]);
    src_X = reshape(src_pts(:,1), dest_height, dest_width);
    src_Y = reshape(src_pts(:,2), dest_height, dest_width);
    
    mat_red = src_img(:,:,1);
    mat_green = src_img(:,:,2);
    mat_blue = src_img(:,:,3);
    mat_intensity = rgb2gray(src_img);

    x_cord = 1:1:size(src_img,2);
    y_cord = 1:1:size(src_img,1);
    
    save_red = interp2(x_cord,y_cord,mat_red,src_X,src_Y,'nearest');
    save_green = interp2(x_cord,y_cord,mat_green,src_X,src_Y,'nearest');
    save_blue = interp2(x_cord,y_cord,mat_blue,src_X,src_Y,'nearest');
    save_intensity = interp2(x_cord,y_cord,mat_intensity,src_X,src_Y,'nearest');
    
    for i=1:1:dest_height
        for j=1:1:dest_width
            
            if(~isnan(save_red(i,j)))
                result_img(i,j,1) = save_red(i,j);
            end 
            
            if(~isnan(save_green(i,j)))
                result_img(i,j,2) = save_green(i,j);
            end 
            
            if(~isnan(save_blue(i,j)))
                result_img(i,j,3) = save_blue(i,j);
            end 
            
            if(~isnan(save_intensity(i,j)))
                result_img(i,j) = save_intensity(i,j);
                mask(i,j) = 1;
            end   
        end
    end
end