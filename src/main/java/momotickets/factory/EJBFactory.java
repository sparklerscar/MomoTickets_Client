package momotickets.factory;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class EJBFactory {
//	public static Object getEJB(String jndipath) {
//		try {
//			final Hashtable<String, Object> jndiProps = new Hashtable<String, Object>();
//			jndiProps.put("jboss.naming.client.ejb.context", true);
//
//			jndiProps.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
//
//			final Context context = new InitialContext(jndiProps);
//			return context.lookup(jndipath);
//
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
	public static Object getEJB(String beanName, String interfaceName) {
		Hashtable<String, String> jndiProperties = new Hashtable<>();
		jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
		try {
			Context context = new InitialContext(jndiProperties);
			final String fullName = "ejb://MomoTickets_Server//" + beanName + "!" + interfaceName;
			System.out.println("******************************************\n"+context.lookup(fullName));
			return context.lookup(fullName);
		} catch (NamingException e) {
			e.printStackTrace();
		}

		return null;
	}
}
