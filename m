From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] gpio: pca953x: remove incorrect le16_to_cpu calls
Date: Mon, 31 Jul 2017 17:06:22 +0300
Message-ID: <1501509982.29303.305.camel@linux.intel.com>
References: <20170703174530.81298-1-andriy.shevchenko@linux.intel.com>
         <CACRpkdbmzoWDGp6miCFG=89vtO=vJTzRF8jKN7Eh6YTKye5FOA@mail.gmail.com>
         <1501509649.29303.300.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:26244 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751705AbdGaOHz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Jul 2017 10:07:55 -0400
In-Reply-To: <1501509649.29303.300.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yong Li <sdliyong@gmail.com>, Phil Reid <preid@electromag.com.au>

On Mon, 2017-07-31 at 17:00 +0300, Andy Shevchenko wrote:
> On Mon, 2017-07-31 at 15:30 +0200, Linus Walleij wrote:
> > On Mon, Jul 3, 2017 at 7:45 PM, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> 

> > 
> > As I don't see reported regressions it is applied for -next for
> > now.
> 
> Luckily we have none, though the latest changes to
> drivers/nfc/fdp/i2c.c
> (*) rely on it.
> 
> (*) already in v4.13-rc1 IIRC.

My gosh! It's for different patch!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
