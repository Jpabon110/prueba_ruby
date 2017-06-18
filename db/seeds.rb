# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
   User.create(rut: 121313, nombre: 'Luke', apellido: 'rivas', image:'',
    email: 'riva@gmail.com', birth: '12/04/1991', password: 'khqek')
   User.create(rut: 23145, nombre: 'Shane', apellido: 'Delawer', image:'',
    email: 'shane@gmail.com', birth: '102/05/1993', password: 'abue112')
   User.create(rut: 3000021, nombre: 'Juan', apellido: 'Pabon', image:'',
    email: 'jpabon110@gmail.com', birth: '09/09/1991', password: 'zero7')
   User.create(rut: 877632, nombre: 'Albert', apellido: 'argenis', image:'',
    email: 'albert@gmail.com', birth: '12/04/1993', password: 'olaik')
   User.create(rut: 954431, nombre: 'Miguel', apellido: 'Pabon', image:'',
    email: 'mpabon@gmail.com', birth: '12/04/1992', password: 'entrar')
