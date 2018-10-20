package practica12

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ContactoController {

    ContactoService contactoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        [usuarios: Contacto.findAll()]
    }

    def show(Long id) {
        respond contactoService.get(id)
    }

    def create() {
        def categorias = Categoria.findAll()
        println categorias.size()
        render(view: "create", model: [categorias: categorias])
    }

    def save(Contacto contacto) {
        try {
//            usuarioService.save(contacto)
            def usuario = new Contacto(params)

            usuario.save(flush: true, failOnError: true)

        } catch (ValidationException e) {
            println e
        }

        redirect(uri: '/contacto/index')
    }

    def edit(Long id) {
        respond contactoService.get(id)
    }

    def update(Contacto contacto) {
        if (contacto == null) {
            notFound()
            return
        }

        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect contacto
            }
            '*'{ respond contacto, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        contactoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
