/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.eventstate.ListOfEventStates.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */

package org.openadr.dras.eventstate;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * This is used to represent a list of EventState entities.
 * 
 * 
 * <p>Java class for ListOfEventStates complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ListOfEventStates">
 * &lt;complexContent>
 * &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 * &lt;sequence>
 * &lt;element name="eventStates" type="{http://www.openadr.org/DRAS/EventState}EventState" maxOccurs="unbounded" minOccurs="0"/>
 * &lt;/sequence>
 * &lt;/restriction>
 * &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ListOfEventStates", propOrder = {
    "eventStates"
})
public class ListOfEventStates
    implements Serializable
{

    /** The event states. */
    @XmlElement(nillable = true)
    protected List<EventState> eventStates;

    /**
     * Gets the value of the eventStates property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the eventStates property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     * getEventStates().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link EventState }
     * 
     * @return the event states
     */
    public List<EventState> getEventStates() {
        if (eventStates == null) {
            eventStates = new ArrayList<EventState>();
        }
        return this.eventStates;
    }

}
