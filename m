From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 2/3] pinctrl: sh-pfc: r8a7795: add support for voltage switching
Date: Mon, 6 Jun 2016 13:11:02 +0200
Message-ID: <CAMuHMdVTimRT=HxjMBTFvhyg7QRfUPc5pV+_2TojBtKX=8Qgpw@mail.gmail.com>
References: <1465195811-3041-1-git-send-email-wsa@the-dreams.de>
 <1465195811-3041-3-git-send-email-wsa@the-dreams.de> <CAMuHMdW6ZEzpmxHMXTYb31JoGCxMskothr16p6GArNCEML8fGw@mail.gmail.com>
 <20160606110353.GA1711@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36356 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966AbcFFLLE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2016 07:11:04 -0400
In-Reply-To: <20160606110353.GA1711@katana>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Mon, Jun 6, 2016 at 1:03 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Mon, Jun 06, 2016 at 09:23:35AM +0200, Geert Uytterhoeven wrote:
>> On Mon, Jun 6, 2016 at 8:50 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> >
>> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> > ---
>> >  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 24 ++++++++++++++++++++++--
>> >  1 file changed, 22 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > index 44632b1a5c978c..8e068d8534de00 100644
>> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
>> > @@ -17,8 +17,8 @@
>> >         PORT_GP_CFG_16(0, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
>> >         PORT_GP_CFG_28(1, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
>> >         PORT_GP_CFG_15(2, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
>> > -       PORT_GP_CFG_16(3, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
>> > -       PORT_GP_CFG_18(4, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH),      \
>> > +       PORT_GP_CFG_16(3, fn, sfx, SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_IO_VOLTAGE),  \
>>
>> Shouldn't this be split in PORT_GP_CFG_12() with SH_PFC_PIN_CFG_IO_VOLTAGE,
>> and PORT_GP_CFG_4() without?
>
> Right. However, PORT_GP_CFG_4 doesn't allow to set an offset for the pin
> numbers. Options I see:

> a) keep it as is and rely on the checks in pin_to_pocctrl()
> b) use PORT_GP_CFG_12 and 4 times PORT_GP_CFG_1 which allow setting the
>    pin number
> c) introduce (yet another) macro like PORT_GP_CFG_4_OFS
>
> So far, I thought a) was good enough. Now I tend to option b) because it
> is indeed more precise. We still can do c) if demand for such a macro
> increases.
>
> What do you think?

Option b is fine for me.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
