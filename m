From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] pinctrl: sh-pfc: r8a7779/r8a7790/r8a7794: Add SCIF_CLK support
Date: Sun, 13 Dec 2015 20:45:13 +0200
Message-ID: <6563506.quzPSTWjGH@avalon>
References: <1449841738-17490-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39151 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752247AbbLNBg5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2015 20:36:57 -0500
In-Reply-To: <1449841738-17490-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Friday 11 December 2015 14:48:55 Geert Uytterhoeven wrote:
> 	Hi Linus, Laurent,
> 
> This patch series add pins, groups, and a function for SCIF_CLK on R-Car
> SoCs that don't have that support yet (H1, H2, and E2). SCIF_CLK is the
> external clock source for the Baud Rate Generator for External Clock
> (BRG) on (H)SCIF.
> 
> Geert Uytterhoeven (3):
>   pinctrl: sh-pfc: r8a7779: Add SCIF_CLK support
>   pinctrl: sh-pfc: r8a7790: Add SCIF_CLK support
>   pinctrl: sh-pfc: r8a7794: Add SCIF_CLK support

I haven't checked the pin assignments so I'll trust you on that. The function 
and group names seem good to me, so, for the whole series,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  drivers/pinctrl/sh-pfc/pfc-r8a7779.c | 41 +++++++++++++++++++++++++++++++++
>  drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 23 ++++++++++++++++++++
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 23 ++++++++++++++++++++
>  3 files changed, 87 insertions(+)

-- 
Regards,

Laurent Pinchart

