From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] pinctrl: pxa: pxa2xx: add pin control skeleton
Date: Thu, 10 Dec 2015 16:10:58 +0100
Message-ID: <CACRpkdaJB1JnThtY6ZmQKDMY3Naci8cEaaK7bXfDUC2pvdgLsA@mail.gmail.com>
References: <1448129093-20722-1-git-send-email-robert.jarzmik@free.fr>
	<1448129093-20722-3-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:32834 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753833AbbLJPK6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 10:10:58 -0500
Received: by obbsd4 with SMTP id sd4so11214154obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 07:10:58 -0800 (PST)
In-Reply-To: <1448129093-20722-3-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Nov 21, 2015 at 7:04 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Add a pincontrol driver for pxa2xx architecture, encompassing all pxa25x
> and pxa27x variants. This is only the pin muxing part of the driver.
>
> One specific consideration is also the memory space (MMIO), which is
> intertwined with the GPIO registers. To make things worse, the GPIO
> direction register also affect pin muxing, as it chooses the "kind" of
> pin, ie. the 4 output functions or 4 input functions.
>
> The mapping between pinctrl notions and PXA Technical Reference Manual
> is as follows :
>  - a pin is obviously a pin
>  - a group is also a pin, ie. group P101 is the pin 101
>  - a mux function is an alternate function
>    (ie. gpio-in, gpio-out, MMCLK, BTRTS, etc ...)
>
> The individual architecture (pxa27x, pxa25x) instantiate a pin control
> by providing a table of pins, each pin being provided a list of
> PXA_FUNCTION (alternate functions).
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Patch applied.

Yours,
Linus Walleij
