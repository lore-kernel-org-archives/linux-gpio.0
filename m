From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Fri, 19 Feb 2016 03:46:20 -0600
Message-ID: <20160219094620.GA28750@deathstar>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
 <20160217205445.GA2394@deathstar>
 <CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:34358 "EHLO
	mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423814AbcBSJqg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 04:46:36 -0500
Received: by mail-io0-f179.google.com with SMTP id 9so103751872iom.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 01:46:35 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Feb 19, 2016 at 09:55:41AM +0100, Linus Walleij wrote:
> On Wed, Feb 17, 2016 at 9:54 PM, Michael Welling <mwelling@ieee.org> wrote:
> 
> > After applying the patch from Josh Cartwright:
> > http://www.spinics.net/lists/arm-kernel/msg484070.html
> 
> Sorry for screwing up :(
> 
> > root@dragonboard-410c:/sys/class/gpio# ~/lsgpio
> > GPIO chip: gpiochip0, "1000000.pinctrl", 122 GPIO lines
> >         line 0: unnamed unlabeled
> > (...)
> >
> > Tested-by: Michael Welling <mwelling@ieee.org>
> 
> I hope that means you also like where this is going :D
>

I am very happy to see the progress that is being made.

I am looking forward to see how the GPIOs will be modified from userspace.
The fact that single controllers can host hundreds of GPIOs is going to
make it an interesting problem.

Do you have a sketch of how the accesses with be performed?
ioctl, read, write.

Thanks for all of the work so far.
> I merged this to my main branch now.
> 
> Yours,
> Linus Walleij
