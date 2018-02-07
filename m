From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: friendly debug information for consumer
Date: Wed, 7 Feb 2018 14:04:07 +0100
Message-ID: <CACRpkdY+oF3atnuXZE2h_sdbiX5LMWZwvNEpJDvUuf0kx2pxPA@mail.gmail.com>
References: <1516685317-12867-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:40068 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753630AbeBGNEI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Feb 2018 08:04:08 -0500
Received: by mail-it0-f49.google.com with SMTP id 196so2138142iti.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2018 05:04:08 -0800 (PST)
In-Reply-To: <1516685317-12867-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Cc: Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org

Hi Wang,

thank you for your patch!

On Tue, Jan 23, 2018 at 6:28 AM, Wang Dongsheng
<dongsheng.wang@hxt-semitech.com> wrote:

> mdiobus always try to get "reset" consumer, but not all platforms
> have this capability. "failed" makes observer confuse when a
> consumer can not find.
>
> Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>

But the message is correct?

> -               dev_dbg(dev, "lookup for GPIO %s failed\n", con_id);

This is happening.

I would be more inclined to agree if it was dev_err() but this is
not even info, it is debug info.

> +               dev_dbg(dev, "Can not detect GPIO consumer %s\n", con_id);

This is not about any "detection", it is about looking something
up.

Yours,
Linus Walleij
