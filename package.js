Package.describe({
    summary: "Sentinel role based authorization."
});

Package.on_use(function (api) {
    var both = ['client', 'server'];
    api.use(['coffeescript', 'underscore', 'accounts-base'], both);
    
    api.add_files('sentinel.litcoffee', both);
    
    api.export && api.export('Sentinel');

});
