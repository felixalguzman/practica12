package practica12

class Rol {

    String authority



    static constraints = {
        authority blank: false, unique: true

    }

    static mapping = {
        cache true
    }
}
