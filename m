From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Regression in v4.15 due to GPIO .get_multiple changes
Date: Mon, 15 Jan 2018 16:35:48 +0100
Message-ID: <20180115153547.GA4441@archie.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:33970 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966132AbeAOPlv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jan 2018 10:41:51 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Lukas Wunner <lukas@wunner.de>, Bartosz Golaszewski <brgl@bgdev.pl>

Hi,

I noticed a regression when testing the GPIOs on an i.MX6 with the
current v4.15-rc8 kernel.

When reading the input value of an internal GPIO, for example with
libgpiod's gpiod_line_get_value, strace shows that userspace blocks
indefinitely at:
ioctl(45, GPIOHANDLE_GET_LINE_VALUES_IOCTL

(The process consumes 100% CPU afterwards and can't be killed)

I looked at changes between v4.14 (working) and v4.15-rc8 (broken),
especially in drivers/gpio/gpio-{mxc,mmio}.c and identified the
following two commits to be responsible:
eec1d566cdf9 ("gpio: Introduce ->get_multiple callback")
80057cb417b2 ("gpio-mmio: Use the new .get_multiple() callback")

Reverting both of them (they are interdependent) fixed the problem.

I don't have a patch to fix it yet, but as it is rather late in the
development cycle of 4.15, I thought it better to report it now. The
author can probably cook up a fix way quicker or decide if you want to
revert.

If you can't reproduce it, let me know and I can send you ftrace
records, test your patches or try to come up with a solution myself.

Cheers,
Clemens
