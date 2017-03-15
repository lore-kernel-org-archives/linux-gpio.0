From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RFC PATCH 1/4] pinctrl: rockchip: remove unnecessary locking
Date: Wed, 15 Mar 2017 17:25:33 +0100
Message-ID: <1496183.x1RzxkxUrn@phil>
References: <20170313183813.3582-1-john@metanate.com>
 <20170313183813.3582-2-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170313183813.3582-2-john@metanate.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Keeping <john@metanate.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Am Montag, 13. M=E4rz 2017, 18:38:10 CET schrieb John Keeping:
> regmap_update_bits does its own locking and everything else accessed
> here is a local variable so there is no need to lock around it.
> =

> I originally wrote this on to of v4.4 which doesn't have the split
> registers for drive strength, where some additional locking might be
> necessary.  But I don't think it can be "slock" given that the following
> patches will convert that to a raw spinlock and regmap uses a normal
> spinlock internally.
> =

> Signed-off-by: John Keeping <john@metanate.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I have a hard time remembering why these locks are in there in the first pl=
ace. =

Not only has regmap its own locking, all the grf-registers handling iomux (=
and =

also the new schmitt triggers) are hiword-mask registers (meaning you enabl=
e =

bit x+16 to get write access to bit x), so there isn't locking needed to =

prevent concurrent register access in the first place.

I can only guess  this was meant as a safeguard for earlier socs (
- rk2928 - single-core Cortex-A9
- rk2918 Cortex-A8
- earlier ARM9) that hadn't these hiword-mask mechanisms yet.
I don't think we'll ever have support for those (they're old and nobody car=
es) =

but we can of course revisit this if at some point somebody is interested i=
n =

affected socs.

Of course that is only true for the grf-based parts, not for the gpio =

registers.

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> =

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index a838c8bb3129..1defe83a5c4d
> 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -649,7 +649,6 @@ static int rockchip_set_mux(struct rockchip_pin_bank
> *bank, int pin, int mux) int iomux_num =3D (pin / 8);
>  	struct regmap *regmap;
>  	int reg, ret, mask, mux_type;
> -	unsigned long flags;
>  	u8 bit;
>  	u32 data, rmask;
> =

> @@ -698,15 +697,11 @@ static int rockchip_set_mux(struct rockchip_pin_bank
> *bank, int pin, int mux) if (ctrl->iomux_recalc && (mux_type &
> IOMUX_RECALCED))
>  		ctrl->iomux_recalc(bank->bank_num, pin, &reg, &bit, &mask);
> =

> -	spin_lock_irqsave(&bank->slock, flags);
> -
>  	data =3D (mask << (bit + 16));
>  	rmask =3D data | (data >> 16);
>  	data |=3D (mux & mask) << bit;
>  	ret =3D regmap_update_bits(regmap, reg, rmask, data);
> =

> -	spin_unlock_irqrestore(&bank->slock, flags);
> -
>  	return ret;
>  }
> =

> @@ -1132,7 +1127,6 @@ static int rockchip_set_drive_perpin(struct
> rockchip_pin_bank *bank, struct rockchip_pinctrl *info =3D bank->drvdata;
>  	struct rockchip_pin_ctrl *ctrl =3D info->ctrl;
>  	struct regmap *regmap;
> -	unsigned long flags;
>  	int reg, ret, i;
>  	u32 data, rmask, rmask_bits, temp;
>  	u8 bit;
> @@ -1160,8 +1154,6 @@ static int rockchip_set_drive_perpin(struct
> rockchip_pin_bank *bank, return ret;
>  	}
> =

> -	spin_lock_irqsave(&bank->slock, flags);
> -
>  	switch (drv_type) {
>  	case DRV_TYPE_IO_1V8_3V0_AUTO:
>  	case DRV_TYPE_IO_3V3_ONLY:
> @@ -1182,17 +1174,14 @@ static int rockchip_set_drive_perpin(struct
> rockchip_pin_bank *bank, rmask =3D BIT(15) | BIT(31);
>  			data |=3D BIT(31);
>  			ret =3D regmap_update_bits(regmap, reg, rmask, data);
> -			if (ret) {
> -				spin_unlock_irqrestore(&bank->slock, flags);
> +			if (ret)
>  				return ret;
> -			}
> =

>  			rmask =3D 0x3 | (0x3 << 16);
>  			temp |=3D (0x3 << 16);
>  			reg +=3D 0x4;
>  			ret =3D regmap_update_bits(regmap, reg, rmask, temp);
> =

> -			spin_unlock_irqrestore(&bank->slock, flags);
>  			return ret;
>  		case 18 ... 21:
>  			/* setting fully enclosed in the second register */
> @@ -1200,7 +1189,6 @@ static int rockchip_set_drive_perpin(struct
> rockchip_pin_bank *bank, bit -=3D 16;
>  			break;
>  		default:
> -			spin_unlock_irqrestore(&bank->slock, flags);
>  			dev_err(info->dev, "unsupported bit: %d for pinctrl drive type: %d
\n",
>  				bit, drv_type);
>  			return -EINVAL;
> @@ -1212,7 +1200,6 @@ static int rockchip_set_drive_perpin(struct
> rockchip_pin_bank *bank, rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>  		break;
>  	default:
> -		spin_unlock_irqrestore(&bank->slock, flags);
>  		dev_err(info->dev, "unsupported pinctrl drive type: %d\n",
>  			drv_type);
>  		return -EINVAL;
> @@ -1224,7 +1211,6 @@ static int rockchip_set_drive_perpin(struct
> rockchip_pin_bank *bank, data |=3D (ret << bit);
> =

>  	ret =3D regmap_update_bits(regmap, reg, rmask, data);
> -	spin_unlock_irqrestore(&bank->slock, flags);
> =

>  	return ret;
>  }
> @@ -1336,16 +1322,12 @@ static int rockchip_set_pull(struct
> rockchip_pin_bank *bank, return ret;
>  		}
> =

> -		spin_lock_irqsave(&bank->slock, flags);
> -
>  		/* enable the write to the equivalent lower bits */
>  		data =3D ((1 << RK3188_PULL_BITS_PER_PIN) - 1) << (bit + 16);
>  		rmask =3D data | (data >> 16);
>  		data |=3D (ret << bit);
> =

>  		ret =3D regmap_update_bits(regmap, reg, rmask, data);
> -
> -		spin_unlock_irqrestore(&bank->slock, flags);
>  		break;
>  	default:
>  		dev_err(info->dev, "unsupported pinctrl type\n");
