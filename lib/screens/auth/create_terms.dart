import 'package:flora/elements/app_bar.dart';
import 'package:flutter/material.dart';

class CreateAccountTerms extends StatelessWidget {
  const CreateAccountTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            BackTitleAppBar(title: "الشروط و الأحكام"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Text(
                " ﻫﺬا اﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ أن ﻳﺴﺘﺒﺪل ﻓﻲ ﻧﻔﺲ ، ﻟﻘﺪ ﺗﻢ ﺗﻮﻟﻴﺪ ﻫﺬا اﻟﻨﺺ ﻣﻦ ﻣﻮﻟﺪ اﻟﻨﺺ اﻟﻌﺮﺑﻰ ، اﻟﻤﺴﺎﺣﺔ ﺣﻴﺚ ﻳﻤﻜﻨﻚ أن ﺗﻮﻟﺪ ﻣﺜﻞ ﻫﺬا اﻟﻨﺺ أو اﻟﻌﺪﻳﺪ ﻣﻦ اﻟﻨﺼﻮص اﺧﺮى إﺿﺎﻓﺔ إﻟﻰ زﻳﺎدة ﻋﺪد اﻟﺤﺮوف اﻟﺘﻰ ﻳﻮﻟﺪﻫﺎ اﻟﺘﻄﺒﻴﻖ.ﻫﺬا اﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ أن ﻳﺴﺘﺒﺪل ﻓﻲ ﻟﻘﺪ ﺗﻢ ﺗﻮﻟﻴﺪ ﻫﺬا اﻟﻨﺺ ﻣﻦ ﻣﻮﻟﺪ اﻟﻨﺺ ، ﻧﻔﺲ اﻟﻤﺴﺎﺣﺔ ﺣﻴﺚ ﻳﻤﻜﻨﻚ أن ﺗﻮﻟﺪ ﻣﺜﻞ ﻫﺬا اﻟﻨﺺ أو اﻟﻌﺪﻳﺪ ﻣﻦ ، اﻟﻌﺮﺑﻰ اﻟﻨﺼﻮص اﺧﺮى إﺿﺎﻓﺔ إﻟﻰ زﻳﺎدة ﻋﺪد اﻟﺤﺮوف اﻟﺘﻰ ﻳﻮﻟﺪﻫﺎ اﻟﺘﻄﺒﻴﻖ.ﻫﺬا اﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ أن ﻳﺴﺘﺒﺪل ﻓﻲ ﻟﻘﺪ ﺗﻢ ﺗﻮﻟﻴﺪ ﻫﺬا اﻟﻨﺺ ﻣﻦ ﻣﻮﻟﺪ اﻟﻨﺺ ، ﻧﻔﺲ اﻟﻤﺴﺎﺣﺔ ﺣﻴﺚ ﻳﻤﻜﻨﻚ أن ﺗﻮﻟﺪ ﻣﺜﻞ ﻫﺬا اﻟﻨﺺ أو اﻟﻌﺪﻳﺪ ﻣﻦ ، اﻟﻌﺮﺑﻰ اﻟﻨﺼﻮص اﺧﺮى إﺿﺎﻓﺔ إﻟﻰ زﻳﺎدة ﻋﺪد اﻟﺤﺮوف اﻟﺘﻰ ﻳﻮﻟﺪﻫﺎ .اﻟﺘﻄﺒﻴﻖ ﻫﺬا اﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ أن ﻳﺴﺘﺒﺪل ﻓﻲ ﻧﻔﺲ ، ﻟﻘﺪ ﺗﻢ ﺗﻮﻟﻴﺪ ﻫﺬا اﻟﻨﺺ ﻣﻦ ﻣﻮﻟﺪ اﻟﻨﺺ اﻟﻌﺮﺑﻰ ، اﻟﻤﺴﺎﺣﺔ ﺣﻴﺚ ﻳﻤﻜﻨﻚ أن ﺗﻮﻟﺪ ﻣﺜﻞ ﻫﺬا اﻟﻨﺺ أو اﻟﻌﺪﻳﺪ ﻣﻦ اﻟﻨﺼﻮص اﺧﺮى إﺿﺎﻓﺔ إﻟﻰ زﻳﺎدة ﻋﺪد اﻟﺤﺮوف اﻟﺘﻰ ﻳﻮﻟﺪﻫﺎ اﻟﺘﻄﺒﻴﻖ.ﻫﺬا اﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ أن ﻳﺴﺘﺒﺪل ﻓﻲ ﻟﻘﺪ ﺗﻢ ﺗﻮﻟﻴﺪ ﻫﺬا اﻟﻨﺺ ﻣﻦ ﻣﻮﻟﺪ اﻟﻨﺺ ، ﻧﻔﺲ اﻟﻤﺴﺎﺣﺔ ﺣﻴﺚ ﻳﻤﻜﻨﻚ أن ﺗﻮﻟﺪ ﻣﺜﻞ ﻫﺬا اﻟﻨﺺ أو اﻟﻌﺪﻳﺪ ﻣﻦ ، اﻟﻌﺮﺑﻰ اﻟﻨﺼﻮص اﺧﺮى إﺿﺎﻓﺔ إﻟﻰ زﻳﺎدة ﻋﺪد اﻟﺤﺮوف اﻟﺘﻰ ﻳﻮﻟﺪﻫﺎ اﻟﺘﻄﺒﻴﻖ.ﻫﺬا اﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ أن ﻳﺴﺘﺒﺪل ﻓﻲ ﻟﻘﺪ ﺗﻢ ﺗﻮﻟﻴﺪ ﻫﺬا اﻟﻨﺺ ﻣﻦ ﻣﻮﻟﺪ اﻟﻨﺺ ",
              ),
            )
          ],
        ),
      )),
    );
  }
}