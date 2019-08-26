typedef ActionCallback<T extends Action> = void Function(T action);

// Action
class Action {
  // 数据
  dynamic data;
  // 是否单一 (单一指不并存未完成的多个同类action)
  bool isSingle = false;

  Action({
    this.data,

  });
}