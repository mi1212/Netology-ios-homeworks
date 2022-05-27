//
//  Posts.swift
//  Netology-1_3-navigation
//
//  Created by Mikhail Chuparnov on 23.03.2022.
//

import UIKit

var postsArray: [Post] = [firstPost, secondPost, thirdPost, fourthPost]

var firstPost = Post(
    author: "Марина Скворцова",
    description: "Серджо Топпи — классик и один из родоначальников итальянского комикса, непревзойдённый мастер детализации и оригинальных композиционных решений — радует российских читателей уже семь лет. И если вы вдруг прошли мимо полки с одним из объемных подарочных томов графических новелл Топпи, сейчас самое время вернуться. Ведь это может оказаться его известная серия «Коллекционер» в традиционном для BD альбомном формате, переизданная Zangavar в конце 2021 года.",
    image: "first",
    likes: 321,
    views: 800,
    isLiked: false
)

var secondPost = Post(
    author: "Саша Шишкина",
    description: "Проект «Тетрадь» существует с 2013 года и ежегодно проводит выставки в различных городских пространствах Петербурга. Большая часть работ создаётся студентами Высшей школы журналистики и массовых коммуникаций СПбГУ, но в выставке традиционно участвуют студенты других университетов города, приглашённые художники, каллиграфы, дизайнеры и режиссёры. Авторы выставки каждый год выбирают одну общую тему и создают медиатексты, раскрывающие её проблематику. Тема «печатает…» посвящена тому, что «выговаривается, выписывается, “выпечатывается” в современном коммуникативном пространстве». Благодаря иллюстрациям, мультимедиа-проектам и инсталляциям выставка создаёт иммерсивное пространство, в котором зритель становится читателем, воспринимающим экспозицию как оффлайн-медиа. Посетить выставку «Тетрадь / печатает…» можно с 22 февраля 2022 года на первом этаже пространства «Цех» Севкабель Порта. Вход свободный.",
    image: "second",
    likes: 532,
    views: 968,
    isLiked: false
)

var thirdPost = Post(
    author: "Саша Шишкина",
    description: "Романистка Бернардин Эваристо, получившая в 2019 году Букеровскую премию за книгу «Девушка, женщина, всё остальное», стала первой не белой писательницей-президентом Королевского литературного общества. И второй женщиной на этой позиции за 200 лет существования объединения.    Бернардин сменит Марину Уорнер на должности президента Королевского литературного общества (КЛО) ближе к концу года. Марина руководит клубом с 2017 года, она была первой женщиной-президентом объединения.",
    image: "third",
    likes: 67,
    views: 123,
    isLiked: true
)

var fourthPost = Post(
    author: "Илья Стопорков",
    description: "Книга, о которой пойдет речь, называется «Откровения молодого романиста». Она являет собой сборник лекций Эко о литературе. Всё очень просто. И название, и пояснение. А характеристикой чего, согласно пословице, является «просто», мы прекрасно знаем. Слово «молодой» в названии книги – не шутка. Умберто Эко абсолютно серьезно утверждает, что может называться молодым и перспективным автором, так как написал крайне мало художественных произведений и много чего еще может дать миру. Кстати говоря, разделение литературы на художественную и нехудожественную - это первое, что Эко подвергает сомнению в рамках этой книги. Впрочем, сомнению в Откровениях молодого романиста подвергается и многое другое.",
    image: "fourth",
    likes: 47,
    views: 368,
    isLiked: false
)

