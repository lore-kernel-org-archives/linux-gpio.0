From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: pca953x: Fix corruption of other gpios in set_multiple.
Date: Tue, 8 Nov 2016 09:30:59 +0100
Message-ID: <CACRpkdb=wWnH2z0pSHRY2JKArKKk1-7jgGorVbDnvt3cT+acYQ@mail.gmail.com>
References: <1478584845-75666-1-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:35182 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbcKHIbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 03:31:01 -0500
Received: by mail-qk0-f171.google.com with SMTP id n204so197612025qke.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 00:31:00 -0800 (PST)
In-Reply-To: <1478584845-75666-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Yong Li <yong.b.li@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Nov 8, 2016 at 7:00 AM, Phil Reid <preid@electromag.com.au> wrote:

> gpiod_set_array_value_complex does not clear the bits field.
> Therefore when the drivers set_multiple funciton is called bits outside
> the mask are undefined and can be either set or not. So bank_val needs
> to be masked with bank_mask before or with the reg_val cache.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied for fixes. Should it also be tagged for stable?
Is there a commit this fixes that we can set as Fixes:?

Yours,
Linus Walleij
