/*
 * www.akuacom.com - Automating Demand Response
 * 
 * com.akuacom.pss2.clientws.soap.SOAPWS2.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */
package com.akuacom.pss2.clientws.soap;

import java.math.BigInteger;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.ws.Holder;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;
import javax.xml.ws.WebServiceContext;

import org.apache.log4j.Logger;
import org.openadr.dras.drasclientsoap.DRASClientSOAP;
import org.openadr.dras.eventstate.EventStateConfirmation;
import org.openadr.dras.eventstate.ListOfEventStates;
import org.openadr.dras.eventstate.SimpleClientEventData;

import com.akuacom.pss2.cache.EventStateCacheHelper;
import com.akuacom.pss2.client.ClientManager;
import com.akuacom.pss2.contact.ConfirmationLevel;
import com.akuacom.pss2.core.EJBFactory;
import com.akuacom.pss2.event.ClientConversationState;
import com.akuacom.pss2.event.EventManager;
import com.akuacom.pss2.participant.Participant;
import com.akuacom.pss2.system.SystemManager;
import com.akuacom.pss2.system.property.PSS2Features;
import com.akuacom.pss2.util.EventStatus;
import com.akuacom.pss2.util.LogUtils;
import com.akuacom.pss2.util.OperationModeValue;
import com.kanaeki.firelog.util.FireLogEntry;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.1-b03- Generated
 * source version: 2.0
 */
@WebService(name = "DRASClientSOAP", targetNamespace = "http://www.openadr.org/DRAS/DRASClientSOAP/")
public class SOAPWS2 implements DRASClientSOAP {

    /** The program manager. */
    private EventManager eventManager = EJBFactory
            .getBean(EventManager.class);

    private ClientManager clientManager = EJBFactory
            .getBean(ClientManager.class);


    private ThreadLocal<WebServiceContext> threadSafeContext = new ThreadLocal<WebServiceContext>();
    
    @Resource
    public void setContext(WebServiceContext context){
    	threadSafeContext.set(context);
    }
    
    
    /** The Constant log. */
    private static final Logger log = Logger.getLogger(SOAPWS2.class);

    /**
     * Gets the event states.
     * 
     * @param returnValue
     *            the return value
     * @param empty
     *            the empty
     * @param eventStates
     *            the event states
     */
    @WebMethod(operationName = "GetEventStates", action = "http://www.openadr.org/DRAS/DRASClientSOAP/GetEventStates")
    @RequestWrapper(localName = "GetEventStates", targetNamespace = "http://www.openadr.org/DRAS/DRASClientSOAP/", className = "org.openadr.dras.drasclientsoap.GetEventStates")
    @ResponseWrapper(localName = "GetEventStatesResponse", targetNamespace = "http://www.openadr.org/DRAS/DRASClientSOAP/", className = "org.openadr.dras.drasclientsoap.GetEventStatesResponse")
    public void getEventStates(
            @WebParam(name = "empty", targetNamespace = "") Object empty,
            @WebParam(name = "returnValue", targetNamespace = "", mode = WebParam.Mode.OUT) Holder<String> returnValue,
            @WebParam(name = "eventStates", targetNamespace = "", mode = WebParam.Mode.OUT) Holder<ListOfEventStates> eventStates) {
        

        
        Principal principal =   threadSafeContext.get().getUserPrincipal();
        if(principal != null){
        	returnValue.value = "SUCCESS";
            String participantName = principal.getName();
            

            List<org.openadr.dras.eventstate.EventState> es = clientManager.getClientDrasEventStates(participantName);
            if(es != null){
            	eventStates.value = new ListOfEventStates();
            	for(org.openadr.dras.eventstate.EventState eventState: es){
            		eventStates.value.getEventStates().add(eventState);
                    ClientConversationState c = new ClientConversationState();
                    c.setDrasClientId(eventState.getDrasClientID());
                    c.setEventIdentifier(eventState.getEventIdentifier());
                    c.setEventModNumber((int)eventState.getEventModNumber());
                    c.setConversationStateId((int) eventState.getEventStateID());
                    c.setProgramName(eventState.getProgramName());
                    c.setCommTime(new Date());
                    String eventStatus = eventState.getSimpleDRModeData().getEventStatus();
                    c.setEventStatus(Enum.valueOf(EventStatus.class,  eventStatus));
                    String operationModeValue = eventState.getSimpleDRModeData().getOperationModeValue();
                    c.setOperationModeValue(Enum.valueOf(OperationModeValue.class, operationModeValue));
                    clientManager.putClientConversationState(c);
                }
            }

            // DRMS-7273: update client comm right here if confirmation is NONE.
            ConfirmationLevel level = EventStateCacheHelper.getInstance().getConfirmationLevel();
            if (level != ConfirmationLevel.FULL) {
                if (es != null && es.size() > 0) {
                    SimpleClientEventData data = es.get(0).getSimpleDRModeData();
                    String operationModeValue = data.getOperationModeValue();
                    String eventStatus = data.getEventStatus();
                    clientManager.updateParticipantCommunications(participantName, new Date(), true, eventStatus, operationModeValue);
                } else {
                    clientManager.updateParticipantCommunications(participantName, new Date(), true, EventStatus.NONE.toString(), OperationModeValue.UNKNOWN.toString());
                }
            }


        }else{
        	returnValue.value = "FAILURE";	
        }
        

    }

    /**
     * Sets the event state confirmation.
     * 
     * @param eventStateConfirmation
     *            the event state confirmation
     * 
     * @return the string
     */
    /**
     * 
     * @param eventStateConfirmation eventStateConfirmation
     * @return returns java.lang.String
     */
    @WebMethod(operationName = "SetEventStateConfirmation", action = "http://www.openadr.org/DRAS/DRASClientSOAP/SetEventStateConfirmation")
    @WebResult(name = "returnValue", targetNamespace = "")
    @RequestWrapper(localName = "SetEventStateConfirmation", targetNamespace = "http://www.openadr.org/DRAS/DRASClientSOAP/", className = "org.openadr.dras.drasclientsoap.SetEventStateConfirmation")
    @ResponseWrapper(localName = "SetEventStateConfirmationResponse", targetNamespace = "http://www.openadr.org/DRAS/DRASClientSOAP/", className = "org.openadr.dras.drasclientsoap.SetEventStateConfirmationResponse")
    public String setEventStateConfirmation(
            @WebParam(name = "eventStateConfirmation", targetNamespace = "") EventStateConfirmation eventStateConfirmation) {
    	
    	String result = "FAILURE";
    	String clientID = eventStateConfirmation.getDrasClientID();
    	BigInteger eventStateID = null;
    	long eID = 0;
    	
    	try{
    		eventStateID = eventStateConfirmation.getEventStateID();
        	if(eventStateID != null){
        		eID = eventStateID.longValue();
        	}

    	}catch(Exception e){// Ignore    		
    	}
    	
    	
    	boolean confirmation = false;

        ClientConversationState state = null;
        if(clientID != null && eventStateID != null){
            ClientConversationState conversationState = clientManager.getClientConversationState(eID);
            if (conversationState != null && clientID.equals(conversationState.getDrasClientId())) {
                state = conversationState;
            }
            confirmation = state != null;
        }
    	
    	//TODO everything below needs to go on a queue
        
        Principal principal =    threadSafeContext.get().getUserPrincipal();
        if(principal != null){
        	String clientName = principal.getName();

            if (confirmation) {
            	result = "SUCCESS";
            } else {
                FireLogEntry logEntry = new FireLogEntry();
                logEntry.setCategory(LogUtils.CATAGORY_COMMS);
                logEntry.setUserName(clientName);
                logEntry.setDescription("Received SOAP EventStateConfirmation. Result: FAILURE");
                log.warn(logEntry);
            }
        	
            String eventState =  EventStatus.NONE.toString();
            String operationModeValue = OperationModeValue.UNKNOWN.toString();
            if(state != null){
            	eventState = state.getEventStatus().name();
            	operationModeValue = state.getOperationModeValue().name();
            }
            
            clientManager.updateParticipantCommunications(clientName,
                    new Date(), confirmation, eventState, operationModeValue);

            if(eventStateConfirmation.isOptInStatus() != null && 
                	!eventStateConfirmation.isOptInStatus())
                {
        			SystemManager systemManager = EJBFactory.getBean(SystemManager.class);
        			PSS2Features features = systemManager.getPss2Features();
        			if (features.isClientOptOut()) 
        			{
        	             Participant client = clientManager.getClientOnly(clientName);
        	             if (client.getClientAllowedToOptOut()) {
        	            	// TODO move to reports
        	             	log.debug(LogUtils.createLogEntryUser(eventStateConfirmation.getProgramName(),
        	                      clientName, LogUtils.CATAGORY_COMMS, "client opt out received", ""));
        	            	 
        		             eventManager.removeParticipantFromEvent(
        		            		 eventStateConfirmation.getEventIdentifier(), client.getParent());
        	             } else {
        	            	 // not logging this for now to avoid flooding logs.
        	             }
        			}
                }
        	
        }
    	
    	return result;
    	
    }
}
