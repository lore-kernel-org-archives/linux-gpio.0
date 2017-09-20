From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Wed, 20 Sep 2017 13:43:38 +0200
Message-ID: <CACRpkdaUV1Mjh7U9bBAgZA5Zq1oqN0HBT=VH5NkvPnY4gHxDVw@mail.gmail.com>
References: <1504798409-32041-1-git-send-email-timur@codeaurora.org>
 <20170919070422.GI3349@codeaurora.org> <CACRpkdZcdLac_wYW+XqtZ=-APo8VmvYL4B1oL-wZyLy8KEs9AA@mail.gmail.com>
 <1ecdf6ee-5098-15d3-f85e-66b39a6c25f9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:45931 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751568AbdITLnk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2017 07:43:40 -0400
Received: by mail-it0-f54.google.com with SMTP id v19so2263587ite.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2017 04:43:40 -0700 (PDT)
In-Reply-To: <1ecdf6ee-5098-15d3-f85e-66b39a6c25f9@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Sep 19, 2017 at 2:32 PM, Timur Tabi <timur@codeaurora.org> wrote:
> On 9/19/17 3:15 AM, Linus Walleij wrote:
>>
>> Oh we already have that I think, Mika Westerberg and Andy Shevcheno
>> implemented that for anyone using CONFIG_GPIOLIB_IRQCHIP, and
>> this driver does. Timur please check: irq_need_valid_mask, irq_valid_mask
>> usage.
>
> These patches already use irq_valid_mask!  But that doesn't block complete
> access to the GPIO.

Aha sorry for my ignorance :(

Doesn't that mean we need something like irq_valid_mask but rather
gpio_valid_mask that just block all usage of certain GPIOs?

Yours,
Linus Walleij
