function A = rand_pnts_knn_convcomb(Z, M)
%RAND_PNTS_KNN_CONVCOMB Summary of this function goes here
% Input:
%   Z: [L, L] 0/1 knn template
%   M: [1] #points generated per point
% Output:
%   A: [L, ML] convex combination coefficients, A(:,i) is a sum-to-one vec
%

  L = size(Z,1); 
  assert(L == size(Z,2));
  A = zeros(L, M*L);
  
  % for each point, generate M points around it
  for i = 1 : L
    % #points for the convex hull
    ind = find( Z(:,i) > 0 );
    K = numel(ind);
    for j = 1 : M
      % generate the sum-to-one coefficients with #points components
      co = rand(1,K);
      co = co./sum(co);
      % assign it to the right column of A
      ii = (i-1)*M + j;
      A(ind, ii) = co(:);
    end % for j
  end % for i

end

