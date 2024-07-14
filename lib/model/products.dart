import 'package:uuid/uuid.dart';

class Products{
  late String p_id;
  late String p_name;
  late String p_img;
  late double price;

  Products(this.p_name,this.p_img,this.price): p_id = Uuid().v4();
}