classdef B3<B
    %B3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods(Access = ?Element_Elastic)
        function [obj,B] = computeB(obj,nunkn,nelem,nnode,cartd)
            B = zeros(6,nnode*nunkn,nelem);
            for inode=1:nnode
                j = nunkn*(inode-1)+1;
                % associated to normal strains
                B(1,j,:) = cartd(1,inode,:);
                B(2,j+1,:) = cartd(2,inode,:);
                B(3,j+2,:) = cartd(3,inode,:);
                % associated to shear strain, gamma12
                B(4,j,:) = cartd(2,inode,:);
                B(4,j+1,:) = cartd(1,inode,:);
                % associated to shear strain, gamma13
                B(5,j,:) = cartd(3,inode,:);
                B(5,j+2,:) = cartd(1,inode,:);
                % associated to shear strain, gamma23
                B(6,j+1,:) = cartd(3,inode,:);
                B(6,j+2,:) = cartd(2,inode,:);
            end
            obj.value = [obj.value {B}];
        end
    end
end

