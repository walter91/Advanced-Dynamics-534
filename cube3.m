function cube3( varargin )
%CUBE3 plots a cube in 3D given matricies containing the verticies of
%opposite planes
%   p1_vert and p2_vert should be matricies containing the verticies
%   of opposite planes. They should be in the same order.
%   
%   A = [ x1 x2 x3;...
%         y1 y2 y3;...
%         z1 z2 z3];       
%
%
%   B = [ x4 x5 x6;...
%         y4 y5 y6;...
%         z4 z5 z6];   
%
%   cube3(A, B, color, fignum)
%
%   or 
% 
%   cube3(A, L, color, fignum)

pointNum = length(varargin{1}(1,:));

p_vert = cell(pointNum + 2,1);

p_vert{1} = varargin{1};

%If two planes are specified
if size(varargin{2}) ~= 1
    
    p_vert{2} = varargin{2};
    color = varargin{3};
    fignum = varargin{4};
      
%If one plane and extrusion length is specified    
else
    color = 3;
    ex_len = varargin{2};
    color = varargin{3};
    fignum = varargin{4};
    
    r21 = p_vert{1}(:,2) - p_vert{1}(:,1);
    r32 = p_vert{1}(:,3) - p_vert{1}(:,2);
    
    e = cross(r21,r32);
    e = e ./ sqrt(dot(e,e));
    %e = [e, e, e, e];
    
    unit = e;
    
    for i = 1:pointNum -1
        unit = [unit, e];
    end
    
    p_vert{2} = ex_len*unit + p_vert{1};
    
end

%Creat matricies for the remaining plane verticies
for i = 1:pointNum - 1
    
    p_vert{i+2} = [p_vert{1}(:,i) p_vert{1}(:,i+1) p_vert{2}(:,i+1) p_vert{2}(:,i)];
        
end
p_vert{pointNum + 2} = [p_vert{1}(:,pointNum) p_vert{1}(:,1) p_vert{2}(:,1) p_vert{2}(:,pointNum)];

%Fill the surfaces
figure(fignum); hold on;
view(45,45);
for i = 1:pointNum +2
    fill3( p_vert{i}(1,:),p_vert{i}(2,:), p_vert{i}(3,:), color);
end
grid on
xlabel('x'); ylabel('y'); zlabel('z');


end