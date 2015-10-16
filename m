From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/PATCH 1/2] gpio: Add PCA9621 driver
Date: Fri, 16 Oct 2015 21:45:51 +0200
Message-ID: <CACRpkdbGiE5nT=zD6qLeaOE+1oATLWg=p6d1jWDY46H_Pf3fBw@mail.gmail.com>
References: <1444329152-11946-1-git-send-email-laurent.pinchart@ideasonboard.com>
	<1444329152-11946-2-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35689 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753458AbbJPTpw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 15:45:52 -0400
Received: by obbzf10 with SMTP id zf10so98786638obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 12:45:52 -0700 (PDT)
In-Reply-To: <1444329152-11946-2-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Oct 8, 2015 at 8:32 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> The PCA9621 is an I2C 8-bit output open-drain expander.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I think I like the mean, clean stand-alone driver better, but now note
this:

> +       ret = i2c_smbus_write_byte(gpio->client, gpio->out);

This is using smbus. That means you can probably access the whole
thing using regmap with devm_regmap_init_i2c() check for example
drivers/mfd/stw481x.c for an example.

> +       mutex_init(&gpio->lock);

With regmap maybe this mutex is not needed to lock stuff?

> +       /* Read the current output state. */
> +       ret = i2c_smbus_read_byte(gpio->client);
> +       if (ret < 0)
> +               return ret;
> +
> +       gpio->out = ret;

And regmap also has this per-register caching thing, where a callback
signifies whether a register i cached or not.

Yours,
Linus Walleij
