# Ask which environment to deploy
printf 'Deploy to (1) Production or (2) Testing? '
read deploy_target

if [ "$deploy_target" = "1" ]; then
    TARGET_DIR="/var/www/html"
    BRANCH="main"
    DEPLOY_URL="http://54.147.115.58/"
elif [ "$deploy_target" = "2" ]; then
    TARGET_DIR="/var/www//html/html_testing"
    BRANCH="testing"
    DEPLOY_URL="http://54.147.115.58:8080/"
else
    echo "Invalid selection. Exiting."
    exit 1
fi

# Ensure we're on correct git branch
git checkout $BRANCH
git pull origin $BRANCH

# DEFINE PATH
dir1=${PWD}

# START FRESH
if [ -d "_site/" ]; then
    rm -rf _site/
fi

# BUILD WEBSITE
quarto render

# CLEAN UP 
cd _site
find . -name .DS_Store -delete
cd "$dir1"

# SET CORRECT PERMISSIONS FOR ALL FILES 
find _site -type f -exec chmod 644 {} +
find _site -type d -exec chmod 755 {} +

# GITHUB SYNC
printf 'Would you like to push to GITHUB? (y/n)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then 

    git config http.postBuffer 20242880000

    # PULL LATEST CHANGES FROM REMOTE BRANCH
    git pull origin $BRANCH

    # SYNC TO LOCAL REPO TO CLOUD 
    read -p 'ENTER MESSAGE: ' message
    echo "commit message = "$message; 
    git add ./; 
    # MAIN BRANCH
    git commit -m "$message"; 

    # PUSH NON-MAIN BRANCH
    #git push  -u origin w05-draft

    # PUSH MAIN BRANCH
    git push origin $BRANCH

else
    echo NOT PUSHING TO GTIHUB!./
fi


# PUSH WEBSITE TO GU DOMAINS 
printf 'Would you like publish to AWS Server? (y/n)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then 

    # Sync to the chosen directory
    # rsync -alvr --delete _site/* morrisge@morris.georgetown.domains:/home/morrisge/public_html/
    rsync -azvr --delete -e "ssh -i ~/.ssh/LightsailSite.pem" _site/ ubuntu@54.147.115.58:$TARGET_DIR/


    echo "Deployed $BRANCH to $DEPLOY_URL!"
else
    echo "NOT PUSHING TO AWS!"
fi

