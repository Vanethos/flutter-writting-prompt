abstract class Mapper<From, To> {
  To map(From value);

  List<To> mapList(List<From> values) {
    if (values == null) return new List<To>(0);

    List<To> returnValues = new List<To>(values.length);
    for (var value in values) {
      returnValues.add(map(value));
    }
    return returnValues;
  }
}