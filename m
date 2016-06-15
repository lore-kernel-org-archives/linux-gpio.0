From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: enable driver on Intel Edison
Date: Wed, 15 Jun 2016 09:11:41 +0200
Message-ID: <CACRpkdb5-+u89gnarQN-NH_uGRoi1FYb=RmMWjCLVhMSvV4iKQ@mail.gmail.com>
References: <1465945076-25517-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36787 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbcFOHLm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2016 03:11:42 -0400
Received: by mail-oi0-f48.google.com with SMTP id p204so20503762oih.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2016 00:11:42 -0700 (PDT)
In-Reply-To: <1465945076-25517-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jun 15, 2016 at 12:57 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel Edison board has 4 GPIO expanders PCA9555a connected to I2C bus. Add an
> ID to support them.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

BTW Andy, if you have PCA95x hardware you're playing with, any chance
you could implement .get_direction() for this driver?

I'd really like for that to be supported on all major hardware.

Yours,
Linus Walleij
