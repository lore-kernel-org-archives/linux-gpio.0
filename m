From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add group for AVB MDIO and MII pins
Date: Thu, 20 Apr 2017 13:18:01 +0300
Message-ID: <2338736.vqmUpXt7la@avalon>
References: <1492681746-20005-1-git-send-email-geert+renesas@glider.be> <3839999.H9bRVaxdVd@avalon> <CAMuHMdWYWWVuFWz7kULLbZeOxVAssFQ584cO45THrLQ6FwTYSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41822 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031421AbdDTKRA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2017 06:17:00 -0400
In-Reply-To: <CAMuHMdWYWWVuFWz7kULLbZeOxVAssFQ584cO45THrLQ6FwTYSA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Geert,

On Thursday 20 Apr 2017 12:11:41 Geert Uytterhoeven wrote:
> On Thu, Apr 20, 2017 at 12:02 PM, Laurent Pinchart wrote:
> > On Thursday 20 Apr 2017 11:49:06 Geert Uytterhoeven wrote:
> >> Group the AVB pins into similar groups as found in other sh-pfc drivers.
> >> The pins can not be muxed between functions other than AVB, but their
> >> drive strengths can be controlled.
> >> 
> >> The group avb_mdc containing ADV_MDC and ADV_MDIO is called avb_mdio on
> >> other SoCs.  In pfc-r8a7796 the avb_mdc group already existed and is in
> >> use in DT. Therefore add the ADV_MDIO pin to the existing group instead
> >> of renaming it.
> > 
> > This clearly shows that we need a few kernel releases to test PFC-related
> > code and DT before we can commit to an ABI. How do you think we should
> > handle this ?
> 
> That's a difficult question ;-)
> 
> For now I'd like to treat R-Car M3-W the same as H3.

I still believe we should introduce some kind of unstable period for DT 
bindings, during which they will be merged in mainline but still subject to 
modification. It could just be a few kernel releases.

-- 
Regards,

Laurent Pinchart

