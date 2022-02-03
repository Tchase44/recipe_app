const passChacker = {
  stringCheck(str){
    return typeof(str) === "string"
  },
  lengthCheck(str){
    return str.length >= 12
  },
  matchCheck(str1,str2){
    return str1 === str2
  },
  errorMessages(checks){
    let messages = []
    let map = {
      str: "Needs to be a string",
      length: "Needs to be at least 12 charaters",
      match: "Password confirmation does not match"
    }
    for (const key in checks) {
      if (checks[key] === false){
        messages.push(map[key])
      }
    }
    return messages
  },
  vaild(test, confirm){
    const checks = {}
    checks.str = this.stringCheck(test)
    checks.length = this.lengthCheck(test)
    checks.match = this.matchCheck(test, confirm)
    let good = this.errorMessages(checks)
    return good.length > 0 ? good : true
  }
}

export default passChacker