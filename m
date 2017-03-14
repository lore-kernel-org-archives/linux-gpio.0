From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: add get_direction function
Date: Tue, 14 Mar 2017 22:41:10 +0100
Message-ID: <CACRpkdZFzYStyPfK1DwkZfvtd7wX9HtD1bnCy+i9h-7xowOz4g@mail.gmail.com>
References: <1486768860-18237-1-git-send-email-timur@codeaurora.org>
 <8652c018-4051-5c77-3126-2d41d150518a@codeaurora.org> <CACRpkdaoHTZa+XjEBAMtO2dS1jevi5h-QYe90SrZDuJghQSyYw@mail.gmail.com>
 <13b19c7f-9440-ab8e-8a2f-d1796a9b3dde@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:33466 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdCNVlN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 17:41:13 -0400
Received: by mail-io0-f177.google.com with SMTP id f84so8683671ioj.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 14:41:12 -0700 (PDT)
In-Reply-To: <13b19c7f-9440-ab8e-8a2f-d1796a9b3dde@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Mar 6, 2017 at 10:52 PM, Timur Tabi <timur@codeaurora.org> wrote:

> On ACPI platforms, the kernel has no control over the muxing (aka function)
> of the various pins.  Firmware configures the TLMM controller for all pins,
> and configures them for whatever functions they're supposed to be.

I think it would be better if pin control and ACPI play along, and I bet that
will happen in the future. This is I guess a question for ACPI standardization
work.

> Therefore, on ACPI, the driver should never change the function of any pin.
> If it's set to something other than 0, then it should never touch that pin.
> Don't write to it, don't change the direction, and definitely don't change
> the function.

Does that mean that pins with 0 are free to play around with?

> So would it be acceptable, for example, to change msm_gpio_set() such that
> if the function of that pin is non-zero, just return an error?

I would ask the driver maintainer about his opinion, and also whoever
is an authority on ACPI for the TLMM-chips, I am no expert
in ACPI. Hell I'm not even good at device tree. Not to mention SFI.
Oh well...

> After all, if pin #17 is set to UART and not GPIO, then there's no point in
> setting that value to 1 or 0, because it's not muxed for GPIO and therefore,
> that 1/0 is not actually going anywhere.  It won't be written to the pin.
>
> I hope I'm making sense.

In a way I guess, I'm just ignorant about how current ACPI implementations
work with hardware in this case so it is likely that you know this
better than me.

Yours,
Linus Walleij
