From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: Store register/field widths in u8
 instead of unsigned long
Date: Fri, 6 Mar 2015 12:21:29 +0100
Message-ID: <CAMuHMdWyKYMav=duATEvyuuh32WMvJQj8F51BO2CrzJFmZ8Q_w@mail.gmail.com>
References: <1425058685-12956-1-git-send-email-geert+renesas@glider.be>
	<12083025.CFMfs0EISD@avalon>
	<CAMuHMdVYUod+rqrjmvtwqT4dbJiGtt+qQW0CbRd5j6uGFJ3=gQ@mail.gmail.com>
	<2354666.zjhAAbqIil@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2354666.zjhAAbqIil@avalon>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent,

On Fri, Mar 6, 2015 at 12:05 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thursday 05 March 2015 10:19:33 Geert Uytterhoeven wrote:
>> On Thu, Mar 5, 2015 at 10:03 AM, Laurent Pinchart wrote:
>> >> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
>> >> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
>> >> @@ -69,9 +69,10 @@ struct pinmux_func {
>> >>  };
>> >>
>> >>  struct pinmux_cfg_reg {
>> >> -     unsigned long reg, reg_width, field_width;
>> >> +     unsigned long reg;
>> >
>> > How about making reg a u32 ? It won't make a difference in practice on
>> > 32-bit systems, but it would be more explicit.
>
> You might have missed this comment.

I intended to, with "reg is used here to store a physical register address",
but probably didn't make it sufficiently clear. Before the advent of PAE and
phys_addr_t, unsigned long was used to store physical addresses.

We could indeed use u32, as the PFC regs are (currently) inside the 32-bit
part of the address space.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
