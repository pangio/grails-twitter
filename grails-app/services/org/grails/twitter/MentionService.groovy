package org.grails.twitter

import grails.transaction.Transactional
import org.grails.twitter.auth.Person

@Transactional
class MentionService {

    def timelineService

    def getMentionsForUser(String username) {
        def timeline = timelineService.getTimelineForUser(username)

        def mentions = new ArrayList<>()
        for (entry in timeline) {
            if (((Status)entry).message.contains(username)) mentions.add(entry)
        }
        mentions
    }

    def serviceMethod() {

    }
}
