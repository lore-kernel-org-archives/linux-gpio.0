From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 05/10] mfd: stmpe: use generic bit mask name
Date: Thu, 4 Aug 2016 16:05:34 +0100
Message-ID: <20160804150534.GC5154@x1>
References: <1461845589-4826-1-git-send-email-patrice.chotard@st.com>
 <1461845589-4826-6-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38141 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756606AbcHDPFn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2016 11:05:43 -0400
Received: by mail-wm0-f53.google.com with SMTP id o80so382221275wme.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Aug 2016 08:05:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1461845589-4826-6-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: patrice.chotard@st.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maxime.coquelin@st.com, amelie.delaunay@st.com, shawnguo@kernel.org, kernel@pengutronix.de, dinguyen@opensource.altera.com, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, thierry.reding@gmail.com, marcel.ziswiler@toradex.com, stefan@agner.ch, dev@lynxeye.de

On Thu, 28 Apr 2016, patrice.chotard@st.com wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
> 
> In order to prepare the ground to STMPE1600,
> as STMPE1600's SYS_CTRL register has the same layout as
> STMPE801 variant, unify STMPExxx_REG_SYS_CTRL_RESET/INT_EN/INT_HI
> bit masks to more generic STMPE_SYS_CTRL_RESET/INT_EN/INT_HI
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  drivers/mfd/stmpe.c | 4 ++--
>  drivers/mfd/stmpe.h | 6 ++----
>  2 files changed, 4 insertions(+), 6 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index af682d0..2556463 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -1089,7 +1089,7 @@ static int stmpe_chip_init(struct stmpe *stmpe)
>  
>  	if (stmpe->irq >= 0) {
>  		if (id == STMPE801_ID)
> -			icr = STMPE801_REG_SYS_CTRL_INT_EN;
> +			icr = STMPE_SYS_CTRL_INT_EN;
>  		else
>  			icr = STMPE_ICR_LSB_GIM;
>  
> @@ -1103,7 +1103,7 @@ static int stmpe_chip_init(struct stmpe *stmpe)
>  		if (irq_trigger == IRQF_TRIGGER_RISING ||
>  				irq_trigger == IRQF_TRIGGER_HIGH) {
>  			if (id == STMPE801_ID)
> -				icr |= STMPE801_REG_SYS_CTRL_INT_HI;
> +				icr |= STMPE_SYS_CTRL_INT_HI;
>  			else
>  				icr |= STMPE_ICR_LSB_HIGH;
>  		}
> diff --git a/drivers/mfd/stmpe.h b/drivers/mfd/stmpe.h
> index 4ae343d..4ba1123 100644
> --- a/drivers/mfd/stmpe.h
> +++ b/drivers/mfd/stmpe.h
> @@ -105,6 +105,8 @@ int stmpe_remove(struct stmpe *stmpe);
>  #define STMPE_ICR_LSB_GIM	(1 << 0)
>  
>  #define STMPE_SYS_CTRL_RESET	(1 << 7)
> +#define STMPE_SYS_CTRL_INT_EN	(1 << 2)
> +#define STMPE_SYS_CTRL_INT_HI	(1 << 0)
>  
>  /*
>   * STMPE801
> @@ -121,10 +123,6 @@ int stmpe_remove(struct stmpe *stmpe);
>  #define STMPE801_REG_GPIO_SET_PIN	0x11
>  #define STMPE801_REG_GPIO_DIR		0x12
>  
> -#define STMPE801_REG_SYS_CTRL_RESET	(1 << 7)
> -#define STMPE801_REG_SYS_CTRL_INT_EN	(1 << 2)
> -#define STMPE801_REG_SYS_CTRL_INT_HI	(1 << 0)
> -
>  /*
>   * STMPE811
>   */

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
