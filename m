From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: Re: [PATCH 04/14] pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin
 assignment for SSI pins group
Date: Mon, 24 Jul 2017 01:32:57 +0900
Message-ID: <CAH1o70+zfgTxnv6nnTpT1foY_fnEUE3kBGqnj+u7S2sPKp9XgQ@mail.gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
 <1499878547-3452-5-git-send-email-ykaneko0929@gmail.com> <CAMuHMdURF=teYxa2iuPDbPQQVV=9mYsE=xBwEGGB0JAhCHXNRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdURF=teYxa2iuPDbPQQVV=9mYsE=xBwEGGB0JAhCHXNRA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert-san,

I'm very sorry that for the long delay in my reply.

2017-07-13 18:12 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Kaneko-san, Kihara-san,
>
> On Wed, Jul 12, 2017 at 6:55 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch fixes MOD_SEL1 bit20 and MOD_SEL2 bit20, bit21 pin assignment
>> for SSI pins group.
>>
>> This is a correction to the incorrect implementation of MOD_SEL register
>> pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
>> User's Manual Rev.0.51E or later.
>>
>> Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
>>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 38 ++++++++++++++++++------------------
>>  1 file changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>> index 4d070c2..18c9c61 100644
>> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>
>> @@ -1277,7 +1277,7 @@ enum {
>>         PINMUX_IPSR_MSEL(IP14_3_0,      RX5_A,                  SEL_SCIF5_0),
>>         PINMUX_IPSR_MSEL(IP14_3_0,      NFWP_N_A,               SEL_NDF_0),
>>         PINMUX_IPSR_MSEL(IP14_3_0,      AUDIO_CLKA_C,           SEL_ADG_A_2),
>> -       PINMUX_IPSR_MSEL(IP14_3_0,      SSI_SCK2_A,             SEL_SSI_0),
>> +       PINMUX_IPSR_MSEL(IP14_3_0,      SSI_SCK2_A,             SEL_SSI2_0),
>
> The SSI_SCK2_A part seems to have been removed in Rev.052E and later?
> However, I can't find that in the errata for Rev.051E.

Indeed, SSI_SCK2_A seems to have been removed from configuration of
SEL_SSI2 in Rev.0.52E, but the definition of IP14[3:0] does not
change.
Should I remove the entry of SSI_SCK2_A from pinmux_data[]?

Thanks,
Kaneko

>
>>         PINMUX_IPSR_MSEL(IP14_3_0,      STP_IVCXO27_0_C,        SEL_SSP1_0_2),
>>         PINMUX_IPSR_GPSR(IP14_3_0,      AUDIO_CLKOUT3_A),
>>         PINMUX_IPSR_MSEL(IP14_3_0,      TCLK1_B,                SEL_TIMER_TMU_1),
>
> The rest looks good to me.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
