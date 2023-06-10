import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/handle_excepiton.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/model/Competitivetiers_model.dart';
import 'package:valoinfos/translations/locale_keys.g.dart';
import 'package:valoinfos/utilities/strings.dart';
import 'package:valoinfos/viewmodels/data_view_model.dart';
import 'package:valoinfos/widgets/custom_appbar.dart';
import 'package:valoinfos/widgets/packages/cache_image.dart';

class CompPage extends StatefulWidget {
  const CompPage({super.key});

  @override
  State<CompPage> createState() => _CompPageState();
}

class _CompPageState extends State<CompPage> {
  DataViewModel? _dataViewModel;
  List<Datum>? _comp;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getFutures();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tier>? tierList = _comp?[0].tiers;
    _dataViewModel ??= Provider.of<DataViewModel>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(LocaleKeys.comp.tr()),
      ),
      body: body(tierList),
    );
  }

  Widget body(List<Tier>? tierList) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: Style.pagePadding,
        child: compList(tierList),
      ),
    );
  }

  Widget compList(List<Tier>? tierList) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: tierList?.length ?? 0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Style.defautlCrossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return compCard(tierList, index);
      },
    );
  }

  Widget compCard(List<Tier>? tierList, int index) {
    String tierColor = "0xff${tierList?[index].color}";
    return Card(
      color: Color(int.parse(tierColor)),
      elevation: Style.defaultElevation,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(Style.defaultPaddingSize * 1.35),
            child: CacheImage(
              image: tierList?[index].largeIcon,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: compTitle(tierList, index),
          ),
        ],
      ),
    );
  }

  Widget compTitle(List<Tier>? tierList, int index) {
    String tierBackColor = "0xff${tierList?[index].backgroundColor}";
    return Container(
      padding: EdgeInsets.all(Style.defaultPaddingSize / 2),
      color: Color(int.parse(tierBackColor)),
      child: Text(
        tierList?[index].tierName ?? StringData.noData,
        style: context.theme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> _getFutures() async {
    try {
      await _dataViewModel!.getComp(context.locale).then(
            (value) => _comp = value,
          );
      setState(() {});
    } catch (e) {
      HandleException.handle(context: context);
    }
  }
}
