From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Fix pca953x_gpio_set_multiple() on 64-bit
Date: Wed, 16 Mar 2016 13:03:10 +0100
Message-ID: <CACRpkdbcSLV-TKVu+KWt9rz3uEMUfpkBAz0Rd5aBR3LWeSJNQA@mail.gmail.com>
References: <1457713887-7748-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:32945 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965777AbcCPMDL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 08:03:11 -0400
Received: by mail-ob0-f175.google.com with SMTP id fz5so48510260obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 05:03:11 -0700 (PDT)
In-Reply-To: <1457713887-7748-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Phil Reid <preid@electromag.com.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 11, 2016 at 5:31 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> pca953x_gpio_set_multiple() divides by 4 to convert from longs to bytes,
> which assumes a 32-bit platform, and is not correct on 64-bit platforms.
> Use "sizeof(...)" instead to fix this.
>
> Fixes: b4818afeacbd8182 ("gpio: pca953x: Add set_multiple to allow multiple bits to be set in one write.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied for fixes. Tagged for stable.
Ack from Phil.

Yours,
Linus Walleij
