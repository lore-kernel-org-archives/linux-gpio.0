From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/pca953x: Add TI TCA9539 support
Date: Fri, 25 Sep 2015 10:17:24 -0700
Message-ID: <CACRpkdYvdW=g41z+Y74gtcuuwvGEC98tUUoHKuVh5=28R2ZD5g@mail.gmail.com>
References: <1441812202-1915-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35846 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932548AbbIYRRY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2015 13:17:24 -0400
Received: by oibi136 with SMTP id i136so61958501oib.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2015 10:17:24 -0700 (PDT)
In-Reply-To: <1441812202-1915-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 9, 2015 at 8:23 AM, Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The TCA9539 is almost identical to the PCA9555 and software-compatible
> with this driver. It exposes 16 general purpose I/O pins in two 8-bit
> configurations.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Looks good! But:

> +       { .compatible = "ti,tca9539", },

You forgot to patch Documentation/devicetree/bindings/gpio/gpio-pca953x.txt

Fix that and I'll apply it.

Yours,
Linus Walleij
