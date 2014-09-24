From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: Fix return value check in xgene_gpio_probe()
Date: Wed, 24 Sep 2014 10:05:07 +0200
Message-ID: <CACRpkdYQjHiL_qriNvgXR8OWgGAuf8HuY5dts8UEgUkbrV-CZQ@mail.gmail.com>
References: <1410477134-5556-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:61193 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753530AbaIXIFI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Sep 2014 04:05:08 -0400
Received: by mail-ig0-f180.google.com with SMTP id a13so6072719igq.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2014 01:05:07 -0700 (PDT)
In-Reply-To: <1410477134-5556-1-git-send-email-weiyj_lk@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: weiyj_lk@163.com
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 12, 2014 at 1:12 AM,  <weiyj_lk@163.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function devm_ioremap_nocache() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied with Alex's Review tag.

Yours,
Linus Walleij
