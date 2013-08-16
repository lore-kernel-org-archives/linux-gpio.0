From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio MIPS/OCTEON: Add a driver for OCTEON's
 on-chip GPIO pins.
Date: Fri, 16 Aug 2013 15:16:20 +0200
Message-ID: <CACRpkdaM=hqwHhNxCLCEZudRNYsyW-bZMXzZyvuW4qs2fGaREw@mail.gmail.com>
References: <1375133350-18828-1-git-send-email-ddaney.cavm@gmail.com>
	<1375133350-18828-3-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:32868 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753004Ab3HPNQV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 09:16:21 -0400
Received: by mail-oa0-f44.google.com with SMTP id l20so2228607oag.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 06:16:20 -0700 (PDT)
In-Reply-To: <1375133350-18828-3-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-mips@linux-mips.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>

On Mon, Jul 29, 2013 at 11:29 PM, David Daney <ddaney.cavm@gmail.com> wrote:

> From: David Daney <david.daney@cavium.com>
>
> The SOCs in the OCTEON family have 16 (or in some cases 20) on-chip
> GPIO pins, this driver handles them all.  Configuring the pins as
> interrupt sources is handled elsewhere (OCTEON's irq handling code).
>
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
>
> Device tree binding defintions already exist for this device in
> Documentation/devicetree/bindings/gpio/cavium-octeon-gpio.txt

I like this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess you will merge both patches through the MIPS arch
tree?

Yours,
Linus Walleij
