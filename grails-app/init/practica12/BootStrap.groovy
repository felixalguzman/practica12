package practica12

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

        if (Usuario.count() < 2){

            def admin = new Usuario(username: "admin",nombre: "felix", apellido: "g", puesto: "dev", telefono: "654645", direccion: "sucasa", categoria: Categoria.first(), password: "1234", email: "felix@gmail.com", movil: "80980890")

            admin.save(flush:true, failOnError: true)
        }


    }


    def destroy = {
    }
}
