<!doctype html public "-//w3c//dtd html 4.0 transitional//en">  
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://akuacom.com/richext" prefix="richext"%>
<f:view>
<head>
    <jsp:include page="../../head.jsp" />
    
    <script type="text/javascript">
        function _selChange(wholeTable,button){
            var eles =wholeTable.getElementsByClassName('checked');
            var userRole =document.getElementById("userRole").value;
            if(eles.length>0 && userRole=='true'){
                button.removeAttribute("disabled");
            }else{
                button.setAttribute("disabled",true);
            }
            
           // onbeforedomupdate   The client-side script method to be called before DOM is updated
          //  oncomplete  The client-side script method to be called after the request is completed
          //  ontabenter The client-side script method to be called when the tab is switched
         //   ontableave The client-side script method to be called when the tab is left
        }
        function initPage(){
            _selChange($('enrolled-table-col'),$('confirmForm:deleteButton'));
        }
    </script>
</head>
<body onload="initPage()">
	<a4j:keepAlive beanName="historyEvents"/>
	<h:form id="navForm">
	<jsp:include page="../../header.jsp" />
	</h:form>
	<rich:spacer height="5px" width="80px"/>
	<h:inputHidden value="#{programs.deleteEnabled}" id="userRole" />
	<rich:dataTable width="945px" styleClass="wizard-header" style="border-bottom:1px solid #DDDDDD">
		<f:facet name="header4">
			<f:facet name="header">
				<rich:columnGroup>
					<rich:column  style="text-align:left;font-size: 13px;">
						<h:outputText value="#{historyEvents.programName}"/>
					</rich:column>
					<rich:column width="21px">
						<a4j:status>
							<f:facet name="start">
								<h:graphicImage style="margin:0px;"  value="/images/small-ajax-loader.gif"/>
							</f:facet>
						</a4j:status>
					</rich:column>
				</rich:columnGroup>
			</f:facet>
		</f:facet>
	</rich:dataTable>

	<rich:panel id="event-creation-wizard" styleClass="wizard-panel">
		<rich:messages layout="table"  id="msg-block"
			infoClass="global-message-info" warnClass="global-message-warn"
			errorClass="global-message-error" fatalClass="global-message-fatal"/>
		
		<!-- don't draw tab header(showHeader=false) and use next and back button 
		to nagivate among pages,so that it looks like a wizard -->
		<rich:tabPanel selectedTab="#{historyEvents.activePage}" 
					   switchType="ajax"
					   headerClass="wizard-header">
			<richext:tab label="list" id="eventList" status ="waitStatus" showHeader="false"> 
				<jsp:include page="list.jsp"/>
			</richext:tab>		
		</rich:tabPanel>
	</rich:panel>	
	
	 <rich:modalPanel id="comfirmpanel" autosized="false"
            keepVisualState="false" width="315" height="150">
            <h:form onsubmit="" id="deleteForm">
                <rich:panel id="messages">
                    <h:outputText value="The selected event(s) will be deleted. " />
                </rich:panel>
                <a4j:commandButton id="yes" value="Yes"
                    reRender="event-creation-wizard"
                    action="#{historyEvents.doDelete}"
                    oncomplete="#{rich:component('comfirmpanel')}.hide();#{rich:element('deleteButton')}.setAttribute('disabled',true);">
                </a4j:commandButton>
                <a4j:commandButton id="no" value="No"
                    oncomplete="#{rich:component('comfirmpanel')}.hide();" />
            </h:form>
        </rich:modalPanel>
	<jsp:include page="../../footer.jsp" />
</body>	
</f:view>