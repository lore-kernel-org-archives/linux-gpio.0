From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Tue, 19 Sep 2017 10:15:50 +0200
Message-ID: <CACRpkdZcdLac_wYW+XqtZ=-APo8VmvYL4B1oL-wZyLy8KEs9AA@mail.gmail.com>
References: <1504798409-32041-1-git-send-email-timur@codeaurora.org> <20170919070422.GI3349@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:43227 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750982AbdISIPw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2017 04:15:52 -0400
Received: by mail-it0-f45.google.com with SMTP id l136so5571362ita.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2017 01:15:52 -0700 (PDT)
In-Reply-To: <20170919070422.GI3349@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Timur Tabi <timur@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Sep 19, 2017 at 9:04 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Perhaps we can add another hook for our purposes here that
> tells gpiolib that the gpio is not usable and to skip it. The
> semantics would be clear, it's just about probing availability of
> this pin as a gpio and doesn't mux any pins.

Oh we already have that I think, Mika Westerberg and Andy Shevcheno
implemented that for anyone using CONFIG_GPIOLIB_IRQCHIP, and
this driver does. Timur please check: irq_need_valid_mask, irq_valid_mask
usage.

Helpful commits:
commit 49c03096263871a68c9dea3e86b7d1e163d2fba8
"pinctrl: baytrail: Do not add all GPIOs to IRQ domain"

Then you can see in commits:
commit 7036502783729c2aaf7a3c24c89087c58721430f
"pinctrl: cherryview: Add a quirk to make Acer Chromebook keyboard work again"
commit 2a8209fa68236ad65363dba03db5dbced520268a
"pinctrl: cherryview: Extend the Chromebook DMI quirk to Intel_Strago systems"

How this valid mask is used to work around specific ACPI
issues on Intel chips.

I bet a million to one that you have the same problems as them,
and then we should also deal with it the same way.

Sorry for not seeing the obvious connection earlier.

Yours,
Linus Walleij
