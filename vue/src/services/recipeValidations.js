/** Validator.valid returns true or an Array of errors */
const Validator = {
  stringCheck(thing, val){
    return typeof(val) === "string" ? true : `${thing} must be a string, not ${typeof(val)}`
  },
  lengthCheck(thing, val){
    return val.length > 2 ? true : `${thing} must at least 3 characters long`
  },
  valid(recipe){
    let errors = {}
    Object.keys(recipe).forEach(key => {
      if(!["id","ingredients", "description","tips"].includes(key)){
        // count the errors
        if(errors.length === undefined){errors.length = 0}

        let check1 = this.stringCheck(key, recipe[key])
        let check2 = this.lengthCheck(key, recipe[key])
        // required
        if(check1 !== true){
          errors[key] = check1
          errors.length += 1
        }
        // required
        if(check2 !== true){
          errors[key] = check2
          errors.length += 1
        }
      }
    })
    return errors.length > 0 ? errors : true
  },
}

export default Validator