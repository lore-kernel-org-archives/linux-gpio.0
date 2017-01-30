From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 5/5] arm: dts: genmai: Add SCIF2 pin group
Date: Mon, 30 Jan 2017 19:55:53 +0100
Message-ID: <CAMuHMdWxvsKgGfuX3LXFvNoDoD7XYHARkOsXK0t5hhdP+wpkFg@mail.gmail.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-6-git-send-email-jacopo+renesas@jmondi.org>
 <4c60f795-d8af-5b3d-f632-a013a9a33be1@cogentembedded.com> <1534890.LugBLSd3dc@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35210 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754023AbdA3TEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 14:04:40 -0500
In-Reply-To: <1534890.LugBLSd3dc@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Laurent,

On Mon, Jan 30, 2017 at 7:17 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday 26 Jan 2017 12:51:03 Sergei Shtylyov wrote:
>> On 1/25/2017 9:09 PM, Jacopo Mondi wrote:
>> > +&pinctrl {
>> > +   pinctrl-names = "default";
>> > +   pinctrl-0 = <&scif2_pins>;
>> > +
>> > +   scif2_pins: serial2 {
>> > +           /* P3_0 as TxD2; P3_2 as RxD2 */
>> > +           renesas-rz,pins = <RZ_PIN(3, 0) ALTERNATE_FUNC_6>,
>>
>> The comma should be after the vendor prefix ("renesas").
>
> And the "-rz" suffix isn't needed, "renesas,pins" will do.

Then it can just become "pins"? Or not?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
