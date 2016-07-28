From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] pinctrl/amd: Remove the default de-bounce time
Date: Thu, 28 Jul 2016 06:37:47 -0700
Message-ID: <20160728133747.GA26440@kroah.com>
References: <CY1PR12MB0042A0DCB603A5B0935CA08CDC000@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:41364 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756719AbcG1Nhe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2016 09:37:34 -0400
Content-Disposition: inline
In-Reply-To: <CY1PR12MB0042A0DCB603A5B0935CA08CDC000@CY1PR12MB0042.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, SPG_Linux_Kernel <SPG_Linux_Kernel@amd.com>, "Xue, Ken" <Ken.Xue@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>

On Thu, Jul 28, 2016 at 10:04:02AM +0000, Agrawal, Nitesh-kumar wrote:
> In the function amd_gpio_irq_enable and amd_gpio_direction_input, rem=
ove the code which is setting the default de-bounce time to 2.75ms.
>=20
> The driver code shall use the same settings as specified in BIOS.
> Any default assignment impacts TouchPad behaviour when the LevelTrig =
is set to EDGE FALLING.
>=20
> Reviewed-by:=A0 Ken Xue <Ken.Xue@amd.com>
> Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
