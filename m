From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Subject: [PATCH RFD 0/3] Add gpio test framework
Date: Sat, 14 Nov 2015 16:51:34 +0800
Message-ID: <1447491097-14799-1-git-send-email-bamvor.zhangjian@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:33662 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbbKNIv7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 03:51:59 -0500
Received: by pabfh17 with SMTP id fh17so124267450pab.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 00:51:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

These series of patches try to add support for testing of gpio
subsystem based on the proposal from Linus Walleij.

The basic idea is implement a virtual gpio device(gpio-mockup) base
on gpiolib. Tester could test the gpiolib by manipulating gpio-mockup
device through sysfs and check the result from debugfs. Both sysfs
and debugfs are provided by gpiolib. Reference the following figure:

   sysfs  debugfs
     |       |
  gpiolib---/
     |
 gpio-mockup

Find two issues with my patch series[1]

Futher work and discussion:
1.  Test other code path(if exists).

2   Add pinctrl and interrupt support(Linus suggest trying the
    eventfd) in next steps.

3.  I feel that we could rework the debugfs in other gpiolib based
    drivers to the code in gpiolib.c with generic gpiolib_dbg_show or
    chip->dbg_show.

4.  Currently, gpio-mockup does not support the device tree. There are
    pros and cons if we do not support device tree:
    Pros: do not need to mix with the real hardware dts.
    Cons: could not test the dt_gpio_count, of_find_gpio which rely on
    device tree. And other function such like gpiod_get_index which
    rely on the correctness of the above functions.

    If we want to test the above functions, we could provide a
    dedicated device tree for gpio-mockup device which could be
    included by other device tree. And we could use device tree
    overlay to provide multiple device tree testcases.

5.  Given that this gpio test framework is based on sysfs and debugfs.
    I feel that it could be a generic gpio test script other then a
    dedicated script for gpio-mockup driver. Although, my script only
    support gpio-mockup driver at this monment.

[1] http://article.gmane.org/gmane.linux.kernel.gpio/11878

Bamvor Jian Zhang (3):
  gpio/mockup: add virtual gpio device
  selftest/gpio: add gpio test case
  gpio: MAINTAINERS: Add an entry for GPIO mockup driver

 MAINTAINERS                          |   9 ++
 drivers/gpio/Kconfig                 |   9 ++
 drivers/gpio/Makefile                |   1 +
 drivers/gpio/gpio-mockup.c           | 216 +++++++++++++++++++++++++++++++
 tools/testing/selftests/Makefile     |   1 +
 tools/testing/selftests/gpio/gpio.sh | 238 +++++++++++++++++++++++++++++++++++
 6 files changed, 474 insertions(+)
 create mode 100644 drivers/gpio/gpio-mockup.c
 create mode 100755 tools/testing/selftests/gpio/gpio.sh

-- 
2.1.4

