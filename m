From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: msm: make msm_gpio.summary_irq signed for error handling
Date: Mon, 18 Nov 2013 11:42:29 +0100
Message-ID: <CACRpkdYZBe9AxYoy9k3Nyfocgc1-8OOpZhFb8bdqgDZrwteNHQ@mail.gmail.com>
References: <20131107075134.GI21844@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:45356 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751714Ab3KRKm3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 05:42:29 -0500
Received: by mail-oa0-f47.google.com with SMTP id k1so1737935oag.34
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 02:42:29 -0800 (PST)
In-Reply-To: <20131107075134.GI21844@elgon.mountain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 7, 2013 at 8:51 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a bug in msm_gpio_probe() where we do:
>
>         msm_gpio.summary_irq = platform_get_irq(pdev, 0);
>         if (msm_gpio.summary_irq < 0) {
>
> The problem is that "msm_gpio.summary_irq" is unsigned so the error
> handling doesn't work.  I've fixed it by making it signed.
>
> Fixes: 43f68444bce7 ('gpio: msm: Add device tree and irqdomain support for gpio-msm-v2')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for fixes and tagged for stable.

Yours,
Linus Walleij
