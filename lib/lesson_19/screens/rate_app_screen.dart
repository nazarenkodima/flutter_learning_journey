import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_19/bloc/rate_app_cubit.dart';
import 'package:flutter_learning_journey/lesson_19/rate_app_colors.dart';
import 'package:go_router/go_router.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  late final RateAppCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<RateAppCubit>();
  }

  @override
  void dispose() {
    if (_cubit.state.status != RateAppStatus.success) {
      _cubit.reset();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RateAppColors.background,
      appBar: AppBar(
        title: const Text('Flutter lab'),
        backgroundColor: RateAppColors.navy,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: BlocConsumer<RateAppCubit, RateAppState>(
          listenWhen: (prev, curr) =>
              prev.status != curr.status &&
              curr.status == RateAppStatus.success,
          listener: (context, state) {
            final messenger = ScaffoldMessenger.of(context);
            context.pop();
            messenger.showSnackBar(_successSnackBar());
          },
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: RateAppColors.cardBlue,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 48,
                left: 16,
                right: 16,
              ),
              child: state.status == RateAppStatus.success
                  ? const _SuccessView()
                  : _RatingView(state: state),
            );
          },
        ),
      ),
    );
  }
}

class _RatingView extends StatelessWidget {
  const _RatingView({required this.state});

  final RateAppState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RateAppCubit>();
    final isLoading = state.status == RateAppStatus.loading;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        const Text(
          'How would you rate the app?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: RateAppColors.navy,
          ),
        ),
        _StarsRow(
          rating: state.rating,
          onStarTap: isLoading ? null : cubit.setRating,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: (state.rating == 0 || isLoading) ? null : cubit.submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: RateAppColors.navy,
                foregroundColor: Colors.white,
                disabledBackgroundColor: RateAppColors.navy.withValues(
                  alpha: 0.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 30,
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Submit rating'),
            ),
            ElevatedButton(
              onPressed: isLoading ? null : cubit.reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: RateAppColors.cardBlue,
                foregroundColor: RateAppColors.navy,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 30,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [Icon(Icons.refresh, size: 18), Text('Reset rating')],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RateAppCubit>();
    final rating = context.select((RateAppCubit c) => c.state.rating);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        const Text(
          'You rated the app',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: RateAppColors.navy,
          ),
        ),
        _StarsRow(rating: rating),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: cubit.reset,
            style: ElevatedButton.styleFrom(
              backgroundColor: RateAppColors.navy,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Rate again'),
          ),
        ),
      ],
    );
  }
}

class _StarsRow extends StatelessWidget {
  const _StarsRow({required this.rating, this.onStarTap});

  final int rating;
  final ValueChanged<int>? onStarTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final filled = index < rating;
        return GestureDetector(
          onTap: onStarTap == null ? null : () => onStarTap!(index + 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Image.asset(
              filled
                  ? 'assets/images/rating_filled.png'
                  : 'assets/images/rating_empty.png',
              width: 40,
              height: 40,
            ),
          ),
        );
      }),
    );
  }
}

SnackBar _successSnackBar() {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    backgroundColor: RateAppColors.snackBarPill,
    content: const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: .center,
      spacing: 10,
      children: [
        Icon(Icons.star_rounded, color: Colors.white),
        Text(
          'Rating submitted successfully',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Icon(Icons.star_rounded, color: Colors.white),
      ],
    ),
  );
}
