From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: aspeed: fix return value check in aspeed_gpio_probe()
Date: Thu, 15 Sep 2016 14:24:22 +0200
Message-ID: <CACRpkdabEO44MGtwe4ychidBh8XG95U-dpiC1WvdFCfv-SF1+g@mail.gmail.com>
References: <1473903032-20524-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34467 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933268AbcIOMbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 08:31:14 -0400
Received: by mail-oi0-f41.google.com with SMTP id m11so66527912oif.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2016 05:31:14 -0700 (PDT)
In-Reply-To: <1473903032-20524-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 15, 2016 at 3:30 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with Joel's ACK.

Yours,
Linus Walleij
