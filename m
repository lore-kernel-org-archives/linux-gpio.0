From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: moxart: remove redundant dev_err call in moxart_gpio_probe()
Date: Tue, 10 Dec 2013 12:33:46 +0100
Message-ID: <CACRpkdYZOUhHoHQVArzf-pruoL7V9yVxNTnTpL28TVTWL6eoGw@mail.gmail.com>
References: <CAPgLHd8tig4hJuxUe=iWs4xJPuvATK9YWfETQudfbEz71Ta=fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:64029 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752141Ab3LJLdr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2013 06:33:47 -0500
Received: by mail-oa0-f45.google.com with SMTP id o6so5399055oag.32
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2013 03:33:46 -0800 (PST)
In-Reply-To: <CAPgLHd8tig4hJuxUe=iWs4xJPuvATK9YWfETQudfbEz71Ta=fg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Dec 4, 2013 at 1:38 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

This does not apply after Jonas Jensen's patch
"gpio: MOXA ART: rename moxart_gpio_base to base"

Please rebase and include Jonas on Cc for this driver.

Yours,
Linus Walleij
