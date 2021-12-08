
%%==============================================================
%% Calculate the clustering coefficient of a network using its adjacency matrix
%%==============================================================
%   A (nxn) - adjacency matrix of a graph G
%   Clust- clustering coefficient (closed neighborhood)

function  Clust = clus_coeff( varargin )
% graphProperties: compute properties of a graph from its adjacency matrix
% usage: Clust = clus_coeff(A);



% get adjacency matrix from list of inputs
A = parseInputs(varargin{:});
% get number of vertices
n = size(A,1);

[MClosed,kClosed,MOpen,kOpen] = subgraphs(A);
% local clustering coefficient in each subgraph
[CLClosed,CLOpen] = deal(zeros(n,1));
for i = 1:n
    CLClosed(i) = sum(MClosed{i}(:))/...
        (numel(kClosed{i})*(numel(kClosed{i})-1));
    CLOpen(i) = sum(MOpen{i}(:))/...
        (numel(kOpen{i})*(numel(kOpen{i})-1));
end
% clustering coefficients
Clust = mean(CLClosed);