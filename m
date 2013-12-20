From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v2] gpio: moxart: add missing .owner to struct gpio_chip
Date: Fri, 20 Dec 2013 10:21:51 +0100
Message-ID: <CACRpkdZ9kEKALzynB5ieUYZwZ49gdUJELabqaJLnNuDopqK8_w@mail.gmail.com>
References: <CAPgLHd-S6JJU+dO4dMb_1JXaESbVo6AsX3L9PL3buNGtPcF0KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:37273 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755396Ab3LTJVv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2013 04:21:51 -0500
Received: by mail-oa0-f43.google.com with SMTP id i7so2548719oag.16
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 01:21:51 -0800 (PST)
In-Reply-To: <CAPgLHd-S6JJU+dO4dMb_1JXaESbVo6AsX3L9PL3buNGtPcF0KQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jonas Jensen <jonas.jensen@gmail.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Dec 16, 2013 at 3:11 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Add missing .owner of struct gpio_chip. This prevents the
> module from being removed from underneath its users.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
> v1 -> v2: rebased and include Jonas.

Patch applied.

Yours,
Linus Walleij
