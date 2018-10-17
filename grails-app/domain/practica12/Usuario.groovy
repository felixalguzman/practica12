package practica12

class Usuario {

    Categoria categoria

    String username
    String password
    boolean enabled = true

    String email
    String nombre
    String apellido
    String telefono
    String movil
    String puesto
    String direccion

    Date dateCreated
    Date lastUpdated

    static hasMany = [departamentos: Departamento]

    static constraints = {
        password blank: false, password: true
        username blank: false, unique: true
        email(email: true, unique: true, blank: false)
        movil blank: false, unique: true
        telefono blank: true
    }

    static mapping = {
        password column: '`password`'

    }
}
