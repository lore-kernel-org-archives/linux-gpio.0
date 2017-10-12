From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH] pinctrl: Do not depend in GPIOLIB, select it
Date: Thu, 12 Oct 2017 15:20:14 -0700
Message-ID: <CAJAp7OgS8+9vCq3iwBzsp-dKfp8w-NGVPVkUVyZgspow-aTmiQ@mail.gmail.com>
References: <20171011100742.9912-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ua0-f182.google.com ([209.85.217.182]:55433 "EHLO
        mail-ua0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753127AbdJLWUP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2017 18:20:15 -0400
Received: by mail-ua0-f182.google.com with SMTP id b11so4062962uae.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2017 15:20:15 -0700 (PDT)
In-Reply-To: <20171011100742.9912-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Phil Reid <preid@electromag.com.au>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Peter Rosin <peda@axentia.se>, Andrey Smirnov <andrew.smirnov@gmail.com>

On Wed, Oct 11, 2017 at 3:07 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Instead of depends on GPIOLIB and having to run around in
> Kconfig menus looking for why your device is not available,
> simply select it from the pin control drivers that need it.
>
> The Kconfig for GPIOLIB is improved, selectable and this
> should "just work".
>

It's generally frowned upon to select a user-selectable option, but as
long as GPIOLIB doesn't "depends on" anything it should be fine.

Regards,
Bjorn
