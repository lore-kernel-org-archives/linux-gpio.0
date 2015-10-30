From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH] gpio: group port-mapped I/O drivers in a menu
Date: Fri, 30 Oct 2015 11:46:45 -0400
Message-ID: <20151030154645.GA1156@ketchup.mtl.sfl>
References: <1446197896-5383-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:39035 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932912AbbJ3QCT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 12:02:19 -0400
Content-Disposition: inline
In-Reply-To: <1446197896-5383-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>, Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>

Hi Linus,

On Oct. Friday 30 (44) 10:38 AM, Linus Walleij wrote:
> Create a Kconfig submenu for drivers using X86 port-mapped I/O
> and depend on X86 for this.
>=20
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> Cc: Andreas Bofjall <andreas@gazonk.org>
> Cc: Simon Guinot <simon.guinot@sequanux.org>
> Cc: Diego Elio Petten=F2 <flameeyes@flameeyes.eu>
> Cc: Daniel Krueger <daniel.krueger@systec-electronic.com>
> Cc: Bruno Randolf <br1@einfach.org>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig | 155 ++++++++++++++++++++++++++---------------=
----------
>  1 file changed, 78 insertions(+), 77 deletions(-)

<snip>

> +menu "Port-mapped I/O GPIO drivers"
> +	depends on X86
> +
> +config GPIO_104_IDIO_16
> +	tristate "ACCES 104-IDIO-16 GPIO support"
> +	depends on X86

Since the menu depends on X86, shouldn't we remove the "depends on X86"
of its drivers?

Thanks,
-v
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
