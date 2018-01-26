From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: allow the gpio base to be configurable
Date: Fri, 26 Jan 2018 14:01:39 +0100
Message-ID: <CACRpkda6FLfUhqOPqJfCHm1PHOWg=CY=wOCDyrd78eMx+-zrZw@mail.gmail.com>
References: <1516915209-28295-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:38663 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751234AbeAZNBk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jan 2018 08:01:40 -0500
Received: by mail-it0-f53.google.com with SMTP id w14so1620279itc.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2018 05:01:40 -0800 (PST)
In-Reply-To: <1516915209-28295-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>

Hi Timur,

thanks for the patch!

On Thu, Jan 25, 2018 at 10:20 PM, Timur Tabi <timur@codeaurora.org> wrote:

> Add an integer to the msm_pinctrl_soc_data struct that pinctrl-msm
> client drivers can use to specify the gpio base.  This is useful
> if the client driver wants to register multiple TLMM devices, because
> each one needs a distinct base.

Sorry, but NACK.

> pinctrl-msm currently sets the base to 0, which ensures that GPIOs
> of the first TLMM are numbered 0..n-1.  It could specify -1 as the
> base, which would tell gpiolib to choose a unique base, but this
> has the side-effect of choosing a non-zero base for all TLMMs:

This is a feature not a bug. It encourages people not to
depend on the global GPIO numberspace.

Just set it to -1.

> gpiochip_find_base: found new base at 437
(...)
> gpiochip_find_base: found new base at 362

These are awesome bases, just beautiful. Use this.

If you don't like seeing GPIO base numbers like this: use things
like the chardev and the tools in tools/gpio or libgpiod when
developing, and you will never see them. They should not make
a difference anyway.

Yours,
Linus Walleij
