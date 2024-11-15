CREATE TABLE user (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(100) NOT NULL,
                      user_name VARCHAR(100) NOT NULL,
                      password VARCHAR(255) NOT NULL
);
CREATE TABLE news (
                      news_id INT AUTO_INCREMENT PRIMARY KEY,
                      title VARCHAR(255) NOT NULL,
                      author VARCHAR(100) NOT NULL,
                      content TEXT NOT NULL,
                      publish_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                      image_path VARCHAR(255)
);

INSERT INTO news (title, author, content, publish_time, update_time, image_path) VALUES
                                                                                     ('News Title 1', 'Author 1', 'Content for news article 1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'path/to/image1.jpg'),
                                                                               ('News Title 2', 'Author 2', 'Content for news article 2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'path/to/image2.jpg'),
                                                                                     ('News Title 3', 'Author 3', 'Content for news article 3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'path/to/image3.jpg'),
                                                                                     ('News Title 4', 'Author 4', 'Content for news article 4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'path/to/image4.jpg'),
                                                                                     ('News Title 5', 'Author 5', 'Content for news article 5', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'path/to/image5.jpg');

CREATE TABLE  gonggao(
                  news_id INT AUTO_INCREMENT PRIMARY KEY,
                  title VARCHAR(255) NOT NULL,
                  author VARCHAR(100) NOT NULL,
                  content TEXT NOT NULL,
                  publish_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                  image_path VARCHAR(255)
);

