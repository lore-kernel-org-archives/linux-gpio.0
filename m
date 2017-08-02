From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: zte: fix 'functions' allocation in zx_pinctrl_build_state()
Date: Wed, 2 Aug 2017 10:31:59 +0200
Message-ID: <CACRpkdbXYOv8FdbWoiwL-4mhBN5JSP3D8iMMjFM1H2u-vgUC-A@mail.gmail.com>
References: <1500212008-29321-1-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:38588 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751929AbdHBIcB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 04:32:01 -0400
Received: by mail-io0-f172.google.com with SMTP id g13so17532034ioj.5
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 01:32:01 -0700 (PDT)
In-Reply-To: <1500212008-29321-1-git-send-email-shawnguo@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Baoyou Xie <xie.baoyou@sanechips.com.cn>, Xin Zhou <zhou.xin8@sanechips.com.cn>, Jun Nie <jun.nie@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawn.guo@linaro.org>

On Sun, Jul 16, 2017 at 3:33 PM, Shawn Guo <shawnguo@kernel.org> wrote:

> From: Shawn Guo <shawn.guo@linaro.org>
>
> It fixes the following Smatch static check warning:
>
>  drivers/pinctrl/zte/pinctrl-zx.c:338 zx_pinctrl_build_state()
>  warn: passing devm_ allocated variable to kfree.
>
> As we will be calling krealloc() on pointer 'functions', which means
> kfree() will be called in there, devm_kzalloc() shouldn't be used with
> the allocation in the first place.  Fix the warning by calling kcalloc()
> and managing the free procedure in error path on our own.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: cbff0c4d27f4 ("pinctrl: add ZTE ZX pinctrl driver support")
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Patch applied.

Yours,
Linus Walleij
