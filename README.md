# Data-Science-Capstone

Project Goal
========================================================

The goal of this project is to create a predictive text model. Coursera partnered with SwiftKey to challenge Capstone participants to take on the same problems and questions Swiftkey encounters when developing their technologies. The Capstone participants analyzed, cleaned, and organized large bodies of text from blogs, twitter and the news into a text prediction system. The text prediction system is presented as a shiny app.

Method
========================================================

Data for the prediction model came from three sources: Twitter, Blogs and News. The cleaned data was tokenized into n-grams. "In the fields of computational linguistics and probability, an n-gram is a contiguous sequence of n items from a given sequence of text or speech." (https://en.wikipedia.org/wiki/N-gram)

The bi-, tri-, and quad-grams were organized by frequency in a sql table and are then used to predict the next word after input by the user. The application searches the quad-grams first then uses "Stupid Backoff" method to check the tri-grams, then bi-grams until it finds a sequence match.
