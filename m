From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: moxart: Actually set output state in moxart_gpio_direction_output()
Date: Fri, 4 Apr 2014 11:32:44 +0200
Message-ID: <CACmBeS1y7y9C7BGG8vrkB7FdXRiBuA2Ar6KNZFM2RC0enMxZ0w@mail.gmail.com>
References: <1395715413.12999.0.camel@phoenix>
	<1395715459.12999.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:61111 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751724AbaDDJco (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Apr 2014 05:32:44 -0400
Received: by mail-ie0-f177.google.com with SMTP id rl12so3121321iec.36
        for <linux-gpio@vger.kernel.org>; Fri, 04 Apr 2014 02:32:44 -0700 (PDT)
In-Reply-To: <1395715459.12999.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Thanks !

Verified by buzzing the buzzer and writing RTC (next-20140403):

echo 24 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio24/direction
echo 1 > /sys/class/gpio/gpio24/value
echo 0 > /sys/class/gpio/gpio24/value

date +%Y%m%d%h%m -s "201001202323"
hwclock -w
reboot
..
[    2.420000] moxart-rtc rtc.0: setting system clock to 2010-01-20
22:23:31 UTC (1264026211)
..
date +%Y%m%d%h%m -s "201212181553"
hwclock -w
reboot
..
[    2.410000] moxart-rtc rtc.0: setting system clock to 2012-12-18
14:53:29 UTC (1355842409)


Tested-by: Jonas Jensen <jonas.jensen@gmail.com>
