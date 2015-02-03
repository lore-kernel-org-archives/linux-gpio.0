From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: pxa: add PXA1928 gpio type support
Date: Tue, 3 Feb 2015 13:41:57 +0100
Message-ID: <CACRpkdbTSh2ZOEpVkCk_QtH44C-hq=8qw-EanHUyD_6fSU_sog@mail.gmail.com>
References: <1422333966-18338-1-git-send-email-robh@kernel.org>
	<1422333966-18338-4-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:40641 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752667AbbBCMl5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Feb 2015 07:41:57 -0500
Received: by mail-oi0-f49.google.com with SMTP id a3so48741298oib.8
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2015 04:41:57 -0800 (PST)
In-Reply-To: <1422333966-18338-4-git-send-email-robh@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jing Xiang <jxiang@marvell.com>, Xiangzhan Meng <mengxzh@marvell.com>

On Tue, Jan 27, 2015 at 5:46 AM, Rob Herring <robh@kernel.org> wrote:

> Add support for PXA1928 GPIOs. The PXA1928 adds a 6th bank from previous
> generations.
>
> Signed-off-by: Jing Xiang <jxiang@marvell.com>
> Signed-off-by: Xiangzhan Meng <mengxzh@marvell.com>
> [robh: ported to 3.19 from vendor kernel]
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

Patch applied...

> -#define BANK_OFF(n)    (((n) < 3) ? (n) << 2 : 0x100 + (((n) - 3) << 2))
> +#define BANK_OFF(n)    (((n) < 3) ? (n) << 2 : ((n) > 5 ? 0x200 : 0x100)       \
> +                       + (((n) % 3) << 2))

While this is a bit convoluted.

Someone care to send a patch converting it to something like a
parseable static inline?

Yours,
Linus Walleij
