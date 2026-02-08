part of '../view.dart';

class _Itme extends StatefulWidget {
  const _Itme({required this.title, this.page});
  final String title;
  final Widget? page;

  @override
  State<_Itme> createState() => _ItmeState();
}

class _ItmeState extends State<_Itme> {
  Future<void> logoutUser() async {
    final response = await DioHelper.sendData(endPoint: 'Auth/logout');
    if (response.issucces) {
      CacheHelper.logOut();
      showMsg(response.data!['message']);
      goTo( widget.page!, canPop: false);
    } else {
      showMsg(response.expetion!, isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = '${widget.title.toLowerCase().replaceAll(' ', '_')}.svg';
    final isLogout = widget.title.toLowerCase() == 'logout';

    return ListTile(
      onTap: widget.page != null
          ? () {
              if (isLogout) {
                logoutUser();
              }
            }
          : null,
      leading: AppImage(image: image),
      title: Text(
        widget.title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: isLogout ? const Color(0xffCD0F0F) : const Color(0xff434C6D),
        ),
      ),
      trailing: isLogout
          ? null
          : const AppImage(
              image: 'arrow.svg',
            ),
    );
  }
}
