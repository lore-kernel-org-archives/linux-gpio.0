From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] arm: dts: r7s72100: Add peripherals nodes
Date: Tue, 10 Jan 2017 22:13:32 +0100
Message-ID: <CAMuHMdWy5qqhJig+6uUTBSAsK8Vdu_exN5e_Ar3fC6JVMAsj2Q@mail.gmail.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <1483990318-26927-4-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVWVsHqdOTxeiD6zXaVJqdHPLvry9EjjPc9XvF8QsXkDw@mail.gmail.com> <2351875.0S8UmoVGa8@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36824 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752324AbdAJVNd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2017 16:13:33 -0500
In-Reply-To: <2351875.0S8UmoVGa8@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Simon Horman <horms@verge.net.au>

Hi Laurent,

On Tue, Jan 10, 2017 at 8:58 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday 10 Jan 2017 16:07:01 Geert Uytterhoeven wrote:
>> On Mon, Jan 9, 2017 at 8:31 PM, Jacopo Mondi wrote:
>> > From: Magnus Damm <damm@opensource.se>
>> >
>> > This is a squash of several commits, adding peripherals groups
>> > configuration to r7s72100 device tree, and enabling some of them on
>> > Genmai evaluation board
>> >
>> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>> Thanks for the rework!
>>
>> >  arch/arm/boot/dts/r7s72100-genmai.dts |  51 ++++++++++++
>> >  arch/arm/boot/dts/r7s72100.dtsi       | 151 +++++++++++++++++++++++++++++
>>
>> This path should be split in multiple parts:
>>   - Add the pfc node to r7s72100.dtsi,
>>   - Add the gpio nodes to r7s72100.dtsi,
>>   - 4 patches for r7s72100-genmai.dts, adding support for LEDs, SCIF,
>>     Ethernet, and SPI.
>
> I can agree about the .dtsi/.dts split, but isn't this going a bit overboard ?

Let's find out what Simon's opinion is...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
