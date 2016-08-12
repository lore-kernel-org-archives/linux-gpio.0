From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/12] pinctrl: Add core pinctrl support for Aspeed SoCs
Date: Fri, 12 Aug 2016 15:18:13 +0200
Message-ID: <CACRpkdaN=wR4amskqMapTJzaTTMJZe2EQWRnyLMQkq_zuhr2eA@mail.gmail.com>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
 <1468994313-13538-3-git-send-email-andrew@aj.id.au> <CACRpkdZ0p+jNHBV1AqhVWQ2Q8RRrHVfsAz3XU3_+f6My22=Zxg@mail.gmail.com>
 <1470962022.27272.68.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:32884 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752225AbcHLNSP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Aug 2016 09:18:15 -0400
Received: by mail-oi0-f52.google.com with SMTP id c15so33882511oig.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Aug 2016 06:18:14 -0700 (PDT)
In-Reply-To: <1470962022.27272.68.camel@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Aug 12, 2016 at 2:33 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

>> > +
>> > +       while (*exprs) {
>> > +               if (strncmp((*exprs)->signal, "GPIO", 4) == 0)
>> > +                       return true;
>> This looks a bit fragile and hard to debug. Do you have some better
>> idea of how to do this but not resort to string comparison?
>
> Yes, this is a little unfortunate. GPIO is not always a pin's lowest
> priority function (e.g. the RGMII/RMII pins), so this makes the GPIO
> case like any other mux function: We need to know when to stop
> iterating the arrays when disabling mux functions of higher priority.
> The alternative is probably to introduce another field to struct
> aspeed_sig_expr and set that as necessary, but that feels redundant if
> we keep to a consistent naming for the GPIOs.

I would probably prefer that option (introduce another field)
but you should make the overall decision, it's no strong opinion
from my side.

> Would it be acceptable to document that requirement?

Sure.

Yours,
Linus Walleij
