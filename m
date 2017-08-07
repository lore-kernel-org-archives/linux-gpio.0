From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Handle the return value of
 davinci_gpio_irq_setup function
Date: Mon, 7 Aug 2017 15:33:34 +0200
Message-ID: <CACRpkdZM2AkzjpArBPGcuoFP4Jm=u=f7gkTR-sjr+vwqNafpaA@mail.gmail.com>
References: <1500543738-9696-1-git-send-email-j-keerthy@ti.com> <1500543738-9696-3-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:37979 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751375AbdHGNdg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 09:33:36 -0400
Received: by mail-it0-f44.google.com with SMTP id m34so3380777iti.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 06:33:36 -0700 (PDT)
In-Reply-To: <1500543738-9696-3-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, fcooper@ti.com, Suman Anna <s-anna@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>

On Thu, Jul 20, 2017 at 11:42 AM, Keerthy <j-keerthy@ti.com> wrote:

> Currently davinci_gpio_irq_setup return value is ignored. Handle the
> return value appropriately.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied.

Yours,
Linus Walleij
