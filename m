From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl/amd: Drop pinctrl_unregister for devm_
 registered device
Date: Thu, 19 Jan 2017 00:15:34 +0100
Message-ID: <CACRpkdb_k56=86hgY+dDuMN-aMgiGhWMicbYbiEGqUbiiC2QMw@mail.gmail.com>
References: <20170117155532.28879-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f170.google.com ([209.85.216.170]:35106 "EHLO
        mail-qt0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750846AbdARXPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 18:15:40 -0500
Received: by mail-qt0-f170.google.com with SMTP id x49so36969138qtc.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 15:15:35 -0800 (PST)
In-Reply-To: <20170117155532.28879-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 17, 2017 at 4:55 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> It's not necessary to unregister pin controller device registered
> with devm_pinctrl_register() and using pinctrl_unregister() leads
> to a double free.
>
> Fixes: 3bfd44306c65 ("pinctrl: amd: Add support for additional GPIO")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
