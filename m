From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/2] tools/gpio: switch to tools buildsystem
Date: Thu, 23 Jun 2016 09:59:34 +0200
Message-ID: <CACRpkdYhr1Q-D4w9=_irdejigE=8zkskAtQ2t8vWFQCRfSJOqw@mail.gmail.com>
References: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36759 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950AbcFWH7f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 03:59:35 -0400
Received: by mail-oi0-f49.google.com with SMTP id f189so58760042oig.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 00:59:34 -0700 (PDT)
In-Reply-To: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Sun, Jun 19, 2016 at 10:41 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Current environment is not allowed to easily build the tools.
> Move to tools buildsystem to allow user build gpio tools using only existing
> kernel sources. Besides that support O=/path/to/build/dir option.
>
> In v3:
> - fold patch 1 & 2 (Alexandre Courbot)
> - add CROSS_COMPILE prefix to ld (Alexandre Courbot)
> - move definition of bindir to last patch

Both patches applied with Alexandre's ACK/Test tags.
Excellent work, thank you for fixing up my uglyhacks.

I think my tools were inspired by tools/iio, now that needs
fixing too...

Yours,
Linus Walleij
