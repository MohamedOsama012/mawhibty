import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawhibty/controllers/states/onboarding_states.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.jpg',
      'title': '!رحلتك بدأت... ورينا عضلاتك',
      'desc': 'كل مستوى تفتحه بيقرّبك من حلمك!يلا ورينا لمستك السحرية'
    },
    {
      'image': 'assets/images/onboarding2.jpg',
      'title': '!المهارة مش كلام... إثبتها',
      'desc': 'صور نفسك، ارفع الفيديو، وخلي الكورة تتكلم عنك',
    },
    {
      'image': 'assets/images/onboarding3.jpg',
      'title': '!ليفل جديد؟ نجمة جديدة؟ يلا بينا',
      'desc': 'كل ما تكمّل مهمة، تكسب نجمة… وسكة الاحتراف بتقرب',
    }
  ];

  void changePage(int index) {
    currentPage = index;
    emit(OnboardingChangeIndexState());
  }
}
