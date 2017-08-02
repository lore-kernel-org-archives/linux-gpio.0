From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: davinci: Use devm_gpiochip_add_data in place
 of gpiochip_add_data
Date: Wed, 2 Aug 2017 11:23:17 +0200
Message-ID: <CACRpkdZ3EJNBJ38nVV+YZd82KNWrCaJk0SRiwku_xjoE+PApWA@mail.gmail.com>
References: <1500543738-9696-1-git-send-email-j-keerthy@ti.com> <1500543738-9696-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:35528 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752352AbdHBJXS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 05:23:18 -0400
Received: by mail-it0-f42.google.com with SMTP id h199so20798685ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 02:23:18 -0700 (PDT)
In-Reply-To: <1500543738-9696-2-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, fcooper@ti.com, Suman Anna <s-anna@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>

On Thu, Jul 20, 2017 at 11:42 AM, Keerthy <j-keerthy@ti.com> wrote:

> Use the devm version of gpiochip_add_data and pass on the
> return value. This avoids memory leak due to gpiochip_add_data
> in case the driver is unbound.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Patch applied.

Yours,
Linus Walleij
