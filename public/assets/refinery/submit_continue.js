(function(){this.init_submit_continue=function(){var e;return $("#submit_continue_button").click(submit_and_continue),$("form").change(function(e){return $(this).attr("data-changes-made",!0)}),(e=$("#continue_editing")).length>0&&e.attr("rel")!=="no-prompt"&&$("#editor_switch a").click(function(e){if($("form[data-changes-made]").length>0&&!confirm("Any changes you've made will be lost. Are you sure you want to continue without saving?"))return e.preventDefault()}),$("input[id=page_custom_slug]").change(function(){return $("#submit_continue_button").remove()})}}).call(this);