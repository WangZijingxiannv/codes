%% 
% 数据
N = [ 74477 119769 205329 238248 313987 434374 500373 608766 ];
PostErr = [ 16.29073439141678 12.74470547262325 9.39811501304692 ...
             7.32602654877735 5.85100255709758 3.73957743964162 ...
             3.13711672024868 2.60045331594802 ];

% 绘制数据点的 loglog 图
figure;
loglog(N, PostErr, '-o', 'Color', [0.2, 0.4, 0.6], 'DisplayName', 'Total posterior error', 'MarkerSize', 6, 'LineWidth', 2); % 第一根线为暗红色
hold on;

% 生成对数尺度下的 x 轴
xline = logspace(log10(min(N)), log10(max(N)), 100); % 在 log 尺度生成 x 轴的值

% 选择 C 为 PostErr 的第一个值，调整 C 使虚线下移
factor = 0.95;  % 因子用于控制虚线的整体下移
C = PostErr(1) * N(1) * factor;  % 调整 C，使虚线整体往下平移
yline = C ./ xline; % 计算斜率为 -1 的线，y = C / x

% 绘制斜率为 -1 的虚线
loglog(xline, yline, '-.', 'Color',[0.8, 0.1, 0.1], 'DisplayName', 'Slope = -1', 'LineWidth', 1.5); % 第二根线为暗蓝色

% 添加网格
grid on;
xlabel('Number of elements');
% 添加 y 轴标签
ylabel('Error');
% 添加图例
% 设置 x 轴和 y 轴的范围，以在前后留出一些空白
xlim([min(N) * 0.8, max(N) * 1.2]); % 设置 x 轴范围
ylim([min(PostErr) * 0.6, max(PostErr) * 1.4]); % 设置 y 轴范围
% xticks([10^5, 10^6]); % 设置 x 轴刻度
% xticklabels({'10^5', '10^6'}); % 设置对应的 x 轴标签
legend('show');
hold off;
print('Lshaped_ratio', '-depsc');
%% 
% 数据
nproc = [36 72 144 288];
time = [431.10 179.31 96.53 53.81];

% 创建图形窗口
figure;


% 画斜率为 -1 的对比线
% 选择对比线的初始点
nproc_ref = [36 288]; % 起点和终点
time_ref = 0.76* time(1) * (nproc(1) ./ nproc_ref); % 保持起点处与 time 相同，斜率为 -1

% 绘制对比线
loglog(nproc_ref, time_ref, '-.', 'Color',[0.2, 0.4, 0.6], 'LineWidth', 2);
hold on;
% 画测试结果的线
loglog(nproc, time, '-o', 'Color', [0.8, 0.2, 0.2],'LineWidth', 2);
% hold on;


% 添加图例
legend('Slope = -1', 'Location', 'northeast');

% 标注坐标轴
xlabel('Number of Processors (nproc)', 'FontSize', 12);
ylabel('Time (s)', 'FontSize', 12);
title('Scalability Test Results', 'FontSize', 14);

% 设置网格
grid on;

% 调整横轴和纵轴的范围，给图留出空白
xlim([min(nproc)*0.8, max(nproc)*1.1]);
ylim([min(time)*0.6, max(time)*1.1]);
set(gca, 'XTick', nproc);
set(gca, 'YTick', [100 200 300 400]);
hold off;
print('Lshaped_scaling', '-depsc');

