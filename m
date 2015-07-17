From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/9] gpiolib: Add GPIO name support
Date: Fri, 17 Jul 2015 22:05:52 +0200
Message-ID: <CACRpkdY=SLGyrcvWT355b3Z+pBwb9gPzVcieD8mOn=zdyJ1mFw@mail.gmail.com>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34551 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863AbbGQUFx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 16:05:53 -0400
Received: by obre1 with SMTP id e1so72169948obr.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 13:05:52 -0700 (PDT)
In-Reply-To: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Jul 17, 2015 at 11:32 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> This is a proposal to add GPIO names to the kernel based on devicetree
> descriptions.
>
> This series adds GPIO name support. Until now it is only possible to use names
> for already requested GPIOs (for example what they are used for). It is not
> possible to identify GPIOs by a name although most of them have a name for
> example in the schematics of the board. This makes it difficult to identify
> a specific GPIO from userspace.
>
> As the GPIO name information is a hardware description this series uses the
> devicetree bindings introduced by the GPIO hogging mechanism, specifically
> 'line-name', to identify GPIOs. The sysfs 'export' file is changed to accept
> names as fallback. The gpio numbers still have a higher priority to ensure
> backwards compatibility.
>
> Exported GPIOs are still using their number as directory name (gpio<ID>). But the
> directories now contain a 'name' file which is '(null)' for non-existent names
> and the name otherwise.
>
> This series can be used to have an easy name mapping for udev with a quite
> simple rule similar to this:
>         SUBSYSTEM=="gpio", KERNEL=="gpio*", ATTR{name}!="(null)", ACTION=="add", \
>         PROGRAM+="/bin/sh -c 'mkdir -p /dev/gpios; rm -f /dev/gpios/$attr{name}; ln -s /sys%p/ /dev/gpios/$attr{name}"
> With this rule udev adds a link for each exported GPIO with a name into
> /dev/gpios/. This way it is not necessary to know the number of a GPIO to use
> it.

I must say I like this series.

Because it makes the GPIO sysfs ABI *less* insane. Especially
I like the patch that makes a distinction between "label" (use)
and "name" (the name of the actual line). That illustrates clearly
that this is thought-through.

However I still have some doubts as it will expand the sysfs ABI,
and we have discussed a char device for GPIO chips as a better
alternative, for example since these can do get/set multiple GPIOs
with a single context switch (ioctl), whereas sysfs is "one value per file"
and would be able to expose some flags better.

Still this is very tempting. Adding some more people to To: to get
some opinions.

Yours,
Linus Walleij
