From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: fix unsigned check if nfuncs with less than
 or equal zero
Date: Wed, 21 Mar 2018 09:49:29 +0100
Message-ID: <CACRpkdZYn8Ke2cXWt63LukTMa-zohToaK-UcrR3mvbCgL_M_yw@mail.gmail.com>
References: <20180226120418.3589-1-colin.king@canonical.com> <AM3PR04MB3063FA8C1B267634A8B1A5180C10@AM3PR04MB306.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR04MB3063FA8C1B267634A8B1A5180C10@AM3PR04MB306.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Colin King <colin.king@canonical.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 26, 2018 at 2:14 PM, A.s. Dong <aisheng.dong@nxp.com> wrote:

>> -     u32 nfuncs = 0;
>> -     u32 i = 0;
>> +     int nfuncs = 0;
>> +     int i = 0;
>>       bool flat_funcs;
>>
>
> I saw 'i', later used, is converted to u32 unconditionally. (GCC did not complain)
> e.g.
> radix_tree_insert
> imx_pinctrl_parse_functions
>
> And of_get_child_count seems can't  return a minor value.
>
> So does something like below look better?
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index c976ffe..4259209 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -612,7 +612,7 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
>                 nfuncs = 1;
>         } else {
>                 nfuncs = of_get_child_count(np);
> -               if (nfuncs <= 0) {
> +               if (nfuncs == 0) {

This makes more sense to me.

You can have zero functions but not negative number of functions.

Aisheng, can you send a patch like this? (Or is it already somewhere in
my inbox?)

Yours,
Linus Walleij
