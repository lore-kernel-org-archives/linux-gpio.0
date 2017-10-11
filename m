From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/7] pinctrl: change Kconfig PINCTRL variable to a menuconfig
Date: Wed, 11 Oct 2017 09:58:51 +0200
Message-ID: <CACRpkdaHWkr8766VMkTTfPPFYyCSdO7FWSb0m_WJb4YsJ1ycUw@mail.gmail.com>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au> <1507266491-73971-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:46309 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756600AbdJKH6w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 03:58:52 -0400
Received: by mail-io0-f181.google.com with SMTP id 101so1199134ioj.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 00:58:52 -0700 (PDT)
In-Reply-To: <1507266491-73971-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lars Poeschel <poeschel@lemonage.de>, Sebastian Reichel <sre@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Fri, Oct 6, 2017 at 7:08 AM, Phil Reid <preid@electromag.com.au> wrote:

> This allows PINCTRL to be selected manually to allow enabling of the
> mcp23s08 i2c/spi gpio driver. Which is not platform specific.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied with Sebastian's review tag.

Yours,
Linus Walleij
