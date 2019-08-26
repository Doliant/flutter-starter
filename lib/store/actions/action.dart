// Action
class Action {
  // 数据
  dynamic data;
  // 是否单一 (单一指不并存未完成的多个action)
  bool isSingle = false;
  // 是否绝对单一 (比对action data; 优先级高于isSingle)
  bool isAbsoluteSingle = false;

  Action({
    this.data,

  });
}