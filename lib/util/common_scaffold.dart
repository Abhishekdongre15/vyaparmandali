// ignore: depend_on_referenced_packages
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/ui_tool_kit/src/assets.dart';
import 'package:vyaparmandali/ui_tool_kit/src/colors.dart';
import 'package:vyaparmandali/ui_tool_kit/src/typography.dart';


class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    Key? key,
    this.child,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.automaticallyImplyLeading = true,
    this.footer,
    this.title,
    this.subtitle,
    this.centerTitle = true,
    this.centerSubtitle = true,
    this.titleTextAlign = TextAlign.center,
    this.subtitleTextAlign = TextAlign.center,
    this.titlePinned = false,
    this.subtitlePinned = false,
    this.slivers,
    this.persistedFooter = false,
    this.scrollPhysics = const AlwaysScrollableScrollPhysics(),
    this.titleHeight = 26,
    this.subtitleHeight = 20,
    this.titleMaxLines,
    this.subTitleMaxLines,
    this.titlePadding = EdgeInsets.zero,
    this.subtitlePadding = EdgeInsets.zero,
  }) : super(key: key);

  final Widget? child;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool automaticallyImplyLeading;
  final Widget? footer;
  final String? title;
  final String? subtitle;
  final bool centerTitle;
  final bool centerSubtitle;
  final TextAlign titleTextAlign;
  final TextAlign subtitleTextAlign;
  final bool titlePinned;
  final bool subtitlePinned;
  final List<Widget>? slivers;
  final bool persistedFooter;
  final ScrollPhysics scrollPhysics;
  final double titleHeight;
  final double subtitleHeight;
  final int? titleMaxLines;
  final int? subTitleMaxLines;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry subtitlePadding;
  // TODO move scaffold to toolkit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: _buildAppbar(context),
      bottomNavigationBar: persistedFooter
          ? Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
              child: footer,
            )
          : null,
      body: SafeArea(
        child: CustomScrollView(
          physics: scrollPhysics,
          slivers: <Widget>[
            if (title != null)
              SliverAppBar(
                backgroundColor: backgroundColor ?? Colors.transparent,
                automaticallyImplyLeading: false,
                centerTitle: centerTitle,
                pinned: titlePinned,
                toolbarHeight: titleHeight,
                title: Padding(
                  padding: titlePinned ? const EdgeInsets.only(bottom: 16, top: 5, left: 7) : titlePadding,
                  child: Text(
                    title!,
                    textAlign: titleTextAlign,
                    maxLines: titleMaxLines,
                    style: ToolkitTypography.h2.copyWith(
                      color: ToolkitColors.black,
                    ),
                  ),
                ),
              ),
            if (subtitle != null)
              SliverPadding(
                padding: const EdgeInsets.only(top: 14, left: 7).add(subtitlePadding),
                sliver: SliverAppBar(
                  backgroundColor: backgroundColor ?? Colors.transparent,
                  automaticallyImplyLeading: false,
                  centerTitle: centerSubtitle,
                  pinned: subtitlePinned,
                  toolbarHeight: subtitleHeight,
                  title: Text(
                    subtitle!,
                    maxLines: subTitleMaxLines,
                    textAlign: subtitleTextAlign,
                    style: ToolkitTypography.body2B.copyWith(
                      color: ToolkitColors.secondaryDarkText,
                    ),
                  ),
                ),
              ),
            if (child != null)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: child,
                ),
              ),
            if (slivers != null)
              ...slivers!.map((e) => SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: e,
                  )),
            if (footer != null && !persistedFooter)
              SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: footer,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  PreferredSize? _buildAppbar(BuildContext context) {
    if (automaticallyImplyLeading) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: 0,
          leading: ToolkitAssets.iconIosBack44.widget(
            fit: BoxFit.none,
            height: 0,
            onTap:(){
              AutoRouter.of(context).pop;
            },
          ),
        ),
      );
    }
    return null;
  }
}
