From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] reason for Allwinner SoC specific pinctrl drivers?
Date: Tue, 5 Jan 2016 10:21:47 +0800
Message-ID: <CAGb2v65WttmGunT1ipekdZN_orjbWa43p9w2tcq_SCi-fzQMnQ@mail.gmail.com>
References: <568A514D.7070102@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:51802 "EHLO
	smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753791AbcAECWK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2016 21:22:10 -0500
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com [209.85.223.179])
	(Authenticated sender: b93043)
	by smtp.csie.ntu.edu.tw (Postfix) with ESMTPSA id 46B6D208AC
	for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2016 10:22:08 +0800 (CST)
Received: by mail-io0-f179.google.com with SMTP id 1so127304043ion.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2016 18:22:08 -0800 (PST)
In-Reply-To: <568A514D.7070102@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: andre.przywara@arm.com
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>

On Mon, Jan 4, 2016 at 7:02 PM, Andre Przywara <andre.przywara@arm.com> wrote:
> Hi,
>
> while looking at the Allwinner A64 SoC support, I was wondering why we
> would actually need a pinctrl driver (file) for each and every Allwinner
> SoC that we support.
> Looking at both the A20 and the A64 doc I don't see any differences in
> the port controller implementation apart from the actual
> muxval <-> subsystem assignment, which is just data, right?
> Comparing the code files in drivers/pinctrl/sunxi seems to support this,
> as those drivers only consist of the table and some boilerplate code.
>
> Now I was wondering whether we could get away with one generic Allwinner
> pinctrl driver and put the SoC specific pin assignments in DT instead.
> It looks like adding an "allwinner,muxval" property in addition to the
> existing "allwinner,function" in the SoC's .dtsi would give us all the
> information we need. This could look like:
>
>         uart0_pins_a: uart0@0 {
>                 allwinner,pins =   "PB22", "PB23";
> +               allwinner,muxval = <0x02    0x02>;
>                 allwinner,function = "uart0";
>                 allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>                 allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>         };

Using a mux value over a string does not gain us much, other than
smaller driver code, since all the strings are gone, and smaller DT,
again no strings. However, if you want some sensible debug output
from the driver, you're going to keep the strings anyway.

The mux values would need to be macros defined in some header file,
instead of raw values which are hard to understand.

That's only half of it. The driver should know what pins are available
and which mux values can be used for them. So you'd still need a table
of some sort. That means it's unlikely you can have a generic driver.
Leaking the internals into the DT is not a good way either.

The current approach of a generic driver library and SoC specific
tables maybe isn't the best approach, but it is easy enough to add new
SoC support.


Regards
ChenYu

> Would it make sense that I sit down and prototype such a driver?
>
> We should keep compatibility with older DTs by keeping the existing
> drivers in (or maybe emulating the current behaviour by providing just
> those tables as a fallback) , but newer SoCs (like the A64?) would not
> need a SoC specific driver, but just go with that generic driver and
> appropriate DT properties.
>
> I appreciate any comments on this, especially if I missed something
> which would render this approach impossible or tedious.
>
> Cheers,
> Andre.
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
