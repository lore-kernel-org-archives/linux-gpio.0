From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: add missing DVC_MUTE signal
Date: Thu, 30 Mar 2017 11:10:47 +0200
Message-ID: <CAMuHMdU_imTfh5Hb=BtKj6u1rJhuj4vAWarC7Xq2RZWQQkH8pg@mail.gmail.com>
References: <20170329183658.618942497@cogentembedded.com> <HK2PR0601MB132955B398D6CE3FA300C222B7340@HK2PR0601MB1329.apcprd06.prod.outlook.com>
 <CAMuHMdU++fKJjAAjjEHmj0W8WZj5L+kmBeW1tjqTA+JhchKbHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36542 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932257AbdC3JKu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Mar 2017 05:10:50 -0400
In-Reply-To: <CAMuHMdU++fKJjAAjjEHmj0W8WZj5L+kmBeW1tjqTA+JhchKbHA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Chris,

On Thu, Mar 30, 2017 at 11:00 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Mar 30, 2017 at 9:33 AM, Chris Paterson
> <Chris.Paterson2@renesas.com> wrote:
>>> From: linux-renesas-soc-owner@vger.kernel.org [mailto:linux-renesas-soc-
>>> owner@vger.kernel.org] On Behalf Of Sergei Shtylyov
>>> Sent: 29 March 2017 19:37
>>>
>>> The R8A7791 PFC driver  was apparently based on the preliminary revisions of
>>> the user's  manual, which  omitted the DVC_MUTE signal  altogether in the
>>> PFC section. The modern manual has the signal described,  so just add the
>>> necassary data to the driver...
>>>
>>> Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Should this patch also CC stable? (Patch 1/2 does)
>
> No need to spam stable with all these patches and reviews.
> If it has a Fixes-tag, the stable team will pick it up anyway. After
> it has ended
> up upstream.

And in this case, there's not really a need to backport it to stable, as
there cannot be any users due to lack of pins using these definitions.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
