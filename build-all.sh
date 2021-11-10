test_dir=./test-dir
out_dir=../../built

RED='\033[0;31m'
NC='\033[0m' # No Color\

echo "Copying Files to Test Directory.."
cp -r x86_64/* ${test_dir}

for D in $test_dir/*; do
    if [ -d "${D}" ]; then
        cd "${D}"
        makepkg -s
        if [ *tar.zst ]; then
            mv *tar.zst $out_dir/
            tput setaf 2; echo "Package has been built successfully and moved to ./built folder"
        else
            echo -e "${RED} ERROR: Package was not built"
        fi
        cd ../..
    fi
done