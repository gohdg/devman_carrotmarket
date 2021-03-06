import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];
  // final Map<String, String> locationDatas = {
  //   'ara': '아라동',
  //   'ora': '오라동',
  //   'donam': '도남동'
  // };
  final List<Map<String, String>> locationDatasList = [
    {'code': 'ara', 'name': '아라동'},
    {'code': 'ora', 'name': '오라동'},
    {'code': 'donam', 'name': '도남동'},
  ];

  final f = NumberFormat('#,###', 'ko_KR');
  String calcStringToWon(String priceString) {
    return f.format(int.parse(priceString)) + ' 원';
  }

  String? currentLocation;

  @override
  void initState() {
    super.initState();
    currentLocation = 'ara';

    datas = [
      {
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2",
      },
      {
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "10000",
        "likes": "5",
      },
      {
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0",
      },
      {
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6",
      },
      {
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존게임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2",
      },
      {
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2",
      },
      {
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2",
      },
      {
        "image": "assets/images/ara-8.jpg",
        "title": "냉장쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3",
      },
      {
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3",
      },
      {
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7",
      },
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      elevation: 1,
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        child: PopupMenuButton<String>(
          offset: Offset(0, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (where) {
            setState(() {
              currentLocation = where;
            });
          },
          itemBuilder: (context) {
            // return [
            //   PopupMenuItem(value: 'ara', child: Text('아라동')),
            //   PopupMenuItem(value: 'ora', child: Text('오라동')),
            //   PopupMenuItem(value: 'donam', child: Text('도남동')),
            // ];
            return locationDatasList
                .map((e) => PopupMenuItem(
                    value: e['code'], child: Text(e['name'].toString())))
                .toList();
          },
          child: Row(
            children: [
              Text(locationDatasList
                  .firstWhere(
                      (element) => element['code'] == currentLocation)['name']
                  .toString()),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svg/bell.svg',
            width: 22,
          ),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          // margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  datas[index]['image'].toString(),
                  width: 100,
                  height: 100,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 100,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datas[index]['title'].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        datas[index]['location'].toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        calcStringToWon(datas[index]['price'].toString()),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/heart_off.svg',
                            width: 13,
                            height: 13,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(datas[index]['likes'].toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 1,
          color: Colors.black12,
          // color: Colors.black.withOpacity(0.4),
        );
      },
      itemCount: datas.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
