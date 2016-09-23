From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: loongson1: remove redundant return value
 check of platform_get_resource()
Date: Fri, 23 Sep 2016 15:10:38 +0200
Message-ID: <CACRpkdZJ-=-gRy4+ERwxmwZrGgjbAVdE-itt6yZQd0U3QK0Nnw@mail.gmail.com>
References: <1474470459-2124-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33052 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754016AbcIWNKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 09:10:40 -0400
Received: by mail-oi0-f42.google.com with SMTP id r126so133412111oib.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 06:10:39 -0700 (PDT)
In-Reply-To: <1474470459-2124-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

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
