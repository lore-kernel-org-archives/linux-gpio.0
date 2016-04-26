From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/8] mfd: stmpe: Add STMPE_IDX_SYS_CTRL/2 enum
Date: Tue, 26 Apr 2016 09:19:15 +0100
Message-ID: <20160426081915.GB6881@dell>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
 <1461068317-28016-2-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:37336 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752216AbcDZITP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 04:19:15 -0400
Received: by mail-wm0-f54.google.com with SMTP id n3so23155460wmn.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 01:19:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1461068317-28016-2-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: patrice.chotard@st.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maxime.coquelin@st.com, amelie.delaunay@st.com, shawnguo@kernel.org, kernel@pengutronix.de, dinguyen@opensource.altera.com, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, swarren@wwwdotorg.org, thierry.reding@gmail.com

On Tue, 19 Apr 2016, patrice.chotard@st.com wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>=20
> As STMPE1801/1601/24xx has a SYS_CTRL register and
> STMPE1601/2403 has even a SYS_CTRL2 register, add
> STMPE_IDX_SYS_CTRL/2 and update driver code accordingly
>=20
> This update prepares the ground for not yet supported STMPE1600
> which share similar REG_SYS_CTRL register.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  drivers/mfd/stmpe.c       | 21 ++++++++++++++-------
>  drivers/mfd/stmpe.h       |  2 ++
>  include/linux/mfd/stmpe.h |  2 ++
>  3 files changed, 18 insertions(+), 7 deletions(-)

When you fix and resubmit, please add my:

  Acked-by: Lee Jones <lee.jones@linaro.org>

=2E.. for my own personal reference.

> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index fb8f9e8..c553b73 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -448,6 +448,8 @@ static const struct mfd_cell stmpe_ts_cell =3D {
> =20
>  static const u8 stmpe811_regs[] =3D {
>  	[STMPE_IDX_CHIP_ID]	=3D STMPE811_REG_CHIP_ID,
> +	[STMPE_IDX_SYS_CTRL]	=3D STMPE811_REG_SYS_CTRL,
> +	[STMPE_IDX_SYS_CTRL2]	=3D STMPE811_REG_SYS_CTRL2,
>  	[STMPE_IDX_ICR_LSB]	=3D STMPE811_REG_INT_CTRL,
>  	[STMPE_IDX_IER_LSB]	=3D STMPE811_REG_INT_EN,
>  	[STMPE_IDX_ISR_MSB]	=3D STMPE811_REG_INT_STA,
> @@ -490,7 +492,7 @@ static int stmpe811_enable(struct stmpe *stmpe, u=
nsigned int blocks,
>  	if (blocks & STMPE_BLOCK_TOUCHSCREEN)
>  		mask |=3D STMPE811_SYS_CTRL2_TSC_OFF;
> =20
> -	return __stmpe_set_bits(stmpe, STMPE811_REG_SYS_CTRL2, mask,
> +	return __stmpe_set_bits(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL2], ma=
sk,
>  				enable ? 0 : mask);
>  }
> =20
> @@ -535,6 +537,8 @@ static struct stmpe_variant_info stmpe610 =3D {
> =20
>  static const u8 stmpe1601_regs[] =3D {
>  	[STMPE_IDX_CHIP_ID]	=3D STMPE1601_REG_CHIP_ID,
> +	[STMPE_IDX_SYS_CTRL]	=3D STMPE1601_REG_SYS_CTRL,
> +	[STMPE_IDX_SYS_CTRL2]	=3D STMPE1601_REG_SYS_CTRL2,
>  	[STMPE_IDX_ICR_LSB]	=3D STMPE1601_REG_ICR_LSB,
>  	[STMPE_IDX_IER_LSB]	=3D STMPE1601_REG_IER_LSB,
>  	[STMPE_IDX_ISR_MSB]	=3D STMPE1601_REG_ISR_MSB,
> @@ -619,13 +623,13 @@ static int stmpe1601_autosleep(struct stmpe *st=
mpe,
>  		return timeout;
>  	}
> =20
> -	ret =3D __stmpe_set_bits(stmpe, STMPE1601_REG_SYS_CTRL2,
> +	ret =3D __stmpe_set_bits(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL2],
>  			STMPE1601_AUTOSLEEP_TIMEOUT_MASK,
>  			timeout);
>  	if (ret < 0)
>  		return ret;
> =20
> -	return __stmpe_set_bits(stmpe, STMPE1601_REG_SYS_CTRL2,
> +	return __stmpe_set_bits(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL2],
>  			STPME1601_AUTOSLEEP_ENABLE,
>  			STPME1601_AUTOSLEEP_ENABLE);
>  }
> @@ -650,7 +654,7 @@ static int stmpe1601_enable(struct stmpe *stmpe, =
unsigned int blocks,
>  	else
>  		mask &=3D ~STMPE1601_SYS_CTRL_ENABLE_SPWM;
> =20
> -	return __stmpe_set_bits(stmpe, STMPE1601_REG_SYS_CTRL, mask,
> +	return __stmpe_set_bits(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL], mas=
k,
>  				enable ? mask : 0);
>  }
> =20
> @@ -689,6 +693,7 @@ static struct stmpe_variant_info stmpe1601 =3D {
>   */
>  static const u8 stmpe1801_regs[] =3D {
>  	[STMPE_IDX_CHIP_ID]	=3D STMPE1801_REG_CHIP_ID,
> +	[STMPE_IDX_SYS_CTRL]	=3D STMPE1801_REG_SYS_CTRL,
>  	[STMPE_IDX_ICR_LSB]	=3D STMPE1801_REG_INT_CTRL_LOW,
>  	[STMPE_IDX_IER_LSB]	=3D STMPE1801_REG_INT_EN_MASK_LOW,
>  	[STMPE_IDX_ISR_LSB]	=3D STMPE1801_REG_INT_STA_LOW,
> @@ -735,14 +740,14 @@ static int stmpe1801_reset(struct stmpe *stmpe)
>  	unsigned long timeout;
>  	int ret =3D 0;
> =20
> -	ret =3D __stmpe_set_bits(stmpe, STMPE1801_REG_SYS_CTRL,
> +	ret =3D __stmpe_set_bits(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL],
>  		STMPE1801_MSK_SYS_CTRL_RESET, STMPE1801_MSK_SYS_CTRL_RESET);
>  	if (ret < 0)
>  		return ret;
> =20
>  	timeout =3D jiffies + msecs_to_jiffies(100);
>  	while (time_before(jiffies, timeout)) {
> -		ret =3D __stmpe_reg_read(stmpe, STMPE1801_REG_SYS_CTRL);
> +		ret =3D __stmpe_reg_read(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL]);
>  		if (ret < 0)
>  			return ret;
>  		if (!(ret & STMPE1801_MSK_SYS_CTRL_RESET))
> @@ -773,6 +778,8 @@ static struct stmpe_variant_info stmpe1801 =3D {
> =20
>  static const u8 stmpe24xx_regs[] =3D {
>  	[STMPE_IDX_CHIP_ID]	=3D STMPE24XX_REG_CHIP_ID,
> +	[STMPE_IDX_SYS_CTRL]	=3D STMPE24XX_REG_SYS_CTRL,
> +	[STMPE_IDX_SYS_CTRL2]	=3D STMPE24XX_REG_SYS_CTRL2,
>  	[STMPE_IDX_ICR_LSB]	=3D STMPE24XX_REG_ICR_LSB,
>  	[STMPE_IDX_IER_LSB]	=3D STMPE24XX_REG_IER_LSB,
>  	[STMPE_IDX_ISR_MSB]	=3D STMPE24XX_REG_ISR_MSB,
> @@ -819,7 +826,7 @@ static int stmpe24xx_enable(struct stmpe *stmpe, =
unsigned int blocks,
>  	if (blocks & STMPE_BLOCK_KEYPAD)
>  		mask |=3D STMPE24XX_SYS_CTRL_ENABLE_KPC;
> =20
> -	return __stmpe_set_bits(stmpe, STMPE24XX_REG_SYS_CTRL, mask,
> +	return __stmpe_set_bits(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL], mas=
k,
>  				enable ? mask : 0);
>  }
> =20
> diff --git a/drivers/mfd/stmpe.h b/drivers/mfd/stmpe.h
> index 84adb46..406f9f2 100644
> --- a/drivers/mfd/stmpe.h
> +++ b/drivers/mfd/stmpe.h
> @@ -138,6 +138,7 @@ int stmpe_remove(struct stmpe *stmpe);
>  #define STMPE811_NR_INTERNAL_IRQS	8
> =20
>  #define STMPE811_REG_CHIP_ID		0x00
> +#define STMPE811_REG_SYS_CTRL		0x03
>  #define STMPE811_REG_SYS_CTRL2		0x04
>  #define STMPE811_REG_SPI_CFG		0x08
>  #define STMPE811_REG_INT_CTRL		0x09
> @@ -264,6 +265,7 @@ int stmpe_remove(struct stmpe *stmpe);
>  #define STMPE24XX_NR_INTERNAL_IRQS	9
> =20
>  #define STMPE24XX_REG_SYS_CTRL		0x02
> +#define STMPE24XX_REG_SYS_CTRL2		0x03
>  #define STMPE24XX_REG_ICR_LSB		0x11
>  #define STMPE24XX_REG_IER_LSB		0x13
>  #define STMPE24XX_REG_ISR_MSB		0x14
> diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
> index cb83883..6c6690f 100644
> --- a/include/linux/mfd/stmpe.h
> +++ b/include/linux/mfd/stmpe.h
> @@ -39,6 +39,8 @@ enum stmpe_partnum {
>   */
>  enum {
>  	STMPE_IDX_CHIP_ID,
> +	STMPE_IDX_SYS_CTRL,
> +	STMPE_IDX_SYS_CTRL2,
>  	STMPE_IDX_ICR_LSB,
>  	STMPE_IDX_IER_LSB,
>  	STMPE_IDX_ISR_LSB,

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
