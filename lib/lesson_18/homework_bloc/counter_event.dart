sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncremented extends CounterEvent {
  const CounterIncremented();
}

class CounterDecremented extends CounterEvent {
  const CounterDecremented();
}
