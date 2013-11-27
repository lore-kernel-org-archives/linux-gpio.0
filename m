From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: mxs gpios as wakeup interrupts and irq_set_wake() hook
Date: Wed, 27 Nov 2013 15:00:11 +0100
Message-ID: <CACRpkdYv6DZzdtKnemta-sZLhEDuvq+dpsiun4EZfp7Ae-1Vuw@mail.gmail.com>
References: <528DDE30.4090509@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:55680 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752235Ab3K0OAM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2013 09:00:12 -0500
Received: by mail-oa0-f47.google.com with SMTP id k1so7568858oag.6
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2013 06:00:11 -0800 (PST)
In-Reply-To: <528DDE30.4090509@digi.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hector Palacios <hector.palacios@digi.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>, Daniel Mack <zonque@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>

On Thu, Nov 21, 2013 at 11:19 AM, Hector Palacios
<hector.palacios@digi.com> wrote:

> +#ifdef CONFIG_PM_SLEEP
>         ct->chip.irq_set_wake = mxs_gpio_set_wake_irq;
> +#endif

Don't bother ifdef:in this. Since that function is not #ifdef:ed
I guess you get a build warning of an unused function when
PM_SLEEP is not set?

Yours,
Linus Walleij
