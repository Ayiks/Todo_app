import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:intl/intl.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({Key? key}) : super(key: key);

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _decriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TodoController _todoController = TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new Todo'),
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    label: const Text('Title'),
                    hintText: 'Please input your Title here',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter a Title!';
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _decriptionController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 5,
                decoration: InputDecoration(
                    label: const Text('Description'),
                    hintText: 'Please enter a description here',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                },
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((value) {
                          setState(() {
                            _dateController.text =
                                DateFormat.yMMMMd().format(value!);
                          });
                        });
                      },
                      controller: _dateController,
                      keyboardType: TextInputType.datetime,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 1,
                      decoration: InputDecoration(
                        label: const Text('Date'),
                        hintText: 'Please Select a date',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: customBlue),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please select a date';
                        }
                        if (value ==
                            DateFormat.yMMMMd().format(DateTime.now())) {
                          return 'You selected today\'s date';
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextFormField(
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        setState(() {
                          _timeController.text = value!.format(context);
                        });
                      });
                    },
                    keyboardType: TextInputType.datetime,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 1,
                    decoration: InputDecoration(
                      label: const Text('Time'),
                      hintText: 'Please Select a time',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select time';
                      }
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String dateTime =
                        _dateController.text + " " + _timeController.text;
                    //TODO: isloading
                    setState(() {});

                    bool isSuccessful = await _todoController.createTodo(
                        title: _titleController.text,
                        description: _decriptionController.text,
                        dateTime: dateTime);
                  }
                },
                child: const Text(
                  'Create Todo',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: customBlue),
              )
            ],
          )),
    );
  }
}
