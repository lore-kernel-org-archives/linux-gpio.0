From: Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v5] selftest/gpio: add gpio test case
Date: Tue, 13 Dec 2016 07:33:12 -0700
Message-ID: <cd8d3fde-17c3-bc6a-8dbc-cf3209f83b34@kernel.org>
References: <7e8cac40-ccf1-d4c3-5a08-09969b273b11@osg.samsung.com>
 <1479723371-5489-1-git-send-email-bamvor.zhangjian@huawei.com>
 <8d50fbdd-f17b-fae2-14dd-80da9fac0a48@huawei.com>
Reply-To: shuah@kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from resqmta-po-08v.sys.comcast.net ([96.114.154.167]:39853 "EHLO
        resqmta-po-08v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932943AbcLMOl0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Dec 2016 09:41:26 -0500
In-Reply-To: <8d50fbdd-f17b-fae2-14dd-80da9fac0a48@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zhangjian (Bamvor)" <bamvor.zhangjian@huawei.com>, shuahkh@osg.samsung.com, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, broonie@kernel.org, mwelling@ieee.org, bamvor.zhangjian@linaro.org, Shuah Khan <shuah@kernel.org>

On 12/13/2016 05:42 AM, Zhangjian (Bamvor) wrote:
> Ping.
> 
> On 2016/11/21 18:16, bamvor.zhangjian@huawei.com wrote:
>> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>>
>> This test script try to do whitebox testing for gpio subsystem(based on
>> gpiolib). It manipulate gpio device through chardev or sysfs and check
>> the result from debugfs. This script test gpio-mockup through chardev by
>> default. User could test other gpio chip by passing the module name.
>> Some of the testcases are turned off by default to avoid the conflicting
>> with gpiochip in system.
>>
>> In details, it test the following things:
>> 1.  Test direction and output value for valid pin.
>> 2.  Test dynamic allocation of gpio base.
>> 3.  Add single, multi gpiochip to do overlap check.
>>
>> Run "tools/testing/selftests/gpio/gpio-mockup.sh -h" for usage.
>>
>> Acked-by: Shuah Khan <shuahkh@osg.samsung.com>
>> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

Hi Linus/Bemovar,

It is now in linux-kselftest next for 4.10-rc1

thanks,
-- Shuah

>> ---
>> Changes since v4:
>> 1.  Install header to to linux/usr/include instead of default path
>> 2.  Print being deprecated for sysfs ABI.
>>
>>  tools/testing/selftests/Makefile                   |   1 +
>>  tools/testing/selftests/gpio/Makefile              |  23 ++
>>  tools/testing/selftests/gpio/gpio-mockup-chardev.c | 324 +++++++++++++++++++++
>>  tools/testing/selftests/gpio/gpio-mockup-sysfs.sh  | 134 +++++++++
>>  tools/testing/selftests/gpio/gpio-mockup.sh        | 201 +++++++++++++
>>  5 files changed, 683 insertions(+)
>>  create mode 100644 tools/testing/selftests/gpio/Makefile
>>  create mode 100644 tools/testing/selftests/gpio/gpio-mockup-chardev.c
>>  create mode 100755 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
>>  create mode 100755 tools/testing/selftests/gpio/gpio-mockup.sh
>>
>> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
>> index ff9e5f2..2437dbc 100644
>> --- a/tools/testing/selftests/Makefile
>> +++ b/tools/testing/selftests/Makefile
>> @@ -6,6 +6,7 @@ TARGETS += exec
>>  TARGETS += firmware
>>  TARGETS += ftrace
>>  TARGETS += futex
>> +TARGETS += gpio
>>  TARGETS += ipc
>>  TARGETS += kcmp
>>  TARGETS += lib
>> diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
>> new file mode 100644
>> index 0000000..205e4d1
>> --- /dev/null
>> +++ b/tools/testing/selftests/gpio/Makefile
>> @@ -0,0 +1,23 @@
>> +
>> +TEST_PROGS := gpio-mockup.sh
>> +TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
>> +BINARIES := gpio-mockup-chardev
>> +
>> +include ../lib.mk
>> +
>> +all: $(BINARIES)
>> +
>> +clean:
>> +    $(RM) $(BINARIES)
>> +
>> +CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
>> +LDLIBS += -lmount -I/usr/include/libmount
>> +
>> +$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
>> +
>> +../../../gpio/gpio-utils.o:
>> +    make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
>> +
>> +../../../../usr/include/linux/gpio.h:
>> +    make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/
>> +
>> diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
>> new file mode 100644
>> index 0000000..667e916
>> --- /dev/null
>> +++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
>> @@ -0,0 +1,324 @@
>> +/*
>> + * GPIO chardev test helper
>> + *
>> + * Copyright (C) 2016 Bamvor Jian Zhang
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms of the GNU General Public License version 2 as published by
>> + * the Free Software Foundation.
>> + */
>> +
>> +#define _GNU_SOURCE
>> +#include <unistd.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <stdio.h>
>> +#include <errno.h>
>> +#include <string.h>
>> +#include <fcntl.h>
>> +#include <getopt.h>
>> +#include <sys/ioctl.h>
>> +#include <libmount.h>
>> +#include <err.h>
>> +#include <dirent.h>
>> +#include <linux/gpio.h>
>> +#include "../../../gpio/gpio-utils.h"
>> +
>> +#define CONSUMER    "gpio-selftest"
>> +#define    GC_NUM        10
>> +enum direction {
>> +    OUT,
>> +    IN
>> +};
>> +
>> +static int get_debugfs(char **path)
>> +{
>> +    struct libmnt_context *cxt;
>> +    struct libmnt_table *tb;
>> +    struct libmnt_iter *itr = NULL;
>> +    struct libmnt_fs *fs;
>> +    int found = 0;
>> +
>> +    cxt = mnt_new_context();
>> +    if (!cxt)
>> +        err(EXIT_FAILURE, "libmount context allocation failed");
>> +
>> +    itr = mnt_new_iter(MNT_ITER_FORWARD);
>> +    if (!itr)
>> +        err(EXIT_FAILURE, "failed to initialize libmount iterator");
>> +
>> +    if (mnt_context_get_mtab(cxt, &tb))
>> +        err(EXIT_FAILURE, "failed to read mtab");
>> +
>> +    while (mnt_table_next_fs(tb, itr, &fs) == 0) {
>> +        const char *type = mnt_fs_get_fstype(fs);
>> +
>> +        if (!strcmp(type, "debugfs")) {
>> +            found = 1;
>> +            break;
>> +        }
>> +    }
>> +    if (found)
>> +        asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
>> +
>> +    mnt_free_iter(itr);
>> +    mnt_free_context(cxt);
>> +
>> +    if (!found)
>> +        return -1;
>> +
>> +    return 0;
>> +}
>> +
>> +static int gpio_debugfs_get(const char *consumer, int *dir, int *value)
>> +{
>> +    char *debugfs;
>> +    FILE *f;
>> +    char *line = NULL;
>> +    size_t len = 0;
>> +    char *cur;
>> +    int found = 0;
>> +
>> +    if (get_debugfs(&debugfs) != 0)
>> +        err(EXIT_FAILURE, "debugfs is not mounted");
>> +
>> +    f = fopen(debugfs, "r");
>> +    if (!f)
>> +        err(EXIT_FAILURE, "read from gpio debugfs failed");
>> +
>> +    /*
>> +     * gpio-2   (                    |gpio-selftest               ) in  lo
>> +     */
>> +    while (getline(&line, &len, f) != -1) {
>> +        cur = strstr(line, consumer);
>> +        if (cur == NULL)
>> +            continue;
>> +
>> +        cur = strchr(line, ')');
>> +        if (!cur)
>> +            continue;
>> +
>> +        cur += 2;
>> +        if (!strncmp(cur, "out", 3)) {
>> +            *dir = OUT;
>> +            cur += 4;
>> +        } else if (!strncmp(cur, "in", 2)) {
>> +            *dir = IN;
>> +            cur += 4;
>> +        }
>> +
>> +        if (!strncmp(cur, "hi", 2))
>> +            *value = 1;
>> +        else if (!strncmp(cur, "lo", 2))
>> +            *value = 0;
>> +
>> +        found = 1;
>> +        break;
>> +    }
>> +    free(debugfs);
>> +    fclose(f);
>> +    free(line);
>> +
>> +    if (!found)
>> +        return -1;
>> +
>> +    return 0;
>> +}
>> +
>> +static struct gpiochip_info *list_gpiochip(const char *gpiochip_name, int *ret)
>> +{
>> +    struct gpiochip_info *cinfo;
>> +    struct gpiochip_info *current;
>> +    const struct dirent *ent;
>> +    DIR *dp;
>> +    char *chrdev_name;
>> +    int fd;
>> +    int i = 0;
>> +
>> +    cinfo = calloc(sizeof(struct gpiochip_info) * 4, GC_NUM + 1);
>> +    if (!cinfo)
>> +        err(EXIT_FAILURE, "gpiochip_info allocation failed");
>> +
>> +    current = cinfo;
>> +    dp = opendir("/dev");
>> +    if (!dp) {
>> +        *ret = -errno;
>> +        goto error_out;
>> +    } else {
>> +        *ret = 0;
>> +    }
>> +
>> +    while (ent = readdir(dp), ent) {
>> +        if (check_prefix(ent->d_name, "gpiochip")) {
>> +            *ret = asprintf(&chrdev_name, "/dev/%s", ent->d_name);
>> +            if (*ret < 0)
>> +                goto error_out;
>> +
>> +            fd = open(chrdev_name, 0);
>> +            if (fd == -1) {
>> +                *ret = -errno;
>> +                fprintf(stderr, "Failed to open %s\n",
>> +                    chrdev_name);
>> +                goto error_close_dir;
>> +            }
>> +            *ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, current);
>> +            if (*ret == -1) {
>> +                perror("Failed to issue CHIPINFO IOCTL\n");
>> +                goto error_close_dir;
>> +            }
>> +            close(fd);
>> +            if (strcmp(current->label, gpiochip_name) == 0
>> +                || check_prefix(current->label, gpiochip_name)) {
>> +                *ret = 0;
>> +                current++;
>> +                i++;
>> +            }
>> +        }
>> +    }
>> +
>> +    if ((!*ret && i == 0) || *ret < 0) {
>> +        free(cinfo);
>> +        cinfo = NULL;
>> +    }
>> +    if (!*ret && i > 0) {
>> +        cinfo = realloc(cinfo, sizeof(struct gpiochip_info) * 4 * i);
>> +        *ret = i;
>> +    }
>> +
>> +error_close_dir:
>> +    closedir(dp);
>> +error_out:
>> +    if (*ret < 0)
>> +        err(EXIT_FAILURE, "list gpiochip failed: %s", strerror(*ret));
>> +
>> +    return cinfo;
>> +}
>> +
>> +int gpio_pin_test(struct gpiochip_info *cinfo, int line, int flag, int value)
>> +{
>> +    struct gpiohandle_data data;
>> +    unsigned int lines[] = {line};
>> +    int fd;
>> +    int debugfs_dir = IN;
>> +    int debugfs_value = 0;
>> +    int ret;
>> +
>> +    data.values[0] = value;
>> +    ret = gpiotools_request_linehandle(cinfo->name, lines, 1, flag, &data,
>> +                       CONSUMER);
>> +    if (ret < 0)
>> +        goto fail_out;
>> +    else
>> +        fd = ret;
>> +
>> +    ret = gpio_debugfs_get(CONSUMER, &debugfs_dir, &debugfs_value);
>> +    if (ret) {
>> +        ret = -EINVAL;
>> +        goto fail_out;
>> +    }
>> +    if (flag & GPIOHANDLE_REQUEST_INPUT) {
>> +        if (debugfs_dir != IN) {
>> +            errno = -EINVAL;
>> +            ret = -errno;
>> +        }
>> +    } else if (flag & GPIOHANDLE_REQUEST_OUTPUT) {
>> +        if (flag & GPIOHANDLE_REQUEST_ACTIVE_LOW)
>> +            debugfs_value = !debugfs_value;
>> +
>> +        if (!(debugfs_dir == OUT && value == debugfs_value))
>> +            errno = -EINVAL;
>> +        ret = -errno;
>> +
>> +    }
>> +    gpiotools_release_linehandle(fd);
>> +
>> +fail_out:
>> +    if (ret)
>> +        err(EXIT_FAILURE, "gpio<%s> line<%d> test flag<0x%x> value<%d>",
>> +            cinfo->name, line, flag, value);
>> +
>> +    return ret;
>> +}
>> +
>> +void gpio_pin_tests(struct gpiochip_info *cinfo, unsigned int line)
>> +{
>> +    printf("line<%d>", line);
>> +    gpio_pin_test(cinfo, line, GPIOHANDLE_REQUEST_OUTPUT, 0);
>> +    printf(".");
>> +    gpio_pin_test(cinfo, line, GPIOHANDLE_REQUEST_OUTPUT, 1);
>> +    printf(".");
>> +    gpio_pin_test(cinfo, line,
>> +              GPIOHANDLE_REQUEST_OUTPUT | GPIOHANDLE_REQUEST_ACTIVE_LOW,
>> +              0);
>> +    printf(".");
>> +    gpio_pin_test(cinfo, line,
>> +              GPIOHANDLE_REQUEST_OUTPUT | GPIOHANDLE_REQUEST_ACTIVE_LOW,
>> +              1);
>> +    printf(".");
>> +    gpio_pin_test(cinfo, line, GPIOHANDLE_REQUEST_INPUT, 0);
>> +    printf(".");
>> +}
>> +
>> +/*
>> + * ./gpio-mockup-chardev gpio_chip_name_prefix is_valid_gpio_chip
>> + * Return 0 if successful or exit with EXIT_FAILURE if test failed.
>> + * gpio_chip_name_prefix: The prefix of gpiochip you want to test. E.g.
>> + *              gpio-mockup
>> + * is_valid_gpio_chip:      Whether the gpio_chip is valid. 1 means valid,
>> + *              0 means invalid which could not be found by
>> + *              list_gpiochip.
>> + */
>> +int main(int argc, char *argv[])
>> +{
>> +    char *prefix;
>> +    int valid;
>> +    struct gpiochip_info *cinfo;
>> +    struct gpiochip_info *current;
>> +    int i;
>> +    int ret;
>> +
>> +    if (argc < 3) {
>> +        printf("Usage: %s prefix is_valid", argv[0]);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    prefix = argv[1];
>> +    valid = strcmp(argv[2], "true") == 0 ? 1 : 0;
>> +
>> +    printf("Test gpiochip %s: ", prefix);
>> +    cinfo = list_gpiochip(prefix, &ret);
>> +    if (!cinfo) {
>> +        if (!valid && ret == 0) {
>> +            printf("Invalid test successful\n");
>> +            ret = 0;
>> +            goto out;
>> +        } else {
>> +            ret = -EINVAL;
>> +            goto out;
>> +        }
>> +    } else if (cinfo && !valid) {
>> +        ret = -EINVAL;
>> +        goto out;
>> +    }
>> +    current = cinfo;
>> +    for (i = 0; i < ret; i++) {
>> +        gpio_pin_tests(current, 0);
>> +        gpio_pin_tests(current, current->lines - 1);
>> +        gpio_pin_tests(current, random() % current->lines);
>> +        current++;
>> +    }
>> +    ret = 0;
>> +    printf("successful\n");
>> +
>> +out:
>> +    if (ret)
>> +        fprintf(stderr, "gpio<%s> test failed\n", prefix);
>> +
>> +    if (cinfo)
>> +        free(cinfo);
>> +
>> +    if (ret)
>> +        exit(EXIT_FAILURE);
>> +
>> +    return ret;
>> +}
>> diff --git a/tools/testing/selftests/gpio/gpio-mockup-sysfs.sh b/tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
>> new file mode 100755
>> index 0000000..085d7a3
>> --- /dev/null
>> +++ b/tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
>> @@ -0,0 +1,134 @@
>> +
>> +is_consistent()
>> +{
>> +    val=
>> +
>> +    active_low_sysfs=`cat $GPIO_SYSFS/gpio$nr/active_low`
>> +    val_sysfs=`cat $GPIO_SYSFS/gpio$nr/value`
>> +    dir_sysfs=`cat $GPIO_SYSFS/gpio$nr/direction`
>> +
>> +    gpio_this_debugfs=`cat $GPIO_DEBUGFS |grep "gpio-$nr" | sed "s/(.*)//g"`
>> +    dir_debugfs=`echo $gpio_this_debugfs | awk '{print $2}'`
>> +    val_debugfs=`echo $gpio_this_debugfs | awk '{print $3}'`
>> +    if [ $val_debugfs = "lo" ]; then
>> +        val=0
>> +    elif [ $val_debugfs = "hi" ]; then
>> +        val=1
>> +    fi
>> +
>> +    if [ $active_low_sysfs = "1" ]; then
>> +        if [ $val = "0" ]; then
>> +            val="1"
>> +        else
>> +            val="0"
>> +        fi
>> +    fi
>> +
>> +    if [ $val_sysfs = $val ] && [ $dir_sysfs = $dir_debugfs ]; then
>> +        echo -n "."
>> +    else
>> +        echo "test fail, exit"
>> +        die
>> +    fi
>> +}
>> +
>> +test_pin_logic()
>> +{
>> +    nr=$1
>> +    direction=$2
>> +    active_low=$3
>> +    value=$4
>> +
>> +    echo $direction > $GPIO_SYSFS/gpio$nr/direction
>> +    echo $active_low > $GPIO_SYSFS/gpio$nr/active_low
>> +    if [ $direction = "out" ]; then
>> +        echo $value > $GPIO_SYSFS/gpio$nr/value
>> +    fi
>> +    is_consistent $nr
>> +}
>> +
>> +test_one_pin()
>> +{
>> +    nr=$1
>> +
>> +    echo -n "test pin<$nr>"
>> +
>> +    echo $nr > $GPIO_SYSFS/export 2>/dev/null
>> +
>> +    if [ X$? != X0 ]; then
>> +        echo "test GPIO pin $nr failed"
>> +        die
>> +    fi
>> +
>> +    #"Checking if the sysfs is consistent with debugfs: "
>> +    is_consistent $nr
>> +
>> +    #"Checking the logic of active_low: "
>> +    test_pin_logic $nr out 1 1
>> +    test_pin_logic $nr out 1 0
>> +    test_pin_logic $nr out 0 1
>> +    test_pin_logic $nr out 0 0
>> +
>> +    #"Checking the logic of direction: "
>> +    test_pin_logic $nr in 1 1
>> +    test_pin_logic $nr out 1 0
>> +    test_pin_logic $nr low 0 1
>> +    test_pin_logic $nr high 0 0
>> +
>> +    echo $nr > $GPIO_SYSFS/unexport
>> +
>> +    echo "successful"
>> +}
>> +
>> +test_one_pin_fail()
>> +{
>> +    nr=$1
>> +
>> +    echo $nr > $GPIO_SYSFS/export 2>/dev/null
>> +
>> +    if [ X$? != X0 ]; then
>> +        echo "test invalid pin $nr successful"
>> +    else
>> +        echo "test invalid pin $nr failed"
>> +        echo $nr > $GPIO_SYSFS/unexport 2>/dev/null
>> +        die
>> +    fi
>> +}
>> +
>> +list_chip()
>> +{
>> +    echo `ls -d $GPIO_DRV_SYSFS/gpiochip* 2>/dev/null`
>> +}
>> +
>> +test_chip()
>> +{
>> +    chip=$1
>> +    name=`basename $chip`
>> +    base=`cat $chip/base`
>> +    ngpio=`cat $chip/ngpio`
>> +    printf "%-10s %-5s %-5s\n" $name $base $ngpio
>> +    if [ $ngpio = "0" ]; then
>> +        echo "number of gpio is zero is not allowed".
>> +    fi
>> +    test_one_pin $base
>> +    test_one_pin $(($base + $ngpio - 1))
>> +    test_one_pin $((( RANDOM % $ngpio )  + $base ))
>> +}
>> +
>> +test_chips_sysfs()
>> +{
>> +       gpiochip=`list_chip $module`
>> +       if [ X"$gpiochip" = X ]; then
>> +               if [ X"$valid" = Xfalse ]; then
>> +                       echo "successful"
>> +               else
>> +                       echo "fail"
>> +                       die
>> +               fi
>> +       else
>> +               for chip in $gpiochip; do
>> +                       test_chip $chip
>> +               done
>> +       fi
>> +}
>> +
>> diff --git a/tools/testing/selftests/gpio/gpio-mockup.sh b/tools/testing/selftests/gpio/gpio-mockup.sh
>> new file mode 100755
>> index 0000000..b183439
>> --- /dev/null
>> +++ b/tools/testing/selftests/gpio/gpio-mockup.sh
>> @@ -0,0 +1,201 @@
>> +#!/bin/bash
>> +
>> +#exit status
>> +#1: run as non-root user
>> +#2: sysfs/debugfs not mount
>> +#3: insert module fail when gpio-mockup is a module.
>> +#4: other reason.
>> +
>> +SYSFS=
>> +GPIO_SYSFS=
>> +GPIO_DRV_SYSFS=
>> +DEBUGFS=
>> +GPIO_DEBUGFS=
>> +dev_type=
>> +module=
>> +
>> +usage()
>> +{
>> +    echo "Usage:"
>> +    echo "$0 [-f] [-m name] [-t type]"
>> +    echo "-f:  full test. It maybe conflict with existence gpio device."
>> +    echo "-m:  module name, default name is gpio-mockup. It could also test"
>> +    echo "     other gpio device."
>> +    echo "-t:  interface type: chardev(char device) and sysfs(being"
>> +    echo "     deprecated). The first one is default"
>> +    echo ""
>> +    echo "$0 -h"
>> +    echo "This usage"
>> +}
>> +
>> +prerequisite()
>> +{
>> +    msg="skip all tests:"
>> +    if [ $UID != 0 ]; then
>> +        echo $msg must be run as root >&2
>> +        exit 1
>> +    fi
>> +    SYSFS=`mount -t sysfs | head -1 | awk '{ print $3 }'`
>> +    if [ ! -d "$SYSFS" ]; then
>> +        echo $msg sysfs is not mounted >&2
>> +        exit 2
>> +    fi
>> +    GPIO_SYSFS=`echo $SYSFS/class/gpio`
>> +    GPIO_DRV_SYSFS=`echo $SYSFS/devices/platform/$module/gpio`
>> +    DEBUGFS=`mount -t debugfs | head -1 | awk '{ print $3 }'`
>> +    if [ ! -d "$DEBUGFS" ]; then
>> +        echo $msg debugfs is not mounted >&2
>> +        exit 2
>> +    fi
>> +    GPIO_DEBUGFS=`echo $DEBUGFS/gpio`
>> +    source gpio-mockup-sysfs.sh
>> +}
>> +
>> +try_insert_module()
>> +{
>> +    if [ -d "$GPIO_DRV_SYSFS" ]; then
>> +        echo "$GPIO_DRV_SYSFS exist. Skip insert module"
>> +    else
>> +        modprobe -q $module $1
>> +        if [ X$? != X0 ]; then
>> +            echo $msg insmod $module failed >&2
>> +            exit 3
>> +        fi
>> +    fi
>> +}
>> +
>> +remove_module()
>> +{
>> +    modprobe -r -q $module
>> +}
>> +
>> +die()
>> +{
>> +    remove_module
>> +    exit 4
>> +}
>> +
>> +test_chips()
>> +{
>> +    if [ X$dev_type = Xsysfs ]; then
>> +        echo "WARNING: sysfs ABI of gpio is going to deprecated."
>> +        test_chips_sysfs $*
>> +    else
>> +        $BASE/gpio-mockup-chardev $*
>> +    fi
>> +}
>> +
>> +gpio_test()
>> +{
>> +    param=$1
>> +    valid=$2
>> +
>> +    if [ X"$param" = X ]; then
>> +        die
>> +    fi
>> +    try_insert_module "gpio_mockup_ranges=$param"
>> +    echo -n "GPIO $module test with ranges: <"
>> +    echo "$param>: "
>> +    printf "%-10s %s\n" $param
>> +    test_chips $module $valid
>> +    remove_module
>> +}
>> +
>> +BASE=`dirname $0`
>> +
>> +dev_type=
>> +TEMP=`getopt -o fhm:t: -n '$0' -- "$@"`
>> +
>> +if [ "$?" != "0" ]; then
>> +        echo "Parameter process failed, Terminating..." >&2
>> +        exit 1
>> +fi
>> +
>> +# Note the quotes around `$TEMP': they are essential!
>> +eval set -- "$TEMP"
>> +
>> +while true; do
>> +    case $1 in
>> +    -f)
>> +        full_test=true
>> +        shift
>> +        ;;
>> +    -h)
>> +        usage
>> +        exit
>> +        ;;
>> +    -m)
>> +        module=$2
>> +        shift 2
>> +        ;;
>> +    -t)
>> +        dev_type=$2
>> +        shift 2
>> +        ;;
>> +    --)
>> +        shift
>> +        break
>> +        ;;
>> +    *)
>> +        echo "Internal error!"
>> +        exit 1
>> +        ;;
>> +    esac
>> +done
>> +
>> +if [ X"$module" = X ]; then
>> +    module="gpio-mockup"
>> +fi
>> +
>> +if [ X$dev_type != Xsysfs ]; then
>> +    dev_type="chardev"
>> +fi
>> +
>> +prerequisite
>> +
>> +echo "1.  Test dynamic allocation of gpio successful means insert gpiochip and"
>> +echo "    manipulate gpio pin successful"
>> +gpio_test "-1,32" true
>> +gpio_test "-1,32,-1,32" true
>> +gpio_test "-1,32,-1,32,-1,32" true
>> +if [ X$full_test = Xtrue ]; then
>> +    gpio_test "-1,32,32,64" true
>> +    gpio_test "-1,32,40,64,-1,5" true
>> +    gpio_test "-1,32,32,64,-1,32" true
>> +    gpio_test "0,32,32,64,-1,32,-1,32" true
>> +    gpio_test "-1,32,-1,32,0,32,32,64" true
>> +    echo "2.  Do basic test: successful means insert gpiochip and"
>> +    echo "    manipulate gpio pin successful"
>> +    gpio_test "0,32" true
>> +    gpio_test "0,32,32,64" true
>> +    gpio_test "0,32,40,64,64,96" true
>> +fi
>> +echo "3.  Error test: successful means insert gpiochip failed"
>> +echo "3.1 Test number of gpio overflow"
>> +#Currently: The max number of gpio(1024) is defined in arm architecture.
>> +gpio_test "-1,32,-1,1024" false
>> +if [ X$full_test = Xtrue ]; then
>> +    echo "3.2 Test zero line of gpio"
>> +    gpio_test "0,0" false
>> +    echo "3.3 Test range overlap"
>> +    echo "3.3.1 Test corner case"
>> +    gpio_test "0,32,0,1" false
>> +    gpio_test "0,32,32,64,32,40" false
>> +    gpio_test "0,32,35,64,35,45" false
>> +    gpio_test "0,32,31,32" false
>> +    gpio_test "0,32,32,64,36,37" false
>> +    gpio_test "0,32,35,64,34,36" false
>> +    echo "3.3.2 Test inserting invalid second gpiochip"
>> +    gpio_test "0,32,30,35" false
>> +    gpio_test "0,32,1,5" false
>> +    gpio_test "10,32,9,14" false
>> +    gpio_test "10,32,30,35" false
>> +    echo "3.3.3 Test others"
>> +    gpio_test "0,32,40,56,39,45" false
>> +    gpio_test "0,32,40,56,30,33" false
>> +    gpio_test "0,32,40,56,30,41" false
>> +    gpio_test "0,32,40,56,20,21" false
>> +fi
>> +
>> +echo GPIO test PASS
>> +
>>
> 
> 
> 

