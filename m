From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: Remove stray printk call in sun5i
 driver's probe function
Date: Mon, 6 Feb 2017 11:08:40 +0100
Message-ID: <CACRpkdYYRY9bZtGiD6Kshd9Jpo3bVaV+pTR5vhnS4CZeZhe7hA@mail.gmail.com>
References: <20170201160209.9261-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:34849 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750950AbdBFKIl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 05:08:41 -0500
Received: by mail-it0-f41.google.com with SMTP id 203so51323964ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 02:08:41 -0800 (PST)
In-Reply-To: <20170201160209.9261-1-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 1, 2017 at 5:02 PM, Chen-Yu Tsai <wens@csie.org> wrote:

> There is a stray printk call in the new sun5i pinctrl driver's probe
> function.
>
> Remove it.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Patch applied.

Yours,
Linus Walleij
