From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Add iomux-route switching support
Date: Sat, 27 May 2017 00:19:26 +0200
Message-ID: <3296473.EV6dOggqEx@phil>
References: <1495783223-28857-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1495783223-28857-1-git-send-email-david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hi David,

Am Freitag, 26. Mai 2017, 15:20:19 CEST schrieb David Wu:
> The rk3228, rk3328, rk3399 have an interesting new feature,
> some things like one specific uart can use multiple pins to
> output data, but control of that seems to be split. The actual
> pin config is identical for all pins - each needs to be configured
> to function 2.
> 
> Use one pin of a specifc group to be set to its special pinmux function,
> then configure the corresponding routing bits. If the pinmux setting is
> wrong for that pin the ip block won't work correctly anyway.


the approach looks nice now, the whole series
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>


Thanks
Heiko


> David Wu (4):
>   pinctrl: rockchip: Add iomux-route switching support
>   pinctrl: rockchip: Add iomux-route switching support for rk3228
>   pinctrl: rockchip: Add iomux-route switching support for rk3328
>   pinctrl: rockchip: Add iomux-route switching support for rk3399
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 321 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 320 insertions(+), 1 deletion(-)
> 
> 
