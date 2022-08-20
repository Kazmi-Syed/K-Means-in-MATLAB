%SYED BILAL JAVED SHAH(180390)
%clearing workspace and screen
clc
clear

%opening file 
%if file exists the id will be 0 or positive
%otherwise negative 
disp('Syed Bilal Javed Shah(180390)')
fname = input('Enter the file name to read data from : ','s');
fid = fopen(fname,'r');

if fid<0
    disp('File is not present with this name')
    return;
else
%if the file exists
%asking for the Dimension
%whether the data is in 2D or 3D
    DIMEN = input('Enter the dimensions of data : ');
    
    %reading data from the file 
    x = fscanf(fid,'%f',[DIMEN inf]);
    x = x';
    %asking for the number of clusters
    K = input('Enter the number of clusters you want : ');

    %number of cluster's input by the user
    %this must be positive integer > 0
    if K <= 0
        %Invalid number of cluster ==> generate error msg
        disp('Wrong input...system crash..!Shutting down in T minus 15 seconds')
        return
        
        %Valid number of clusters        
    else
%choosing initial random centroids from the data-set
        temp2 = randi(size(x,1), K , 1);
        means = zeros(K,DIMEN);
        for t=1:1:K
         means(t,:) = x(temp2(t),:);
        end

        counter =0; %for keeping record of iterations
        %for comparing the old clusters and new
        %we need two matrices 
        %to make the loop to run for atleast 1 time
        %we will choose two different matrices
        A = ones(size(x,1),DIMEN+1);
        B = zeros(size(x,1),DIMEN+1);

        %plotting and means finding
        %algorithm for 2d data-set
        if DIMEN==2
            while ~isequal(A,B)
                counter = counter+1;
                SUM = zeros(K,1);
                B=A;
                for n=1:1:size(x,1)
                        Fasla=pdist2(x(n,:),means)';
                        [MIN , INDEX] = min(Fasla);
                        A(n,1:1:3)= [x(n,:),INDEX];
                end
                pause(2)
                newplot
                title(['Iteration  ',num2str(counter)])
                %plotting centroids
                %and associated data points
                for n=1:1:size(x,1)
                   hold on
                   plot(means(:,1),means(:,2),'kx','MarkerSize',10) 
                   if A(n,3)==1
                        plot(x(n,1),x(n,2),'r.','MarkerSize',5)
                    elseif A(n,3)==2
                        plot(x(n,1),x(n,2),'g.','MarkerSize',5)
                        elseif A(n,3)==3
                        plot(x(n,1),x(n,2),'k.','MarkerSize',5)
                        elseif A(n,3)==4
                        plot(x(n,1),x(n,2),'m.','MarkerSize',5)
                        elseif A(n,3)==5
                        plot(x(n,1),x(n,2),'b.','MarkerSize',5)
                        elseif A(n,3)==6
                        plot(x(n,1),x(n,2),'y.','MarkerSize',5)
                   end

                    midpoint = pdist2(means(1,:),means(2,:))/2;
                    hold off
                end

                means =zeros(size(means));
                    for n=1:1:size(x,1)
                        if A(n,3) == 1
                            means(1,:) =[(means(1,1)+A(n,1)),(means(1,2)+A(n,2))];
                            SUM(1)=SUM(1)+1;
                        elseif A(n,3) == 2
                            means(2,:) =[(means(2,1)+A(n,1)),(means(2,2)+A(n,2))];
                            SUM(2)=SUM(2)+1;
                        elseif A(n,3) == 3
                            means(3,:) =[(means(3,1)+A(n,1)),(means(3,2)+A(n,2))];
                            SUM(3)=SUM(3)+1;
                        elseif A(n,3) == 4
                            means(4,:) =[means(4,1)+A(n,1) means(4,2)+A(n,2)];
                            SUM(4)=SUM(4)+1;
                        elseif A(n,3) == 5
                            means(5,:) =[means(5,1)+A(n,1) means(5,2)+A(n,2)];
                            SUM(5)=SUM(5)+1;
                        elseif A(n,3) == 6
                            means(6,:) =[means(6,1)+A(n,1) means(6,2)+A(n,2)];
                            SUM(6)=SUM(6)+1;
                        end
                    end
                    means = means./SUM;
            end
            disp('Writing Output file for 2D-dataset ')
                fname = (['C:\Users\Danial Shah\Desktop\k\OUTPUT2D.txt']);
                fid = fopen(fname,'w+');
                fprintf(fid,'%f\t %f\t %d\n',A');
                fclose(fid);
                disp('File created succesfully for 2D-dataset')

        else
          %algorithm for 3D-dataset
        while ~isequal(A,B)
            counter = counter+1;
            SUM = zeros(K,1);
            B=A;
            for n=1:1:size(x,1)
                    Fasla = pdist2(x(n,:),means)';
                    [MIN , INDEX] = min(Fasla);
                    A(n,1:1:4)= [x(n,:),INDEX];
            end
            pause(2)
            newplot
            set(gcf,'color','c');
            set(gca,'color','k');
            title(['Iteration  ',num2str(counter)])
            xlabel('X-axis')
            ylabel('Y-axis')
            zlabel('Z-axis')
            hold on
            %plotting means with 'X' in graph
             plot3(means(:,1),means(:,2),means(:,3),'x','Color','w','MarkerSize',15)
            %plotting the data-sets with associated centroid
             for n=1:1:size(x,1) 
               if A(n,4)==1
                    plot3(x(n,1),x(n,2),x(n,3),'.','color','g','MarkerSize',10)
                elseif A(n,4)==2
                    plot3(x(n,1),x(n,2),x(n,3),'.','Color','r','MarkerSize',10)
                    elseif A(n,4)==3
                    plot3(x(n,1),x(n,2),x(n,3),'.','Color','c','MarkerSize',10)
                    elseif A(n,4)==4
                    plot3(x(n,1),x(n,2),x(n,3),'.','Color','b','MarkerSize',10)
                    elseif A(n,4)==5
                    plot3(x(n,1),x(n,2),X(n,3),'.','Color','m','MarkerSize',10)
                    elseif A(n,4)==6
                    plot3(x(n,1),x(n,2),x(n,3),'.','Color','y','MarkerSize',10)
               end

            end
        hold off
        %updating centroids
            means =zeros(size(means));
                for n=1:1:size(x,1)
                    if A(n,4) == 1
                        means(1,:) =[(means(1,1)+A(n,1)),(means(1,2)+A(n,2)),(means(1,3)+A(n,3))];
                        SUM(1)=SUM(1)+1;
                    elseif A(n,4) == 2
                        means(2,:) =[(means(2,1)+A(n,1)),(means(2,2)+A(n,2)),(means(2,3)+A(n,3))];
                        SUM(2)=SUM(2)+1;
                    elseif A(n,4) == 3
                        means(3,:) =[(means(3,1)+A(n,1)),(means(3,2)+A(n,2)),(means(3,3)+A(n,3))];
                        SUM(3)=SUM(3)+1;
                    elseif A(n,4) == 4
                        means(4,:) =[means(4,1)+A(n,1) means(4,2)+A(n,2),(means(4,3)+A(n,3))];
                        SUM(4)=SUM(4)+1;
                    elseif A(n,4) == 5
                        means(5,:) =[means(5,1)+A(n,1) means(5,2)+A(n,2),(means(5,3)+A(n,3))];
                        SUM(5)=SUM(5)+1;
                    elseif A(n,4) == 6
                        means(6,:) =[means(6,1)+A(n,1) means(6,2)+A(n,2),(means(6,3)+A(n,3))];
                        SUM(6)=SUM(6)+1;
                    end
                end
                means = means./SUM;
        end
        %Writing output file
        disp('Writing output file for 3D-dataset')
        fid = fopen('Output3d.txt','w+');
        fprintf(fid,'%.16f\t%.16f\t%.16f\t%i\n',A');
        fclose(fid);
        disp('Output file is created....!')
        end
    end
end