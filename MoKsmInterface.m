classdef MoKsmInterface < SpikeSortingHelper & ClusteringHelper & MoKsm

	properties
        ClusterAssignment = [];
        ClusterTags = [];
        ContaminationMatrix = [];
	end

	methods
		function self = MoKsmInterface(self)
        % Creates a ClusteringHelper class.  Doesn't need to initialize
        % anything yet
        
            self = self@SpikeSortingHelper(self, varargin{:});
            self = self@ClusteringHelper(self);
            self = self@MoKsm(self);
            
            % Hacky.  For creating with just features and time
            % need to skip this
            if length(varargin) > 1
                self = parseParams(self, varargin{:});
            end
            
            % If there are waveforms, get the features (this shouldn't be at this level) 
            if isfield(self.data, 'Waveforms')
                self = getFeatures(self, self.params.Feature);
            end
            
        end
        
        function self = updateInformation(self)
            % This method updates the ClusterAssignment and ContaminationMatrix
            
        end

        function self = delete(self, id)
            % Delete a cluster by ID.  Should call updateInformation afterwards.
        end
        
        function self = split(self, id)
            % Splits a cluster by ID.  Should call updateInformation
            % afterwards.
        
        end

        function self = merge(self, ids)
        % Splits a cluster by ID.  Should call updateInformation
        % afterwards.
        
        end
        
        function self = refit(self)
        % Refit the complete data set again
        
        end
        
        function self = compress(self)
        % Remove any information that can be recomputed and doesn't
        % need to be stored on disk
        
        end
        
        function self = uncompress(self)
        % Recreate any information that compress strips out
        
        end
        
    end

end
