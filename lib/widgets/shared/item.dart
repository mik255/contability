



import 'package:contability/widgets/shared/card.dart';
import 'package:flutter/material.dart';

import '../designer/icons.dart';
import '../designer/texts.dart';

class DebitItem extends StatelessWidget {
  const DebitItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCardWithImg(assetPath: '',),
        Column(
          children: [
            Text('Banco do brasil',style: heading3(),),
            Text('fecha dia 24',style: heading5(),),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xff9a9a9a),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      SizedBox(
                        width: 47,
                        height: 12,
                        child: Text(
                          "aberto",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 87,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xff009557),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      SizedBox(
                        width: 86,
                        height: 12,
                        child: Text(
                          "R\$ 1.500,00 / 358,84",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text('Total deste mes',style: heading5(),),
            Text('R\$ 1.250,84 ',style: heading2(),),
          ],
        ),
        edit()
      ],
    );
  }
}
