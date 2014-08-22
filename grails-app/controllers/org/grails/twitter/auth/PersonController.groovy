package org.grails.twitter.auth



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonController {

    def springSecurityService

    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Person.list(params), model:[personInstanceCount: Person.count()]
    }

    def show(Person personInstance) {
        respond personInstance
    }

    def create() {
        respond new Person(params)
    }

    @Transactional
    def save(Person personInstance) {
        print 'ACTION: save'
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'create'
            return
        }

        personInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'personInstance.label', default: 'User'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
        respond personInstance
    }

    @Transactional
    def update(Person personInstance) {
        print 'ACTION: update'
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'edit'
            return
        }

        personInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), personInstance.id])
                redirect personInstance
            }
            '*'{ respond personInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), personInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def upload_avatar(Person personInstance) {
        print 'ACTION: upload_avatar'
        def user = springSecurityService.currentUser // or however you select the current user

        // Get the avatar file from the multi-part request
        def f = request.getFile('avatar')

        // List of OK mime-types
        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Avatar must be one of: ${okcontents}"
            render(view:'select_avatar', model:[user:user])
            return
        }

        // Save the image and mime type
        personInstance.avatar = f.bytes
        personInstance.avatarType = f.contentType
        log.info("File uploaded: $personInstance.avatarType")

        // Validation works, will check if the image is too big
        if (!personInstance.save()) {
            render(view:'select_avatar', model:[user:user])
            return
        }
        flash.message = "Avatar (${personInstance.avatarType}, ${personInstance.avatar.size()} bytes) uploaded."
        redirect(action:'show')
    }

    def avatar_image() {
        print 'ACTION: avatar_image'
        def personInstance = Person.get(params.id)
        if (!personInstance || !personInstance.avatar || !personInstance.avatarType) {
            response.sendError(404)
            return
        }
        response.contentType = personInstance.avatarType
        response.contentLength = personInstance.avatar.size()
        OutputStream out = response.outputStream
        out.write(personInstance.avatar)
        out.close()
    }

}
