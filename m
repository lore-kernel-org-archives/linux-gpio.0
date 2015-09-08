From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Request for submaintainer moderation: PFC pinctrl patches
Date: Tue, 08 Sep 2015 12:18:43 +0300
Message-ID: <1530496.s22K61kEaC@avalon>
References: <CACRpkdaMPST2ptDfPNH4e=hQBO1HjmsbcMXQRNRf905Rbi24Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47179 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754076AbbIHJSa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 05:18:30 -0400
In-Reply-To: <CACRpkdaMPST2ptDfPNH4e=hQBO1HjmsbcMXQRNRf905Rbi24Lw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>

Hi Linus,

On Tuesday 08 September 2015 11:09:49 Linus Walleij wrote:
> Hi Renesas PFC folks,
> 
> I am faced with a patchs storm for PFC stuf from Geert, Kununori and
> Sergei at the same time.
> 
> I need help to review, prioritize and handle this. Also I have zero Renesas
> boards and no way to test if these collide at runtime, and for SH whether
> they collide even at compiletime.
> 
> I want you to agree on one person to stack up and accumulate PFC patches
> for both fixes and devel and send me a pull request.
> 
> Last time Laurent did this, I don not know if he's up for it again or
> if you need to appoint a new submaintainer.
> 
> Anyways: suggestions?

I don't have time to handle this now, but I agree someone must shield you from 
the storm. We're working on pinctrl support for the new R-Car H3 (R8A7795) 
SoC, hence the amount of patches submitted for review. I believe they should 
have been submitted to the linux-sh mailing list only until they reach enough 
maturation for broader review.

-- 
Regards,

Laurent Pinchart

