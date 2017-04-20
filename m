From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add group for AVB MDIO and MII pins
Date: Thu, 20 Apr 2017 13:47:19 +0200
Message-ID: <CAMuHMdVvdDqo7yxGBc9L7iF4ZVRYNEFFmzuzU75t4+hXZpSUWA@mail.gmail.com>
References: <1492681746-20005-1-git-send-email-geert+renesas@glider.be>
 <2338736.vqmUpXt7la@avalon> <CAMuHMdWEMOXctK6F6fXeO+Y3S4_tkikJYUf=bA9u5yofD5ciQw@mail.gmail.com>
 <5295991.u29V8BK3nd@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35811 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942464AbdDTLrU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2017 07:47:20 -0400
In-Reply-To: <5295991.u29V8BK3nd@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Laurent,

On Thu, Apr 20, 2017 at 1:44 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday 20 Apr 2017 13:37:27 Geert Uytterhoeven wrote:
>> On Thu, Apr 20, 2017 at 12:18 PM, Laurent Pinchart wrote:
>> > On Thursday 20 Apr 2017 12:11:41 Geert Uytterhoeven wrote:
>> >> On Thu, Apr 20, 2017 at 12:02 PM, Laurent Pinchart wrote:
>> >>> On Thursday 20 Apr 2017 11:49:06 Geert Uytterhoeven wrote:
>> >>>> Group the AVB pins into similar groups as found in other sh-pfc
>> >>>> drivers. The pins can not be muxed between functions other than AVB,
>> >>>> but their drive strengths can be controlled.
>> >>>>
>> >>>> The group avb_mdc containing ADV_MDC and ADV_MDIO is called avb_mdio
>> >>>> on other SoCs. In pfc-r8a7796 the avb_mdc group already existed and is
>> >>>> in use in DT. Therefore add the ADV_MDIO pin to the existing group
>> >>>> instead of renaming it.
>> >>>
>> >>> This clearly shows that we need a few kernel releases to test
>> >>> PFC-related code and DT before we can commit to an ABI. How do you
>> >>> think we should handle this ?
>> >>
>> >> That's a difficult question
>> >>
>> >> For now I'd like to treat R-Car M3-W the same as H3.
>> >
>> > I still believe we should introduce some kind of unstable period for DT
>> > bindings, during which they will be merged in mainline but still subject
>> > to modification. It could just be a few kernel releases.
>>
>> Like, from v4.4 (when avb_mdc was added for H3) until v4.12 (earliest
>> we can correct this)?
>
> Sorry, I misread you, I thought that H3 named the group mdio (you might want
> to clarify this in the commit message). I was referring to when M3 PFC support

Sorry, this was a bit unclear (I reused the description from the H3 patch).
This was actually referring to R-Car Gen2. Will fix.

> was introduced, which was v4.10, so that's just two releases. We obviously
> can't rename mdc to mdio on H3 if we want to keep backward compatibility.

And because of pin-compatibility and board sharing of H3 and M3-W, I
want both to use identical group naming.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
