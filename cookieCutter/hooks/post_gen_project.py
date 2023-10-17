import sys, os, shutil
from cookiecutter.main import cookiecutter


def main():
    print("********** PRE GENERATION HOOK *************")
    curdir = os.path.abspath(os.path.curdir)

    # copy modules
    framework = "{{ cookiecutter.framework }}"
    database = "{{ cookiecutter.database}}"
    if framework != "":
        get_modules("framework", framework)
    if database != "":
        get_modules('database', database)


def get_modules(kind, module):
    modules = []
    infile = open(f"templates/{kind}/{module}.txt", "r")
    for line in infile:
        line = line.strip()
        modules.append(line)
    infile.close()
    copy_modules(modules)


def copy_modules(modules):
    for module in modules:
        shutil.move(f"bicepModules/{module}", "bicep/modules/")


if __name__ == "__main__":
    sys.exit(main())
