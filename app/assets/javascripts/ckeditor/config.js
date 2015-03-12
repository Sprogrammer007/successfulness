CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];

  config.toolbarGroups = [
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'paragraph',   groups: [ 'list', 'indent', 'align'] },
    { name: 'colors' }
  ];
  config.floatSpaceDockedOffsetX = 10;
  config.removePlugins = 'elementspath, resize';
  // ... rest of the original config.js  ...
}