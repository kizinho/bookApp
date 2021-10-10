class OnboardingStatus {
  OnboardingStatus({
    this.status,
  });

  bool? status;

  factory OnboardingStatus.fromJson(Map<String, dynamic> json) =>
      OnboardingStatus(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
