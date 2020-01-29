import 'dart:convert' as JSON;
main() {
  int dt1 = DateTime.now().millisecond;
  String nestedJson = '{"Student": [{"1stclass": [{"Name": "student1","RollNumber":25,"Exams": {"1stexam": {"Marks": {"Maths": 100,"English": 78,"science": 79,"Drawing": 97}}}}],"2ndclass": [{"Name": "student2","RollNumber": 7,"Exams": {"1stexam": {"Marks": {"Maths": 89,"English": 90,"science": 69,"Drawing": 40}}}}],"3rdclass": [{"Name": "student3","RollNumber": 106,"Exams": {"1stexam":{"Marks": {"Maths": 99,"English": 94,"science": 95,"Drawing": 96}}}}]}]}';
  Map json3 = JSON.jsonDecode(nestedJson);
  //print(json3);
  print(json3["Student"][0]["1stclass"][0]["Exams"]["1stexam"]["Marks"]["Maths"]);
  json3["Student"][0]["1stclass"][0]["Exams"]["1stexam"]["Marks"]["Maths"]=99;
  print(json3["Student"][0]["1stclass"][0]["Exams"]["1stexam"]["Marks"]);
  print('\n$json3');
  //json3["Student"][0]["1stclass"][0]["Exams"]["1stexam"]["Marks"].remove('Maths');
  //print("\n$json3");
  dynamic ex(json)
  {
    if(json is Map)
    {
      if(json["Marks"]!=null)
      {
        print(json["Marks"]);
      }
      else
      {
       for(int i=0;i<json.length;i++)
       {
        if(json[json.keys.elementAt(i)] is Map)
        {
          Map newjson = json[json.keys.elementAt(i)];
          ex(newjson);
        }
        else if(json[json.keys.elementAt(i)] is List)
        {
          List newjson = json[json.keys.elementAt(i)];
          ex(newjson);
        } 
       }
      }
    }
    else if(json is List)
    {
      for(int i=0;i<json.length;i++)
      {
        if(json[i] is Map)
        {
          Map newjson =  json[i];
          ex(newjson);
        }
        else if(json[i] is List)
        {
          List newjson = json[i];
          ex(newjson);
        }
      }
    }
  }
  ex(json3);
  //print(json3);
  print(json3[json3.keys.elementAt(0)][0]);
  int dt2 = DateTime.now().millisecond;
  print("${dt2-dt1} milli sec");
}
