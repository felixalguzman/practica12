package practica12

class UsuarioRol implements Serializable {

    Usuario usuario
    Rol rol

    Date dateCreated
    Date lastUpdated

    static constraints = {

    }

    static mapping = {
        id composite: ['usuario', 'rol']
        version false
    }
}
