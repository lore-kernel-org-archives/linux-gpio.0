From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add DRIF support
Date: Tue, 21 Jun 2016 09:37:25 +0200
Message-ID: <CAMuHMdXYW5ObuDPm7aCr5uTaPYBrTAREM6Z16XWF3q7YBtFgNw@mail.gmail.com>
References: <1466165981-65284-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <CAMuHMdXz5mvR=+iWBap=jV7w94phuLXJSNKtOCqjxCEFNy=QDg@mail.gmail.com> <SG2PR06MB103835BE72B262243B46864BC3570@SG2PR06MB1038.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:36418 "EHLO
	mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750696AbcFUIjs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jun 2016 04:39:48 -0400
In-Reply-To: <SG2PR06MB103835BE72B262243B46864BC3570@SG2PR06MB1038.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Ramesh,

CC linux-gpio, LinusW, Laurent

On Fri, Jun 17, 2016 at 4:16 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
>> >  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 121
>> > +++++++++++++++++++++++++++++++++++
>> >  1 file changed, 121 insertions(+)
>> >
>> > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > index 33be5d56..6f246ec 100644
>> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > @@ -1658,6 +1658,91 @@ static const unsigned int canfd1_data_mux[] = {
>> >         CANFD1_TX_MARK,         CANFD1_RX_MARK,
>> >  };
>> >
>> > +/* - DRIF
>> > +--------------------------------------------------------------- */
>> static const unsigned int drif0_data_a_pins[] = {
>> > +       /* CLK, SYNC, D0, D1 */
>> > +       RCAR_GP_PIN(6, 8), RCAR_GP_PIN(6, 9), RCAR_GP_PIN(6, 10),
>> > +       RCAR_GP_PIN(6, 7),
>> > +};
>> > +static const unsigned int drif0_data_a_mux[] = {
>> > +       RIF0_CLK_A_MARK, RIF0_SYNC_A_MARK, RIF0_D0_A_MARK,
>> > +RIF0_D1_A_MARK, };
>>
>> According to my information, each DRIF module consists of two sub-modules
>> (that's why there are 8 module clocks for 4 DRIF modules), each handling a
>> data pin, but sharing the CLK and SYNC signals.
>> Hence it's possible to receive using only one data pin. Is that correct?
>
> Yes, that is correct.
>
>> Shouldn't the pinctrl data reflect that? The second unused data pin could
>> be used for something else.
>
> Is that possible? For e.g. when MOD_SEL0(bit8 -> sel_drif2) is set to 0, all the 4 pins are owned by DRIF IP(RIF2_XXX_A set) even though one of the RIF2_D0_A or RIF2_D1_A may be unused depending on the master it interfaces with. Am I missing something?

You're right, the whole block is switched.

The unused data pin can still be configured as a GPIO, as the GPSR register
(to select between GPIO and IP function) takes precedence.

Linus/Laurent: I assume the GPIO also takes precedence in the Linux pinctrl
subsystem, or would it return an error, as the pin is claimed by the IP group?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
