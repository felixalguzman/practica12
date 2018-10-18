package practica12

import grails.converters.JSON
import grails.validation.ValidationException
import groovy.json.JsonBuilder

import static org.springframework.http.HttpStatus.*

class CategoriaController {

    CategoriaService categoriaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
       [categorias : Categoria.findAll()]
    }

    def show(Long id) {
        respond categoriaService.get(id)
    }

    def create() {

    }

    def save() {

        try {

            def categoria = new Categoria(params)
            categoria.save(flush:true, failOnError:true)

        } catch (ValidationException e) {
          println e
        }

        redirect(uri: '/')


    }

    def editar(Long id) {
        def categoria = categoriaService.get(id)

        render categoria as JSON
    }

    def update(Integer id, String nombre) {


        def categoria = Categoria.findById(id)

        categoria.setNombre(nombre)
        categoria.save(flush:true, failOnError:true)

        redirect(uri: '/categoria/index')

    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        categoriaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
