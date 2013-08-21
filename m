From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: interrupt consistency check for OF GPIO IRQs
Date: Thu, 22 Aug 2013 01:27:17 +0200
Message-ID: <CACRpkdbVYfBS5L+0ejfbTBwPbD9HFB1kV8qnS7DdSydRccxDmg@mail.gmail.com>
References: <1377092334-770-1-git-send-email-larsi@wh2.tu-dresden.de>
	<1507189.CRWvzVJqTV@flatron>
	<521548E3.6010703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:47610 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752865Ab3HUX1R (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2013 19:27:17 -0400
Received: by mail-ob0-f175.google.com with SMTP id xn12so2201936obc.34
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2013 16:27:17 -0700 (PDT)
In-Reply-To: <521548E3.6010703@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, galak@codeaurora.org, Pawel Moll <pawel.moll@arm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>

On Thu, Aug 22, 2013 at 1:10 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> On Wednesday 21 of August 2013 15:38:54 Lars Poeschel wrote:

>>> To solve this dilemma, perform an interrupt consistency check
>>> when adding a GPIO chip: if the chip is both gpio-controller and
>>> interrupt-controller, walk all children of the device tree,
>
> It seems a little odd to solve this only for DT. What about the non-DT case?

DT is the hardware configuration system that lets you request
the same resource in two ways, i.e. it allows one and the same
node to be both gpio-controller and interrupt-controller, and
start handing out the same line as both GPIO and IRQ
independently.

I asked if ACPI had this ambiguity, and the answer appears to
be either "no" (which I suspect) or just "nobody knows" :-/

In either way, checking the consistency of ACPI IRQs vs
GPIOs will be fundamentally different, should it have the same
problem, and does it appear we can certainly refactor this to
be shared, should there be something to gain from.

Yours,
Linus Walleij
