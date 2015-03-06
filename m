From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: Store register/field widths in u8 instead of unsigned long
Date: Fri, 06 Mar 2015 13:31:59 +0200
Message-ID: <1757841.Fx0bRccTKy@avalon>
References: <1425058685-12956-1-git-send-email-geert+renesas@glider.be> <2354666.zjhAAbqIil@avalon> <CAMuHMdWyKYMav=duATEvyuuh32WMvJQj8F51BO2CrzJFmZ8Q_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33689 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753792AbbCFLby (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 06:31:54 -0500
In-Reply-To: <CAMuHMdWyKYMav=duATEvyuuh32WMvJQj8F51BO2CrzJFmZ8Q_w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>

Hi Geert,

On Friday 06 March 2015 12:21:29 Geert Uytterhoeven wrote:
> On Fri, Mar 6, 2015 at 12:05 PM, Laurent Pinchart wrote:
> > On Thursday 05 March 2015 10:19:33 Geert Uytterhoeven wrote:
> >> On Thu, Mar 5, 2015 at 10:03 AM, Laurent Pinchart wrote:
> >> >> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> >> >> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> >> >> @@ -69,9 +69,10 @@ struct pinmux_func {
> >> >> 
> >> >>  };
> >> >>  
> >> >>  struct pinmux_cfg_reg {
> >> >> 
> >> >> -     unsigned long reg, reg_width, field_width;
> >> >> +     unsigned long reg;
> >> > 
> >> > How about making reg a u32 ? It won't make a difference in practice on
> >> > 32-bit systems, but it would be more explicit.
> > 
> > You might have missed this comment.
> 
> I intended to, with "reg is used here to store a physical register address",
> but probably didn't make it sufficiently clear. Before the advent of PAE
> and phys_addr_t, unsigned long was used to store physical addresses.
> 
> We could indeed use u32, as the PFC regs are (currently) inside the 32-bit
> part of the address space.

Sounds good with me. If you want to make that change as a separate patch,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

for this patch. Otherwise I'll ack v2.

-- 
Regards,

Laurent Pinchart

