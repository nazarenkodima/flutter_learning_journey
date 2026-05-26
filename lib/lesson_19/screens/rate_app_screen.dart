import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_journey/lesson_19/bloc/rate_app_cubit.dart';
import 'package:flutter_learning_journey/lesson_19/rate_app_colors.dart';
import 'package:go_router/go_router.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        final cubit = context.read<RateAppCubit>();
        if (cubit.state.status != RateAppStatus.success) {
          cubit.reset();
        }
        context.pop();
      },
      child: Scaffold(
        backgroundColor: RateAppColors.background,
        appBar: AppBar(
          title: const Text('Flutter lab'),
          backgroundColor: RateAppColors.navy,
          foregroundColor: Colors.white,
        ),
        body: BlocConsumer<RateAppCubit, RateAppState>(
        listenWhen: (prev, curr) =>
            prev.status != curr.status && curr.status == RateAppStatus.success,
        listener: (context, state) {
          final messenger = ScaffoldMessenger.of(context);
          context.pop();
          messenger.showSnackBar(_successSnackBar());
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Container(
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
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Image.asset(
                    'assets/images/${state.rating}.png',
                    key: ValueKey(state.rating),
                    height: 160,
                  ),
                ),
              ],
            ),
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
            fontSize: 20,
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
            fontSize: 20,
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
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Image.asset(
                filled
                    ? 'assets/images/rating_filled.png'
                    : 'assets/images/rating_empty.png',
                key: ValueKey(filled),
                width: 40,
                height: 40,
              ),
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
