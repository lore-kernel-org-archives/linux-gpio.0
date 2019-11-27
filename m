Return-Path: <SRS0=puWS=ZT=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FAEC43215
	for <linux-gpio@archiver.kernel.org>; Wed, 27 Nov 2019 13:35:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4675420722
	for <linux-gpio@archiver.kernel.org>; Wed, 27 Nov 2019 13:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbgu7pRI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfK0Nfq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 27 Nov 2019 08:35:46 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44260 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfK0Nfq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 08:35:46 -0500
Received: by mail-vs1-f66.google.com with SMTP id p6so9992737vsj.11
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 05:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dx6Wkv3ySGhXS7qkfXJJNC6KphczTVFp4Ev8Iq4fldI=;
        b=nbgu7pRIs9YzZOrtRCF+j2cEMFGx1sNFj31QpHqVahAmOam94iAL18YA9Hq58tzKek
         0mxzxrwGSu0aFlRhUFmhqiO3jbF624J7a6WJF7VNhKwUsJ6QyL5kpQFp+pZ/8+NYQHVw
         KazwKCDdWqXG0tQEgIHXM3MmaP0hb3SYgoa2cT+eojLzYQSkhsvZJCVGYsj0XLRGaJYL
         gHSUGVwnTKJI+oAHmMAM23csKKMTfylhYiyHEbSueon9SVvPBvi9kwkN8qaRzkynqp6E
         kA/cDOdIo0iqh8Ioh6eihHtQjaGCB72jlNP7TdMoW9qbTRlXBeWgX+mtUxnHBYRXrBjD
         ieFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dx6Wkv3ySGhXS7qkfXJJNC6KphczTVFp4Ev8Iq4fldI=;
        b=IoQqOO5Alb3hSe++3Ez0X2YMIHFTNvgFelQWPqeVPWDV52ncPcYshGd2RkmY/XZd9E
         ZFKVo6GCZna+Eq9iVeZ34vS1Ig9p8HugRlNk38GnY70lthww1atm32tdBiMRbHa2ZXYz
         hw+sFJay8WXI2nhlw2vAxhEFFrCPzRzq6wFNcvYXEodJ+YrZPlOGseEHHqLwCz/3YNwm
         xtGB9V+SOHhqfRT7YsKzSoisQsVWN+x6IX7zhsW3lR2Au1cQPsLDDol7/RhDlem6oocw
         5VfPgWgUQqLhPaC/YZ7MDTc4stsN2A/tnRpgxtE31Pm13ubVd3sJjrJGrUddJSNy1+/m
         3fvg==
X-Gm-Message-State: APjAAAX7QveP4pqYslSFrLKzoxiA4Lh54YXLxLot3+BifbBLkvMXUYqC
        oc+WnDX+wW+jdmU+WdGnAoQCiFg0J9ssD6L/xlFTwQ==
X-Google-Smtp-Source: APXvYqxTK7Y0dYdPsk1QLrm3GQ61nChJ51nQBQEnr2r1WJ4jId+4aZ7y6DwhtjdZzHGHtVxFBrSd3MlBXY9hpL+raRQ=
X-Received: by 2002:a67:88c8:: with SMTP id k191mr3302354vsd.86.1574861745194;
 Wed, 27 Nov 2019 05:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20191127115619.20278-1-m.felsch@pengutronix.de> <20191127115619.20278-3-m.felsch@pengutronix.de>
In-Reply-To: <20191127115619.20278-3-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Nov 2019 14:35:33 +0100
Message-ID: <CACRpkdYLeSjsXaG6Bg4Y2-8PW41ALn4PN7QUvp3tA7XReWrKGg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mfd: da9062: add support for the DA9062 GPIOs in
 the core
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 12:56 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Currently the da9062 GPIO's aren't available. The patch adds the support
> to make these available by adding a gpio device with the corresponding
> irq resources. Furthermore the patch fixes a minor style issue for the
> onkey device.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

This is a regmap irqchip so I guess not much to say about it.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

HOWEVER: this looks very much hierarchical does it not?

I can clearly see that regmap's irqchip does not support
hierarchical interrupt domains, so we should just make a
mental note somewhere that "oh yeah and then one day
we should make regmap irqchips play well with hierarchical
interrupts".

Yours,
Linus Walleij
