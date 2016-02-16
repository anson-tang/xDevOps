#!/usr/bin/env python
# -*- coding: utf-8 -*-
######################################################################
# Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               #
# All rights reserved                                                #
# Name: install.py
# Author: Canux canuxcheng@gmail.com                                 #
# Version: V1.0                                                      #
# Time: Thu 28 May 2015 10:18:46 PM CST
######################################################################
# Description:
######################################################################

import os
import tarfile
import shutil
import argparse


def define_options():
    parser = argparse.ArgumentParser(description="Deploy stardict and offline \
                                     dictionary on linux system.")
    parser.add_argument("-i", "--install",
                        dest="install",
                        action="store_true",
                        required=False,
                        help="Install stardict with apt-get install.")
    parser.add_argument("-d", "--dictionary",
                        action="store_true",
                        dest="dictionary",
                        required=False,
                        help="Install offline dictionary.")
    args = parser.parse_args()
    return args


def extract(src, des):
    for file in os.listdir("%s" % src):
        try:
            tar = tarfile.open("%s/%s" % (src, file), "r:bz2")
            tar.extractall("%s" % des)
            tar.close()
        except Exception as e:
            print "extract error: %s" % e


def main():
    cur = os.getcwd()
    # All dict finally here.
    dict = '/usr/share/stardict'
    # This is the original dict.
    src = "%s" % cur + "/stardict"
    # This a temp for extract dict.
    des = "%s" % cur + "/dic"

    args = define_options()

    # Install stardict.
    if args.install:
        try:
            os.system("sudo apt-get install sdcv stardict")
        except Exception as e:
            print "Install stardict error: %s" % e

    if args.dictionary:
        try:
            # First delete the dict.
            shutil.rmtree("%s" % des)
            # Make a new folder for the extract dict.
            os.mkdir("%s" % des)
        except Exception:
            pass

        # Extract original dict from src to des.
        extract(src, des)

        try:
            # First remove the folder dic in dict.
            os.system("sudo rm -rf %s/dic" % dict)
            # Then copy the des to dict.
            os.system("sudo cp -a %s %s" % (des, dict))
            # At last remove des on current folder.
            shutil.rmtree("%s" % des)
        except Exception:
            pass

if __name__ == "__main__":
    main()
    print "Install stardict succeed."
