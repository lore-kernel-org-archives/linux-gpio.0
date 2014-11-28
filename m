From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: mcp23s08: Add option to configure IRQ as active high
Date: Fri, 28 Nov 2014 16:39:31 +0100
Message-ID: <CACRpkdasOLsPm2jGCLjLa=-mWSuu2GLQLaxbtr8TL6EeQhjPfg@mail.gmail.com>
References: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com>
	<1416213491-9775-3-git-send-email-alexander.stein@systec-electronic.com>
	<CACRpkdZCA7Zxs0HDpFZSmFmg5hYYAHmeNySFpM-Xq3G322mmbw@mail.gmail.com>
	<3020714.NCVpEFcdBT@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:46970 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751772AbaK1Pjc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 10:39:32 -0500
Received: by mail-ie0-f173.google.com with SMTP id y20so6157436ier.4
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2014 07:39:31 -0800 (PST)
In-Reply-To: <3020714.NCVpEFcdBT@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Nov 27, 2014 at 3:36 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> On Thursday 27 November 2014 14:58:39, Linus Walleij wrote:

>> Sorry too confused by this, can you explain?
>
> Sure. Until now ODR is cleared as reset default while INTPOL explicitly gets cleared.
> So the INT output pin on the MCP23S17 is an active-low output pin which will trigger
> an active-low interrupt.

OK... I thought it was some kind of input line to the device. Now I get it, it
is what is generated *out* of this device. Please state this in the bindings.

> While this is useually great, as most interrupt pins are active low, our board design
> requires an active-high output.

OK I get it :)

> You might wonder why I then also changed IRQF_TRIGGER_LOW to
> IRQF_TRIGGER_HIGH for my board the interrupt line is actually active low.
> This is due the fact that GIC only supports active high-interrupts (any other flag
> results in request fail) but the microcontroller has a feature to inverse these interrupt triggers.

Very convoluted, but common in electronics, OK, no problem.

Yours,
Linus Walleij
