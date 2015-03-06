From: Jonas Gorski <jogo@openwrt.org>
Subject: "gpioN" named functions for GPIO pins
Date: Fri, 6 Mar 2015 12:26:00 +0100
Message-ID: <CAOiHx==ZVc8z-zPqn4iPr-9Z_hmg95vrWGiexhZp_LJYg5NQSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:41418 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754201AbbCFL0a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 6 Mar 2015 06:26:30 -0500
Received: from localhost (localhost [127.0.0.1])
	by arrakis.dune.hu (Postfix) with ESMTP id D296C28BCF0
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2015 12:26:06 +0100 (CET)
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com [209.85.192.52])
	by arrakis.dune.hu (Postfix) with ESMTPSA id C66F8280950
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2015 12:26:04 +0100 (CET)
Received: by qgfl89 with SMTP id l89so11730297qgf.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2015 03:26:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello Linus,


according to your Documentation/pinctrl.txt:

"Pin control interaction with the GPIO subsystem
===============================================
...
For this reason there are two functions a pin control driver can implement
to enable only GPIO on an individual pin: .gpio_request_enable() and
.gpio_disable_free().
...
Alternatively to using these special functions, it is fully allowed to use
named functions for each GPIO pin, the pinctrl_request_gpio() will attempt to
obtain the function "gpioN" where "N" is the global GPIO pin number if no
special GPIO-handler is registered."

As far as I understand the second paragraph, it should suffice to
define functions named "gpio0", "gpio1", etc. instead of adding a
gpio_request_enable().

But I fail to see in pinctrl_request_gpio() where this happens:

pinctrl_request_gpio() calls pinmux_request_gpio(), which calls
pin_request(); pin_request() then calls ops->gpio_request_enable() if
present and a gpiorange is given, or ops->request() if present.
Nowhere I can see that any "gpio%d" function is even looked for, at
least that was the heuristic I used to find that place where
pinctrl_request_gpio was supposed to obtain the function "gpioN".

Am I just overlooking something, or is this actually not implemented?


Regards
Jonas
