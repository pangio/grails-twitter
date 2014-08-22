package org.grails.twitter

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

import org.grails.twitter.auth.Person

@Secured('IS_AUTHENTICATED_FULLY')
class StatusController {

    def statusService
    def mentionService
    def timelineService
    def springSecurityService

    def index() {
        def messages = timelineService.getTimelineForUser(springSecurityService.principal.username)
        def mentions = mentionService.getMentionsForUser(springSecurityService.principal.username)

        mentions.each {
            println(it)
        }
        [statusMessages: messages, mentions: mentions]
    }

    def updateStatus(String message) {
        statusService.updateStatus message
        def messages = timelineService.getTimelineForUser(springSecurityService.principal.username)
        
        def content = twitter.renderMessages messages: messages
        render content
    }

    def follow(long id) {
        statusService.follow id
        redirect action: 'index'
    }
	
	def like(long id) {
		statusService.like id
		
		def content = twitter.renderLikes message: Status.get(id)
		render content
	}

    def mentions () {
        def mentions = mentionService.getMentionsForUser(springSecurityService.principal.username)
        mentions.each {
            println it
        }
        [mentions: mentions]
    }
}
