From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 04/14] pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin
 assignment for SSI pins group
Date: Thu, 17 Aug 2017 15:16:19 +0200
Message-ID: <CAMuHMdWbFD4aZt1sjhZkyANZcLQHb8WojHBSqcL-W40njYtTyQ@mail.gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com>
 <1499878547-3452-5-git-send-email-ykaneko0929@gmail.com> <CAMuHMdURF=teYxa2iuPDbPQQVV=9mYsE=xBwEGGB0JAhCHXNRA@mail.gmail.com>
 <CAH1o70+zfgTxnv6nnTpT1foY_fnEUE3kBGqnj+u7S2sPKp9XgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAH1o70+zfgTxnv6nnTpT1foY_fnEUE3kBGqnj+u7S2sPKp9XgQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Kaneko-san, Kihara-san,

On Sun, Jul 23, 2017 at 6:32 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> I'm very sorry that for the long delay in my reply.

No problem. Likewise, I've been on holidays.

> 2017-07-13 18:12 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
>> On Wed, Jul 12, 2017 at 6:55 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>
>>> This patch fixes MOD_SEL1 bit20 and MOD_SEL2 bit20, bit21 pin assignment
>>> for SSI pins group.
>>>
>>> This is a correction to the incorrect implementation of MOD_SEL register
>>> pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
>>> User's Manual Rev.0.51E or later.
>>>
>>> Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
>>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>>> ---
>>>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 38 ++++++++++++++++++------------------
>>>  1 file changed, 19 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>>> index 4d070c2..18c9c61 100644
>>> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>>> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
>>
>>> @@ -1277,7 +1277,7 @@ enum {
>>>         PINMUX_IPSR_MSEL(IP14_3_0,      RX5_A,                  SEL_SCIF5_0),
>>>         PINMUX_IPSR_MSEL(IP14_3_0,      NFWP_N_A,               SEL_NDF_0),
>>>         PINMUX_IPSR_MSEL(IP14_3_0,      AUDIO_CLKA_C,           SEL_ADG_A_2),
>>> -       PINMUX_IPSR_MSEL(IP14_3_0,      SSI_SCK2_A,             SEL_SSI_0),
>>> +       PINMUX_IPSR_MSEL(IP14_3_0,      SSI_SCK2_A,             SEL_SSI2_0),
>>
>> The SSI_SCK2_A part seems to have been removed in Rev.052E and later?
>> However, I can't find that in the errata for Rev.051E.

It's the same in Rev. 0.55 (page 6-39, second row at the top), where the cell
that used to contain SSI_SCK2_A is blank.

Kihara-san, is the datasheet correct w.r.t. this?

> Indeed, SSI_SCK2_A seems to have been removed from configuration of
> SEL_SSI2 in Rev.0.52E, but the definition of IP14[3:0] does not
> change.

Correct.

> Should I remove the entry of SSI_SCK2_A from pinmux_data[]?

Please wait for that until we have confirmation about the correctness of the
datasheet.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
