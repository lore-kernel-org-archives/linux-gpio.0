From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add GP-1-28 port pin support
Date: Thu, 23 Nov 2017 11:43:53 +0100
Message-ID: <CAMuHMdVjMDaFE4yJ9hRiJszeHqWrJ1zOcBXJHct9x4zXh=DXLA@mail.gmail.com>
References: <1510802091-30535-1-git-send-email-ykaneko0929@gmail.com> <CAMuHMdUkC507jjdX6DaG_w3RMLepshD01eTiVZLaHAijWP=K3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:44494 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752326AbdKWKny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Nov 2017 05:43:54 -0500
In-Reply-To: <CAMuHMdUkC507jjdX6DaG_w3RMLepshD01eTiVZLaHAijWP=K3Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

Hi Kaneko-san,

On Thu, Nov 23, 2017 at 11:03 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Nov 16, 2017 at 4:14 AM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch supports GP-1-28 port pin of R8A7795 ES2.0 SoC added in
>> Rev.0.54E of the R-Car Gen3 Hardware User's Manual or later version.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Thanks for your patch!
>
>> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>
>> @@ -5246,7 +5248,7 @@ enum {
>>                 { RCAR_GP_PIN(1, 19),  0, 3 },  /* A19 */
>>         } },
>>         { PINMUX_DRIVE_REG("DRVCTRL8", 0xe6060320) {
>> -               { PIN_NUMBER('F', 1), 28, 3 },  /* CLKOUT */
>> +               { RCAR_GP_PIN(1, 28), 28, 3 },  /* CLKOUT */
>>                 { RCAR_GP_PIN(1, 20), 24, 3 },  /* CS0 */
>>                 { RCAR_GP_PIN(1, 21), 20, 3 },  /* CS1_A26 */
>>                 { RCAR_GP_PIN(1, 22), 16, 3 },  /* BS */
>
> You should make a similar change to the corresponding entry for "PUEN2",
> cfr. drivers/pinctrl/sh-pfc/pfc-r8a7796.c.
>
> With that fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Nevermind, I fixed that up myself while applying.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
