From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
Date: Fri, 16 Aug 2013 14:36:44 +0200
Message-ID: <CACRpkdZLOwsfRibDMgYq9pX=A2TTJkavE0_Da=BWormy=HsOCg@mail.gmail.com>
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:60365 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756110Ab3HPMgo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 08:36:44 -0400
Received: by mail-ob0-f181.google.com with SMTP id dn14so1945604obc.26
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 05:36:44 -0700 (PDT)
In-Reply-To: <1375183115-30237-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>

On Tue, Jul 30, 2013 at 1:18 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> +++ b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
> @@ -0,0 +1,25 @@
> +Generic memory-mapped GPIO controller
> +
> +Required properties:
> +- compatible: Should be "basic-mmio-gpio" or "basic-mmio-gpio-be".
> +- reg: Physical base GPIO controller registers location and length.
> +- reg-names: Should be the names of reg resources. Each register uses
> +  its own reg name, so there should be as many reg names as referenced
> +  registers:
> +  "dat"                : Input/output register (Required),
> +  "set"                : Register for set output bits (Optional),
> +  "clr"                : Register for clear output bits (Optional),
> +  "dirout"     : Register for setup direction as output (Optional),
> +  "dirin"      : Register for setup direction as input (Optional).
> +- gpio-controller: Marks the device node as a gpio controller.
> +- #gpio-cells: Should be two.

This appears to make a *lot* of implicit assumptions about these
registers. You absolutely *have* to define every assumption in clear
text for this.

Example of implicit assumptions:

- Registers in "basic-mmio-gpio" are these assumed to be
  little endian? Or target-CPU-endian?

- Does "-be" mean that the CPU or the bus is big endian?
  (I assume the bus...)

- Is is assumed that 0 in a dat bit is low line and 1is a high line?

- Is it assumed that setting a bit to 1 in set drives the line high and
  setting it to 1 in clr clears the line?

- Same question for dirout/dirin?

- What happens if you set the same bit in both dirin and dirout?

- Is it assumed that the first GPIO line is bit 0, second GPIO line
  is bit 1 (etc) up to bit ....N?

- How many bits are there in a register after all? 8? 16? 32? 64?
  Or the bus size of the architecture maybe?

This really need some very details definition before it can be
considered for merging.

Yours,
Linus Walleij
