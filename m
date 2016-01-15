From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/2] pinctrl: sh-pfc: r8a7795: Errata for Rev 0.50 datasheet
Date: Sat, 16 Jan 2016 01:15:05 +0200
Message-ID: <4820959.GCDVHibvGF@avalon>
References: <1452856024-10793-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51676 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753046AbcAOXOt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2016 18:14:49 -0500
In-Reply-To: <1452856024-10793-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Geert,

On Friday 15 January 2016 12:07:02 Geert Uytterhoeven wrote:
> 	Hi Linus, Laurent,
> 
> This patch series synchronize the R-Car M3 (r8a7795) pin control driver
> code with the latest Manual Errata for Rev 0.50 of the R-Car Gen3
> datasheet.  None of this has user-visible impact.
> 
> Laurent: As the first patch depends on (big) "[PATCH v3 2/2]
> pinctrl: sh-pfc: Rename PINMUX_IPSR_DATA() to PINMUX_IPSR_GPSR()", from
> series "[PATCH v3 0/2] pinctrl: sh-pfc: Improve pinmux macros
> documentation", and you had comments on earlier versions of that series,
> it would be good to receive an ack for that series first
> (https://www.spinics.net/lists/linux-gpio/msg09949.html).

I'll handle it with the highest vacation-compatible priority :-) I'll have my 
computer with me this week :-/

> Geert Uytterhoeven (2):
>   pinctrl: sh-pfc: r8a7795: Rename SSI_{WS,SCK}0129 to SSI_{WS,SCK}01239
>   pinctrl: sh-pfc: r8a7795: Remove bits SEL_VSP_1 and SEL_VSP_0
> 
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

-- 
Regards,

Laurent Pinchart

