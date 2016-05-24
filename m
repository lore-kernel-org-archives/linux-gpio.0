From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: Add Oxford Semiconductor OXNAS pinctrl
 and gpio driver
Date: Tue, 24 May 2016 11:35:20 +0200
Message-ID: <CACRpkdZPMqRNn9rmcC4HYVKrdS7cxBD7O7oE4YPrP7L-0_Wakg@mail.gmail.com>
References: <1462952062-5316-1-git-send-email-narmstrong@baylibre.com>
	<1462952062-5316-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35784 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755282AbcEXJfV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 05:35:21 -0400
Received: by mail-oi0-f45.google.com with SMTP id w184so10402713oiw.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2016 02:35:21 -0700 (PDT)
In-Reply-To: <1462952062-5316-2-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, May 11, 2016 at 9:34 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add pinctrl and gpio control support to Oxford Semiconductor OXNAS SoC Family.
> This version supports the ARM926EJ-S based OX810SE SoC with 34 IO pins.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

I tried implementing a .get_direction() callback for the Oxnas GPIO
(this is good to have, for debugfs and for the new userspace ABI).

However:

> +/* GPIO Registers */
> +#define INPUT_VALUE    0x00
> +#define IRQ_PENDING    0x0c
> +#define OUTPUT_SET     0x14
> +#define OUTPUT_CLEAR   0x18
> +#define OUTPUT_EN_SET  0x1c
> +#define OUTPUT_EN_CLEAR        0x20
> +#define RE_IRQ_ENABLE  0x28
> +#define FE_IRQ_ENABLE  0x2c

No pure OUTPUT_EN register to read the direction from?
Or is it one of the undocumented ones?

Could you take a stab at implementing .get_direction() and
send a patch?

Yours,
Linus Walleij
