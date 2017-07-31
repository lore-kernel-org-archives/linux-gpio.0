From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] gpio: pca953x: remove incorrect le16_to_cpu calls
Date: Mon, 31 Jul 2017 17:00:49 +0300
Message-ID: <1501509649.29303.300.camel@linux.intel.com>
References: <20170703174530.81298-1-andriy.shevchenko@linux.intel.com>
         <CACRpkdbmzoWDGp6miCFG=89vtO=vJTzRF8jKN7Eh6YTKye5FOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:24310 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750923AbdGaOCX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Jul 2017 10:02:23 -0400
In-Reply-To: <CACRpkdbmzoWDGp6miCFG=89vtO=vJTzRF8jKN7Eh6YTKye5FOA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yong Li <sdliyong@gmail.com>, Phil Reid <preid@electromag.com.au>

On Mon, 2017-07-31 at 15:30 +0200, Linus Walleij wrote:
> On Mon, Jul 3, 2017 at 7:45 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > i2c_smbus commands handle the correct byte order for smbus
> > transactions
> > internally. This will currently result in incorrect operation on big
> > endian systems.
> > 
> > Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied.

Thanks!

> 
> As I don't see reported regressions it is applied for -next for
> now.

Luckily we have none, though the latest changes to drivers/nfc/fdp/i2c.c
(*) rely on it.

(*) already in v4.13-rc1 IIRC.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
