#!/bin/bash
set -eu

while getopts u:p:n:o: OPT
do
        case $OPT in
                "u" ) TRAC_USER="$OPTARG"
                ;;
                "p" ) TRAC_PASS="$OPTARG"
                ;;
                "n" ) TRAC_NAME="$OPTARG"
                ;;
                "o" ) TRAC_OUTPUT_PATH="$OPTARG"
                ;;
                * )
                ;;
        esac
done

: ${TRAC_USER:=admin}
: ${TRAC_PASS:=pass}
: ${TRAC_NAME:="Sample Project"}
: ${TRAC_OUTPUT_PATH:=project}


TRAC_PATH=/var/trac/$TRAC_OUTPUT_PATH

if [ ! -f $TRAC_PATH/VERSION ]
then
        trac-admin $TRAC_PATH  initenv "$TRAC_NAME" sqlite:db/trac.db git /repo.git
        trac-admin $TRAC_PATH permission add $TRAC_USER TRAC_ADMIN

        trac-admin $TRAC_PATH config set components acct_mgr.admin.accountmanageradminpanel enabled
        trac-admin $TRAC_PATH config set components acct_mgr.api.accountmanager enabled
        trac-admin $TRAC_PATH config set components acct_mgr.db.sessionstore enabled
        trac-admin $TRAC_PATH config set components acct_mgr.guard.accountguard enabled
        trac-admin $TRAC_PATH config set components acct_mgr.htfile.htdigeststore enabled
        trac-admin $TRAC_PATH config set components acct_mgr.htfile.htpasswdstore enabled
        trac-admin $TRAC_PATH config set components acct_mgr.http.httpauthstore enabled
        trac-admin $TRAC_PATH config set components acct_mgr.macros.accountmanagerwikimacros enabled
        trac-admin $TRAC_PATH config set components acct_mgr.notification.accountchangelistener enabled
        trac-admin $TRAC_PATH config set components acct_mgr.notification.accountchangenotificationadminpanel enabled
        trac-admin $TRAC_PATH config set components acct_mgr.pwhash.htdigesthashmethod enabled
        trac-admin $TRAC_PATH config set components acct_mgr.pwhash.htpasswdhashmethod enabled
        trac-admin $TRAC_PATH config set components acct_mgr.register.basiccheck enabled
        trac-admin $TRAC_PATH config set components acct_mgr.register.bottrapcheck enabled
        trac-admin $TRAC_PATH config set components acct_mgr.register.emailcheck enabled
        trac-admin $TRAC_PATH config set components acct_mgr.register.emailverificationmodule enabled
        trac-admin $TRAC_PATH config set components acct_mgr.register.regexpcheck enabled
        trac-admin $TRAC_PATH config set components acct_mgr.register.registrationmodule enabled
        trac-admin $TRAC_PATH config set components acct_mgr.register.usernamepermcheck enabled
        trac-admin $TRAC_PATH config set components acct_mgr.svnserve.svnservepasswordstore enabled
        trac-admin $TRAC_PATH config set components acct_mgr.web_ui.accountmodule enabled
        trac-admin $TRAC_PATH config set components acct_mgr.web_ui.loginmodule enabled
        trac-admin $TRAC_PATH config set components acct_mgr.web_ui.resetpwstore enabled
        trac-admin $TRAC_PATH config set components code_comments.comment_macro.codecommentlinkmacro enabled
        trac-admin $TRAC_PATH config set components code_comments.db.codecommentssetup enabled
        trac-admin $TRAC_PATH upgrade
        trac-admin $TRAC_PATH config set components code_comments.ticket_event_listener.updateticketcodecomments enabled
        trac-admin $TRAC_PATH config set components code_comments.web.bundlecommentsredirect enabled
        trac-admin $TRAC_PATH config set components code_comments.web.codecomments enabled
        trac-admin $TRAC_PATH config set components code_comments.web.commentsrest enabled
        trac-admin $TRAC_PATH config set components code_comments.web.deletecommentform enabled
        trac-admin $TRAC_PATH config set components code_comments.web.jsdataforrequests enabled
        trac-admin $TRAC_PATH config set components code_comments.web.listcomments enabled
        trac-admin $TRAC_PATH config set components code_comments.web.mainnavigation enabled
        trac-admin $TRAC_PATH config set components code_comments.web.wikipreview enabled
        trac-admin $TRAC_PATH config set components customfieldadmin.api.customfields enabled
        trac-admin $TRAC_PATH config set components customfieldadmin.customfieldadmin.customfieldadminpage enabled
        trac-admin $TRAC_PATH config set components graphviz.graphviz.graphviz enabled
        trac-admin $TRAC_PATH config set components httpauth.filter.httpauthfilter enabled
        trac-admin $TRAC_PATH config set components includemacro.macros.includemacro enabled
        trac-admin $TRAC_PATH config set components mastertickets.api.masterticketssystem enabled
        trac-admin $TRAC_PATH upgrade
        trac-admin $TRAC_PATH config set components mastertickets.web_ui.masterticketsmodule enabled
        trac-admin $TRAC_PATH config set components navadd.navadd.navadd enabled
        trac-admin $TRAC_PATH config set components subcomponents.web_ui.subcomponentsmodule enabled
        trac-admin $TRAC_PATH config set components tracopt.mimeview.enscript.enscriptrenderer enabled
        trac-admin $TRAC_PATH config set components tracopt.mimeview.php.phprenderer enabled
        trac-admin $TRAC_PATH config set components tracopt.perm.config_perm_provider.extrapermissionsprovider enabled
        trac-admin $TRAC_PATH config set components tracopt.ticket.clone.ticketclonebutton enabled
        trac-admin $TRAC_PATH config set components tracopt.ticket.commit_updater.committicketreferencemacro enabled
        trac-admin $TRAC_PATH config set components tracopt.ticket.commit_updater.committicketupdater enabled
        trac-admin $TRAC_PATH config set components tracopt.ticket.deleter.ticketdeleter enabled
        trac-admin $TRAC_PATH config set components tracopt.versioncontrol.git.git_fs.* enabled
        #trac-admin $TRAC_PATH config set components tracsubtickets.api.subticketssystem enabled
        #trac-admin $TRAC_PATH config set components tracsubtickets.web_ui.subticketsmodule enabled
        trac-admin $TRAC_PATH config set components tractags.admin.tagchangeadminpanel enabled
        trac-admin $TRAC_PATH config set components tractags.api.tagsystem enabled
        trac-admin $TRAC_PATH config set components tractags.db.tagsetup enabled
        trac-admin $TRAC_PATH upgrade
        trac-admin $TRAC_PATH config set components tractags.macros.tagwikimacros enabled
        trac-admin $TRAC_PATH config set components tractags.ticket.tickettagprovider enabled
        trac-admin $TRAC_PATH config set components tractags.web_ui.tagrequesthandler enabled
        trac-admin $TRAC_PATH config set components tractags.wiki.tagwikisyntaxprovider enabled
        trac-admin $TRAC_PATH config set components tractags.wiki.wikitaginterface enabled
        trac-admin $TRAC_PATH config set components tractags.wiki.wikitagprovider enabled

        trac-admin $TRAC_PATH config set ticket-custom blockedby text
        trac-admin $TRAC_PATH config set ticket-custom blockedby.label "Blocked By"
        trac-admin $TRAC_PATH config set ticket-custom blocking text
        trac-admin $TRAC_PATH config set ticket-custom blocking.label "Blocking"
        trac-admin $TRAC_PATH config set ticket-custom parents text
        trac-admin $TRAC_PATH config set ticket-custom parents.label "Parent Tickets"
        trac-admin $TRAC_PATH config set trac repository_dir $TRAC_PATH/repo.git

        trac-admin $TRAC_PATH upgrade
        trac-admin $TRAC_PATH wiki upgrade

        chown -R www-data:www-data $TRAC_PATH
        chmod -R 775 $TRAC_PATH
fi

if [ ! -d $TRAC_PATH/repo.git ]
then
     git init --bare $TRAC_PATH/repo.git
     chown -R www-data:www-data $TRAC_PATH/repo.git
     chmod -R 775 $TRAC_PATH/repo.git
fi

realm="Trac"

if [ -f /var/trac/.htpasswd ]
then

        if [ `grep ^$TRAC_USER: .htpasswd | wc -l` -eq 0 ]
        then
                (echo -n "$TRAC_USER:$realm:" && (echo -n "$TRAC_USER:$realm:$TRAC_PASS" | md5sum | awk '{print $1}')) >> /var/trac/.htpasswd
                echo "add user $TRAC_USER to .htpasswd"
        else
                newline=`(echo -n "$TRAC_USER:$realm:" && (echo -n "$TRAC_USER:$realm:$TRAC_PASS" | md5sum | awk '{print $1}'))`
                sed -i -e "s/^$TRAC_USER:.*$/$newline/g" .htpasswd
                echo "update user $TRAC_USER"
        fi

else
        #htdigest -c /var/trac/.htpasswd "Trac" admin
        (echo -n "$TRAC_USER:$realm:" && (echo -n "$TRAC_USER:$realm:$TRAC_PASS" | md5sum | awk '{print $1}')) >> /var/trac/.htpasswd
        echo "create .htpasswd file"
fi


