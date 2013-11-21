From: Fabio Estevam <festevam@gmail.com>
Subject: Re: mxs gpios as wakeup interrupts and irq_set_wake() hook
Date: Thu, 21 Nov 2013 15:45:56 -0200
Message-ID: <CAOMZO5Caua_+ZAJWdiCmQyf7nrQoW+GwBoE2J3w_RxeKKGkxGw@mail.gmail.com>
References: <528DDE30.4090509@digi.com>
	<528E364B.2070309@freescale.com>
	<528E4394.9050807@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vb0-f53.google.com ([209.85.212.53]:40950 "EHLO
	mail-vb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858Ab3KURp4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2013 12:45:56 -0500
Received: by mail-vb0-f53.google.com with SMTP id g10so51103vbg.26
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2013 09:45:56 -0800 (PST)
In-Reply-To: <528E4394.9050807@digi.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hector Palacios <hector.palacios@digi.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "zonque@gmail.com" <zonque@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>

On Thu, Nov 21, 2013 at 3:32 PM, Hector Palacios
<hector.palacios@digi.com> wrote:

> Do you mean to have an entry like this?
>
>         gpio_keys {
>                 compatible = "gpio-keys";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 autorepeat;
>                 gpio-key,wakeup;
>                 button@21 {
>                         label = "GPIO Key UP";
>                         linux,code = <103>;
>                         gpios = <&gpio3 11 1>;  /* gpio107 */
>                 };
>         };

Yes, this is what I meant.

>
> No it doesn't.
>
> In any case what I wanted (maybe it's not standard) was to be able to export
> a GPIO, configure it as interrupt, and enable it as wakeup, entirely from
> sysfs, without needing to use a driver or defining an entry for a specific
> GPIO in the DT.
> I achieved it with the code I sent but I guess the framework was not devised
> to use gpios that way.
>
> Have you tested if that irq_set_wake hook in the gpio-mxs.c driver is ever
> called?

On mx28evk I don't have any free GPIO I can use to wakeup the system,
so I have not tried it.

I have only used the serial port to wakeup the system.

Regards,

Fabio Estevam
