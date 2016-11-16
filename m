From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: fix theoretical uninitialized variable access
Date: Wed, 16 Nov 2016 20:54:10 +0100
Message-ID: <CACRpkdYS_C7FVT7LqBsC1izjJJn_GB1Dc6FEe-XBObfGXuVi9w@mail.gmail.com>
References: <20161116141841.2030776-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:35204 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752699AbcKPTyM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2016 14:54:12 -0500
Received: by mail-qk0-f171.google.com with SMTP id n204so190237806qke.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2016 11:54:11 -0800 (PST)
In-Reply-To: <20161116141841.2030776-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 16, 2016 at 3:18 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> gcc warns about a  way that it could use an uninitialized variable:
>
> drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pinctrl_init':
> drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: error: 'best_div' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>
> This cannot really happen except if 'freq' is UINT_MAX and 'clock' is
> zero, and both of these are forbidden. To shut up the warning anyway,
> this changes the logic to initialize the return code to the first
> divider value before looking at the others.
>
> Fixes: 7c926492d38a ("pinctrl: sunxi: Add support for interrupt debouncing")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
