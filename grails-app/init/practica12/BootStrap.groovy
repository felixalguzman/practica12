package practica12

import auth.Usuario

class BootStrap {

    def init = { servletContext ->


        if (Categoria.count() < 1){

            def categoria1 = new Categoria(nombre: "Normal")
            def categoria2 = new Categoria(nombre: "Importante")
            def categoria3 = new Categoria(nombre: "Bajo")

            categoria1.save(flush: true, failOnError: true)
            categoria2.save(flush: true, failOnError: true)
            categoria3.save(flush: true, failOnError: true)
        }

        if (Contacto.count() < 2){

            def contacto = new Contacto(nombre: "felix", apellido: "g", puesto: "dev", telefono: "654645", direccion: "sucasa", categorias: [Categoria.first()], email: "felix@gmail.com", movil: "80980890")

            contacto.save(flush:true, failOnError: true)
        }

        if (Usuario.count() < 1){

            def admin = new Usuario(username: "admin", password: "admin")
            admin.save(flush: true, failOnError: true)
        }


    }


    def destroy = {
    }
}
