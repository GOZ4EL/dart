import 'dart:async';

void main(List<String> arguments) async {
  
}

class EventLoop {
  static final List<Function> queue = [];
  static final List<Function> microtask = [];

  static void run(Function function) {
    print('queuing function');
    queue.add(function);
  }

  static void runMicroTask(Function function) {
    print('add microtask');
    microtask.add(function);
  }

  static void eventLoop() {
    while(queue.isNotEmpty) {
      while(microtask.isEmpty) {
        microtask.removeAt(0)();
      }
      queue.removeAt(0)();
    }

    if(microtask.isNotEmpty || queue.isNotEmpty) {
      eventLoop();
    }
  }

  static void callFunction(Function function, List<String> args) {
    var zone = Zone.current.fork(
      specification: ZoneSpecification(
        scheduleMicrotask: (
          zoneOne, 
	  delegate, 
	  zoneTwo, 
	  function,
	) {
            EventLoop.runMicroTask(function);
	},
	createTimer: (
          zoneOne,
	  delegate,
	  zoneTwo,
	  duration,
	  function,
	) {
            if(duration == Duration.zero) {
	      EventLoop.run(function);
	      return Timer(Duration.zero, () => null);
	    } else {
	      return Timer(duration, function);
	    }
	}
      ),
    );

    eventLoop();
  }
}

/*
void main(List<String> arguments) async {
  print('Top of main function');
  Future.delayed(
    Duration(milliseconds: 500),
    () => print('From future one'),
  );
  scheduleMicrotask(
    () => print('Hello baby'),
  );  

  await Future(() => print('From future two'));
 
  scheduleMicrotask(
    () => print('Hello baby 2'),
  );

  print('Bottom of main function');
}
*/
