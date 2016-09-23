From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: aspeed: remove redundant return value check
 of platform_get_resource()
Date: Fri, 23 Sep 2016 15:12:04 +0200
Message-ID: <CACRpkdZ+1FGLfVbBY5nG-yiirWHjc1-SZvSjWVHM-xjvY_eXRA@mail.gmail.com>
References: <1474470476-2257-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36140 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758848AbcIWNMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 09:12:05 -0400
Received: by mail-oi0-f46.google.com with SMTP id t83so133464269oie.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 06:12:05 -0700 (PDT)
In-Reply-To: <1474470476-2257-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Sep 21, 2016 at 5:07 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Remove unneeded error handling on the result of a call
> to platform_get_resource() when the value is passed to
> devm_ioremap_resource().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
