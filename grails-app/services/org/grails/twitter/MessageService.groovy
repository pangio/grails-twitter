package org.grails.twitter

import org.grails.twitter.auth.Person

class MessageService {

	static expose = ['jms']

	def springSecurityService

	void updateMessage(String message) {
		def messageObj = new Message(message: message)
		messageObj.author = lookupCurrentPerson()
		messageObj.save()
	}

	private lookupCurrentPerson() {
		Person.get(springSecurityService.principal.id)
	}
}
