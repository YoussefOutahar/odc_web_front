// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "website_name": "OptimaDecision Consulting",
  "website_subtitle": "Smart future is yours",
  "tab_tiles": {
    "home": "Home",
    "blog": "Blog",
    "about": "About Us",
    "formation": "Trainings",
    "conseils": "Advice",
    "contact_us": "Let's talk"
  },
  "home_page": {
    "title": {
      "about_us": "About Us",
      "events": "Events",
      "formations": "Trainings",
      "team": "Our Team",
      "conseils": "Advice"
    },
    "subtitle": {
      "team": "Meet the team behind ODC",
      "events": "Recent events",
      "formations": "Our trainings",
      "conseils": "test"
    }
  },
  "footer": {
    "contact": "Contact Us",
    "follow": "Follow Us"
  },
  "about_page": {
    "who_are_we": "Who are we",
    "our_mission": "Our mission",
    "our_values": "Our Values",
    "what_we_do": "What we do",
    "formations": "Formations"
  },
  "blog_page": {
    "read_more": "Read more",
    "recent_posts": "Recent posts",
    "search_title": "Search",
    "search_hint": "Type here..."
  }
};
static const Map<String,dynamic> fr = {
  "website_name": "OptimaDecision Consulting",
  "website_subtitle": "Un avenir intelligent est à vous",
  "tab_tiles": {
    "home": "Accueil",
    "blog": "Blog",
    "about": "À propos",
    "formation": "Formations",
    "conseils": "Conseils",
    "contact_us": "Contactez-nous"
  },
  "home_page": {
    "title": {
      "about_us": "À propos",
      "events": "Evenements",
      "formations": "Formations",
      "team": "Notre Equipe",
      "conseils": "Conseils"
    },
    "subtitle": {
      "team": "Rencontrez l'équipe derrière ODC",
      "events": "Événements récents",
      "formations": "Nos formations",
      "conseils": "test"
    }
  },
  "footer": {
    "contact": "Contactez-nous",
    "follow": "Suivez-nous"
  },
  "about_page": {
    "who_are_we": "Qui sommes nous",
    "our_mission": "Notre mission",
    "our_values": "Nos Valeurs",
    "what_we_do": "Ce qu'on fait",
    "formations": "Trainings"
  },
  "blog_page": {
    "read_more": "En savoir plus",
    "recent_posts": "Posts récents",
    "search_title": "Recherche",
    "search_hint": "Écrivez ici..."
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "fr": fr};
}
