part of 'onboard_bloc.dart';

@immutable


class OnboardState extends Equatable{
final List<PageViewItems> items;

const OnboardState({this.items=const []});

OnboardState copyWith({List<PageViewItems>?items }){
  return OnboardState(items:items??this.items);
}


  @override
  List<Object?> get props => [items];

}

class PageViewItems{
  final String image;
  final String description;

  PageViewItems({required this.image,required this.description});

}
