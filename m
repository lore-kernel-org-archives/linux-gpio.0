From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rza1: off by one in rza1_parse_gpiochip()
Date: Thu, 31 Aug 2017 13:38:10 +0200
Message-ID: <CACRpkdYtaDdNY5WpuBx1ZRUt_0_HOy9LHABEjQSfcL7q1O084g@mail.gmail.com>
References: <20170818103248.ddguatdt5jhm5zx7@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36271 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750915AbdHaLiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 07:38:11 -0400
Received: by mail-oi0-f44.google.com with SMTP id t75so3165910oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 04:38:11 -0700 (PDT)
In-Reply-To: <20170818103248.ddguatdt5jhm5zx7@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Aug 18, 2017 at 12:32 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> The rza1_pctl->ports[] array has RZA1_NPORTS (12) elements.  The > here
> should be >= to prevent an out of bounds access.
>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
