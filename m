From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH v2 0/3] Add gpio test framework
Date: Wed,  3 Feb 2016 20:14:33 +0800
Message-ID: <1454501676-19900-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:35436 "EHLO
	mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752302AbcBCMOz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 07:14:55 -0500
Received: by mail-pf0-f178.google.com with SMTP id 65so13138982pfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Feb 2016 04:14:55 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

These series of patches try to add support for testing of gpio
subsystem based on the proposal from Linus Walleij. The first version
is here[1].

The basic idea is implement a virtual gpio device(gpio-mockup) base
on gpiolib. Tester could test the gpiolib by manipulating gpio-mockup
device through sysfs or char device and check the result from debugfs.
Reference the following figure:

   sysfs/char device  debugfs
     |                   |
  gpiolib----------------/
     |
 gpio-mockup

Currently, this test script will use sysfs interface by default. I
plan set char device as default after it upstreamed.

In order to avoid conflict with other gpio exist in the system,
only dynamic allocation is tested by default. User could pass -f to
do full test.

[1] http://comments.gmane.org/gmane.linux.kernel.gpio/11883

Changes since v1:
1.  Change value of gpio to boolean.
2.  Only test dynamic allocation by default.

Bamvor Jian Zhang (3):
  gpio/mockup: add virtual gpio device
  selftest/gpio: add gpio test case
  gpio: MAINTAINERS: Add an entry for GPIO mockup driver

 Documentation/kernel-parameters.txt               |   4 +
 MAINTAINERS                                       |   7 +
 drivers/gpio/Kconfig                              |  12 ++
 drivers/gpio/Makefile                             |   1 +
 drivers/gpio/gpio-mockup.c                        | 231 ++++++++++++++++++++++
 tools/testing/selftests/Makefile                  |   1 +
 tools/testing/selftests/gpio/Makefile             |  10 +
 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh | 117 +++++++++++
 tools/testing/selftests/gpio/gpio-mockup.sh       | 198 +++++++++++++++++++
 9 files changed, 581 insertions(+)
 create mode 100644 drivers/gpio/gpio-mockup.c
 create mode 100644 tools/testing/selftests/gpio/Makefile
 create mode 100644 tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
 create mode 100755 tools/testing/selftests/gpio/gpio-mockup.sh

-- 
2.1.4

