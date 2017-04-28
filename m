From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v2] pinctrl: artpec6: Fix return value check in artpec6_pmx_probe()
Date: Fri, 28 Apr 2017 09:41:34 +0200
Message-ID: <CACRpkda8SHP6f7zTAYJyNNhAKAmLAwM_ZvRtXVN=t72-j58Wwg@mail.gmail.com>
References: <20170425032945.22157-1-weiyj.lk@gmail.com> <20170425112930.19555-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:33044 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756115AbdD1Hlq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 03:41:46 -0400
Received: by mail-io0-f182.google.com with SMTP id k87so53368972ioi.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Apr 2017 00:41:40 -0700 (PDT)
In-Reply-To: <20170425112930.19555-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@axis.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 25, 2017 at 1:29 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function pinctrl_register() returns
> ERR_PTR() not NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: fix comment

Patch applied with Jesper's ACK.

Yours,
Linus Walleij
