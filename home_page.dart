class HomePage extends StatefulWidget {
const HomePage({super.key});
@override
State<HomePage> createState() =>HomePageState();
}
class _HomePageState extends State<HomePage> {
late TextEditingController controller;
late FocusNode focusNode;
final List<String> inputTags = [];
String response= ' ';
@override
void initState() {
controller = TextEditingController();
focusNode = FocusNode();
super.initState();
}
@override
void dispose(){
controller.dispose();
focusNode.disposel);
super.dispose();
}
@override
Widget build(BuildContext context){
return Scaffold(
body: SafeArea(
child:Padding(
padding: const EdgeInsets.all(20),
child: SizedBox(
height:MediaQuery.of(context).size.height,
child: Column(
children: [ const Text( ' Find the best recipe for cooking!' ,
maxLines: 3, style: TextStyle(fontSize:35, fontWeight: FontWeight.bold),
),
const SizedBox( height:20, ),
Row(
children:[
Flexible(
child: TextFormField(
autofocus: true,
autocorrect: true,
focusNode: focusNode,
controller: controller,
onFieldSubmitted: (value) {
controller.clear();
set state((){
inputTags.add(value);
focusNode.requestFocus();
});
print(inputTags);
},
decoration: InputDecoration(
focusedBorder: OutlineInputBorder(
borderSide: BorderSide (
color: Theme.of(context).colorScheme.primary,
), 
borderRadius : const BorderRadius.only(
topLeft: Radius.circular(5.5), bottomLeft: Radius.circular(5.5))), 
enabledBorder: const OutlineInputBorder(
borderSide: BorderSide(),
), 
labelText: "Enter the ingredients your have...",
labelStyle: TextStyle(
color: Theme.of(context).colorScheme.primary,)),
), 
), 
Container(
color: Theme.of(context).colorScheme.primary,
child: Padding (
padding: const EdgeInsets.all(9),
child: IconButton(
onPressed: (){
controller.clear(); 
setState(() {
inputTags.add(controller.text);
focusNode.requestFocus();
});
print(inputTags);
}, 
icon: const Icon(
Icons.add,
color: Colors.white,
size:30,),),),)
],
),
Padding (
padding: const EdgeInsets.symmetric(vertical: 10),
child: Wrap(
children: [
for (int i=0; i < inputTags.length; i++)
Padding (
padding: const EdgeInsets.symmetric(horizontal: 5.0),
child: Chip(
backgroundColor: Color(
(math.Random().nextDouble()* 0xFFFFFF).toInt()) 
.withOpacity(0.1),
shape: Rounded Rectang eBorder( borderRadius: BorderRadius.circular(5.5)), 
on deleted:(){
setState((){
inputTags.remove(inputTags[i]);
print(inputTags);
});},
label: Text(inputTags [i]),
deleteIcon: const Icon(
Icons.close,
size: 20,
), // Icon
), // Padding
],),),),),
);
}
}