From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] MIPS: OCTEON: Select ARCH_REQUIRE_GPIOLIB
Date: Fri, 16 Aug 2013 15:14:33 +0200
Message-ID: <CACRpkdZwZyqkjmHmdawyD+mC3bRmgg9Ab_VZp1cPPSGLUfVGMw@mail.gmail.com>
References: <1375133350-18828-1-git-send-email-ddaney.cavm@gmail.com>
	<1375133350-18828-2-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:51248 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752489Ab3HPNOd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 09:14:33 -0400
Received: by mail-ob0-f175.google.com with SMTP id xn12so1991506obc.6
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 06:14:33 -0700 (PDT)
In-Reply-To: <1375133350-18828-2-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-mips@linux-mips.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>, Alexandre Courbot <acourbot@nvidia.com>

On Mon, Jul 29, 2013 at 11:29 PM, David Daney <ddaney.cavm@gmail.com> wrote:

> From: David Daney <david.daney@cavium.com>
>
> ... and create asm/mach-cavium-octeon/gpio.h so that things continue
> to build.
>
> This allows us to use the existing I2C connected GPIO expanders.
>
> Signed-off-by: David Daney <david.daney@cavium.com>

I like the looks of this.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
