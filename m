From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Fri, 30 Oct 2015 15:40:50 +0100
Message-ID: <CACRpkdYZD1AQ6AM1PP_P7Yn5zzytXH-VxonrT1tkQ_Jyjbtp7g@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<20151024175331.GA22220@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34900 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbbJ3Okv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 10:40:51 -0400
Received: by obctp1 with SMTP id tp1so45294934obc.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 07:40:50 -0700 (PDT)
In-Reply-To: <20151024175331.GA22220@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Sat, Oct 24, 2015 at 7:53 PM, Markus Pargmann <mpa@pengutronix.de> wrote:

>> How to identify and manipulate individual GPIO lines from this
>> ABI is a *LATER* *QUESTION*, this is the bare essentials for
>> getting there: basic operations on the gpiochip device level.
>
> Does this include identifying GPIO lines independent of gpiochips? I
> think that is a use-case as well.

My view is that we will NOT support any such GPIO lines.

The new API requires that everyone use gpiolib properly for all their
GPIOs if they want to use them from userspace.

We have cases with gpiochips with a single GPIO line, so I don't
see why we can't require that.

Yours,
Linus Walleij
