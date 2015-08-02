From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH v2 10/11] w1: Allow compile test of GPIO consumers if !GPIOLIB
Date: Sun, 02 Aug 2015 12:25:07 +0300
Message-ID: <1214241438507507@web3j.yandex.ru>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org> <1438506594-31888-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from forward15j.cmail.yandex.net ([5.255.227.179]:47804 "EHLO
	forward15j.cmail.yandex.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751815AbbHBJdI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2015 05:33:08 -0400
In-Reply-To: <1438506594-31888-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Geert

02.08.2015, 12:09, "Geert Uytterhoeven" <geert@linux-m68k.org>:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
>
> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
> appropriate.

> - depends on GPIOLIB
> + depends on GPIOLIB || COMPILE_TEST

Does that mean GPIO subsystem is always available and no additional dependency needed
when COMPILE_TEST is enabled?
