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

    def save() {
        try {
//            usuarioService.save(contacto)
            def contacto = new Contacto(params)
            if (params.categoria != null) {
                def categoria = Categoria.findById(params.categoria as Integer)

                contacto.addToCategorias(categoria)
            }

            if (params.departamentos != null){
//                for (Integer id in params.departamentos){
//                    def departamento = Departamento.findById(id)
//
////                    contacto.addToDepartamentos(departamento)
//                }
                println "departamentos: " + params.departamentos as String
            }


            contacto.save(flush: true, failOnError: true)

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
            respond contacto.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect contacto
            }
            '*' { respond contacto, [status: OK] }
        }
    }

    def delete(Long id) {
        def contacto = Contacto.findById(id)

        contacto.delete(flush: true, failOnError: true)
        render(view: 'index')

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
