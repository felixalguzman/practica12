package practica12

class InicioController {

    def index() {

        [contactos: Contacto.count(), departamentos: Departamento.count(), categorias : Categoria.count()]
    }
}
