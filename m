From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] bcm2835-gpio-exp: Driver for GPIO expander via
 mailbox service
Date: Wed, 3 Jan 2018 11:08:15 +0100
Message-ID: <CACRpkdb73jGGRm5OrXLGYSOjMni-NsOwdC7TXH2k+iAEnAvL2g@mail.gmail.com>
References: <cover.1514898134.git.baruch@tkos.co.il> <bcac00c71b29c359b59053a30d817a8f17d6731d.1514898134.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:40578 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752138AbeACKIR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jan 2018 05:08:17 -0500
Received: by mail-it0-f46.google.com with SMTP id f190so1248212ita.5
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2018 02:08:17 -0800 (PST)
In-Reply-To: <bcac00c71b29c359b59053a30d817a8f17d6731d.1514898134.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>

On Tue, Jan 2, 2018 at 2:19 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> +config GPIO_BCM_EXP
> +       bool "Broadcom Exp GPIO"
> +       depends on OF_GPIO && RASPBERRYPI_FIRMWARE && (ARCH_BCM2835 || COMPILE_TEST)
> +       help
> +         Turn on GPIO support for Broadcom chips using the firmware mailbox
> +         to communicate with VideoCore on BCM283x chips.

Should this be

default RASPBERRYPI_FIRMWARE

So it is always available if the firmware interface is there?

> +#include <linux/err.h>
> +#include <linux/gpio.h>

Just use

#include <linux/driver.h>

> +#define MODULE_NAME "brcmexp-gpio"
> +#define NUM_GPIO 8
> +
> +struct brcmexp_gpio {
> +       struct gpio_chip gc;
> +       struct device *dev;
> +       struct rpi_firmware *fw;
> +};
> +
> +struct gpio_set_config {
> +       u32 gpio, direction, polarity, term_en, term_pull_up, state;
> +};
> +
> +struct gpio_get_config {
> +       u32 gpio, direction, polarity, term_en, term_pull_up;
> +};

Seems to support some pin control stuff, hm?

The pull ups seems unused though so OK.

Yours,
Linus Walleij
