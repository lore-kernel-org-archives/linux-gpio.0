From: Yegor Yefremov <yegorslists@googlemail.com>
Subject: sysfs: wait for GPIO interrupt
Date: Thu, 8 May 2014 10:19:10 +0200
Message-ID: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:65005 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751552AbaEHITc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 May 2014 04:19:32 -0400
Received: by mail-lb0-f177.google.com with SMTP id s7so2992926lbd.36
        for <linux-gpio@vger.kernel.org>; Thu, 08 May 2014 01:19:31 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linux GPIO List <linux-gpio@vger.kernel.org>
Cc: jack@embed.me.uk, Javier Martinez Canillas <javier@dowhile0.org>

I've stumbled upon following issue. When waiting for interrupt with
poll() like described in this example [1], the program returns from
poll() immediately. This thread [2] describes a workaround for this
issue via making read() before invoking poll().

My system is am335x, kernel 3.15-rc4

I experience this behavior by both SoC's own GPIO and i2c expander tca6416.

Is this the proper way (invoke read() before poll()) to work with
GPIOs from user space, so that this approach should be incorporated
into such libraries as libsoc [3]

Yegor

[1] https://developer.ridgerun.com/wiki/index.php/Gpio-int-test.c
[2] http://comments.gmane.org/gmane.linux.distributions.gumstix.general/61286
[3] https://github.com/jackmitch/libsoc
