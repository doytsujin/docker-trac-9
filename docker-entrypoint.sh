#!/bin/bash
set -eu

if [ ! -d /var/trac ]
then
	mkdir /var/trac
fi

if [ -f /var/tracwork/trac.wsgi -a  ! -f /var/trac/trac.wsgi ]
then
	cp  /var/tracwork/trac.wsgi /var/trac/trac.wsgi
fi

if [ ! -f /var/trac/project/VERSION ]
then
        trac-admin /var/trac/project initenv "Sample Project" sqlite:db/trac.db git /repo.git
        trac-admin /var/trac/project/ permission add admin TRAC_ADMIN

        trac-admin /var/trac/project config set components acct_mgr.admin.accountmanageradminpanel enabled
        trac-admin /var/trac/project config set components acct_mgr.api.accountmanager enabled
        trac-admin /var/trac/project config set components acct_mgr.db.sessionstore enabled
        trac-admin /var/trac/project config set components acct_mgr.guard.accountguard enabled
        trac-admin /var/trac/project config set components acct_mgr.htfile.htdigeststore enabled
        trac-admin /var/trac/project config set components acct_mgr.htfile.htpasswdstore enabled
        trac-admin /var/trac/project config set components acct_mgr.http.httpauthstore enabled
        trac-admin /var/trac/project config set components acct_mgr.macros.accountmanagerwikimacros enabled
        trac-admin /var/trac/project config set components acct_mgr.notification.accountchangelistener enabled
        trac-admin /var/trac/project config set components acct_mgr.notification.accountchangenotificationadminpanel enabled
        trac-admin /var/trac/project config set components acct_mgr.pwhash.htdigesthashmethod enabled
        trac-admin /var/trac/project config set components acct_mgr.pwhash.htpasswdhashmethod enabled
        trac-admin /var/trac/project config set components acct_mgr.register.basiccheck enabled
        trac-admin /var/trac/project config set components acct_mgr.register.bottrapcheck enabled
        trac-admin /var/trac/project config set components acct_mgr.register.emailcheck enabled
        trac-admin /var/trac/project config set components acct_mgr.register.emailverificationmodule enabled
        trac-admin /var/trac/project config set components acct_mgr.register.regexpcheck enabled
        trac-admin /var/trac/project config set components acct_mgr.register.registrationmodule enabled
        trac-admin /var/trac/project config set components acct_mgr.register.usernamepermcheck enabled
        trac-admin /var/trac/project config set components acct_mgr.svnserve.svnservepasswordstore enabled
        trac-admin /var/trac/project config set components acct_mgr.web_ui.accountmodule enabled
        trac-admin /var/trac/project config set components acct_mgr.web_ui.loginmodule enabled
        trac-admin /var/trac/project config set components acct_mgr.web_ui.resetpwstore enabled
        trac-admin /var/trac/project config set components code_comments.comment_macro.codecommentlinkmacro enabled
        trac-admin /var/trac/project config set components code_comments.db.codecommentssetup enabled
        trac-admin /var/trac/project upgrade
        trac-admin /var/trac/project config set components code_comments.ticket_event_listener.updateticketcodecomments enabled
        trac-admin /var/trac/project config set components code_comments.web.bundlecommentsredirect enabled
        trac-admin /var/trac/project config set components code_comments.web.codecomments enabled
        trac-admin /var/trac/project config set components code_comments.web.commentsrest enabled
        trac-admin /var/trac/project config set components code_comments.web.deletecommentform enabled
        trac-admin /var/trac/project config set components code_comments.web.jsdataforrequests enabled
        trac-admin /var/trac/project config set components code_comments.web.listcomments enabled
        trac-admin /var/trac/project config set components code_comments.web.mainnavigation enabled
        trac-admin /var/trac/project config set components code_comments.web.wikipreview enabled
        trac-admin /var/trac/project config set components customfieldadmin.api.customfields enabled
        trac-admin /var/trac/project config set components customfieldadmin.customfieldadmin.customfieldadminpage enabled
        trac-admin /var/trac/project config set components graphviz.graphviz.graphviz enabled
        trac-admin /var/trac/project config set components httpauth.filter.httpauthfilter enabled
        trac-admin /var/trac/project config set components includemacro.macros.includemacro enabled
        trac-admin /var/trac/project config set components mastertickets.api.masterticketssystem enabled
        trac-admin /var/trac/project upgrade
        trac-admin /var/trac/project config set components mastertickets.web_ui.masterticketsmodule enabled
        trac-admin /var/trac/project config set components navadd.navadd.navadd enabled
        trac-admin /var/trac/project config set components subcomponents.web_ui.subcomponentsmodule enabled
        trac-admin /var/trac/project config set components tracopt.mimeview.enscript.enscriptrenderer enabled
        trac-admin /var/trac/project config set components tracopt.mimeview.php.phprenderer enabled
        trac-admin /var/trac/project config set components tracopt.perm.config_perm_provider.extrapermissionsprovider enabled
        trac-admin /var/trac/project config set components tracopt.ticket.clone.ticketclonebutton enabled
        trac-admin /var/trac/project config set components tracopt.ticket.commit_updater.committicketreferencemacro enabled
        trac-admin /var/trac/project config set components tracopt.ticket.commit_updater.committicketupdater enabled
        trac-admin /var/trac/project config set components tracopt.ticket.deleter.ticketdeleter enabled
        trac-admin /var/trac/project config set components tracopt.versioncontrol.git.git_fs.* enabled
        #trac-admin /var/trac/project config set components tracsubtickets.api.subticketssystem enabled
        #trac-admin /var/trac/project config set components tracsubtickets.web_ui.subticketsmodule enabled
        trac-admin /var/trac/project config set components tractags.admin.tagchangeadminpanel enabled
        trac-admin /var/trac/project config set components tractags.api.tagsystem enabled
        trac-admin /var/trac/project config set components tractags.db.tagsetup enabled
        trac-admin /var/trac/project upgrade
        trac-admin /var/trac/project config set components tractags.macros.tagwikimacros enabled
        trac-admin /var/trac/project config set components tractags.ticket.tickettagprovider enabled
        trac-admin /var/trac/project config set components tractags.web_ui.tagrequesthandler enabled
        trac-admin /var/trac/project config set components tractags.wiki.tagwikisyntaxprovider enabled
        trac-admin /var/trac/project config set components tractags.wiki.wikitaginterface enabled
        trac-admin /var/trac/project config set components tractags.wiki.wikitagprovider enabled

        trac-admin /var/trac/project config set ticket-custom blockedby text
        trac-admin /var/trac/project config set ticket-custom blockedby.label "Blocked By"
        trac-admin /var/trac/project config set ticket-custom blocking text
        trac-admin /var/trac/project config set ticket-custom blocking.label "Blocking"
        trac-admin /var/trac/project config set ticket-custom parents text
        trac-admin /var/trac/project config set ticket-custom parents.label "Parent Tickets"
        trac-admin /var/trac/project config set trac repository_dir /var/trac/project/repo.git

        trac-admin /var/trac/project upgrade
        trac-admin /var/trac/project wiki upgrade
fi

if [ ! -d /var/trac/project/repo.git ]
then
     git init --bare /var/trac/project/repo.git
fi

if [ ! -f /var/trac/.htpasswd ]
then
        #htdigest -c /var/trac/.htpasswd "Trac" admin
        user="admin"
        realm="Trac"
        password="admin"
        (echo -n "$user:$realm:" && (echo -n "$user:$realm:$password" | md5sum | awk '{print $1}')) >> /var/trac/.htpasswd
fi

chown -R www-data:www-data /var/trac/
chmod -R 775 /var/trac/
cp -f /var/tracwork/httpd.conf /usr/local/apache2/conf/httpd.conf
rm -rf /var/tracwork

httpd -k stop

exec "$@"



