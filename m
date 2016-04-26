From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/8] mfd: stmpe: Add reset support for all STMPE variant
Date: Tue, 26 Apr 2016 09:18:48 +0100
Message-ID: <20160426081848.GA6881@dell>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
 <1461068317-28016-3-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:38052 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752526AbcDZISt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2016 04:18:49 -0400
Received: by mail-wm0-f42.google.com with SMTP id u206so22905748wme.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2016 01:18:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1461068317-28016-3-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: patrice.chotard@st.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maxime.coquelin@st.com, amelie.delaunay@st.com, shawnguo@kernel.org, kernel@pengutronix.de, dinguyen@opensource.altera.com, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, swarren@wwwdotorg.org, thierry.reding@gmail.com

On Tue, 19 Apr 2016, patrice.chotard@st.com wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>=20
> Reset was only implemented for STMPE1801 variant despite
> all variant have a SOFT_RESET bit.
>=20
> For STMPE2401/2403/801/1601/1801 SOFT_RESET bit is bit 7
> of SYS_CTRL register.
> For STMPE610/811 (which have the same variant id) SOFT_RESET
> bit is bit 1 of SYS_CTRL register.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  drivers/mfd/stmpe.c | 23 +++++++++++++++--------
>  drivers/mfd/stmpe.h |  7 +++++--
>  2 files changed, 20 insertions(+), 10 deletions(-)

When you fix and resubmit, please add my:

  Acked-by: Lee Jones <lee.jones@linaro.org>

=2E.. for my own personal reference.

> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index c553b73..af682d0 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -735,13 +735,22 @@ static int stmpe1801_enable(struct stmpe *stmpe=
, unsigned int blocks,
>  				enable ? mask : 0);
>  }
> =20
> -static int stmpe1801_reset(struct stmpe *stmpe)
> +static int stmpe_reset(struct stmpe *stmpe)
>  {
> +	u16 id_val =3D stmpe->variant->id_val;
>  	unsigned long timeout;
>  	int ret =3D 0;
> +	u8 reset_bit;
> +
> +	if (id_val =3D=3D STMPE811_ID)
> +		/* STMPE801 and STMPE610 use bit 1 of SYS_CTRL register */
> +		reset_bit =3D STMPE811_SYS_CTRL_RESET;
> +	else
> +		/* all other STMPE variant use bit 7 of SYS_CTRL register */
> +		reset_bit =3D STMPE_SYS_CTRL_RESET;
> =20
>  	ret =3D __stmpe_set_bits(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL],
> -		STMPE1801_MSK_SYS_CTRL_RESET, STMPE1801_MSK_SYS_CTRL_RESET);
> +			       reset_bit, reset_bit);
>  	if (ret < 0)
>  		return ret;
> =20
> @@ -750,7 +759,7 @@ static int stmpe1801_reset(struct stmpe *stmpe)
>  		ret =3D __stmpe_reg_read(stmpe, stmpe->regs[STMPE_IDX_SYS_CTRL]);
>  		if (ret < 0)
>  			return ret;
> -		if (!(ret & STMPE1801_MSK_SYS_CTRL_RESET))
> +		if (!(ret & reset_bit))
>  			return 0;
>  		usleep_range(100, 200);
>  	}
> @@ -1074,11 +1083,9 @@ static int stmpe_chip_init(struct stmpe *stmpe=
)
>  	if (ret)
>  		return ret;
> =20
> -	if (id =3D=3D STMPE1801_ID)	{
> -		ret =3D  stmpe1801_reset(stmpe);
> -		if (ret < 0)
> -			return ret;
> -	}
> +	ret =3D  stmpe_reset(stmpe);
> +	if (ret < 0)
> +		return ret;
> =20
>  	if (stmpe->irq >=3D 0) {
>  		if (id =3D=3D STMPE801_ID)
> diff --git a/drivers/mfd/stmpe.h b/drivers/mfd/stmpe.h
> index 406f9f2..4ae343d 100644
> --- a/drivers/mfd/stmpe.h
> +++ b/drivers/mfd/stmpe.h
> @@ -104,6 +104,8 @@ int stmpe_remove(struct stmpe *stmpe);
>  #define STMPE_ICR_LSB_EDGE	(1 << 1)
>  #define STMPE_ICR_LSB_GIM	(1 << 0)
> =20
> +#define STMPE_SYS_CTRL_RESET	(1 << 7)
> +
>  /*
>   * STMPE801
>   */
> @@ -126,6 +128,7 @@ int stmpe_remove(struct stmpe *stmpe);
>  /*
>   * STMPE811
>   */
> +#define STMPE811_ID			0x0811
> =20
>  #define STMPE811_IRQ_TOUCH_DET		0
>  #define STMPE811_IRQ_FIFO_TH		1
> @@ -155,6 +158,8 @@ int stmpe_remove(struct stmpe *stmpe);
>  #define STMPE811_REG_GPIO_FE		0x16
>  #define STMPE811_REG_GPIO_AF		0x17
> =20
> +#define STMPE811_SYS_CTRL_RESET		(1 << 1)
> +
>  #define STMPE811_SYS_CTRL2_ADC_OFF	(1 << 0)
>  #define STMPE811_SYS_CTRL2_TSC_OFF	(1 << 1)
>  #define STMPE811_SYS_CTRL2_GPIO_OFF	(1 << 2)
> @@ -244,8 +249,6 @@ int stmpe_remove(struct stmpe *stmpe);
>  #define STMPE1801_REG_GPIO_PULL_UP_MID		0x23
>  #define STMPE1801_REG_GPIO_PULL_UP_HIGH		0x24
> =20
> -#define STMPE1801_MSK_SYS_CTRL_RESET		(1 << 7)
> -
>  #define STMPE1801_MSK_INT_EN_KPC		(1 << 1)
>  #define STMPE1801_MSK_INT_EN_GPIO		(1 << 3)
> =20

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
