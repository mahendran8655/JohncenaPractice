package com.akuacom.pss2.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Used to mark fields in @Entity classes that map to non-hibernate-standard column definitions
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@Throwaway
public @interface DubiousColumnDefinition {
	String value() default "";
}
