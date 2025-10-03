import 'package:cv_web/bloc/language_bloc.dart';
import 'package:cv_web/data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {


  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme(),
      home: BlocProvider(
        create: (_) => LanguageBloc("ru"),
        child: MainPage()
      ),
    );
  }
}

class MainPage extends StatelessWidget {

  bool isEnglishSelected = false;
  ScrollController scrollController = ScrollController();

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(toolbarHeight: 80, 
          title: 
            Container(padding: EdgeInsets.all(5), alignment: Alignment.centerLeft, child: 
              Row(
                children: [
                  Text("Т. Э.", style: TextStyle(color: AppTheme.baseGreen, fontSize: 30, fontWeight: FontWeight.bold),),
                  Container(width: 1, margin: EdgeInsets.only(left: 15, top: 35), child: Divider(thickness: 50, color: AppTheme.baseGrey,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Данный сайт сделан на Flutter", style: TextStyle(color: AppTheme.baseGrey, fontSize: 30),),
                  )
                ],
              )
            ),
          
          actions: [
            LanguageButton(languageCode: "en"),
            Text("/", style: TextStyle(color: AppTheme.baseGrey, fontSize: 30),),
            LanguageButton(languageCode: "ru"),
            SizedBox(width: 10,)
          ],
            
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              Container(width: double.infinity, height: 1200, decoration: 
                BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromARGB(255, 60, 85, 78), Color.fromARGB(0, 39, 46, 44)]
                  )
                ),  
              ),
              MainContent(),
              Positioned(right: -250, child: GearWidget(scrollController: scrollController,)),
            ],
          ),
        )
      );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FirstBlock(),
      RichText(text: TextSpan(
        style: TextStyle(fontSize: 50, fontFamily: "Roboto-bold", fontWeight: FontWeight.bold, color: AppTheme.baseGrey),
        children: [
          TextSpan(text: "Опубликованные"),
          TextSpan(text: " проекты", style: TextStyle(color: AppTheme.baseGreen))
        ]
      ))
    ]);
  }
}

class FirstBlock extends StatelessWidget {
  const FirstBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 400, height: 550, margin: EdgeInsets.only(left: 80), decoration: 
          BoxDecoration(color: AppTheme.baseGreen, 
            borderRadius: 
              BorderRadiusGeometry.only(bottomLeft: Radius.circular(170), bottomRight: Radius.circular(150)),
            boxShadow: [
              BoxShadow(color: AppTheme.baseGreen, blurRadius: 60)
            ]
          ),
        ),
        SizedBox(width: 150),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 150,), 
          Text("Привет, я", style: TextStyle(fontSize: 50),),
          Text("Туманян Эрик", style: TextStyle(fontSize: 80, color: AppTheme.baseGreen),),
          SizedBox(width: 800, child: Text("Flutter-разработчик | UI/UX дизайнер кроссплатформленных приложений", softWrap: true, style: TextStyle(fontSize: 40),)),
          Text("Опыт некоммерческой разработки: 3 года", style: TextStyle(fontSize: 25, color: AppTheme.baseGreen, fontFamily: "Montserrat", fontWeight: FontWeight.normal),),
          SizedBox(height: 40,),
          Row(children: [
            SocialMediaButton(asset: "assets/images/telegram.png", link: "ssilka"), 
            SocialMediaButton(asset: "assets/images/whatsapp.png", link: "ssilka"), 
            SocialMediaButton(asset: "assets/images/linkedIn.png", link: "ssilka"), 
            SocialMediaButton(asset: "assets/images/github.png", link: "ssilka"),
          ],),
          SizedBox(height: 200,)
        ],),
      
      ],);
  }
}

class GearWidget extends StatefulWidget {

  final ScrollController scrollController;

  const GearWidget({super.key, required this.scrollController});

  @override
  State<GearWidget> createState() => _GearWidgetState();
}

class _GearWidgetState extends State<GearWidget> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  bool isForward = false;
  double scrollOffset = 0;

  double mod(double input)
  {
    if(input < 0)
    {
      return -input;
    }
    else
    {
      return input;
    }
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this);

    widget.scrollController.addListener(() {
      if(widget.scrollController.position.maxScrollExtent > 0)
      {
        double speed = 0.2;
        //  Current scroll offset
        double currentOffset = widget.scrollController.offset / widget.scrollController.position.maxScrollExtent;
        //  Scroll Logic
        if(mod(scrollOffset - currentOffset) > 0.01)
        {
          controller.animateTo(currentOffset * speed*0.2, duration: Duration(milliseconds: 100));
        }
        else
        {
          controller.value = currentOffset * speed;
        }
        
        scrollOffset = currentOffset;

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Lottie.asset(
      "assets/animations/gear_animation.json",
      width: 700,
      controller: controller,
      onLoaded: (composition)
      {
        controller.duration = composition.duration;
        controller.value = 0.0;
      }  
    );
  }
}



class SocialMediaButton extends StatelessWidget {
  
  String asset;
  String link;

  SocialMediaButton({required this.asset, required this.link, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(width: 80, height: 80, child: IconButton(onPressed: (){},  icon: Image.asset(asset))),
    );
  }
}

class LanguageButton extends StatelessWidget {
  String languageCode;
  LanguageButton({super.key, required this.languageCode});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LanguageBloc>();
    return TextButton(onPressed: () => bloc.add(LanguageChange(languageCode)), child: BlocBuilder<LanguageBloc, LanguageState>(builder:(context, state) {
      Color textColor = state.selectedLanguage == languageCode ? AppTheme.baseGreen : AppTheme.baseGrey;

        return Text(languageCode.toUpperCase(), style: TextStyle(color: textColor, fontSize: 30));
      })); 
  }
}