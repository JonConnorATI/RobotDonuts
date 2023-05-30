ROBOT_LISTENER_API_VERSION = 3

#def end_test(data, result):
 #   print('Test started: ' + result.starttime);
  #  print('Test ended: ' + result.endtime);


def end_test(data, result):
    print(f'\nStart time: {result.starttime}')
    print(f'End time: {result.endtime}')
    print(f'Elapsed time: {result.elapsedtime} ms')