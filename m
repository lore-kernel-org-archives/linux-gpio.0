From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Regression caused by a603a2b8d86e "gpio: of: Add special quirk to
 parse regulator flags"
Date: Tue, 16 Jan 2018 23:49:59 +0100
Message-ID: <CACRpkdZxsL2e2y9u2Sf826mn5W0OC+0dBERm_b4HRO6xEizeWw@mail.gmail.com>
References: <814e4459-39ef-8397-709b-858bf5564212@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:35490 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751687AbeAPWuD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 17:50:03 -0500
Received: by mail-io0-f178.google.com with SMTP id m11so9235470iob.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2018 14:50:03 -0800 (PST)
In-Reply-To: <814e4459-39ef-8397-709b-858bf5564212@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 16, 2018 at 9:49 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> With the latest next kernel I get a NPE caused by mentioned commit.
> The change doesn't consider that the flags parameter can be NULL,
> e.g. of_get_named_gpio() sets it to NULL.
> All that of_gpio_flags_quirks() does is adjusting the flags,
> so the following simple change fixed the issue for me.
>
> if (flags)
>         of_gpio_flags_quirks(np, flags);

How sloppy of me.

I sent a patch.

Yours,
Linus Walleij
