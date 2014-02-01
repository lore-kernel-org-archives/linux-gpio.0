From: Evgeny Boger <boger@contactless.ru>
Subject: Question about non-boolean gpio sysfs values
Date: Sun, 02 Feb 2014 03:35:01 +0400
Message-ID: <52ED84A5.3050102@contactless.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:39969 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897AbaBAXfF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Feb 2014 18:35:05 -0500
Received: by mail-lb0-f170.google.com with SMTP id u14so4501213lbd.29
        for <linux-gpio@vger.kernel.org>; Sat, 01 Feb 2014 15:35:02 -0800 (PST)
Received: from [192.168.0.164] ([81.5.110.82])
        by mx.google.com with ESMTPSA id 10sm8608781lan.5.2014.02.01.15.35.01
        for <linux-gpio@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Sat, 01 Feb 2014 15:35:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hello,

I'm now getting non-boolean values from gpio sysfs interface on 3.13, 
like this

root@wirenboard:~# cat /sys/class/gpio/gpio16/value
65536

(I'm working with imx23 soc which is handled by gpio-generic.c driver)

Looks like these weird non-boolean values appeared after this commit: 
https://github.com/torvalds/linux/commit/79a9becda8940deb2274b5aa4577c86d52ee7ecb 
.


1) Is it an expected behavior or not?

2) If it's not the case, which one of these should be fixed?
   a) bgpio_get in gpio-generic.c to return only boolean values
or
   b) gpio_value_show so only the sysfs interface will be affected
or
  c) gpiod_get_value and gpiod_get_value_cansleep functions


--
  Thanks,
    Evgeny Boger








