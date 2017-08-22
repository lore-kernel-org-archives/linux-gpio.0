From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd: fix error return code in amd_gpio_probe()
Date: Tue, 22 Aug 2017 14:25:02 +0200
Message-ID: <CACRpkdYXM3chAGp0YC3Z+vsbr_QOr+yvmxi3yN22J3bd265=Tw@mail.gmail.com>
References: <20170809160933.GA29055@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33357 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932609AbdHVMZD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2017 08:25:03 -0400
Received: by mail-oi0-f41.google.com with SMTP id f11so183616349oic.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2017 05:25:03 -0700 (PDT)
In-Reply-To: <20170809160933.GA29055@embeddedgus>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 9, 2017 at 6:09 PM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> platform_get_irq() returns an error code, but the pinctrl-amd driver
> ignores it and always returns -EINVAL. This is not correct and,
> prevents -EPROBE_DEFER from being propagated properly.
>
> Print and propagate the return value of platform_get_irq on failure.
>
> This issue was detected with the help of Coccinelle.
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied.

Yours,
Linus Walleij
