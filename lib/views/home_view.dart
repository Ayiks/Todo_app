import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';
import 'package:todo_app/views/create_todo.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'todo_tile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/5.jpeg'),
          ),
        ),
        title: Text(
          'My Task',
        ),
        elevation: 0,
        actions: const [
          Icon(Icons.sort),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return const TodoTileView();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: 5),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CreateTodoView();
          }));
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(37, 43, 103, 0.4),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CompletedTodoWidget();
                      });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: customBlue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Completed',
                          style: TextStyle(
                              color: customBlue, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: customBlue,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '24',
                      style: TextStyle(color: customBlue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedTodoWidget extends StatelessWidget {
  const CompletedTodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.check_circle,
          color: customBlue,
        ),
        title: Text(
          'Plan a trip to Finland',
          style: TextStyle(fontWeight: FontWeight.w600, color: customBlue),
        ),
        subtitle: Text(
          'Lorem Ipsum is simply dummy text of the printing, Ipsum is simply dummy text of the printing Ipsum is simply dummy text of the printing Ipsum is simply dummy text of the printing',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications,
              color: customBlue,
            ),
            Text(
              'Yesterday',
              style: TextStyle(color: customBlue),
            )
          ],
        ),
      ),
    );
  }
}
