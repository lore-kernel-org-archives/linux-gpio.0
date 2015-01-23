From: Paul Bolle <pebolle@tiscali.nl>
Subject: gpio: ARCH_MB86S7X?
Date: Fri, 23 Jan 2015 11:21:41 +0100
Message-ID: <1422008501.30730.22.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cpsmtpb-ews04.kpnxchange.com ([213.75.39.7]:53652 "EHLO
	cpsmtpb-ews04.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752782AbbAWKVo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 23 Jan 2015 05:21:44 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Andy Green <andy.green@linaro.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Jassi,

Your commit 0da094d82c27 ("gpio: Add Fujitsu MB86S7x GPIO driver") is
included in today's linux-next (ie, next-20150123). I noticed because a
script I use to check linux-next spotted a problem in it.

That commit added the Kconfig symbol GPIO_MB86S7X and made it depend on
ARCH_MB86S7X. But there's no Kconfig symbol ARCH_MB86S7X in linux-next.
I assume a patch to add that symbol is queued somewhere. Is that
correct?

Please note that I actually managed to cross-compile
drivers/gpio/gpio-mb86s7x.c with this command:
    make ARCH=arm CROSS_COMPILE=arm-linux-gnu- EXTRA_CFLAGS="-DCONFIG_GPIOLIB=y" drivers/gpio/gpio-mb86s7x.o

So, for what it's worth, that dependency appears to be not needed to
build this driver.

Thanks,


Paul Bolle

