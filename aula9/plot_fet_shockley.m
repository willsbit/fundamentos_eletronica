%% Dados

R = 1000;
Vgs = 0:0.1:1.4;
Vr = [3.172 2.243 1.791 1.400 1.293 0.840 0.557 351.6e-3 243.6e-3 73.4e-3 32.3e-3 15.4e-3 2.1e-3 0.1e-3 0];
Id = Vr ./ R;

Vp = 1.4;
Idss = Id(1);

shockleyId = Idss * (1 - (Vgs ./ Vp)).^2;

%% Polarização direta

cfg = stdplot.theme('fig_width', 16, 'fig_height', 8, 'fontsize', 10);

cfg.arruma_fig.enabled = false;
[fig, ax] = stdplot.createFigure(cfg);

plot(ax, -Vgs, Id*1000, 'o', 'LineWidth', 1.2, ...
    'DisplayName', 'Dados medidos');

plot(ax, -Vgs, shockleyId*1000, '-', 'LineWidth', 1.2, ...
    'DisplayName', 'Equa\c{c}\~ao de Shockley');

% Vp contém o módulo do corte; no gráfico e nos rótulos, VP é negativo.
% Para IDSS/2, usamos 1 - 1/sqrt(2), pois 0,3 VP daria 0,49 IDSS.
fracoes_vp = [0, 1 - 1/sqrt(2), 0.5, 1];
tensoes_referencia = -Vp * fracoes_vp;
correntes_referencia = Idss * [1, 1/2, 1/4, 0] * 1000;

plot(ax, tensoes_referencia, correntes_referencia, 'kd', ...
    'MarkerFaceColor', 'k', 'MarkerSize', 5, ...
    'HandleVisibility', 'off');

rotulos_referencia = { ...
    '$(0,\;I_{DSS})$', ...
    '$(0{,}3V_P,\;I_{DSS}/2)$', ...
    '$(0{,}5V_P,\;I_{DSS}/4)$', ...
    '$(V_P,\;0)$'};

% Deslocamos os rótulos para dentro dos eixos, acima da curva nos pontos
% intermediários, para manter os marcadores e os dados medidos legíveis.
deslocamentos_x = Vp * [-0.08, -0.025, -0.025, 0.025];
deslocamentos_y = Idss * 1000 * [-0.03, 0.03, 0.03, 0.03];
alinhamentos_horizontais = {'right', 'right', 'right', 'left'};
alinhamentos_verticais = {'top', 'bottom', 'bottom', 'bottom'};
for indice_ponto = 1:numel(fracoes_vp)
    text(ax, tensoes_referencia(indice_ponto) + deslocamentos_x(indice_ponto), ...
        correntes_referencia(indice_ponto) + deslocamentos_y(indice_ponto), ...
        rotulos_referencia{indice_ponto}, ...
        'Interpreter', cfg.label_interpreter, ...
        'FontName', cfg.font, 'FontSize', cfg.fontsize - 1, ...
        'HorizontalAlignment', alinhamentos_horizontais{indice_ponto}, ...
        'VerticalAlignment', alinhamentos_verticais{indice_ponto});
end

set(ax, ...
    'FontName', cfg.font, ...
    'FontSize', cfg.fontsize, ...
    'TickLabelInterpreter', cfg.tick_label_interpreter, ...
    'GridLineStyle', cfg.grid_line_style, ...
    'GridLineWidth', cfg.grid_line_width, ...
    'GridAlpha', cfg.grid_alpha, ...
    'LineWidth', cfg.axes_line_width);
grid(ax, 'on');
box(ax, 'on');
ax.BoxStyle = 'full';

xlabel(ax, '$V_{GS}\; (\mathrm{V})$', ...
    'Interpreter', cfg.label_interpreter);
ylabel(ax, '$I_D\; (\mathrm{mA})$', ...
    'Interpreter', cfg.label_interpreter);
legend(ax, 'Location', 'northwest', ...
    'Interpreter', cfg.label_interpreter, ...
    'FontName', cfg.font, 'FontSize', cfg.fontsize - 1);

xticklabels(sep_convert(xticks, '%3.2f', 'virgula'))
stdplot.finish(fig, cfg);
% xlim([0.1 1])


% run pode mudar a pasta corrente; ancoramos a saída na pasta do script.
pasta_saida = fileparts(mfilename('fullpath'));
print(fig, fullfile(pasta_saida, 'fet_shockley.pdf'), '-dpdf', '-vector');
