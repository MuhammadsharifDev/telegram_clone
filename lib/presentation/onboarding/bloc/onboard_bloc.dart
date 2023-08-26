import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:telegram_clone/core/utils/app_images.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(const OnboardState()) {
    on<PageViewEvent>(_pageviewItem);
  }
  void _pageviewItem(PageViewEvent event,Emitter<OnboardState> emit){
    emit(state.copyWith(items: items));
  }
}

final List<PageViewItems> items=[
  PageViewItems(image: AppImages.onboarding_image, description:'Welcome to chatboat\n,a great friend to chat\n with you'),
  PageViewItems(image: AppImages.onboarding_image, description:'If you are confused about\n what to do just open\n Chatboat app'),
  PageViewItems(image: AppImages.onboarding_image, description:'Chatboat will be ready\n to chat & make you\n happy'),
];