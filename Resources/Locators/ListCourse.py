
# ListServer.robot

loc_title_course_management  = "xpath://p[normalize-space(text())='Gerenciamento de cursos']"
loc_name_course_input = "id:nomeCurso"
loc_add_course_button = "xpath://span[text()='Adicionar curso']"
loc_id_course_list = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-id.mat-column-id"
loc_name_course_list = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-nomeCurso.mat-column-nomeCurso"
loc_status_course_list = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-ativo.mat-column-ativo"
loc_alter_status_course_button = "css:span.mat-mdc-button-persistent-ripple.mdc-button__ripple"
loc_delete_course_button = "css:td.mat-mdc-cell.mdc-data-table__cell.cdk-cell.cdk-column-deletar.mat-column-deletar"
loc_name_course = "xpath://td[text()='Curso teste']"
loc_status_course = "xpath://tr[td[contains(text(), 'Curso teste')]]//td[contains(@class, 'mat-column-ativo')]//span[contains(text(), 'Ativo')]"
loc_alter_status_course_active = "xpath://tr[td[contains(text(), 'Curso teste')]]//td[contains(@class, 'mat-column-editar')]//button//span[contains(text(), 'Desativar')]"
loc_delete_course = "xpath://tr[td[contains(text(), 'Curso teste')]]//td[contains(@class, 'mat-column-deletar')]//button[mat-icon[contains(text(), 'delete')]]"#"xpath://tr[td[contains(text(), 'Curso teste')]]//td[contains(@class, 'mat-column-deletar')]//button//mat-icon[text()='delete']"
loc_alter_status_course_disabled = "xpath://tr[td[contains(text(), 'Curso teste')]]//td[contains(@class, 'mat-column-editar')]//button//span[contains(text(), 'Ativar')]"
loc_status_course_inactive = "xpath://tr[td[contains(text(), 'Curso teste')]]//td[contains(@class, 'mat-column-ativo')]//span[contains(text(), 'Inativo')]"
loc_confirm_delete_button = "xpath://button[span[contains(text(), 'Confirmar')]]"
loc_success_msg = "xpath://div[contains(text(),'Curso foi excluído do sistema!')]"






