package practica12

class Usuario {

    String username
    String password
    boolean enabled = true

    Date dateCreated
    Date lastUpdated

    static constraints = {
        password blank: false, password: true
        username blank: false, unique: true
    }

    static mapping = {
        password column: '`password`'

    }
}
