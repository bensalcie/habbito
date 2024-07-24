/// PAGE ROUTES
/// [home_page_route]
/// [topics_page_index]
/// [chat_page_index]
/// [personal_page_index]
/// [about_page_index]
library;
// ignore_for_file: constant_identifier_names

//HOME
const home_page_route = '/home';
const topic_details_index = 'topic-details';
const homepage_to_topic_details_page = '$home_page_route/$topic_details_index';

//TOPICS
const topics_page_index = '/topics';
const topics_to_details_page = '$topics_page_index/$topic_details_index';
//CHAT
const chat_page_index = '/chat';

//PERSONAL
const personal_page_index = '/personal';
const add_babbit_index = 'add-habbit';
const personal_to_add_habbit_page = '$personal_page_index/$add_babbit_index';

//ABOUT
const about_page_index = '/about';
