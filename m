Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B827EC61DA4
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Feb 2023 12:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjBVMhq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 22 Feb 2023 07:37:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbjBVMhp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2023 07:37:45 -0500
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C7C39CE9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2023 04:37:40 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 505041fe-b2ab-11ed-a2f4-005056bdd08f;
        Wed, 22 Feb 2023 14:20:37 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Wed, 22 Feb 2023 14:20:37 +0200
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 3/4] gpio: loongson1: Add DT support
Message-ID: <Y/YIlb8axBVVW3VV@surfacebook>
References: <20230222111213.2241633-1-keguang.zhang@gmail.com>
 <20230222111213.2241633-4-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222111213.2241633-4-keguang.zhang@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Wed, Feb 22, 2023 at 07:12:12PM +0800, Keguang Zhang kirjoitti:
> This patch adds DT support for Loongson-1 GPIO driver,
> including the following changes.
> - Add the of_match_table
> - Parse the ngpios property
> - Parse the alias id

Split!

...

> +	if (of_property_read_u32(dn, "ngpios", &ngpios)) {
> +		dev_err(dev, "Missing ngpios OF property\n");
> +		return -ENODEV;
> +	}

Why?! GPIO library has this already.

...

> +	id = of_alias_get_id(dn, "gpio");
> +	if (id < 0) {
> +		dev_err(dev, "Couldn't get OF id\n");
> +		return id;
> +	}

What is this for?

...

> +	ls1x_gc->gc.base = pdev->id * BITS_PER_LONG;
> -	ls1x_gc->gc.base = pdev->id * 32;

No way. This is change makes me thing that initially it's simply wrong. Please,
just use -1 for the base.

...

> +static const struct of_device_id ls1x_gpio_dt_ids[] = {
> +	{ .compatible = "loongson,ls1x-gpio", },

Inner comma is not needed.

> +	{ /* sentinel */ }
> +};

You missed MODULE_DEVICE_TABLE().

-- 
With Best Regards,
Andy Shevchenko


