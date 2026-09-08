" Ejemplo: Programación Orientada a Objetos en Smalltalk
    Definición de clases y uso de herencia
" 

Object subclass: #Animal [
    | nombre edad |
    
    nombre: n [
        nombre := n.
    ]
    
    edad: a [
        edad := a.
    ]
    
    moverse [
        ('Animal llamado ' , nombre , ' se está moviendo') displayNl.
    ]
    
    hacer_sonido [
        'Sonido genérico de animal' displayNl.
    ]
]

" Clase derivada: Perro hereda de Animal
Animal subclass: #Perro [
    hacer_sonido [
        ('Perro ' , nombre , ' ladra: ¡Guau guau!' ) displayNl.
    ]
    
    traer_objeto [
        (nombre , ' está trayendo el objeto') displayNl.
    ]
]

" Clase derivada: Gato hereda de Animal
Animal subclass: #Gato [
    hacer_sonido [
        ('Gato ' , nombre , ' maúlla: ¡Miau!') displayNl.
    ]
    
    rasgunar [
        (nombre , ' está rasguñando') displayNl.
    ]
]

" Uso de las clases
perro := Perro new.
perro nombre: 'Rex'.
perro edad: 5.
perro moverse.
perro hacer_sonido.
perro traer_objeto.

'---' displayNl.

gato := Gato new.
gato nombre: 'Whiskers'.
gato edad: 3.
gato moverse.
gato hacer_sonido.
gato rasgunar.
" ========================================
" EJEMPLO: Clase de Banco
" ========================================

Object subclass: #CuentaBancaria [
    | titular saldo |
    
    inicializar: t con_saldo: s [
        titular := t.
        saldo := s.
    ]
    
    ver_saldo [
        ('Saldo de ' , titular , ': $' , saldo asString) displayNl.
    ]
    
    depositar: cantidad [
        (cantidad <= 0)
            ifTrue: [ 'Error: Cantidad debe ser positiva' displayNl. ^ self ].
        saldo := saldo + cantidad.
        ('Depósito de $' , cantidad asString , ' completado') displayNl.
    ]
    
    retirar: cantidad [
        (cantidad <= 0)
            ifTrue: [ 'Error: Cantidad debe ser positiva' displayNl. ^ self ].
        (cantidad > saldo)
            ifTrue: [ 'Error: Saldo insuficiente' displayNl. ^ self ].
        saldo := saldo - cantidad.
        ('Retiro de $' , cantidad asString , ' completado') displayNl.
    ]
    
    transferir_a: otra_cuenta cantidad: cantidad [
        (cantidad > saldo)
            ifTrue: [ 'Error: Saldo insuficiente para transferencia' displayNl. ^ self ].
        self retirar: cantidad.
        otra_cuenta depositar: cantidad.
        ('Transferencia completada de ' , cantidad asString) displayNl.
    ]
]

" Uso de CuentaBancaria
'=== EJEMPLO DE BANCO ===' displayNl.

cuenta_juan := CuentaBancaria new.
cuenta_juan inicializar: 'Juan' con_saldo: 1000.
cuenta_juan ver_saldo.

cuenta_maria := CuentaBancaria new.
cuenta_maria inicializar: 'María' con_saldo: 500.
cuenta_maria ver_saldo.

'---' displayNl.

cuenta_juan depositar: 200.
cuenta_juan ver_saldo.

cuenta_juan retirar: 150.
cuenta_juan ver_saldo.

'---' displayNl.

cuenta_juan transferir_a: cuenta_maria cantidad: 300.
cuenta_juan ver_saldo.
cuenta_maria ver_saldo.
" ========================================
" EJEMPLO: Estudiante y Calificaciones
" ========================================

Object subclass: #Estudiante [
    | nombre calificaciones |
    
    inicializar: n [
        nombre := n.
        calificaciones := OrderedCollection new.
    ]
    
    agregar_calificacion: nota [
        calificaciones add: nota.
    ]
    
    obtener_promedio [
        (calificaciones isEmpty)
            ifTrue: [ ^ 0 ].
        ^ (calificaciones inject: 0 into: [ :sum :x | sum + x ]) / calificaciones size.
    ]
    
    mostrar_info [
        ('Estudiante: ' , nombre) displayNl.
        ('Calificaciones: ' , calificaciones asString) displayNl.
        ('Promedio: ' , (self obtener_promedio) asString) displayNl.
    ]
    
    aprobado [
        ^ (self obtener_promedio) >= 70.
    ]
]

" Uso de Estudiante
'=== EJEMPLO DE ESTUDIANTE ===' displayNl.

estudiante1 := Estudiante new.
estudiante1 inicializar: 'Carlos'.
estudiante1 agregar_calificacion: 85.
estudiante1 agregar_calificacion: 90.
estudiante1 agregar_calificacion: 78.
estudiante1 mostrar_info.

(estudiante1 aprobado)
    ifTrue: [ 'Carlos APROBÓ el curso' displayNl ]
    ifFalse: [ 'Carlos NO APROBÓ el curso' displayNl ].

'---' displayNl.

estudiante2 := Estudiante new.
estudiante2 inicializar: 'Ana'.
estudiante2 agregar_calificacion: 65.
estudiante2 agregar_calificacion: 60.
estudiante2 agregar_calificacion: 55.
estudiante2 mostrar_info.

(estudiante2 aprobado)
    ifTrue: [ 'Ana APROBÓ el curso' displayNl ]
    ifFalse: [ 'Ana NO APROBÓ el curso' displayNl ].
" ========================================
