close all;                                          % 모든 생성된 창을 닫음 
clear all;                                          % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                                % 명령(command) 창을 비움

n=[-10:1:10];                                       % 시간축 설정
x=4*stepfun(n,0)-(n-2).*(n>=2)+(n-6).*(n>=6);       % x[n] 생성 
xp0=x(11:16);                                       % x[n]의 한 주기 파형 선택  
for k=1:21 
  if rem(k,6)==5
    xp(k)=xp0(1);                                   % 주기신호 xN[n] 생성()
  else
    xp(k)=xp0(rem(k,6)+2);                          % 주기신호 xN[n] 생성(그 외의 )
  end
end
xs=4*stepfun(n,-3)-(n+1).*(n>=-1)+(n-3).*(n>=3);    % x[n+3] 생성 
xr=fliplr(x);                                       % x[-n] 생성 (y축 대칭)
xe=0.5*(x+xr);                                      % 우함수 대칭 성분 xe[n] 생성
xo=0.5*(x-xr);                                      % 기함수 대칭 성분 xo[n] 생성

Ex=sum(x.*x);                                       % 신호 x[n]의 에너지 계산 
Pxp=sum(xp0.*xp0)/6;                                % 신호 xN[n]의 전력 계산 

subplot(3,2,1);                                     % 3행 2열 분할 그림 창의 1번 창 
stem(n,x);                                          % x[n] 그림 
title('x[n]');                                      % 그림 제목 
axis([-10 10 -1 5]);                                % x축과 y축의 그림 영역 지정 
subplot(3,2,2);                                     % 3행 2열 분할 그림 창의 2번 창 
stem(n,xp);                                         % xN[n] 그림
title('x_N[n]');                                    % 그림 제목 
axis([-10 10 -1 5]);                                % x축과 y축의 그림 영역 지정 
subplot(3,2,3);                                     % 3행 2열 분할 그림 창의 3번 창 
stem(n,xs);                                         % x[n+3] 그림 
title('x[n+3]');                                    % 그림 제목 
axis([-10 10 -1 5]);                                % x축과 y축의 그림 영역 지정 
subplot(3,2,4);                                     % 3행 2열 분할 그림 창의 4번 창 
stem(n,xr);                                         % x[-n] 그림
title('x[-n]');                                     % 그림 제목 
axis([-10 10 0 5]);                                 % x축과 y축의 그림 영역 지정 
subplot(3,2,5);                                     % 3행 2열 분할 그림 창의 5번 창 
stem(n,xe);                                         % xe[n] 그림
title('x_e[n]');                                    % 그림 제목 
axis([-10 10 -1 5]);                                % x축과 y축의 그림 영역 지정 
subplot(3,2,6);                                     % 3행 2열 분할 그림 창의 6번 창 
stem(n,xo);                                         % xo[n] 그림
title('x_o[n]');                                    % 그림 제목 
axis([-10 10 -3 3]);                                % x축과 y축의 그림 영역 지정 

fprintf('신호 x[n]의 에너지는 %d\n',Ex);             % 명령창에 x[n]의 에너지 값 표시 
fprintf('주기 신호 x_N[n]의 전력은 %f\n',Pxp);       % 명령창에 xN[n]의 전력 값 표시  