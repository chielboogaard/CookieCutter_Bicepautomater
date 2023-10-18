import sys, os, shutil
from cookiecutter.main import cookiecutter


def main():
    print("********** PRE GENERATION HOOK *************")
    curdir = os.path.abspath(os.path.curdir)

    # copy modules
    framework = "{{ cookiecutter.framework }}"
    database = "{{ cookiecutter.database }}"
    modules = "{{ cookiecutter.modules }}"
    if framework != "":
        get_modules("framework", framework)
    if database != "":
        if database != "none":
            get_modules("database", database)
    if modules == "yes":
        copy_all_modules()


def get_modules(kind, module):
    modules = []
    infile = open(f"templates/{kind}/{module}.txt", "r")
    for line in infile:
        line = line.strip()
        modules.append(line)
    infile.close()
    copy_modules(modules)


def copy_all_modules():
    bicepModules = os.listdir("bicepModules")
    for module in bicepModules:
        shutil.move(f"bicepModules/{module}", "bicep/modules/")


def copy_modules(modules):
    for module in modules:
        shutil.move(f"bicepModules/{module}", "bicep/modules/")


def remove_temp_folders():
    shutil.rmtree("bicepModules")
    shutil.rmtree("templates")


if __name__ == "__main__":
    main()
    sys.exit(remove_temp_folders())
