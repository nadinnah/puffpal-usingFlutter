class CarouselDataModel {
  final String title;
  final String imageName;
  final String description;

  CarouselDataModel(this.title, this.imageName, this.description);
}

List<CarouselDataModel> carouselDataList = [
  CarouselDataModel('title1', 'lib/assets/images/asthmaKids.jpg', 'description1'),
  CarouselDataModel('title2', 'lib/assets/images/Asthma_Inhaler.jpg', 'description2'),
  CarouselDataModel('title3', 'lib/assets/images/diana1.png', 'description3'),
  CarouselDataModel('title4', 'lib/assets/images/diana2.jpg', 'description4'),
  CarouselDataModel('title5', 'lib/assets/images/diana3.jpg', 'description5'),
  CarouselDataModel('title6', 'lib/assets/images/giftblack.jpg', 'description6'),
];
