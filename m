From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: zte: fix dereference of 'data' in zx_set_mux()
Date: Mon, 31 Jul 2017 15:13:40 +0200
Message-ID: <CACRpkda31aW5YpFefGe3R8mWmMJ-iPF7UMB8t-tqPxhnihkWEw@mail.gmail.com>
References: <1498880736-18143-1-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:33810 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751784AbdGaNNm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 09:13:42 -0400
Received: by mail-io0-f169.google.com with SMTP id o9so3111983iod.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 06:13:41 -0700 (PDT)
In-Reply-To: <1498880736-18143-1-git-send-email-shawnguo@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawn.guo@linaro.org>

On Sat, Jul 1, 2017 at 5:45 AM, Shawn Guo <shawnguo@kernel.org> wrote:

> From: Shawn Guo <shawn.guo@linaro.org>
>
> It fixes the following Smatch complaint:
>
> drivers/pinctrl/zte/pinctrl-zx.c:76 zx_set_mux()
> warn: variable dereferenced before check 'data' (see line 67)
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: cbff0c4d27f4 ("pinctrl: add ZTE ZX pinctrl driver support")
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij
