From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: spear-spics: drop unused MODULE_ tags from
 non-modular code
Date: Tue, 23 Aug 2016 11:24:17 +0200
Message-ID: <CACRpkdbGi29PCCgG2CtA4a_0f-6V2hNADMxb5Gtr3F8hvCXYuw@mail.gmail.com>
References: <20160822164833.3633-1-paul.gortmaker@windriver.com> <20160822164833.3633-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35499 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757478AbcHWJZI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2016 05:25:08 -0400
Received: by mail-oi0-f54.google.com with SMTP id 4so188716382oih.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Aug 2016 02:24:19 -0700 (PDT)
In-Reply-To: <20160822164833.3633-4-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 22, 2016 at 6:48 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_SPEAR_SPICS
> drivers/gpio/Kconfig:   bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We delete the MODULE_LICENSE tag etc. since all that information
> is now contained at the top of the file in the comments.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
