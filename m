From: "David.Wu" <wdc@rock-chips.com>
Subject: Re: [PATCH v2] pinctrl: rockchip: add support for the rk3399
Date: Fri, 29 Jan 2016 19:35:23 +0800
Message-ID: <56AB4E7B.2060807@rock-chips.com>
References: <1451997055-47655-1-git-send-email-wdc@rock-chips.com>
 <1452152498-21780-1-git-send-email-wdc@rock-chips.com>
 <7536813.E6m4KCLL9V@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:33612 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754977AbcA2LfX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jan 2016 06:35:23 -0500
In-Reply-To: <7536813.E6m4KCLL9V@diego>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>

Hi Heiko,

=E5=9C=A8 2016/1/29 0:56, Heiko St=C3=BCbner =E5=86=99=E9=81=93:
> Hi David,
>
> Am Donnerstag, 7. Januar 2016, 15:41:38 schrieb David Wu:
>> From: David Wu <david.wu@rock-chips.com>
>>
>> The pinctrl of rk3399 is much different from other's,
>> especially the 3bits of drive strength.
>>
>> Signed-off-by: David Wu <david.wu@rock-chips.com>
>> ---
>> change from v1:
>> - need spin_unlock_irqrestore for set drive default case
>>
>>   .../bindings/pinctrl/rockchip,pinctrl.txt          |   1 +
>>   drivers/pinctrl/pinctrl-rockchip.c                 | 339
>> ++++++++++++++++++++- 2 files changed, 326 insertions(+), 14 deletio=
ns(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinc=
trl.txt
>> b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt ind=
ex
>> 391ef4b..3bb9456 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
>> @@ -22,6 +22,7 @@ Required properties for iomux controller:
>>     - compatible: one of "rockchip,rk2928-pinctrl",
>> "rockchip,rk3066a-pinctrl" "rockchip,rk3066b-pinctrl",
>> "rockchip,rk3188-pinctrl"
>>   		       "rockchip,rk3288-pinctrl", "rockchip,rk3368-pinctrl"
>> +		       "rockchip,rk3399-pinctrl"
>>     - rockchip,grf: phandle referencing a syscon providing the
>>   	 "general register files"
>>
>> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
>> b/drivers/pinctrl/pinctrl-rockchip.c index a065112..9d61c6e 100644
>> --- a/drivers/pinctrl/pinctrl-rockchip.c
>> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> [...]
>
>> @@ -685,19 +821,60 @@ static int rockchip_get_drive_perpin(struct
>> rockchip_pin_bank *bank, struct rockchip_pin_ctrl *ctrl =3D info->ct=
rl;
>>   	struct regmap *regmap;
>>   	int reg, ret;
>> -	u32 data;
>> +	u32 data, temp, rmask_bits;
>>   	u8 bit;
>> +	int drv_type =3D bank->drv[pin_num / 8].drv_type;
>>
>>   	ctrl->drv_calc_reg(bank, pin_num, &regmap, &reg, &bit);
>>
>> +	switch (drv_type) {
>> +	case DRV_TYPE_IO_1V8_3V0_AUTO:
>> +	case DRV_TYPE_IO_3V3_ONLY:
>> +		if (RK3399_DRV_3BITS_PER_PIN + bit >=3D 16) {
> According to the doc excerpts, wouldn't the big special handling only=
 be
> necessary for for gpio3b5 alone (+ other banks) ... i.e. the one sett=
ing being
> split over both registers?

yes, only the pin5 setting of 3bits width bank is split over two regist=
ers.

> If so I think doing something like the following might be easier to
> understand? Same of course for the set-counterpart. [Beware if I miss=
ed up the
> indices somewhere :-)

yeap.
Seemed it is clearer to view by using following code.
I will have a try, thanks.

>
> rmask_bits =3D RK3399_DRV_3BITS_PER_PIN;
> switch(bit) {
> case 0 ... 12:
> 	/* regular case, nothing to do */
> 	break;
> case 15:
> 	/* drive-strength offset is special, as it is spread over 2 register=
s */
> 	ret =3D regmap_read(regmap, reg, &data);
> 	if (ret)
> 		return ret;
>
> 	ret =3D regmap_read(regmap, reg + 0x4, &temp);
> 	if (ret)
> 		return ret;
>
> 	/*
> 	 * the bit data[15] contains bit 0 of the value
> 	 * while temp[1:0] containts bits 2 and 1
> 	 */
> 	data >>=3D 15;
> 	temp &=3D 0x3;
> 	temp <<=3D 1;
> 	data |=3D temp;
>
> 	return rockchip_perpin_drv_list[drv_type][data];
> case 18 ... 21:
> 	/* setting fully enclosed in the second register */
> 	rmask_bits =3D RK3399_DRV_3BITS_PER_PIN;
> 	reg +=3D 4;
> 	bit -=3D 18;
> }
>
>> +			/* need to read regs twice */
>> +			ret =3D regmap_read(regmap, reg, &temp);
>> +			if (ret)
>> +				return ret;
>> +
>> +			temp >>=3D bit;
>> +			rmask_bits =3D 16 - bit;
>> +			temp &=3D (1 << rmask_bits) - 1;
>> +
>> +			reg =3D reg + 0x4;
>> +			ret =3D regmap_read(regmap, reg, &data);
>> +			if (ret)
>> +				return ret;
>> +
>> +			rmask_bits =3D RK3399_DRV_3BITS_PER_PIN
>> +				+ bit - 16;
>> +			data &=3D (1 << rmask_bits) - 1;
>> +			data <<=3D 16 - bit;
>> +			data |=3D temp;
>> +
>> +			return rockchip_perpin_drv_list[drv_type][data];
>> +		}
>> +
>> +		rmask_bits =3D RK3399_DRV_3BITS_PER_PIN;
>> +		break;
>> +	case DRV_TYPE_IO_DEFAULT:
>> +	case DRV_TYPE_IO_1V8_OR_3V0:
>> +	case DRV_TYPE_IO_1V8_ONLY:
>> +		rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>> +		break;
>> +	default:
>> +		dev_err(info->dev, "unsupported pinctrl drive type: %d\n",
>> +			drv_type);
>> +		return -EINVAL;
>> +	}
>> +
>>   	ret =3D regmap_read(regmap, reg, &data);
>>   	if (ret)
>>   		return ret;
>>
>>   	data >>=3D bit;
>> -	data &=3D (1 << RK3288_DRV_BITS_PER_PIN) - 1;
>> +	data &=3D (1 << rmask_bits) - 1;
>>
>> -	return rockchip_perpin_drv_list[data];
>> +	return rockchip_perpin_drv_list[drv_type][data];
>>   }
>>
>>   static int rockchip_set_drive_perpin(struct rockchip_pin_bank *ban=
k,
> [...]
>
>> @@ -729,8 +913,45 @@ static int rockchip_set_drive_perpin(struct
>> rockchip_pin_bank *bank,
>>
>>   	spin_lock_irqsave(&bank->slock, flags);
>>
>> +	switch (drv_type) {
>> +	case DRV_TYPE_IO_1V8_3V0_AUTO:
>> +	case DRV_TYPE_IO_3V3_ONLY:
>> +		if (RK3399_DRV_3BITS_PER_PIN + bit >=3D 16) {
>> +			/* need to write regs twice */
>> +			rmask_bits =3D 16 - bit;
>> +			/* enable the write to the equivalent lower bits */
>> +			data =3D ((1 << rmask_bits) - 1) << (bit + 16);
>> +			rmask =3D data | (data >> 16);
>> +			ret &=3D (1 << rmask_bits) - 1;
>> +			data |=3D (ret << bit);
>> +
>> +			ret =3D regmap_update_bits(regmap, reg, rmask, data);
>> +			if (ret)
>> +				return ret;
>> +
>> +			ret =3D i >> rmask_bits;
>> +			rmask_bits =3D RK3399_DRV_3BITS_PER_PIN + bit - 16;
>> +			reg =3D reg + 0x4;
>> +			bit =3D 0;
> Apart from a change similar to the above, should the setting maybe al=
so
> directly return and not depend on the final write?

okay, i will do the simialr change to the above.

>> +		} else {
>> +			rmask_bits =3D RK3399_DRV_3BITS_PER_PIN;
>> +		}
>> +		break;
>> +	case DRV_TYPE_IO_DEFAULT:
>> +	case DRV_TYPE_IO_1V8_OR_3V0:
>> +	case DRV_TYPE_IO_1V8_ONLY:
>> +		rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>> +		break;
>> +	default:
>> +		spin_unlock_irqrestore(&bank->slock, flags);
>> +		dev_err(info->dev, "unsupported pinctrl drive type: %d\n",
>> +			drv_type);
>> +		return -EINVAL;
>> +
>> +	}
>> +
>>   	/* enable the write to the equivalent lower bits */
>> -	data =3D ((1 << RK3288_DRV_BITS_PER_PIN) - 1) << (bit + 16);
>> +	data =3D ((1 << rmask_bits) - 1) << (bit + 16);
>>   	rmask =3D data | (data >> 16);
>>   	data |=3D (ret << bit);
>>
> [...]
>
>> @@ -2208,6 +2461,62 @@ static struct rockchip_pin_ctrl rk3368_pin_ct=
rl =3D {
>>   		.drv_calc_reg		=3D rk3368_calc_drv_reg_and_bit,
>>   };
>>
>> +static struct rockchip_pin_bank rk3399_pin_banks[] =3D {
>> +	PIN_BANK_IOMUX_DRV_FLAGS_OFFSET(0, 32, "gpio0", IOMUX_SOURCE_PMU,
>> +					IOMUX_SOURCE_PMU,
>> +					IOMUX_SOURCE_PMU,
>> +					IOMUX_SOURCE_PMU,
>> +					DRV_TYPE_IO_1V8_ONLY,
>> +					DRV_TYPE_IO_1V8_ONLY,
>> +					0,
>> +					0,
> DRV_TYPE_IO_DEFAULT instead of 0 please.
>
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
