From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Fri, 22 Sep 2017 15:29:53 +0200
Message-ID: <CACRpkdZFunwQ=tiQqsapap7Ozz42hr=df5vqbC0S5xy5Wn+ZWw@mail.gmail.com>
References: <1504798409-32041-1-git-send-email-timur@codeaurora.org>
 <20170919070422.GI3349@codeaurora.org> <CACRpkdZcdLac_wYW+XqtZ=-APo8VmvYL4B1oL-wZyLy8KEs9AA@mail.gmail.com>
 <1ecdf6ee-5098-15d3-f85e-66b39a6c25f9@codeaurora.org> <CACRpkdaUV1Mjh7U9bBAgZA5Zq1oqN0HBT=VH5NkvPnY4gHxDVw@mail.gmail.com>
 <d53e67a2-4f69-752f-ba35-53872d9b9760@codeaurora.org> <CACRpkdYfAcKrgbgybccurUKTyR0E+tHDyzp7sbXxXxKuyMOGhQ@mail.gmail.com>
 <619f48d2-59c7-c090-4ace-9e8db9f92064@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:43287 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751877AbdIVNaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2017 09:30:00 -0400
Received: by mail-io0-f182.google.com with SMTP id k101so3045882iod.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2017 06:30:00 -0700 (PDT)
In-Reply-To: <619f48d2-59c7-c090-4ace-9e8db9f92064@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Thu, Sep 21, 2017 at 2:12 PM, Timur Tabi <timur@codeaurora.org> wrote:
> On 9/21/17 7:08 AM, Linus Walleij wrote:
>>
>> I guess gpio_valid_mask would take precedence over irq_valid_mask.
>> I.e if the GPIO is not valid then the IRQ is per definition not valid
>> either.
>>
>> Since it is a new thing, we can simply define a semantic like that
>> and document it.
>
> So what about my current patches?

I am waiting for the maintainer, Bjorn Andersson, to provide review.

>  I hope you're not asking me to rewrite
> them again.

I don't understand your remark. If you are impatient, such is life.

What is your response to Stephen's comment:

> [Stephen Boyd]
> Perhaps we can add another hook for our purposes here that
> tells gpiolib that the gpio is not usable and to skip it. The
> semantics would be clear, it's just about probing availability of
> this pin as a gpio and doesn't mux any pins.

I think this kind of related to my response (after I realized it
was not just about IRQs):

> Doesn't that mean we need something like irq_valid_mask but rather
> gpio_valid_mask that just block all usage of certain GPIOs?

Yours,
Linus Walleij
