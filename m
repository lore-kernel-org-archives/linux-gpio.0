From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: xgene: mark PM functions as __maybe_unused
Date: Wed, 15 Feb 2017 22:35:36 +0100
Message-ID: <CAK8P3a0HV2GELVw_7HdqUYV3918bEb7Y4=jQycU5-APYbfO3hA@mail.gmail.com>
References: <20170214212032.2676656-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:36253 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751702AbdBOVfh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2017 16:35:37 -0500
In-Reply-To: <20170214212032.2676656-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <gnurou@gmail.com>, Duc Dang <dhdang@apm.com>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 14, 2017 at 10:20 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> When CONFIG_PM_SLEEP is disabled, we get a warning about unused functions:
>
> drivers/gpio/gpio-xgene.c:155:12: warning: 'xgene_gpio_resume' defined but not used [-Wunused-function]
>  static int xgene_gpio_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~
> drivers/gpio/gpio-xgene.c:142:12: warning: 'xgene_gpio_suspend' defined but not used [-Wunused-function]
>  static int xgene_gpio_suspend(struct device *dev)
>
> The warnings are harmless and can be avoided by simplifying the code and marking
> the functions as __maybe_unused.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I ran into a problem with this version, please either add this trivial fixup:

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 1fd62bef562b..f1c6ec17b90a 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -42,9 +42,7 @@ struct xgene_gpio {
  struct gpio_chip chip;
  void __iomem *base;
  spinlock_t lock;
-#ifdef CONFIG_PM
  u32 set_dr_val[XGENE_MAX_GPIO_BANKS];
-#endif
 };

 static int xgene_gpio_get(struct gpio_chip *gc, unsigned int offset)

or wait for a new version from me.

     Arnd
