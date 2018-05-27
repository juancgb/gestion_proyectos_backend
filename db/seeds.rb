# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creacion de roles
roles = Role.create([
    { name: 'Admin', description: 'Administrador del sistema', status: true },
    { name: 'Director', description: 'Director de trabajos de grado', status: true },
    { name: 'Estudiante', description: 'Estudiante que realiza en trabajo de grado', status: true }
])

# Creacion de usuarios
users = User.create([
    { name: 'Admin', nickname: 'Admin', email: 'admin@gestionproyectos.edu.co', password: '123456789' },
    { name: 'Director', nickname: 'Director', email: 'director@univalle.edu.co', password: '123456789' },
    { name: 'Estudiante', nickname: 'Estudiante', email: 'estudiante@univalle.edu.co', password: '123456789' }
])

# Creacion de sedes
offices = Office.create([
    { name: 'Sede Tulua', status: true },
    { name: 'Sede Buga', status: true },
    { name: 'Sede Zarzal', status: true },
    { name: 'Sede Palmira', status: true }
])

# Creacion de la relacion usuarios-sedes
UserRole.create([
    { user: users.first, office: offices.first },
    { user: users.first, office: offices.second },
    { user: users.first, office: offices.third },
    { user: users.first, office: offices.fourth },
    { user: users.second, office: offices.first },
    { user: users.third, office: offices.first }
])

# Creacion de sedes
process_level_statuses = ProcessLevelStatus.create([
    { name: 'Activo' },
    { name: 'Inactivo' },
    { name: 'Eliminado' },
])
