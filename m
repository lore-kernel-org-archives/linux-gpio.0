From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: pca954x: fix undefined error code from remove
Date: Wed, 7 Sep 2016 16:15:20 +0200
Message-ID: <CACRpkdafOgFE+3-8wuqO1trYdHyy0S3nxNzLJuGTmFS_aYY3eQ@mail.gmail.com>
References: <20160826152546.604384-1-arnd@arndb.de> <20160826152546.604384-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35780 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752404AbcIGOPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 10:15:38 -0400
Received: by mail-oi0-f50.google.com with SMTP id s131so27340323oie.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 07:15:21 -0700 (PDT)
In-Reply-To: <20160826152546.604384-2-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Phil Reid <preid@electromag.com.au>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Aug 26, 2016 at 5:25 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The recent addition of the regulator support has led to the pca953x_remove
> function returning uninitialized data when no platform data pointer is
> provided, as gcc warns when using -Wmaybe-uninitialized:
>
> drivers/gpio/gpio-pca953x.c: In function 'pca953x_remove':
> drivers/gpio/gpio-pca953x.c:860:9: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>
> This restores the previous behavior, returning 0 on success.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: e23efa311110 ("gpio: pca954x: Add vcc regulator and enable it")
> Cc: Phil Reid <preid@electromag.com.au>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org

Patch applied with Phil's ACK.

Yours,
Linus Walleij
