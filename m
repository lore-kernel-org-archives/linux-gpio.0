From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: pl061: hook request if gpio-ranges avaiable
Date: Wed, 3 Dec 2014 14:45:36 +0100
Message-ID: <CACRpkdZbei_gpWR7LfSKb-d=ti9POMR9n9k2z8OMfhgm5BwDFg@mail.gmail.com>
References: <1417494780-3704-1-git-send-email-heyunlei@huawei.com>
	<1417494780-3704-2-git-send-email-heyunlei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:58466 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbaLCNph (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Dec 2014 08:45:37 -0500
Received: by mail-ie0-f170.google.com with SMTP id rd18so13883514iec.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2014 05:45:36 -0800 (PST)
In-Reply-To: <1417494780-3704-2-git-send-email-heyunlei@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yunlei He <heyunlei@huawei.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wangbintian <bintian.wang@huawei.com>, peifeiyue@huawei.com, liguozhu@hisilicon.com, Xinwei Kong <kong.kongxinwei@hisilicon.com>

On Tue, Dec 2, 2014 at 5:32 AM, Yunlei He <heyunlei@huawei.com> wrote:

> Gpio-ranges property is useful to represent which GPIOs correspond
> to which pins on which pin controllers. But there may be some gpios
> without pinctrl operation. So check whether gpio-ranges property
> exists in device node first.
>
> Signed-off-by: Yunlei He <heyunlei@huawei.com>
> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>

Yep simple and elegant.

Patch applied.

However I wonder if it would be possible to move this to the
gpiolib.c or gpiolib-of.c core so not all drivers with this problem
has to implement it.

Yours,
Linus Walleij
