From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] pinctrl: rockchip: Add rk3328 pinctrl support
Date: Fri, 27 Jan 2017 17:03:03 +0100
Message-ID: <1512819.Zr7BpdjdZU@phil>
References: <1485074286-7863-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1485074286-7863-1-git-send-email-david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hi David,

Am Sonntag, 22. Januar 2017, 16:38:06 CET schrieb David Wu:
> From: "david.wu" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> This patch supports 3bit width iomux type.
> Note, the iomux of following pins are special, need to
> be handled specially.
>  - gpio2_b0 ~ gpio2_b6
>  - gpio2_b7
>  - gpio2_c7
>  - gpio3_b0
>  - gpio3_b1 ~ gpio3_b7
> And therefore add IOMUX_RECALCED_FLAG to indicate which
> iomux source of the bank need to be recalced. If the mux
> recalced callback and IOMUX_RECALCED_FLAG were set, recalc
> the related pins' iomux.
> 
> Signed-off-by: david.wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Patch description should pay a lot of attention to explaining _why_ a change 
is necessary.

In general, please split the patch in at least 3 individual patches:
- addition of 3bit mux support (that part looks good)
- that recalculation-part ... which I'm still struggling to understand
  but will hopefully have understood down below
- addition of actual rk3328-support (rk3328-specific functions and 


> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index 08765f5..cc05753 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -75,6 +75,8 @@ enum rockchip_pinctrl_type {
>  #define IOMUX_WIDTH_4BIT	BIT(1)
>  #define IOMUX_SOURCE_PMU	BIT(2)
>  #define IOMUX_UNROUTED		BIT(3)
> +#define IOMUX_WIDTH_3BIT	BIT(4)
> +#define IOMUX_RECALCED_FLAG	BIT(5)

leave out the "_FLAG" bit please, makes it shorter and its state as flag is 
clearly visible

[...]

> @@ -355,6 +359,24 @@ struct rockchip_pinctrl {
>  	unsigned int			nfunctions;
>  };
> 
> +/**
> + * struct rockchip_mux_recalced_data: represent a pin iomux data.
> + * @num: bank num.
> + * @bit: index at register or used to calc index.
> + * @min_pin: the min pin.
> + * @max_pin: the max pin.
> + * @reg: the register offset.
> + * @mask: mask bit
> + */
> +struct rockchip_mux_recalced_data {
> +	u8 num;
> +	u8 bit;
> +	int min_pin;
> +	int max_pin;
> +	int reg;
> +	int mask;

please reorganize
	num, min_pin, max_pin are the queried values
while
	reg, bit, mask are the result values

Mixing these makes it hard to understand. Same for the table below.


> +};
> +
>  static struct regmap_config rockchip_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
> @@ -514,13 +536,83 @@ static void rockchip_dt_free_map(struct pinctrl_dev
> *pctldev, * Hardware access
>   */
> 
> +static const struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] =
> { +	{
> +		.num = 2,
> +		.bit = 0x2,
> +		.min_pin = 8,
> +		.max_pin = 14,
> +		.reg = 0x24,
> +		.mask = 0x3
> +	},
> +	{
> +		.num = 2,
> +		.bit = 0,
> +		.min_pin = 15,
> +		.max_pin = 15,
> +		.reg = 0x28,
> +		.mask = 0x7
> +	},
> +	{

nit: coding style, "}, {"


> +		.num = 2,
> +		.bit = 14,
> +		.min_pin = 23,
> +		.max_pin = 23,
> +		.reg = 0x30,
> +		.mask = 0x3
> +	},
> +	{
> +		.num = 3,
> +		.bit = 0,
> +		.min_pin = 8,
> +		.max_pin = 8,
> +		.reg = 0x40,
> +		.mask = 0x7
> +	},
> +	{
> +		.num = 3,
> +		.bit = 0x2,
> +		.min_pin = 9,
> +		.max_pin = 15,
> +		.reg = 0x44,
> +		.mask = 0x3

I think I don't fully understand what this is supposed to do. In the TRM you 
send me at 0x44 all bits are marked as reserved and the other registers also 
look very strange.

I guess GPIO2CH_IOMUX shows the thing you're trying solve, with gpio2_c6 being 
at [5:3] but gpio2_c7 got moved to [15:14] out of its natural position.
Chip designers have strange ideas it seems.


Heiko
