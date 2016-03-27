From: Guenter Roeck <guenter@roeck-us.net>
Subject: Problems with commit a770d946371e ("gpio: pxa: add pin control gpio
 direction and request")
Date: Sat, 26 Mar 2016 18:01:19 -0700
Message-ID: <56F730DF.9080307@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:34373 "EHLO
	mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754430AbcC0BBV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Mar 2016 21:01:21 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,

when trying pxa_defconfig with various pxa270 and pxa255 qemu targets, I noticed that the gpio
pin direction is no longer set. Bisect points to commit a770d946371e ("gpio: pxa: add pin control
gpio direction and request"). As it turns out, pxa_defconfig does not configure PINCTRL. As a result,
pinctrl stub functions are used. Those all return 0 if PINCTRL is not configured. This causes the
pxa gpio driver to wrongly assume that pinctrl configured the gpio pin direction, and does nothing.

Looking into gpio-mvebu.c, its use of the pinctrl functions is completely different. It aborts
on error, not on success, from the pinctrl functions. Given that, I have no idea how to resolve
the problem. Having the stub functions return an error might cause the mvebu driver (and maybe
others) to fail if there is no pinctrl driver, so that does not seem to be an option.

If the idea is to mandate pinctrl for PXA architectures, it should probably be enabled for those
architectures. Unless I am missing something, PXA architectures to not select PINCTRL, which
suggests that the problem may affect a wide range of systems. Please have a look.

Thanks,
Guenter

