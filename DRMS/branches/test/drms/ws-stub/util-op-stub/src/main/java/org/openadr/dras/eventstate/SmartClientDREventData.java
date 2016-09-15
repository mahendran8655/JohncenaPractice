/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.eventstate.SmartClientDREventData.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
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
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;


/**
 * This is used to represent all the information associated with a DR Event.  It can be used by Smart DRAS Clients.
 * 
 * 
 * <p>Java class for SmartClientDREventData complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="SmartClientDREventData">
 * &lt;complexContent>
 * &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 * &lt;sequence>
 * &lt;element name="notificationTime" type="{http://www.w3.org/2001/XMLSchema}dateTime"/>
 * &lt;element name="startTime" type="{http://www.w3.org/2001/XMLSchema}dateTime"/>
 * &lt;element name="endTime" type="{http://www.w3.org/2001/XMLSchema}dateTime"/>
 * &lt;element name="nearTime" type="{http://www.w3.org/2001/XMLSchema}dateTime"/>
 * &lt;element name="eventInfoInstances" type="{http://www.openadr.org/DRAS/EventState}EventInfoInstance" maxOccurs="unbounded" minOccurs="0"/>
 * &lt;/sequence>
 * &lt;/restriction>
 * &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "SmartClientDREventData", propOrder = {
    "notificationTime",
    "startTime",
    "endTime",
    "nearTime",
    "eventInfoInstances"
})
public class SmartClientDREventData
    implements Serializable
{

    /** The notification time. */
    @XmlElement(required = true)
    @XmlSchemaType(name = "dateTime")
    protected XMLGregorianCalendar notificationTime;
    
    /** The start time. */
    @XmlElement(required = true)
    @XmlSchemaType(name = "dateTime")
    protected XMLGregorianCalendar startTime;
    
    /** The end time. */
    @XmlElement(required = true)
    @XmlSchemaType(name = "dateTime")
    protected XMLGregorianCalendar endTime;
    
    /** The near time. */
    @XmlElement(required = true)
    @XmlSchemaType(name = "dateTime")
    protected XMLGregorianCalendar nearTime;
    
    /** The event info instances. */
    @XmlElement(nillable = true)
    protected List<EventInfoInstance> eventInfoInstances;

    /**
     * Gets the value of the notificationTime property.
     * 
     * @return the notification time
     * 
     * possible object is
     * {@link XMLGregorianCalendar }
     */
    public XMLGregorianCalendar getNotificationTime() {
        return notificationTime;
    }

    /**
     * Sets the value of the notificationTime property.
     * 
     * @param value allowed object is
     * {@link XMLGregorianCalendar }
     */
    public void setNotificationTime(XMLGregorianCalendar value) {
        this.notificationTime = value;
    }

    /**
     * Gets the value of the startTime property.
     * 
     * @return the start time
     * 
     * possible object is
     * {@link XMLGregorianCalendar }
     */
    public XMLGregorianCalendar getStartTime() {
        return startTime;
    }

    /**
     * Sets the value of the startTime property.
     * 
     * @param value allowed object is
     * {@link XMLGregorianCalendar }
     */
    public void setStartTime(XMLGregorianCalendar value) {
        this.startTime = value;
    }

    /**
     * Gets the value of the endTime property.
     * 
     * @return the end time
     * 
     * possible object is
     * {@link XMLGregorianCalendar }
     */
    public XMLGregorianCalendar getEndTime() {
        return endTime;
    }

    /**
     * Sets the value of the endTime property.
     * 
     * @param value allowed object is
     * {@link XMLGregorianCalendar }
     */
    public void setEndTime(XMLGregorianCalendar value) {
        this.endTime = value;
    }
    
    /**
     * Gets the value of the nearTime property.
     * 
     * @return the near Time
     * 
     * possible object is
     * {@link XMLGregorianCalendar }
     */
    public XMLGregorianCalendar getNearTime() {
		return nearTime;
	}
    
    /**
     * Sets the value of the nearTime property.
     * 
     * @param value allowed object is
     * {@link XMLGregorianCalendar }
     */

	public void setNearTime(XMLGregorianCalendar nearTime) {
		this.nearTime = nearTime;
	}

	/**
     * Gets the value of the eventInfoInstances property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the eventInfoInstances property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     * getEventInfoInstances().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link EventInfoInstance }
     * 
     * @return the event info instances
     */
    public List<EventInfoInstance> getEventInfoInstances() {
        if (eventInfoInstances == null) {
            eventInfoInstances = new ArrayList<EventInfoInstance>();
        }
        return this.eventInfoInstances;
    }

}
