From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: fix pull-up/down logic
Date: Fri, 29 Apr 2016 11:17:08 +0200
Message-ID: <CACRpkdbxu4guLjaaMrQ5h1H=4nByuzbSc-aOBdb2S7m8BfZ5Hg@mail.gmail.com>
References: <1461074628-20224-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34598 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225AbcD2JRJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2016 05:17:09 -0400
Received: by mail-oi0-f52.google.com with SMTP id k142so112202643oib.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Apr 2016 02:17:09 -0700 (PDT)
In-Reply-To: <1461074628-20224-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 19, 2016 at 4:03 PM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> The default configuration of a pin is often with a value in the
> pull-up/down field at chip reset. So, even if the internal logic of the
> controller prevents writing a configuration with pull-up and pull-down at
> the same time, we must ensure explicitly this condition before writing the
> register.
>
> This was leading to a pull-down condition not taken into account for
> instance.
>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Fixes: 776180848b57 ("pinctrl: introduce driver for Atmel PIO4 controller")
> Cc: stable@vger.kernel.org #v4.4 and later

Patch applied for fixes with the ACKs.

Yours,
Linus Walleij
