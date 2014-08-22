package org.grails.twitter.auth

import org.grails.twitter.Message

class Person {

    String realName
	String username
	String password
	boolean enabled

    byte[] avatar
    String avatarType

    boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	static hasMany = [followed:Person, messages: Message]
	static searchable = [only: 'realName']

	static constraints = {
		username blank: false, unique: true
		password blank: false

        avatar(nullable:true, maxSize: 163840 /* 16K */)
        avatarType(nullable:true)

    }

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByPerson(this).collect { it.authority } as Set
	}
}
