Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BCBC433EF
	for <linux-gpio@archiver.kernel.org>; Sat, 16 Oct 2021 18:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C75261152
	for <linux-gpio@archiver.kernel.org>; Sat, 16 Oct 2021 18:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbhJPSJs (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 16 Oct 2021 14:09:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45114 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244457AbhJPSJr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Oct 2021 14:09:47 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: alyssa)
        with ESMTPSA id D37D81F43C5C
Date:   Sat, 16 Oct 2021 14:07:31 -0400
From:   Alyssa Rosenzweig <alyssa@collabora.com>
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v3 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <YWsU48UwClC3QYzD@maud>
References: <20211016141839.45460-1-joey.gouly@arm.com>
 <20211016141839.45460-5-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016141839.45460-5-joey.gouly@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> +static int apple_gpio_gpio_get_direction(struct gpio_chip *chip,
> +					 unsigned int offset)
> +{
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> +	unsigned int reg = apple_gpio_get_reg(pctl, offset);
> +
> +	return (FIELD_GET(REG_GPIOx_MODE, reg) == REG_GPIOx_OUT) ?
> +		       GPIO_LINE_DIRECTION_OUT :
> +			     GPIO_LINE_DIRECTION_IN;
> +}

Nit: weird spacing.
