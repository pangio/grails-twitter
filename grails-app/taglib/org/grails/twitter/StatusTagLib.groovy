package org.grails.twitter

class StatusTagLib {
    static namespace = 'twitter'
    
    def renderMessages = { attrs ->
        def messages = attrs.messages
        messages.eachWithIndex { message, counter ->
            out << g.render(template: '/status/statusMessages', model: [statusMessage: message, messageCounter: counter])
        }
    }

    def renderMentions = { attrs ->
        def mentions = attrs.mentions
        mentions.eachWithIndex { mention, counter ->
            out << g.render(template: '/status/statusMessages', model: [mention: mention, counter: counter])
        }
    }

	def renderLikes = { attrs ->
		def likedPeople
		
		if (attrs.message)
			likedPeople = attrs.message.liked

		out << g.render(template: '/status/statusLikes', model: [likes: likedPeople])
	}
}
