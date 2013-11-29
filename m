From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND] gpio: rcar: Support both edge trigger with DT
Date: Fri, 29 Nov 2013 21:06:17 +0100
Message-ID: <CACRpkdbkKR=ZpYe9K21daLGZr7+mM5suAWKpoSPjUOZqQc272w@mail.gmail.com>
References: <1811469.aLo43mdTt2@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:54458 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752498Ab3K2UGS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 15:06:18 -0500
Received: by mail-oa0-f44.google.com with SMTP id m1so10842187oag.17
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 12:06:18 -0800 (PST)
In-Reply-To: <1811469.aLo43mdTt2@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>

On Fri, Nov 29, 2013 at 2:48 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> Some versions of the R-Car GPIO controller support triggering on both
> edges of the input signal. Whether this capability is supported is
> currently specified in platform data. R-Car GPIO devices instantiated
> from the device tree have the capability turned off even when the
> hardware supports it.
>
> To fix this, add DT match data support to the driver, initialize both
> edge trigger support from match data and enable both edge trigger in
> r8a7790 and r8a7791 match data.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Magnus Damm <damm@opensource.se>

Patch applied, but shouldn't there be some change to add these
new compatible strings to Documentation/devicetree/bindings/*
somewhere?

Accepted as follow-on patch or something to be squashed into
this later if I'm right.

Thanks!
Linus Walleij
