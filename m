From: "David.Wu" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] pinctrl: rockchip: Add rk3328 pinctrl support
Date: Mon, 6 Feb 2017 16:50:33 +0800
Message-ID: <339f2b10-9810-017f-a240-a558bdc69431@rock-chips.com>
References: <1485074286-7863-1-git-send-email-david.wu@rock-chips.com>
 <1512819.Zr7BpdjdZU@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1512819.Zr7BpdjdZU@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hi Heiko,

Sorry for late reply because of the holiday.

>> @@ -355,6 +359,24 @@ struct rockchip_pinctrl {
>>  	unsigned int			nfunctions;
>>  };
>>
>> +/**
>> + * struct rockchip_mux_recalced_data: represent a pin iomux data.
>> + * @num: bank num.
>> + * @bit: index at register or used to calc index.
>> + * @min_pin: the min pin.
>> + * @max_pin: the max pin.
>> + * @reg: the register offset.
>> + * @mask: mask bit
>> + */
>> +struct rockchip_mux_recalced_data {
>> +	u8 num;
>> +	u8 bit;
>> +	int min_pin;
>> +	int max_pin;
>> +	int reg;
>> +	int mask;
>
> please reorganize
> 	num, min_pin, max_pin are the queried values
> while
> 	reg, bit, mask are the result values
>
> Mixing these makes it hard to understand. Same for the table below.
>

How about this struct?
struct rockchip_mux_recalced_data {
	struct {
		u8 num;
		int pin;
	} querie;
	struct {
		u8 reg;
		u8 bit;
		u8 mask;
	} result;
};

>
>> +};
>> +
>>  static struct regmap_config rockchip_regmap_config = {
>>  	.reg_bits = 32,
>>  	.val_bits = 32,
>> @@ -514,13 +536,83 @@ static void rockchip_dt_free_map(struct pinctrl_dev
>> *pctldev, * Hardware access
>>   */
>>
>> +static const struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] =
>> { +	{
>> +		.num = 2,
>> +		.bit = 0x2,
>> +		.min_pin = 8,
>> +		.max_pin = 14,
>> +		.reg = 0x24,
>> +		.mask = 0x3
>> +	},
>> +	{
>> +		.num = 2,
>> +		.bit = 0,
>> +		.min_pin = 15,
>> +		.max_pin = 15,
>> +		.reg = 0x28,
>> +		.mask = 0x7
>> +	},
>> +	{
>
> nit: coding style, "}, {"
>
>
>> +		.num = 2,
>> +		.bit = 14,
>> +		.min_pin = 23,
>> +		.max_pin = 23,
>> +		.reg = 0x30,
>> +		.mask = 0x3
>> +	},
>> +	{
>> +		.num = 3,
>> +		.bit = 0,
>> +		.min_pin = 8,
>> +		.max_pin = 8,
>> +		.reg = 0x40,
>> +		.mask = 0x7
>> +	},
>> +	{
>> +		.num = 3,
>> +		.bit = 0x2,
>> +		.min_pin = 9,
>> +		.max_pin = 15,
>> +		.reg = 0x44,
>> +		.mask = 0x3
>
> I think I don't fully understand what this is supposed to do. In the TRM you
> send me at 0x44 all bits are marked as reserved and the other registers also
> look very strange.

Sorry, there is a wrong description in my patch.
The reserved pins are not opened at rk3328 soc, could not be used, but 
they appear in my code, this makes you confused.

There are three pins need to be recalculated from the the latest GRF i 
sent to you just now.
  - gpio2_b4
  - gpio2_b7
  - gpio2_c7

So, the max_pin and min_pin changes to pin in the 
"rockchip_mux_recalced_data" struct, because there are no serial pins to 
be recalculated, but three single pins.

>
> I guess GPIO2CH_IOMUX shows the thing you're trying solve, with gpio2_c6 being
> at [5:3] but gpio2_c7 got moved to [15:14] out of its natural position.
> Chip designers have strange ideas it seems.

Yes, it is very strange here, not so well-regulated.

>
>
> Heiko
>
>
>
