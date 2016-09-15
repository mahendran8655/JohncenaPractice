/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.eventstate.OperationState.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */

package org.openadr.dras.eventstate;

import java.io.Serializable;
import java.math.BigInteger;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;


/**
 * This represents a single state within a Simple DRAS Clients operation mode schedule.  Each state is represented by an operation mode value and a time parameter that is used to specify the time slot of this state during the period when the DR event is active.  A sequence of these states defines an entire response schedule.
 * 
 * 
 * <p>Java class for OperationState complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="OperationState">
 * &lt;complexContent>
 * &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 * &lt;sequence>
 * &lt;element ref="{http://www.openadr.org/DRAS/EventState}OperationModeValue"/>
 * &lt;element name="modeTimeSlot" type="{http://www.w3.org/2001/XMLSchema}nonNegativeInteger"/>
 * &lt;/sequence>
 * &lt;/restriction>
 * &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "OperationState", propOrder = {
    "operationModeValue",
    "modeTimeSlot"
})
public class OperationState
    implements Serializable
{

    /** The operation mode value. */
    @XmlElement(name = "OperationModeValue", required = true)
    protected String operationModeValue;
    
    /** The mode time slot. */
    @XmlElement(required = true)
    @XmlSchemaType(name = "nonNegativeInteger")
    protected BigInteger modeTimeSlot;

    /**
     * This is simply the Operation mode value for this time slot.
     * 
     * @return the operation mode value
     * 
     * possible object is
     * {@link String }
     */
    public String getOperationModeValue() {
        return operationModeValue;
    }

    /**
     * Sets the value of the operationModeValue property.
     * 
     * @param value allowed object is
     * {@link String }
     */
    public void setOperationModeValue(String value) {
        this.operationModeValue = value;
    }

    /**
     * Gets the value of the modeTimeSlot property.
     * 
     * @return the mode time slot
     * 
     * possible object is
     * {@link BigInteger }
     */
    public BigInteger getModeTimeSlot() {
        return modeTimeSlot;
    }

    /**
     * Sets the value of the modeTimeSlot property.
     * 
     * @param value allowed object is
     * {@link BigInteger }
     */
    public void setModeTimeSlot(BigInteger value) {
        this.modeTimeSlot = value;
    }

}
