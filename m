From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Tue, 16 Feb 2016 12:28:59 -0600
Message-ID: <20160216182859.GA15568@deathstar>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:36886 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755924AbcBPS3O (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 13:29:14 -0500
Received: by mail-ig0-f177.google.com with SMTP id 5so84838934igt.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 10:29:14 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>

On Mon, Feb 15, 2016 at 02:20:35PM +0100, Linus Walleij wrote:
> This adds a GPIO line ABI for getting name, label and a few select
> flags from the kernel.
> 
> This hides the kernel internals and only tells userspace what it
> may need to know: the different in-kernel consumers are masked
> behind the flag "kernel" and that is all userspace needs to know.
> 
> However electric characteristics like active low, open drain etc
> are reflected to userspace, as this is important information.
> 
> We provide information on all lines on all chips, later on we will
> likely add a flag for the chardev consumer so we can filter and
> display only the lines userspace actually uses in e.g. lsgpio,
> but then we first need an ABI for userspace to grab and use
> (get/set/select direction) a GPIO line.
> 
> Sample output from "lsgpio" on ux500:
> 
> GPIO chip: gpiochip7, "8011e000.gpio", 32 GPIO lines
>         line 0: unnamed unlabeled
>         line 1: unnamed unlabeled
> (...)
>         line 25: unnamed "SFH7741 Proximity Sensor" [kernel output open-drain]
>         line 26: unnamed unlabeled
> (...)
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I attempted to test the gpio char implementation on the Dragonboard 410c and it
fails to boot.

I just pulled the linux-gpio/chardev-more branch and built from there. The board
boots from the mainline 4.5-rc2.

If there were any boot messages I would give them to you but it fails early.
Tried to get more from earlycon but still nothing.

Do you have a 64 bit arm target to test this on to see if it fails for you as
well?

