From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mcp23s08: add pinconf support
Date: Mon, 30 Jan 2017 16:08:01 +0100
Message-ID: <CACRpkdZyUq+v756vBhM=eu1i3ccsOrkMkEJObrt4HttmVXFkYQ@mail.gmail.com>
References: <20170127144738.21107-1-sre@kernel.org> <20170127144738.21107-3-sre@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:35080 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932348AbdA3PR6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 10:17:58 -0500
Received: by mail-it0-f42.google.com with SMTP id 203so195829017ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 07:17:58 -0800 (PST)
In-Reply-To: <20170127144738.21107-3-sre@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 27, 2017 at 3:47 PM, Sebastian Reichel <sre@kernel.org> wrote:

> mcp23xxx device have configurable 100k pullup resistors. This adds
> support for enabling them using pinctrl's pinconf interface.
>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>

That's the right approach!

> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c

Can we move the patch to drivers/pinctrl/* like all other mixed drivers
doing combined pinctrl and GPIO?

Also: no Kconfig changes? Surely you must select the right pinctrl
things, I guess you're just lucky that some other pin controller on your
system selects your infrastructure. I think that is why the build robot
is complaining.

> +static int mcp_update_cache(struct mcp23s08 *mcp)
> +{
> +       int ret, reg, i;
> +
> +       for (i = 0; i < ARRAY_SIZE(mcp->cache); i++) {
> +               ret = mcp_read(mcp, i, &reg);
> +               if (ret < 0)
> +                       return ret;
> +               mcp->cache[i] = reg;
> +       }
> +
> +       return 0;
> +}

Why do you need a cache of register values when regmap already
supports this?

Instead I suggest: exploit the .volatile_reg() callback from
struct regmap_config and use regmap to maintain the cache.

Apart from this is is nice!

With the recent changes from Mika Westerberg scheduled for v4.11
the road is open to expose pullups all the way to userspace from
GPIOs chardev if we want to (some patches would be needed).

Yours,
Linus Walleij
