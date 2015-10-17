%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   DRAW_PATCH(F, V, C, transparent)
%
%   Draws a link using faces F and vertices V.
%   C Defines the color of the robot.
%   If transparent == 1, the robot is drawn with transparency.
%   
%   
%	See also DRAW_LINK, DRAWROBOT3D, ANIMATE
%
%   Author: Arturo Gil. Universidad Miguel Hern�ndez de Elche. 
%   email: arturo.gil@umh.es date:   05/02/2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Copyright (C) 2012, by Arturo Gil Aparicio
%
% This file is part of ARTE (A Robotics Toolbox for Education).
% 
% ARTE is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% ARTE is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Leser General Public License
% along with ARTE.  If not, see <http://www.gnu.org/licenses/>.

%This file has been modified by Hector Barreras Almarcha
function draw_patch(F, V, C, transparent)

if nargin==2
    %default color
    C=[0.5 0.6 0.7];
    transparent=0;
end
if nargin==3
    transparent=0;
end

set(gca, 'drawmode', 'fast');

%draw the vertices
%note: vertices should be expressed in m
p = patch('faces', F, 'vertices', V);

set(p, 'FaceColor', C);

if transparent
    % The facealpha property is does not work correctly, as transparency is not yet implemented
    % setting it to .4 will simply make it not render
    printf('Warning: transparency is not correctly implemented so far. Setting it to 1 will cause the patches to not be rendered\n');
    set(p, 'facealpha',.4)          % Draws the link with transparency    
end

%TEMPORARY - The light command is currently not supported in Octave
%light;
set(p, 'EdgeColor', 'k'); % This will make the 3d figure visible more easily

%change material properties
%TEMPORARY - The material function is currently not supported in octave
%material( [0.5 0.1 0.01]);
daspect([1 1 1])                    % Setting the aspect ratio

xlabel('X (m)'),ylabel('Y (m)'),zlabel('Z (m)')
