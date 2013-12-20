From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v2] gpio: moxart: remove redundant dev_err call in moxart_gpio_probe()
Date: Fri, 20 Dec 2013 10:22:46 +0100
Message-ID: <CACRpkdZE3BnUV4_6_8SJ15oyw8yRNAHtJ6mvv8tNNnsMPHZXXA@mail.gmail.com>
References: <CAPgLHd_vpHwJO1Wg08gUoJSUS62vaHKC8YAQ2vVbi7QLE+DSgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:60946 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754613Ab3LTJWq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2013 04:22:46 -0500
Received: by mail-oa0-f44.google.com with SMTP id m1so2567310oag.31
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 01:22:46 -0800 (PST)
In-Reply-To: <CAPgLHd_vpHwJO1Wg08gUoJSUS62vaHKC8YAQ2vVbi7QLE+DSgQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jonas Jensen <jonas.jensen@gmail.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Dec 16, 2013 at 3:12 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
> v1 -> v2: rebased and include Jonas.

Patch applied.

Yours,
Linus Walleij
