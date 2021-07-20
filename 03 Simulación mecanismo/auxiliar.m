% Funciones de referencia para el robot
paso_normal_desp=paso_trebol_normal+1;
paso_expan_desp=paso_trebol_expandido+1;

%Trebol normal
Treb_norm1 = [0 -0.7854;0.5 -0.7854;(0.5:0.08:1)' tg(:,1) ;paso_normal_desp' t_q1]; 
Treb_norm2 = [0 2.3562;0.5 2.3562;(0.5:0.08:1)' tg(:,2) ;paso_normal_desp' t_q2]; 
%Trebol expandido
Treb_expa1 = [0 -0.7854;0.5 -0.7854;(0.5:0.08:1)' tg(:,1) ;paso_expan_desp' t_q1]; 
Treb_expa2 = [0 2.3562;0.5 2.3562;(0.5:0.08:1)' tg(:,2) ;paso_expan_desp' t_q2];