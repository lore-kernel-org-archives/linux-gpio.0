From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] gpio: pca953x: remove incorrect le16_to_cpu calls
Date: Mon, 31 Jul 2017 15:30:53 +0200
Message-ID: <CACRpkdbmzoWDGp6miCFG=89vtO=vJTzRF8jKN7Eh6YTKye5FOA@mail.gmail.com>
References: <20170703174530.81298-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:37767 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751792AbdGaNaz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 09:30:55 -0400
Received: by mail-it0-f46.google.com with SMTP id v127so126229818itd.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 06:30:55 -0700 (PDT)
In-Reply-To: <20170703174530.81298-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yong Li <sdliyong@gmail.com>, Phil Reid <preid@electromag.com.au>

On Mon, Jul 3, 2017 at 7:45 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> i2c_smbus commands handle the correct byte order for smbus transactions
> internally. This will currently result in incorrect operation on big
> endian systems.
>
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

As I don't see reported regressions it is applied for -next for
now.

Yours,
Linus Walleij
