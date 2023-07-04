List<String> ciudades = [
  'الرياض',
  'جدة ',
  'الدمام',
  'القصيم',
  'الإحساء',
  'الخبر',
  'تبوك',
  'نجران ',
  'خميس مشيط',
  'مكة '
];

class AutosModel {
  String? marca; //
  String? modelo; //
  int? maletas;
  int? asientos; //
  double? valoracion; //
  String? xmodel;
  int? velocidad;
  List<String> image; //
  int? precio;

  AutosModel(
      {this.marca,
      this.modelo,
      this.precio,
      this.valoracion,
      this.asientos,
      required this.image,
      this.maletas,
      this.velocidad,
      this.xmodel});
}

List<AutosModel> stockDeAutos = [
  AutosModel(
      marca: "LADA",
      modelo: "TAXI",
      precio: 25,
      valoracion: 4.0,
      asientos: 2,
      image: ["images/Lada-removebg.png"],
      maletas: 2,
      velocidad: 220,
      xmodel: 'x2'),
        AutosModel(
      marca: "Rolls Royce",
      modelo: "",
      precio: 300,
      valoracion: 4.6,
      asientos: 5,
      image: ["images/Rolls_Royce_2021.png", "images/RollsRos.png", "images/rolsroys.png"],
      maletas: 3,
      velocidad: 160,
      xmodel: 'x1'),
           AutosModel(
      marca: "lamborghini Huracan",
      modelo: "",
      precio: 300,
      valoracion: 4.6,
      asientos: 5,
      image: ["images/lamborghini_huracan.png", "images/huracan.png", ],
      maletas: 3,
      velocidad: 160,
      xmodel: 'x1'),
      AutosModel(
      marca: "panamera",
      modelo: "",
      precio: 450,
      valoracion: 3.9,
      asientos: 4,
      image: ["images/panamera.png"],
      maletas: 2,
      velocidad: 120,
      xmodel: 'x1'),
        AutosModel(
      marca: "G Class",
      modelo: "",
      precio: 500,
      valoracion: 3.9,
      asientos: 4,
      image: ["images/مرسيدس-G63-2023.png","images/G_class_2021.png"],
      maletas: 2,
      velocidad: 120,
      xmodel: 'x1'),

  AutosModel(
      marca: "Audi",
      modelo: "Cabrio",
      precio: 499,
      valoracion: 4.7,
      asientos: 2,
      image: ["images/auto-2.png", "images/auto-2.png", "images/auto-2.png"],
      maletas: 2,
      velocidad: 250,
      xmodel: 'x3'),

  AutosModel(
      marca: "Mercedes Benz",
      modelo: "Faster",
      precio: 499,
      valoracion: 4.0,
      asientos: 4,
      image: ["images/auto-4.png", "images/auto-4.png", "images/auto-4.png"],
      maletas: 2,
      velocidad: 200,
      xmodel: 'x4'),
  
  AutosModel(
      marca: "JEEP",
      modelo: "4x4",
      precio: 399,
      valoracion: 4.2,
      asientos: 4,
      image: ["images/auto-6.png", "images/auto-6.png", "images/auto-6.png"],
      maletas: 2,
      velocidad: 150,
      xmodel: 'x2'),
];
