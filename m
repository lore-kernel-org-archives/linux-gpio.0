From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: enfore type for i2c_smbus_write_word_data()
Date: Wed, 8 Jun 2016 10:03:00 +0200
Message-ID: <CACRpkdb65f-UYFawLRw9MymUDGdLcpSwMGxo8RA4n3NF3m0+Fg@mail.gmail.com>
References: <1464721423-10969-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34696 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752526AbcFHIDB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 04:03:01 -0400
Received: by mail-oi0-f52.google.com with SMTP id e72so869863oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 01:03:01 -0700 (PDT)
In-Reply-To: <1464721423-10969-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Yong Li <sdliyong@gmail.com>, Phil Reid <preid@electromag.com.au>

On Tue, May 31, 2016 at 9:03 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The commit 9b8e3ec34318 ("gpio: pca953x: Use correct u16 value for register
> word write") fixed regression in pca953x_write_regs(). At the same time the
> solution introduced a sparse warning:
>
> drivers/gpio/gpio-pca953x.c:168:39: warning: incorrect type in argument 3 (different base types)
> drivers/gpio/gpio-pca953x.c:168:39:    expected unsigned short [unsigned] [usertype] value
> drivers/gpio/gpio-pca953x.c:168:39:    got restricted __le16 [usertype] <noident>
>
> Fix the code by enforcing the type of i2c_smbus_write_word_data() parameter.
>
> Cc: Yong Li <sdliyong@gmail.com>
> Cc: Phil Reid <preid@electromag.com.au>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
