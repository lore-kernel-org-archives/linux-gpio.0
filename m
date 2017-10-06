From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/3] pinctrl: sunxi: Disable strict mode for old pinctrl drivers
Date: Fri, 6 Oct 2017 16:34:07 +0800
Message-ID: <CAGb2v656TCA3yqGP=Jb36weFUvQryC=AMi5TxP_tMbz8w-ajdg@mail.gmail.com>
References: <cover.7a61d0bb31530def29efd8b4286d8c0afdaab347.1507236823.git-series.maxime.ripard@free-electrons.com>
 <b09cdfbf4c7546f299031c2923b9f8fcef881e3d.1507236823.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:33662 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750868AbdJFIed (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2017 04:34:33 -0400
In-Reply-To: <b09cdfbf4c7546f299031c2923b9f8fcef881e3d.1507236823.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Oct 6, 2017 at 4:54 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Old pinctrl drivers will need to disable strict mode for various reasons,
> among which:
>   - Some DT will still have a pinctrl group for each GPIO used, which will
>     be rejected by pin_request. While we could remove those nodes, we still
>     have to deal with old DTs.
>   - Some GPIOs on these boards need to have their pin configuration changed
>     (for bias or current), and there's no clear migration path
>
> Let's disable the strict mode on those SoCs so that there's no breakage.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c | 1 +
>  drivers/pinctrl/sunxi/pinctrl-sun5i.c     | 1 +
>  drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c | 1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-a23.c | 1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c | 1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c  | 3 ++-
>  drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c | 1 +

You should also set it for the R_PIO drivers.
IIRC you removed some entries for them in your
other patchset.

Otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>
