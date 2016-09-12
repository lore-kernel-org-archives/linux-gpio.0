From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: iop: Use generic GPIO MMIO functions for driver
Date: Mon, 12 Sep 2016 15:34:32 +0200
Message-ID: <CACRpkdb7=QCw6CNT_Z_yQwJbtizajs1nm8LtSnhHRot3HxnLwg@mail.gmail.com>
References: <1473402003-24424-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:36165 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756086AbcILNed (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 09:34:33 -0400
Received: by mail-it0-f48.google.com with SMTP id o3so9460108ita.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 06:34:33 -0700 (PDT)
In-Reply-To: <1473402003-24424-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Sep 9, 2016 at 8:20 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> This patch switches the driver to use the generic GPIO MMIO functions
> that removes a bit of redundant and duplicate code.
> ---
> Compile tested only.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

I don't know if people using IOP exist for real.

If this doesn't work for them, I hope they turn up and greet us
with a fix.

Patch applied.

Yours,
Linus Walleij
