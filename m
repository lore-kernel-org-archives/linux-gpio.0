From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: Store register/field widths in u8
 instead of unsigned long
Date: Fri, 6 Mar 2015 12:26:57 +0100
Message-ID: <CAMuHMdVhD2e2Q9bTwu_r30AUCq4=-GzH=RWp2TFL7tXXz3prJA@mail.gmail.com>
References: <1425058685-12956-1-git-send-email-geert+renesas@glider.be>
	<1425058685-12956-3-git-send-email-geert+renesas@glider.be>
	<CACRpkdbv8V2DY6DniY5fOaSQNkNZtZQ6G_hrm-vcG9cjFTSAEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:44756 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754201AbbCFL06 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 06:26:58 -0500
In-Reply-To: <CACRpkdbv8V2DY6DniY5fOaSQNkNZtZQ6G_hrm-vcG9cjFTSAEA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

Hi Linus, Laurent,

On Fri, Mar 6, 2015 at 11:48 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Feb 27, 2015 at 6:38 PM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
>> Register and field widths are in the range 1..32. Storing them in the
>> pinctrl data in (arrays of) unsigned long wastes space.
>>
>> This decreases the size of a (32-bit) shmobile_defconfig kernel
>> supporting 7 SoCs by 26460 bytes.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This 2/4 is not ACKed so pausing application after 1/4.
>
> Is 3,4/4 independent of this patch?

Unfortunately not, as there are contextual dependencies.

Laurent: Is 2/4 OK for you as-is? Your comments about the size of reg are
not related to "Store register/field widths in u8 instead of unsigned long",
and thus an area for future improvement.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
