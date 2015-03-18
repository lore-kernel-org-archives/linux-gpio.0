From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3] pinctrl: add AMD GPIO driver support.
Date: Wed, 18 Mar 2015 01:49:41 +0100
Message-ID: <CACRpkda0Ka3MoYy4DVhmxonsQvhEfXZo2xNzx-9cJ3z2AY31ZA@mail.gmail.com>
References: <1422949788.18208.4.camel@kxue-X58A-UD3R>
	<1423111885.18208.41.camel@kxue-X58A-UD3R>
	<1425452005.24903.4.camel@kxue-X58A-UD3R>
	<CACRpkdZiSaMUQxU5HHuMn0kZhdXqAX6OYVQGmoNriP0jamuHPA@mail.gmail.com>
	<1425969811.14295.8.camel@kxue-X58A-UD3R>
	<1425970939.14295.11.camel@kxue-X58A-UD3R>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34834 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752741AbbCRAtm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 20:49:42 -0400
Received: by oiag65 with SMTP id g65so23784941oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 17:49:41 -0700 (PDT)
In-Reply-To: <1425970939.14295.11.camel@kxue-X58A-UD3R>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ken Xue <Ken.Xue@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 10, 2015 at 8:02 AM, Ken Xue <Ken.Xue@amd.com> wrote:

> pinctrl: add AMD GPIO driver support.
>
> KERNCZ GPIO is a new IP from AMD. it can be implemented in both x86 and ARM.
> Current driver patch only support GPIO in x86.
>
> Signed-off-by: Ken Xue <Ken.Xue@amd.com>

Patch applied, thanks for this nice version!

> +#include <linux/gpio/driver.h>

I moved it back to <linux/gpio.h> sorry for the fuzz. I really have to
move the GPIO ranges functions over to <gpio/driver.h>.

Yours,
Linus Walleij
