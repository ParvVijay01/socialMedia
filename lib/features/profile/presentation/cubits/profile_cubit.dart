import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/profile/domain/repos/profile_repo.dart';
import 'package:social_media/features/profile/presentation/cubits/profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  // fetch user profile using repo
  Future<void> fetchUserProfile(String uid) async {
    try {
      emit(ProfileLoading());
      final user = await profileRepo.fetchUserProfile(uid);

      if (user != null) {
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError('Failed to load user profile'));
      }
    } catch (e) {
      emit(ProfileError('Failed to load user profile: $e'));
    }
  }

  // update bio or profile picture
  Future<void> updateProfile({
    required String uid,
    String? newBio,
  }) async {
    emit(ProfileLoading());
    try {
      // Fetch current profile first
      final currentUser = await profileRepo.fetchUserProfile(uid);

      if (currentUser == null) {
        emit(ProfileError("Failed to fetch user for profile update"));
        return;
      }

      // profile picture update

      // update new profile
      final updatedProfile =
          currentUser.copyWith(newBio: newBio ?? currentUser.bio);

      // update in repo
      await profileRepo.updateProfile(updatedProfile);

      // re fetch the updated profile
      await fetchUserProfile(uid);
    } catch (e) {
      emit(ProfileError('Failed to update user profile: $e'));
    }
  }
}
