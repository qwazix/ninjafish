var modules = {};

(function() {
    Qt.include("settings.js")
    var st = settings(LocalStorage),
            cached_model,//device model
            pulley_model,
            pulley_callbacks;
    modules.settings = st.settings;
    modules.favourites = st.favourites;

    favourites = modules.favourites.getAll();

}());
