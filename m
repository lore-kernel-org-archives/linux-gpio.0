From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mcp23s08: Select REGMAP/REGMAP_I2C to fix build error
Date: Sat, 4 Feb 2017 21:25:20 +0100
Message-ID: <CACRpkdZK67bPWufobVPrNMpNoVgf6nXK3vaEH5_ANQZ5ejUtog@mail.gmail.com>
References: <20170202101306.24976-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:35728 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751033AbdBDUZW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Feb 2017 15:25:22 -0500
Received: by mail-it0-f47.google.com with SMTP id 203so33046529ith.0
        for <linux-gpio@vger.kernel.org>; Sat, 04 Feb 2017 12:25:22 -0800 (PST)
In-Reply-To: <20170202101306.24976-1-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Sebastian Reichel <sre@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 2, 2017 at 11:13 AM, Axel Lin <axel.lin@ingics.com> wrote:

> This driver now using devm_regmap_init/devm_regmap_init_i2c, so it needs
> to select REGMAP/REGMAP_I2C accordingly.
>
> Fixes: ("3d84fdb3f0b5 gpio: mcp23s08: use regmap")
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Sebastian's ACK.

Yours,
Linus Walleij
