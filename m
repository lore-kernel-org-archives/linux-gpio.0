From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] pinctrl: rockchip: Use common interface for recalced iomux
Date: Fri, 21 Jul 2017 11:35:23 +0200
Message-ID: <2301545.dlea0HVRYo@phil>
References: <1500618435-15092-1-git-send-email-david.wu@rock-chips.com> <1500618435-15092-2-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:45972 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753969AbdGUJfd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Jul 2017 05:35:33 -0400
In-Reply-To: <1500618435-15092-2-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Am Freitag, 21. Juli 2017, 14:27:14 CEST schrieb David Wu:
> The other Socs also need the feature of recalced iomux, so
> make it as a common interface like iomux route feature.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 89 +++++++++++++++++++++-----------------
>  1 file changed, 50 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index e831647..fd4e491 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -76,7 +76,6 @@ enum rockchip_pinctrl_type {
>  #define IOMUX_SOURCE_PMU	BIT(2)
>  #define IOMUX_UNROUTED		BIT(3)
>  #define IOMUX_WIDTH_3BIT	BIT(4)
> -#define IOMUX_RECALCED		BIT(5)

very cool to see this flag go away and simply calculating the affected
bits is obviously a way nicer solution.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks for that cleanup
Heiko

