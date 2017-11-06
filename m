From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] pinctrl: Fix armada-37xx pmic pin group numbering
Date: Mon, 06 Nov 2017 17:09:07 +0100
Message-ID: <87shdr75jw.fsf@free-electrons.com>
References: <CABQZ+_QYDE9k31ywvHqSEsNPjsnGQHMd0oCyErKFAT1PpETkEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:48185 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752211AbdKFQJT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2017 11:09:19 -0500
In-Reply-To: <CABQZ+_QYDE9k31ywvHqSEsNPjsnGQHMd0oCyErKFAT1PpETkEg@mail.gmail.com>
        (Henrik Juul Pedersen's message of "Mon, 6 Nov 2017 17:02:58 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Henrik Juul Pedersen <hjp@liab.dk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Emil Vesterdahl <emil@liab.dk>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Hi Henrik,
 
 On lun., nov. 06 2017, Henrik Juul Pedersen <hjp@liab.dk> wrote:

> Fix pin numbering in Marvell ARMADA 37xx pincontroller.
>
> The pmic0 and pmic1 pin groups start on pins 6 and 7 respectively.
>
> Signed-off-by: Henrik Juul Pedersen <hjp@liab.dk>

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

when applying the patch, we should also add:

Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support
for Armada 37xx")
Cc: <stable@vger.kernel.org>

Thanks,

Gregory

> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 71b94474..e223fac2 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -157,8 +157,8 @@ static struct armada_37xx_pin_group
> armada_37xx_nb_groups[] = {
>   PIN_GRP_GPIO("pwm1", 12, 1, BIT(4), "pwm"),
>   PIN_GRP_GPIO("pwm2", 13, 1, BIT(5), "pwm"),
>   PIN_GRP_GPIO("pwm3", 14, 1, BIT(6), "pwm"),
> - PIN_GRP_GPIO("pmic1", 17, 1, BIT(7), "pmic"),
> - PIN_GRP_GPIO("pmic0", 16, 1, BIT(8), "pmic"),
> + PIN_GRP_GPIO("pmic1", 7, 1, BIT(7), "pmic"),
> + PIN_GRP_GPIO("pmic0", 6, 1, BIT(8), "pmic"),
>   PIN_GRP_GPIO("i2c2", 2, 2, BIT(9), "i2c"),
>   PIN_GRP_GPIO("i2c1", 0, 2, BIT(10), "i2c"),
>   PIN_GRP_GPIO("spi_cs1", 17, 1, BIT(12), "spi"),
> -- 
> 2.14.1
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
