From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH] pinctrl-zynq.c: Fix typos in smc0_nand_grp and smc0_nor_grp
Date: Wed, 12 Aug 2015 09:27:40 -0700
Message-ID: <CAAtXAHdbHoqMQP0wHpHiUbD6d6W8WcDaB=5VR2D5Nh29Seue9A@mail.gmail.com>
References: <1439389332-9373-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:34362 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933796AbbHLQ1m convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Aug 2015 12:27:42 -0400
Received: by wicne3 with SMTP id ne3so225460780wic.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2015 09:27:40 -0700 (PDT)
In-Reply-To: <1439389332-9373-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>

Acked-by: Moritz Fischer <moritz.fischer@ettus.com>

On Wed, Aug 12, 2015 at 7:22 AM, Mike Looijmans <mike.looijmans@topic.n=
l> wrote:
> Group names should be smc0_nand_grp and smc0_nor_grp, otherwise you'l=
l
> get errors like this if you try to pinmux them via the devicetree:
> zynq-pinctrl 700.pinctrl: invalid group "smc0_nand_grp" for function =
"smc0_nand"
>
> Probably a typo while creating these tables.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>  drivers/pinctrl/pinctrl-zynq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl=
-zynq.c
> index 7ce23b6..5aafea8 100644
> --- a/drivers/pinctrl/pinctrl-zynq.c
> +++ b/drivers/pinctrl/pinctrl-zynq.c
> @@ -706,10 +706,10 @@ static const char * const sdio1_wp_groups[] =3D=
 {"gpio0_0_grp",
>                 "gpio0_39_grp", "gpio0_41_grp", "gpio0_43_grp",
>                 "gpio0_45_grp", "gpio0_47_grp", "gpio0_49_grp",
>                 "gpio0_51_grp", "gpio0_53_grp", "sdio1_emio_wp_grp"};
> -static const char * const smc0_nor_groups[] =3D {"smc0_nor"};
> +static const char * const smc0_nor_groups[] =3D {"smc0_nor_grp"};
>  static const char * const smc0_nor_cs1_groups[] =3D {"smc0_nor_cs1_g=
rp"};
>  static const char * const smc0_nor_addr25_groups[] =3D {"smc0_nor_ad=
dr25_grp"};
> -static const char * const smc0_nand_groups[] =3D {"smc0_nand"};
> +static const char * const smc0_nand_groups[] =3D {"smc0_nand_grp"};
>  static const char * const can0_groups[] =3D {"can0_0_grp", "can0_1_g=
rp",
>                 "can0_2_grp", "can0_3_grp", "can0_4_grp", "can0_5_grp=
",
>                 "can0_6_grp", "can0_7_grp", "can0_8_grp", "can0_9_grp=
",
> --
> 1.9.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
