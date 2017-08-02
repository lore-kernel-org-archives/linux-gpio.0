From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpio: davinci: Convert prinkt to dev_err
Date: Wed, 2 Aug 2017 11:25:21 +0200
Message-ID: <CACRpkdYCGm7TcGPFFauec2fiWop++5N8SqOnsYZ9=me5qs5L_Q@mail.gmail.com>
References: <1500543738-9696-1-git-send-email-j-keerthy@ti.com> <1500543738-9696-4-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:35053 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752708AbdHBJZX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 05:25:23 -0400
Received: by mail-it0-f51.google.com with SMTP id h199so20822410ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 02:25:22 -0700 (PDT)
In-Reply-To: <1500543738-9696-4-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, fcooper@ti.com, Suman Anna <s-anna@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>

On Thu, Jul 20, 2017 at 11:42 AM, Keerthy <j-keerthy@ti.com> wrote:

> In case of devm_clk_get failure use dev_err instead of printk
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied.

Yours,
Linus Walleij
