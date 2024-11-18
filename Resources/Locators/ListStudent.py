
# ListStudent.robot

loc_title_list  = "xpath://p[normalize-space(text())='Lista de alunos']"
loc_filter_registration_input = "xpath://input[@placeholder='Filtrar por matrícula...']"
loc_filter_name_input = "xpath://input[@placeholder='Filtrar por nome...']"
loc_name_student_list = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-nome.mat-column-nome"
loc_email_student_list = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-email.mat-column-email"
loc_turn_student_list = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-cargo.mat-column-cargo"
loc_course_student_list = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-curso.mat-column-curso"
loc_registration_student_list = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-matricula.mat-column-matricula"
loc_delete_button_list = "xpath://mat-icon[text()='delete']"


loc_email_student = "xpath://span[text()='aluno_exclusao@restinga.ifrs.edu.br']"
loc_turn_student = "xpath://tr[td/span[text()='aluno_exclusao@restinga.ifrs.edu.br']]//td/span[text()='Manhã']"
loc_course_student = "xpath://tr[td/span[text()='aluno_exclusao@restinga.ifrs.edu.br']]//td/span[text()='Análise e Desenvolvimento de Sistemas']"
loc_registration_student = "xpath://tr[td/span[text()='aluno_exclusao@restinga.ifrs.edu.br']]//td/span[text()='1234567890']"
loc_delete_button = "xpath://tr[td/span[text()='aluno_exclusao@restinga.ifrs.edu.br']]//button[mat-icon[contains(text(), 'delete')]]"
loc_confirm_delete_button = "xpath://button[span[contains(text(), 'Confirmar')]]"








