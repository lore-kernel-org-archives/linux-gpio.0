From: bamvor.zhangjian@linaro.org
Subject: [PATCH v3 0/5] Add gpio test framework
Date: Wed, 31 Aug 2016 11:45:43 +0200
Message-ID: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:34870 "EHLO
        mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759075AbcHaJqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2016 05:46:07 -0400
Received: by mail-pf0-f177.google.com with SMTP id x72so17899783pfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2016 02:46:07 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

These series of patches try to add support for testing of gpio
subsystem based on the proposal from Linus Walleij. The first two
version is here[1][2].

The basic idea is implement a virtual gpio device(gpio-mockup) base
on gpiolib. Tester could test the gpiolib by manipulating gpio-mockup
device through sysfs or char device and check the result from debugfs.
Reference the following figure:

   sysfs/char device  debugfs
     |                   |
  gpiolib----------------/
     |
 gpio-mockup

Currently, this test script will use chardev interface by default.

In order to avoid conflict with other gpio exist in the system,
only dynamic allocation is tested by default. User could pass -f to
do full test.

[1] http://comments.gmane.org/gmane.linux.kernel.gpio/11883
[2] http://www.spinics.net/lists/linux-gpio/msg11700.html

Changes since v1:
1.  Change value of gpio to boolean.
2.  Only test dynamic allocation by default.
Changes since v2:
1.  Switch to chardev.
2.  Add basic gpio operation for chardev.

Bamvor Jian Zhang (5):
  tools/gpio: add gpio basic opereations
  tools/gpio: re-work gpio hammer with gpio operations
  gpio/mockup: add virtual gpio device
  selftest/gpio: add gpio test case
  gpio: MAINTAINERS: Add an entry for GPIO mockup driver

 Documentation/kernel-parameters.txt                |   4 +
 MAINTAINERS                                        |   7 +
 drivers/gpio/Kconfig                               |  12 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-mockup.c                         | 214 ++++++++++++++
 tools/gpio/gpio-hammer.c                           |  52 +---
 tools/gpio/gpio-utils.c                            | 163 +++++++++++
 tools/gpio/gpio-utils.h                            | 121 ++++++++
 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/gpio/Makefile              |  23 ++
 tools/testing/selftests/gpio/gpio-mockup-chardev.c | 321 +++++++++++++++++++++
 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh  | 134 +++++++++
 tools/testing/selftests/gpio/gpio-mockup.sh        | 200 +++++++++++++
 13 files changed, 1211 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpio/gpio-mockup.c
 create mode 100644 tools/testing/selftests/gpio/Makefile
 create mode 100644 tools/testing/selftests/gpio/gpio-mockup-chardev.c
 create mode 100755 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
 create mode 100755 tools/testing/selftests/gpio/gpio-mockup.sh

-- 
1.8.4.5

