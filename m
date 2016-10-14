From: Bamvor Jian Zhang <bamvor.zhangjian@huawei.com>
Subject: [PATCH v4 0/3] Add gpio test framework
Date: Fri, 14 Oct 2016 10:48:24 +0800
Message-ID: <1476413307-1397-1-git-send-email-bamvor.zhangjian@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:18980 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753779AbcJNCqR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2016 22:46:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, broonie@kernel.org, mwelling@ieee.org, shuahkh@osg.samsung.com

These series of patches try to add support for testing of gpio
subsystem based on the proposal from Linus Walleij. The first three
version is here[1][2][3].

The basic idea is implement a virtual gpio device(gpio-mockup) base
on gpiolib. Tester could test the gpiolib by manipulating gpio-mockup
device through chardev(default) or sysfs and check the result from
debugfs. Reference the following figure:

   sysfs/chardev      debugfs
     |                   |
  gpiolib----------------/
     |
 gpio-mockup

In order to avoid conflict with other gpio exist in the system,
only dynamic allocation is tested by default. User could pass -f to
do full test.

The test script could also test other (real) gpio device, such as
pl061 in my qemu:
./gpio-mockup.sh -m 9030000.pl061

Originally, there are 5 patches. 2 of them are merged by Linus:
a6a1cf3 gpio: MAINTAINERS: Add an entry for GPIO mockup driver
0f98dd1 gpio/mockup: add virtual gpio device

There series only include the others:
tools/gpio: add gpio basic opereations
tools/gpio: re-work gpio hammer with gpio operations
selftest/gpio: add gpio test case

[1] http://comments.gmane.org/gmane.linux.kernel.gpio/11883
[2] http://www.spinics.net/lists/linux-gpio/msg11700.html
[2] http://www.spinics.net/lists/linux-gpio/msg16255.html

Changes since v3:
1.  Rename the api in gpio-utils.[ch] with gpiotools.
2.  Update in kernel document according to the
    "Documentation/kernel-docs.txt", and move it to implementation.
3.  Remove useless label of goto according to the suggestion from
    Michael Welling.

Changes since v2:
1.  Switch to chardev.
2.  Add basic gpio operation for chardev.

Changes since v1:
1.  Change value of gpio to boolean.
2.  Only test dynamic allocation by default.

Bamvor Jian Zhang (3):
  tools/gpio: add gpio basic opereations
  tools/gpio: re-work gpio hammer with gpio operations
  selftest/gpio: add gpio test case

 tools/gpio/gpio-hammer.c                           |  67 ++---
 tools/gpio/gpio-utils.c                            | 257 ++++++++++++++++
 tools/gpio/gpio-utils.h                            |  16 +
 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/gpio/Makefile              |  23 ++
 tools/testing/selftests/gpio/gpio-mockup-chardev.c | 324 +++++++++++++++++++++
 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh  | 134 +++++++++
 tools/testing/selftests/gpio/gpio-mockup.sh        | 200 +++++++++++++
 8 files changed, 972 insertions(+), 50 deletions(-)
 create mode 100644 tools/testing/selftests/gpio/Makefile
 create mode 100644 tools/testing/selftests/gpio/gpio-mockup-chardev.c
 create mode 100755 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
 create mode 100755 tools/testing/selftests/gpio/gpio-mockup.sh

-- 
1.8.4.5

