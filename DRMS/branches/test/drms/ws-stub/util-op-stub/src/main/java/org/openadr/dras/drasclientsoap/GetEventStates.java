/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.drasclientsoap.GetEventStates.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */

package org.openadr.dras.drasclientsoap;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GetEventStates complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="GetEventStates">
 * &lt;complexContent>
 * &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 * &lt;sequence>
 * &lt;element name="empty" type="{http://www.w3.org/2001/XMLSchema}anyType"/>
 * &lt;/sequence>
 * &lt;/restriction>
 * &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GetEventStates", propOrder = {
    "empty"
})
public class GetEventStates {

    /** The empty. */
    @XmlElement(required = true)
    protected Object empty;

    /**
     * Gets the value of the empty property.
     * 
     * @return the empty
     * 
     * possible object is
     * {@link Object }
     */
    public Object getEmpty() {
        return empty;
    }

    /**
     * Sets the value of the empty property.
     * 
     * @param value allowed object is
     * {@link Object }
     */
    public void setEmpty(Object value) {
        this.empty = value;
    }

}
