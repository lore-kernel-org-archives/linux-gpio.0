From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Tue, 15 Mar 2016 10:08:05 +0100
Message-ID: <CAMuHMdUc+uMgEWxCm9EYCxXR8QL9_2M-Pa6R-w6QzGPx1wgn9w@mail.gmail.com>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
	<CACRpkdZko+MAKn-JGCNPhnSVJOHJQ1GG_0HNN33Z6zpbu9ZddQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:34407 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934348AbcCOJIM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2016 05:08:12 -0400
In-Reply-To: <CACRpkdZko+MAKn-JGCNPhnSVJOHJQ1GG_0HNN33Z6zpbu9ZddQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On Tue, Mar 15, 2016 at 9:29 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Mar 7, 2016 at 7:40 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> If pinctrl_provide_dummies() is used unconditionally, then the dummy
>> state will be used even on DT platforms when the "init" state was
>> intentionally left out. Instead of "default", the dummy "init" state
>> will then be used during probe. Thus, when probing an I2C controller on
>> cold boot, communication triggered by bus notifiers broke because the
>> pins were not initialized.
>>
>> Do it like OMAP2: use the dummy state only for non-DT platforms.
>>
>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Patch applied for fixes with all the ACKs etc.
>
> This unfortiunately coincide with the merge window so was slow
> to pick it up, but it will be in the first round of fixes to Torvalds,
> possibly at -rc1 possibly earlier.

Thanks, I understand.

>> -       pinctrl_provide_dummies();
>> +       /* Enable dummy states for those platforms without pinctrl support */
>> +       if (!of_have_populated_dt())
>> +               pinctrl_provide_dummies();
>
> So remind we: what Renesas platforms are still not using DT?
> arch/sh?

Yep, the mighty SuperH. Old H8 and new ARM are DT-only.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
