From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] pinctrl: sunxi: Fix PIN_CONFIG_BIAS_PULL_{DOWN,UP} argument
Date: Tue, 15 Nov 2016 10:19:21 +0100
Message-ID: <CACRpkdYED7dMFGpurWHXRcCozP+OrvJ+-ejZ1quJKOPpo9BHOA@mail.gmail.com>
References: <20161111095036.11803-1-wens@csie.org> <20161111095036.11803-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:35241 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966501AbcKOJTW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 04:19:22 -0500
Received: by mail-qk0-f169.google.com with SMTP id n204so127976411qke.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2016 01:19:21 -0800 (PST)
In-Reply-To: <20161111095036.11803-2-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Fri, Nov 11, 2016 at 10:50 AM, Chen-Yu Tsai <wens@csie.org> wrote:

> According to pinconf-generic.h, the argument for
> PIN_CONFIG_BIAS_PULL_{DOWN,UP} is non-zero if the bias is enabled
> with a pull up/down resistor, zero if it is directly connected
> to VDD or ground.
>
> Since Allwinner hardware uses a weak pull resistor internally,
> the argument should be 1.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied this v3 rather than the v2.

Yours,
Linus Walleij
