From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: ath79: Fix module autoload
Date: Mon, 24 Oct 2016 00:23:48 +0200
Message-ID: <CACRpkda6rb3bsWEFLSAEu=kwZxO3qSTAiq8NtYB6L7LAm1pUiA@mail.gmail.com>
References: <1476823442-31104-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:33222 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751752AbcJWWXt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Oct 2016 18:23:49 -0400
Received: by mail-qt0-f182.google.com with SMTP id s49so117841709qta.0
        for <linux-gpio@vger.kernel.org>; Sun, 23 Oct 2016 15:23:48 -0700 (PDT)
In-Reply-To: <1476823442-31104-1-git-send-email-javier@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alban Bedel <albeu@free.fr>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Oct 18, 2016 at 10:44 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:

> If the driver is built as a module, autoload won't work because the module
> alias information is not filled. So user-space can't match the registered
> device with the corresponding module.
>
> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
>
> Before this patch:
>
> $ modinfo drivers/gpio/gpio-ath79.ko | grep alias
> $
>
> After this patch:
>
> $ modinfo drivers/gpio/gpio-ath79.ko | grep alias
> alias:          of:N*T*Cqca,ar9340-gpioC*
> alias:          of:N*T*Cqca,ar9340-gpio
> alias:          of:N*T*Cqca,ar7100-gpioC*
> alias:          of:N*T*Cqca,ar7100-gpio
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Patch applied with Alban's ACK.

Yours,
Linus Walleij
