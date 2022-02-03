<template>
  <footer id="footer" class="footer">
    <div><h6 id="copy">Created by: Tim Chase &copy; {{date.getFullYear()}}</h6></div>
  </footer>
</template>

<script>
export default {
  name: "Footer",
  data(){
    return {
      date: new Date,
    }
  }
}
</script>

<style scoped>
#footer.footer{
  margin:0;
  padding:0;
  width:100%;
  height: 65px;
  background: #424242;
}
#footer > div {
  height: 100%;
width: 100%;
padding: 22px 0;
}
#footer > div > h6#copy{
  color: #3bbd58;
  font-size: 1em;
  display: inline;
  margin: 0;
}
/* background: #3bbd58; */
</style>