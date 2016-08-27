From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] pinctrl: rockchip: make it explicitly non-modular
Date: Sat, 27 Aug 2016 13:14:51 +0200
Message-ID: <CACRpkdbtY1vEnzNamCSdo_VLBGDAr-beavadaLWYO0LuUTwhdw@mail.gmail.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com> <20160823211944.18554-5-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34024 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750746AbcH0LOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Aug 2016 07:14:52 -0400
Received: by mail-oi0-f50.google.com with SMTP id l203so142590011oib.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Aug 2016 04:14:52 -0700 (PDT)
In-Reply-To: <20160823211944.18554-5-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>

On Tue, Aug 23, 2016 at 11:19 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/Kconfig:config PINCTRL_ROCKCHIP
> drivers/pinctrl/Kconfig:        bool
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
