<script language="jscript" runat="server">
	function objFromJson(str){
		eval("var _temp=(" + str + ");");
		return _temp;
	}
</script>