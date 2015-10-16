From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add driver for MEN 16Z127 GPIO controller
Date: Fri, 16 Oct 2015 21:51:43 +0200
Message-ID: <CACRpkda5FRJgQ7=DKQATs2uC3QPzs3gvYUKKz-Y3NQjEK=4fvA@mail.gmail.com>
References: <1444068553-16899-1-git-send-email-andy@wernerandy.de>
	<CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
	<20151008165540.GA2850@linux-rrhd.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34088 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753004AbbJPTvn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 15:51:43 -0400
Received: by oies66 with SMTP id s66so30443407oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 12:51:43 -0700 (PDT)
In-Reply-To: <20151008165540.GA2850@linux-rrhd.site>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andreas Werner <andy@wernerandy.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Thumshirn <morbidrsa@gmail.com>

On Thu, Oct 8, 2015 at 6:55 PM, Andreas Werner <andy@wernerandy.de> wrote:

> The register is currently impelemented as a read/write register
> which means the pin mode is configurable by software to
> Push Pull or Open Drain.

OK then you can set it in accordance to what clients request.

> There is also the possiblity (normal way) that the HW (FPGA) configures
> each pin to the correct mode.
>
> Is there actually a way to set an output mode from userland or by the gpio API?

As per <linux/gpio/machine.h> you can specify per-line if it should be
open drain using GPIO_OPEN_DRAIN, this will push through to the
gpio descriptor and those lines with this flag set will be handled specially.
We have merged device tree bindings for OD/OS but not code to
handle these, but I might have some code from Laurent Pinchart cooking
for the DT in-kernel backend too.

> I did not find anything about that.

git grep OPEN_DRAIN

Yours,
Linus Walleij
