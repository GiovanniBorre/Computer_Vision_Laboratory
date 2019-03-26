function AugmentedMatrix = matrixFramer(matrix, matrixSize)
    % Add the appropriate ledge to the image in order to avoid loss on the edge
     K=floor(matrixSize/2);
%     addRows = zeros(floor(matrixSize/2), size(matrix, 2) + 2*floor(matrixSize/2));
%     addColumns = zeros(size(matrix, 1), floor(matrixSize/2));
%     AugmentedMatrix = [addRows; addColumns matrix addColumns; addRows]; 
    K=floor(matrixSize/2);

    r1 = matrix(1:K,:);
    r2 = matrix( (end-K):end , :);
    
    c1 = matrix(:,1:K);
    c2 = matrix(:, (end-K):end);
    c1=c1';
    c2=c2';
    
    
    for i=1:K
        R1(i,:)=r1(K+1-i,:);
        R2(i,:)=r2(K+1-i,:);
        C1(i,:)=c1(K+1-i,:);
        C2(i,:)=c2(K+1-i,:);     
    end
    
    C1=C1';
    C2=C2';
    Q1 = rot90(matrix(1:K, 1:K),2);
    Q2 = rot90(matrix(1:K, (end-K+1):end),2);
    Q3 = rot90(matrix((end-K+1):end, 1:K),2);
    Q4 = rot90(matrix((end-K+1):end, (end-K+1):end),2);
    
    AugmentedMatrix = [Q1 R1 Q2; C1 matrix C2; Q3 R2 Q4]; 
end