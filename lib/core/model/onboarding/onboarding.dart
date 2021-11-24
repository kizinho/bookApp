class SliderModel {
  String? imageAssetPath;
  String? title;
  String? desc;
  double? width;
  double? height;

  SliderModel(
      {this.imageAssetPath, this.title, this.desc, this.width, this.height});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath!;
  }

  String getTitle() {
    return title!;
  }

  String getDesc() {
    return desc!;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>.empty(growable: true);
  SliderModel sliderModel = new SliderModel();

  //slider item 1
  sliderModel.setDesc(
      "With this app you can simply find your best book and browse around them");
  sliderModel.setTitle("Find your best book");
  sliderModel.setImageAssetPath("assets/images/onboarding/screen1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //slider item 2
  sliderModel.setDesc(
      "Follow us and lets take a look around the latest books you can get inspired from");
  sliderModel.setTitle("Get insight of what is happeing");
  sliderModel.setImageAssetPath("assets/images/onboarding/screen2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  ////slider item 3
  sliderModel.setDesc(
      "What are you still waiting for, proceed and feel amazed when browsing through our book store");
  sliderModel.setTitle("Let get started ");
  sliderModel.setImageAssetPath("assets/images/onboarding/screen3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
