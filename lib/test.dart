import 'package:postgres/postgres.dart';
import 'dart:math';

void main( List<String> arguments)async{
  var now = new DateTime.now();
  Random rnd = new Random();

  //  //Random rnd2 = new Random(now.millisecondsSinceEpoch);
 //
 //  //month
 //  int minm = 1, maxm = 4;
 //  int sdm = minm + rnd.nextInt(maxm - minm);
 //
 //  //days
 //  int mind = 1, maxd = 31;
 //  int sdd = mind + rnd.nextInt(maxd - mind);
 //
 //  //start time
 //  int min = 9, max =18;
 //  int stt = min + rnd.nextInt(max);
 //
 //  //end time
 //  int e = stt+1;
 //
 //  //ratings
 //  int minr =4, maxr =6;
 //  int r = minr + rnd.nextInt(maxr-minr);

  final conn = PostgreSQLConnection(
    'localhost',
    5435,
    'task',
    username: 'postgres',
    password: 'password',
  );
   await conn.open();
  print('Connected to Postgres Database');

  // await conn.query('''
  //   CREATE TABLE TASK (
  //     task_id serial primary key not null,
  //     user_id varchar,
  //     description text,
  //     task_start time,
  //     task_end  time,
  //     day_selected  date,
  //     recurring text,
  //     ratings decimal
  //   )
  // ''');


  // var uidd = 'ZcHKl6pIB6WhIoEY2XeMlsiU75Y2' ;
  // var descriptionn = 'meeting';
  // var task_startt = '$stt:00';
  // var task_endd = '$e:00' ;
  // var date_selectedd = '2021-$sdm-$sdd';
  // var recurringg = 'no';
  // var ratingss = '$r';

  //await conn.close();

  for (int i = 0;i<=500;i++){

    //month
    int minm = 1, maxm = 4;
    int sdm = minm + rnd.nextInt(maxm - minm);

    //days
    int mind = 1, maxd = 31;
    int sdd = mind + rnd.nextInt(maxd - mind);

    //start time
    int min = 0, max =24;
    int stt = min + rnd.nextInt(max-min);

    //end time
    int e = stt+1;

    //ratings
    int minr =1, maxr =6;
    int r = minr + rnd.nextInt(maxr-minr);

    var uidd = 'NcHKl6pIB6WhIoEY2XeMlsiU75Y2' ;
    var descriptionn = 'task';
    var task_startt = '$stt:00';
    var task_endd = '$e:00' ;
    var date_selectedd = '2021-$sdm-$sdd';
    var recurringg = 'no';
    var ratingss = '$r';

    await conn.query('''
     INSERT INTO task(uid, description, task_start, task_end, date_selected, recurring, ratings) VALUES (@uid, @description, @task_start, @task_end, @date_selected, @recurring, @ratings)
  ''', substitutionValues: {
      'uid': uidd,
      'description': descriptionn,
      'task_start' : task_startt,
      'task_end' : task_endd,
      'date_selected' : date_selectedd,
      'recurring' : recurringg,
      'ratings' : ratingss
    }
    );
  }
  await conn.close();
}