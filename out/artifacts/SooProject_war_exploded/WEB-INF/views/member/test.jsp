<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/jquery.fileupload.js"></script>
    <script type="text/javascript">
        $( document ).ready(function() {
            jQuery('#imageUpload').fileupload({
                dataType: 'json',
                formData: {
                    imageType : "logo"
                },
                done: function (e, data) {
                    alert(data);
                }
            });
        });
    </script>
</head>
<body>
<input id="imageUpload" type="file" name="files[]" data-url="/file/upload/image" multiple="">
</body>
</html>