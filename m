From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/grgpio: fix deadlock in grgpio_irq_unmap()
Date: Mon, 17 Aug 2015 10:56:18 +0200
Message-ID: <CACRpkdbWd70EM0azZhhmi9nyi6D1QHAWXqHkh5r-PRsmvzKXKQ@mail.gmail.com>
References: <1439799832-13402-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34026 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbbHQI4T (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2015 04:56:19 -0400
Received: by obbfr1 with SMTP id fr1so106568520obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2015 01:56:18 -0700 (PDT)
In-Reply-To: <1439799832-13402-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ldv-project@linuxtesting.org, Alexandre Courbot <gnurou@gmail.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>, Andreas Larsson <andreas@gaisler.com>

On Mon, Aug 17, 2015 at 10:23 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> As reported by Alexey Khoroshilov:
>
>     grgpio_irq_unmap() code looks quite suspicious regarding usage of
>     priv->bgc.lock spinlock.
>
>     It locks the spinlock in line 310:
>
>         spin_lock_irqsave(&priv->bgc.lock, flags);
>
>     and then it can call grgpio_set_imask() in line 317:
>
>         grgpio_set_imask(priv, i, 0);
>
>     But grgpio_set_imask() unconditionally locks the spinlock by itself.
>
> Fix this by moving the spinlock acquisition outside of
> grgpio_set_imask().
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Reported-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> CC: Alexey Khoroshilov <khoroshilov@ispras.ru>
> CC: Andreas Larsson <andreas@gaisler.com>

Patch applied.

Yours,
Linus Walleij
