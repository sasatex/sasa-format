clc ;
clear all ;
disp('SoPhiSTIcaTeD AnD DiMeN presents, SR simulation. <Info : c=1>') ;
tmax = input('What is max t? ') ;
objnum = input('What is object number? ') ;
t=0:0.01:tmax;

objecti = cat(1,t,zeros(2,size(t,2))) ;
object = objecti ;
objctrl = 0;

for i=1:objnum-1
    object = cat(3,object,objecti) ;
end


isobjref = zeros(1,objnum);
objref = 0 ;
velocity = zeros(2,objnum);
accelaration = zeros(1,objnum);

key=input('Press key, 1 : ObjectInput, 2 : Graph, 3 : Animation, 4 : End ') ;

while(key ~= 4)
       switch key
       
           case 1
               
               key1=input('Press key, 1 : ConstantSpeed, 2 : ConstantAccelaration, 3 : Otherwise , 4 : End ') ;
               while(key1 ~= 4)
               
               switch key1
                   case 1
                       objctrl = input('What object do you want to control? ');
                       while(objctrl==0 || objctrl>objnum)
                           objctrl = ('Invalid Object#. What object do you want to control? ');
                       end
                       key11 = input('Press key, 1 : Orthogonal , 2 : Polar ') ;
                       isobjref(objctrl) = 1 ;
                       switch key11
                           case 1
                               x_0 = input('What is x_0? ') ;
                               y_0 = input('What is y_0? ') ;
                               v_x = input('What is v_x? ') ;
                               v_y = input('What is v_y? ') ;
                               velocity(1,objctrl) = sqrt(v_x^2+v_y^2) ;
                               velocity(2,objctrl) = atan(v_y/v_x) ;
                               object(2,:,objctrl) = x_0 + object(1,:,objctrl) .* v_x ;
                               object(3,:,objctrl) = y_0 + object(1,:,objctrl) .* v_y ;
                               
                           case 2
                               r = input('What is r? ');
                               r_theta = input('What is theta? ');
                               x_0 = r * cos(r_theta) ; 
                               y_0 = r * sin(r_theta) ;
                               velocity(1,objctrl) = input('What is v? ') ;
                               velocity(2,objctrl) = input('What is theta? ') ;
                               v_x = velocity(1,objctrl) * cos(velocity(2,objctrl)) ;
                               v_y = velocity(1,objctrl) * sin(velocity(2,objctrl)) ;
                               object(2,:,objctrl) = x_0 + object(1,:,objctrl) .* v_x ;
                               object(3,:,objctrl) = y_0 + object(1,:,objctrl) .* v_y ;
                               
                           otherwise
                       end
                       
                   case 2
                       objctrl = input('What object do you want to control? ');
                       while(objctrl==0 || objctrl>objnum)
                           objctrl = ('Invalid Object#. What object do you want to control? ');
                       end
                       key21 = input('Press key, 1 : Orthogonal , 2 : Polar ') ;
                       switch key21
                           case 1
                               x_0 = input('What is x_0? ') ;
                               y_0 = input('What is y_0? ') ;
                               v_x = input('What is v_x0? ') ;
                               v_y = input('What is v_y0? ') ;
                               a_x = input('What is a_x? ') ;
                               a_y = input('What is a_y? ') ;
                                   
                               velocity(1,objctrl) = sqrt(v_x^2+v_y^2) ;
                               velocity(2,objctrl) = atan(v_y/v_x) ;
                               object(2,:,objctrl) = x_0 + object(1,:,objctrl) .* v_x + 0.5 .* object(1,:,objctrl).^2 .* a_x ;
                               object(3,:,objctrl) = y_0 + object(1,:,objctrl) .* v_y + 0.5 .* object(1,:,objctrl).^2 .* a_y ;
                               
                               
                           case 2
                               r = input('What is r? ');
                               r_theta = input('What is theta? ');
                               x_0 = r * cos(r_theta) ; 
                               y_0 = r * sin(r_theta) ;
                               velocity(1,objctrl) = input('What is v? ') ;
                               velocity(2,objctrl) = input('What is theta? ') ;
                               a = input('What is a? ') ;
                               a_theta = input('What is theta? ') ;
                               v_x = velocity(1,objctrl) * cos(velocity(2,objctrl)) ;
                               v_y = velocity(1,objctrl) * sin(velocity(2,objctrl)) ;
                               a_x = a * cos(a_theta) ;
                               a_y = a * sin(a_theta) ;
                               object(2,:,objctrl) = x_0 + object(1,:,objctrl) .* v_x + 0.5 .* object(1,:,objctrl).^2 .* a_x ;
                               object(3,:,objctrl) = y_0 + object(1,:,objctrl) .* v_y + 0.5 .* object(1,:,objctrl).^2 .* a_y ;
                               
                            
                           
                               
                           otherwise
                       end
                       
                   case 3
                      disp('No. ') ;
                   otherwise
               end
               key1=input('Press key, 1 : ConstantSpeed, 2 : ConstantAccelaration, 3 : Otherwise , 4 : End ') ;
               end
           case 2
                objref = input('What is your reference frame? 0 : Default ');
                while(objref~=0 && isobjref(max(1,objref))~=1)
                    objref = input('That is not a reference frame. Input again. 0 : Default ');
                end
                
               if(objref~=0)
                            theta_ref = velocity(2,objref) ;
                            v_ref = velocity(1,objref) ;
                            theta_ref_tilde = acosh(1/sqrt(1-v_ref.^2)) ;
                            x_0 = object(2,1,objref);
                            y_0 = object(3,1,objref);
                            R = [1 0 0 ; 0 cos(-theta_ref) -sin(-theta_ref) ; 0 sin(-theta_ref) cos(-theta_ref)] ;
                            R_tilde = [ cosh(theta_ref_tilde) sinh(theta_ref_tilde) 0 ; sinh(theta_ref_tilde) cosh(theta_ref_tilde) 0 ; 0 0 1 ] ;
                            S = cat(1, zeros(1,size(t,2)) , -x_0*ones(1,size(t,2)) , -y_0*ones(1,size(t,2))) ;
                            objectg = zeros(size(object));
                            for i = 1:objnum
                            objectg(:,:,i) = eye(3)/R/R_tilde*R*(object(:,:,i)-S) ;
                            end
                            
                            else
                                objectg = object ;
                end
                
                key21 = input('Draw : 1, ChangeReference : 2, End : 3 ') ;
                
                while( key21 ~= 3 )
                    switch key21
                     
                        case 1
                            
                            
                            objctrl=input('What object do you want to graph? End : 0 ');
                            if(objctrl~=0)
                                
                            hplot = plot3(objectg(2,:,objctrl), objectg(3,:,objctrl), objectg(1,:,objctrl), 'DisplayName', int2str(objctrl)) ;
                            hold all;
                            
                            objctrl=input('Another object which you want to graph? End : 0 ');
                            while(objctrl~=0)
                            plot3(objectg(2,:,objctrl), objectg(3,:,objctrl), objectg(1,:,objctrl), 'DisplayName', int2str(objctrl)) ;
                            hplot = cat(1, hplot, plot3(objectg(2,:,objctrl), objectg(3,:,objctrl), objectg(1,:,objctrl), 'DisplayName', int2str(objctrl)) ) ;
                            objctrl=input('Another object which you want to graph? End : 0 ');
                            end
                            
                            
                            xlabel('x')
                            ylabel('y')
                            zlabel('t')
                            legend(hplot)
                            title(int2str(objref))
                            hold all ;
                            
                            end
                        case 2
                            objref = input('What is your reference frame? 0 : Default ');
                            while(objref~=0 && isobjref(max(1,objref))~=1)
                                objref = input('That is not a reference frame. Input again. 0 : Default ');
                            end
                            
                            if(objref~=0)
                            theta_ref = velocity(2,objref) ;
                            v_ref = velocity(1,objref) ;
                            theta_ref_tilde = acosh(1/sqrt(1-v_ref.^2)) ;
                            R = [1 0 0 ; 0 cos(-theta_ref) -sin(-theta_ref) ; 0 sin(-theta_ref) cos(-theta_ref)] ;
                            R_tilde = [ cosh(theta_ref_tilde) sinh(theta_ref_tilde) 0 ; sinh(theta_ref_tilde) cosh(theta_ref_tilde) 0 ; 0 0 1 ] ;
                            S = cat(1, zeros(1,size(t,2)) , -x_0*ones(1,size(t,2)) , -y_0*ones(1,size(t,2))) ;
                            objectg = zeros(size(object));
                            for i = 1:objnum
                            objectg(:,:,i) = eye(3)/R/R_tilde*R*(object(:,:,i)-S) ;
                            end
                            
                            else
                                objectg = object ;
                            end
                         
                        otherwise
                            ('Work Dimen!!!!') ;
                    end
                    key21 = input('Draw : 1, ChangeReference : 2, End : 3 ') ;
                end
                
           case 3
               objref = input('What is your reference frame? 0 : Default ');
                            while(objref~=0 && isobjref(max(1,objref))~=1)
                                objref = input('That is not a reference frame. Input again. 0 : Default ');
                            end
                            
                            if(objref~=0)
                            theta_ref = velocity(2,objref) ;
                            v_ref = velocity(1,objref) ;
                            theta_ref_tilde = acosh(1/sqrt(1-v_ref.^2)) ;
                            x_0 = object(2,1,objref);
                            y_0 = object(3,1,objref);
                            R = [1 0 0 ; 0 cos(-theta_ref) -sin(-theta_ref) ; 0 sin(-theta_ref) cos(-theta_ref)] ;
                            R_tilde = [ cosh(theta_ref_tilde) sinh(theta_ref_tilde) 0 ; sinh(theta_ref_tilde) cosh(theta_ref_tilde) 0 ; 0 0 1 ] ;
                            S = cat(1, zeros(1,size(t,2)) , -x_0*ones(1,size(t,2)) , -y_0*ones(1,size(t,2))) ;
                            objectg = zeros(size(object));
                            for i = 1:objnum
                            objectg(:,:,i) = eye(3)/R/R_tilde*R*(object(:,:,i)-S) ;
                            end
                            
                            else
                                objectg = object ;
                            end
                            
               objani = 0;
               objani_scan = input('What object do you want to animate? End : 0') ;
               
               while(objani_scan~=0)
                   objani = cat(2,objani,objani_scan) ;
                   objani_scan = input('Extra object to animate? End : 0') ;
               end
               
               if(max(objani)~=0)
                   objani = objani(2:size(objani,2)) ;
                   labels = string(objani) ;
                   objecta = objectg(:,:,objani) ;
                   
               figure
               xlim([min(min(objecta(2,:,:)))-3,max(max(objecta(2,:,:)))+3])
               ylim([min(min(objecta(3,:,:)))-3,max(max(objecta(3,:,:)))+3])
               hold on;
               for k = 1:size(t,2)
                   if k > 1
                        delete(hpoints);
                   end
                   
                       for p = 1:size(objani,2)
                       hpoints(p) = plot(objecta(2,k,p),objecta(3,k,p),'o');
                       end
                       legend(labels);
                       pause(0.001)
                       drawnow limitrate
               end
               
               end
               
           otherwise
               
       
       end
       key=input('Press key, 1 : ObjectInput, 2 : Graph, 3 : Animation, 4 : End ') ;
end