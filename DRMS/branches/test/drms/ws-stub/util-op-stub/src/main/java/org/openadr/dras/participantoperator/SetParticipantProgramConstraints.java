/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.participantoperator.SetParticipantProgramConstraints.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */

package org.openadr.dras.participantoperator;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import org.openadr.dras.participantaccount.ListOfParticipantAccountIDs;
import org.openadr.dras.programconstraint.ProgramConstraint;


/**
 * <p>Java class for SetParticipantProgramConstraints complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="SetParticipantProgramConstraints">
 * &lt;complexContent>
 * &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 * &lt;sequence>
 * &lt;element name="participantIDs" type="{http://www.openadr.org/DRAS/ParticipantAccount}ListOfParticipantAccountIDs"/>
 * &lt;element name="participantGroup" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 * &lt;element name="programConstraint" type="{http://www.openadr.org/DRAS/ProgramConstraint}ProgramConstraint"/>
 * &lt;/sequence>
 * &lt;/restriction>
 * &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "SetParticipantProgramConstraints", propOrder = {
    "participantIDs",
    "participantGroup",
    "programConstraint"
})
public class SetParticipantProgramConstraints
    implements Serializable
{

    /** The participant i ds. */
    @XmlElement(required = true)
    protected ListOfParticipantAccountIDs participantIDs;
    
    /** The participant group. */
    @XmlElement(nillable = true)
    protected String participantGroup;
    
    /** The program constraint. */
    @XmlElement(required = true)
    protected ProgramConstraint programConstraint;

    /**
     * Gets the value of the participantIDs property.
     * 
     * @return the participant i ds
     * 
     * possible object is
     * {@link ListOfParticipantAccountIDs }
     */
    public ListOfParticipantAccountIDs getParticipantIDs() {
        return participantIDs;
    }

    /**
     * Sets the value of the participantIDs property.
     * 
     * @param value allowed object is
     * {@link ListOfParticipantAccountIDs }
     */
    public void setParticipantIDs(ListOfParticipantAccountIDs value) {
        this.participantIDs = value;
    }

    /**
     * Gets the value of the participantGroup property.
     * 
     * @return the participant group
     * 
     * possible object is
     * {@link String }
     */
    public String getParticipantGroup() {
        return participantGroup;
    }

    /**
     * Sets the value of the participantGroup property.
     * 
     * @param value allowed object is
     * {@link String }
     */
    public void setParticipantGroup(String value) {
        this.participantGroup = value;
    }

    /**
     * Gets the value of the programConstraint property.
     * 
     * @return the program constraint
     * 
     * possible object is
     * {@link ProgramConstraint }
     */
    public ProgramConstraint getProgramConstraint() {
        return programConstraint;
    }

    /**
     * Sets the value of the programConstraint property.
     * 
     * @param value allowed object is
     * {@link ProgramConstraint }
     */
    public void setProgramConstraint(ProgramConstraint value) {
        this.programConstraint = value;
    }

}
