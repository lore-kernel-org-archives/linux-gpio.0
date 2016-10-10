From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] pinctrl: intel: Only restore pins that are used by the
 driver
Date: Mon, 10 Oct 2016 14:37:19 +0000
Message-ID: <0e3bf0b8c82d4c3ca6d753abfd1063bf@ausx13mpc124.AMER.DELL.COM>
References: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
 <20161010133931.88055-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from esa8.dell-outbound.iphmx.com ([68.232.149.218]:40359 "EHLO
        esa8.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752119AbcJJOqx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Oct 2016 10:46:53 -0400
In-Reply-To: <20161010133931.88055-1-mika.westerberg@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, linus.walleij@linaro.org
Cc: heikki.krogerus@linux.intel.com, acelan.kao@canonical.com, linux.cj@gmail.com, Jared.Dominguez@dell.com, linux-gpio@vger.kernel.org

> Dell XPS 13 (and maybe some others) uses a GPIO (CPU_GP_1) during
> suspend
> to explicitly disable USB touchscreen interrupt. This is done to prevent
> situation where the lid is closed the touchscreen is left functional.
>=20
> The pinctrl driver (wrongly) assumes it owns all pins which are owned by
> host and not locked down. It is perfectly fine for BIOS to use those pins
> as it is also considered as host in this context.
>=20
> What happens is that when the lid of Dell XPS 13 is closed, the BIOS
> configures CPU_GP_1 low disabling the touchscreen interrupt. During
> resume
> we restore all host owned pins to the known state which includes CPU_GP_1
> and this overwrites what the BIOS has programmed there causing the
> touchscreen to fail as no interrupts are reaching the CPU anymore.
>=20
> Fix this by restoring only those pins we know are explicitly requested by
> the kernel one way or other.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D176361
> Reported-by: AceLan Kao <acelan.kao@canonical.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> AceLan,
>=20
> Can you try this one as well? It should do prevent the driver from messin=
g
> the pins used by the BIOS.
>=20
>  drivers/pinctrl/intel/pinctrl-intel.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/inte=
l/pinctrl-
> intel.c
> index 257cab129692..2b5b20bf7d99 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -19,6 +19,7 @@
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>=20
> +#include "../core.h"
>  #include "pinctrl-intel.h"
>=20
>  /* Offset from regs */
> @@ -1079,6 +1080,26 @@ int intel_pinctrl_remove(struct platform_device
> *pdev)
>  EXPORT_SYMBOL_GPL(intel_pinctrl_remove);
>=20
>  #ifdef CONFIG_PM_SLEEP
> +static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl, unsig=
ned
> pin)
> +{
> +	const struct pin_desc *pd =3D pin_desc_get(pctrl->pctldev, pin);
> +
> +	if (!pd || !intel_pad_usable(pctrl, pin))
> +		return false;
> +
> +	/*
> +	 * Only restore the pin if it is actually in use by the kernel (or
> +	 * by userspace). It is possible that some pins are used by the
> +	 * BIOS during resume and those are not always locked down so
> leave
> +	 * them alone.
> +	 */
> +	if (pd->mux_owner || pd->gpio_owner ||
> +	    gpiochip_line_is_irq(&pctrl->chip, pin))
> +		return true;
> +
> +	return false;
> +}
> +
>  int intel_pinctrl_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
> @@ -1092,7 +1113,7 @@ int intel_pinctrl_suspend(struct device *dev)
>  		const struct pinctrl_pin_desc *desc =3D &pctrl->soc->pins[i];
>  		u32 val;
>=20
> -		if (!intel_pad_usable(pctrl, desc->number))
> +		if (!intel_pinctrl_should_save(pctrl, desc->number))
>  			continue;
>=20
>  		val =3D readl(intel_get_padcfg(pctrl, desc->number,
> PADCFG0));
> @@ -1153,7 +1174,7 @@ int intel_pinctrl_resume(struct device *dev)
>  		void __iomem *padcfg;
>  		u32 val;
>=20
> -		if (!intel_pad_usable(pctrl, desc->number))
> +		if (!intel_pinctrl_should_save(pctrl, desc->number))
>  			continue;
>=20
>  		padcfg =3D intel_get_padcfg(pctrl, desc->number, PADCFG0);
> --
> 2.9.3

Mika,

After positive comments in this working properly and is accepted, would you=
=20
consider submitting back to @stable as well?  It affects all kernel version=
s=20
that carry intel pinctrl (IIRC back to 4.1?)

Thanks,

