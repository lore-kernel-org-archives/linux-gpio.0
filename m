From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Fri, 19 Feb 2016 04:26:14 -0600
Message-ID: <20160219102614.GA31335@deathstar>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
 <20160217205445.GA2394@deathstar>
 <CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
 <20160219094620.GA28750@deathstar>
 <CACRpkdairn2nnpWz48gakwdwcbPUiv3mVOzcdhdW9Yy8W=XZog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:38523 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181AbcBSK03 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 05:26:29 -0500
Received: by mail-ig0-f174.google.com with SMTP id y8so32837790igp.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 02:26:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdairn2nnpWz48gakwdwcbPUiv3mVOzcdhdW9Yy8W=XZog@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Feb 19, 2016 at 10:47:45AM +0100, Linus Walleij wrote:
> On Fri, Feb 19, 2016 at 10:46 AM, Michael Welling <mwelling@ieee.org> wrote:
> 
> > I am looking forward to see how the GPIOs will be modified from userspace.
> > The fact that single controllers can host hundreds of GPIOs is going to
> > make it an interesting problem.
> >
> > Do you have a sketch of how the accesses with be performed?
> > ioctl, read, write.
> 
> No. Suggestions welcome. Looking at drivers/iio for inspiration.
>

Well one thing I never liked about the iio userspace is the mixed API.
You have to use sysfs to setup buffered reads and character device for
the reads.

I suppose individual GPIOs could be configured by simply calling
specific ioctls passing the (offset, value) as the argument.

GPIO_EXPORT_LINE_IOCTL - Allocate the GPIO to userspace.
GPIO_SET_DIRECTION_IOCTL - Set GPIO direction.
GPIO_SET_VALUE_IOCTL - Set GPIO value.
GPIO_GET_VALUE_IOCTL - Get GPIO value.
GPIO_SET_ACTIVE_IOCTL - Set GPIO active high/low.
GPIO_SET_OPEN_DRAIN_IOCTL - Set GPIO open drain.
GPIO_SET_OPEN_SOURCE_IOCTL - Set GPIO open source.

Then all exported GPIOs could be accessible using read and write callbacks.

Handling interrupts may prove a little trickier.
The poll could be used on the character device but then there would have to
be a way to resolve which GPIO triggered the interrupt.

What do you think?

> Yours,
> Linus Walleij
