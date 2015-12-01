From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: rcar: Improve clock error handling and reporting
Date: Tue, 1 Dec 2015 11:09:32 +0100
Message-ID: <CAMuHMdUJYF_DQ_zaS-+nEcam-tuwPCjeowvr-iQyqJdz=825Zg@mail.gmail.com>
References: <1448377528-19307-1-git-send-email-geert+renesas@glider.be>
	<CACRpkdabE9=UsGsRqzVZg3P09ntLTMz1NE3ginQ_XdFiddh4bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35904 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755759AbbLAKJd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 05:09:33 -0500
In-Reply-To: <CACRpkdabE9=UsGsRqzVZg3P09ntLTMz1NE3ginQ_XdFiddh4bw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Courbot <gnurou@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

Hi Linus,

On Tue, Dec 1, 2015 at 10:54 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 24, 2015 at 4:05 PM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
>> If the Renesas R-Car GPIO driver cannot find a functional clock, it
>> prints a warning, .e.g.
>>
>>         gpio_rcar ffc40000.gpio: unable to get clock
>>
>> and continues, as the clock is optional, depending on the SoC type.
>> This warning may confuse users.
>>
>> To fix this, add a flag to indicate that the clock is mandatory or
>> optional:
>>   - If the clock is mandatory (on R-Car Gen2), a missing clock is now
>>     treated as a fatal error,
>>   - If the clock is optional (on R-Car Gen1), the warning is no longer
>>     printed.
>>
>> The new flag is merged with the existing has_both_edge_trigger boolean
>> into a bitfield to save space.
>
> *DON'T* try to save bits in a megabyte kernel like this.
> The better readability is worth the extra bits or bytes it takes.
> Besides, did you really try to compile it before/after that change
> to verify that it actually saved that space?

Is it better readable?

Size also depends on how many more flags we'll add later.

>> Suggested-by: Magnus Damm <magnus.damm@gmail.com>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> This depends on "gpio: rcar: Remove obsolete platform data support".
>
> Where is that patch? This does not apply to my tree,
> probably because of this.

IIRC, you said "include it in your pull request" for that series.

> Please sent the patches in a series.

I can send both to you, as they're not pinctrl but gpio.

>>         unsigned has_both_edge_trigger:1;
>> +       unsigned needs_clk:1;
>
> both should be bool and assigned true/false.

OK, if you prefer it that way.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
