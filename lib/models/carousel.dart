class CarouselDataModel {
  final String title;
  final String imageName;
  final String description;

  CarouselDataModel(this.title, this.imageName, this.description);
}

List<CarouselDataModel> carouselDataList = [
  CarouselDataModel('title1', 'assets/images/asthmaKids.jpg', 'description1'),
  CarouselDataModel('title2', 'assets/images/Asthma_Inhaler.jpg', 'description2'),
  CarouselDataModel('title3', 'assets/images/diana1.png', 'description3'),
  CarouselDataModel('title4', 'assets/images/diana2.jpg', 'description4'),
  CarouselDataModel('title5', 'assets/images/diana3.jpg', 'description5'),
  CarouselDataModel('title6', 'assets/images/giftblack.jpg', 'description6'),
];
