<!-- 
Copyright 2008, 2009 UFPE - Universidade Federal de Pernambuco
 
Este arquivo é parte do programa Amadeus Sistema de Gestão de Aprendizagem, ou simplesmente Amadeus LMS
 
O Amadeus LMS é um software livre; você pode redistribui-lo e/ou modifica-lo dentro dos termos da Licença Pública Geral GNU como
publicada pela Fundação do Software Livre (FSF); na versão 2 da Licença.
 
Este programa é distribuído na esperança que possa ser útil, mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a Licença Pública Geral GNU para maiores detalhes.
 
Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título "LICENCA.txt", junto com este programa, se não, escreva para a Fundação do Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>

<logic:notPresent name="user"> 
	<logic:redirect action="system.do?method=showViewWelcome"/> 
</logic:notPresent>

<script type="text/javascript">
	function lfCreateEvaluation(idModule, positionModule) { 
		createEvaluation(idModule, positionModule, '<img border=0 src=<%=request.getContextPath()%>/themes/default/imgs/ajax-loader-activity.gif /><bean:message key="ajaxLoading.save" />');
	}
	$(function(){$('#startEvaluation').datepicker({changeMonth: true,changeYear: true, showAnim: 'scale'});});
	$(function(){$('#finishEvaluation').datepicker({changeMonth: true,changeYear: true, showAnim: 'scale'});});
</script>

<div id="evaluationActivities" class="cmBody">
<html:form action="newEvaluation" >
	<div class="cmTitle">
		<bean:message key="activities.evaluation" />
	</div>
	<html:errors/>
	<div class="cmLine">	
		<label class="labelAttribute"><bean:message key="activities.evaluation.description" /></label>
	</div>
	<div class="cmLine">
		<html:text name="evaluationActivity" property="descriptionEvaluation"/>
	</div>
	<div class="cmLine">
		<strong><bean:message key="activities.evaluation.period" /></strong>
	</div>
	<div class="cmDataTime">
		<label class="labelAttribute"><bean:message key="activities.evaluation.start" /></label>
		<html:text name="evaluationActivity" property="startEvaluation" styleId="startEvaluation" style="width: 80px;"/>
	</div>
	<div class="cmDataTime">
		<label class="labelAttribute"><bean:message key="activities.evaluation.end" /></label>
		<html:text name="evaluationActivity" property="finishEvaluation" styleId="finishEvaluation" style="width: 80px;"/>	
	</div>
	<div class="cmLine">
		<html:radio name="evaluationActivity" property="afterdeadlineachievedEvaluation" value="true"/>
		<bean:message key="activities.evaluation.allowPeriod" />
	</div>
	<div class="cmLine">
		<html:radio name="evaluationActivity" property="afterdeadlineachievedEvaluation" value="false"/>
		<bean:message key="activities.evaluation.denyPeriod" />
	</div>
	<div class="cmFooter">
		<div id="actions">
		<a onclick="lfCreateEvaluation(${module.id}, ${module.position});" href="javascript:void(0)"><bean:message key="general.save" /></a> / 
		<a onclick="cancelShowListActivity(${module.position});" href="javascript:void(0)"><bean:message key="general.cancel" /></a>
		</div>
	</div>
</html:form>
</div>