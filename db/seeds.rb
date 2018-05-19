# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creacion de roles
/roles = Role.create([
    { name: 'Admin', description: 'Administrador del sistema', status: true }
])

# Creacion de usuarios
users = User.create([
    { name: 'Admin', nickname: 'Admin', email: 'admin@gestionproyectos.edu.co', password: '123456789' }
])

# Creacion de sedes
offices = Office.create([
    { name: 'Admin', status: true }
])

# Creacion de la relacion usuarios-sedes
UserRole.create([
    { user: users.first, office: offices.first }
])/

# Creacion de sedes
process_level_statuses = ProcessLevelStatus.create([
    { name: 'Activo' },
    { name: 'Inactivo' },
    { name: 'Eliminado' },
])