From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: expose only some GPIO pins
Date: Fri, 23 Jun 2017 14:33:26 +0200
Message-ID: <CACRpkdZeDjS_g27=1e7uCmFpjnqX+sDSu5G2VAuwFr_GJW1mug@mail.gmail.com>
References: <1498164850-4738-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37930 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751106AbdFWMd1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2017 08:33:27 -0400
Received: by mail-it0-f48.google.com with SMTP id b205so7518104itg.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2017 05:33:27 -0700 (PDT)
In-Reply-To: <1498164850-4738-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On Thu, Jun 22, 2017 at 10:54 PM, Timur Tabi <timur@codeaurora.org> wrote:

> On Qualcomm Technologies QDF2xxx platforms, only a subset of the GPIOs
> are actually available to the HLOS.  The others are blocked by the XPU,
> and any attempt to access them will cause an XPU violation that halts
> the system.

That's a bummer. Looking for Bj=C3=B6rn's review on this patch.

> Instead, the ACPI table now lists only specific GPIOs that are exposed
> externally as generic GPIO pins.

The ACPI table or the device tree property "gpios" right?

(But maybe this system is only using ACPI.)

> To maintain consistency, the GPIOs are
> enumerated 0 .. (N-1) as before, so that "gpio0" is really whatever is
> the first GPIO listed in ACPI.  The actual mapping is available via
> /sys/kernel/debug/gpio.

I think using "lsgpio" fron tools/gpio/lsgpio.c is better to inspect
the available GPIOs.

If you haven't tested the GPIO tools, please try it out.

Yours,
Linus Walleij
