#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================
change_theme() {
    if [ "$theme" != "Default" ]; then
        ynh_add_config --template="themes/$theme/admin/override.css" --destination="/usr/share/yunohost/admin/override.css"
        chmod 644 "/usr/share/yunohost/admin/override.css"
        ynh_add_config --template="themes/$theme/admin/override.js" --destination="/usr/share/yunohost/admin/override.js"
        chmod 644 "/usr/share/yunohost/admin/override.js"
        cp "../conf/themes/$theme/admin/logo.png" "/usr/share/yunohost/admin/logo.png"

        cp "/usr/share/yunohost/admin/index.html.save" "/usr/share/yunohost/admin/index.html"
        ynh_replace_string --match_string="</body>" --replace_string="</body>\n<link rel=\"stylesheet\" href=\"/yunohost/admin/override.css\">" --target_file=/usr/share/yunohost/admin/index.html
        ynh_replace_string --match_string="<body>" --replace_string="<body>\n<script type=\"module\" crossorigin src=\"/yunohost/admin/override.js\"></script>" --target_file=/usr/share/yunohost/admin/index.html
    else
        cp "/usr/share/yunohost/admin/index.html.save" "/usr/share/yunohost/admin/index.html"
    fi

    if [ "$theme" != "Default" ]; then
        yunohost settings set misc.portal.portal_theme --value $theme
    else
        yunohost settings set misc.portal.portal_theme --value default
    fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
