import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yemenshabab_news_cms_mobile/data/models/news/news.dart';
import 'package:yemenshabab_news_cms_mobile/services/news/routes/news_routes.dart';

class NewsRepository {
  Future<List<News>> fetchNews() async {
    return Future.value([
      News(id: '1', title: 'title1', content: 'content1', imageUrl: 'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/tsah7c9evnal289z5fig/IMG%20Worlds%20of%20Adventure%20Admission%20Ticket%20in%20Dubai%20-%20Klook.jpg'),
      News(id: '2', title: 'title2', content: 'content1', imageUrl: 'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/tsah7c9evnal289z5fig/IMG%20Worlds%20of%20Adventure%20Admission%20Ticket%20in%20Dubai%20-%20Klook.jpg'),
      News(id: '3', title: 'title3', content: 'content1', imageUrl: 'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/tsah7c9evnal289z5fig/IMG%20Worlds%20of%20Adventure%20Admission%20Ticket%20in%20Dubai%20-%20Klook.jpg'),
      News(id: '4', title: 'title4', content: 'content1', imageUrl: 'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/tsah7c9evnal289z5fig/IMG%20Worlds%20of%20Adventure%20Admission%20Ticket%20in%20Dubai%20-%20Klook.jpg'),
      News(id: '5', title: 'title5', content: 'content1', imageUrl: 'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/tsah7c9evnal289z5fig/IMG%20Worlds%20of%20Adventure%20Admission%20Ticket%20in%20Dubai%20-%20Klook.jpg'),
    ]);

    final response = await http.get(Uri.parse(NewsRoutes.fetchNews));

    if (response.statusCode == 200) {
      final List<dynamic> newsJson = jsonDecode(response.body);
      return newsJson.map((json) => News.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
