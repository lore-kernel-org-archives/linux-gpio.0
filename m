From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: baytrail: Enable glitch filter for GPIOs used
 as interrupts
Date: Tue, 2 Jan 2018 10:39:18 +0100
Message-ID: <CACRpkdbfuqRJpA5Q5NzeESkP4TmdepsoE3=HDuzyeVhZfXpe=w@mail.gmail.com>
References: <20180101122357.10465-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:45029 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751286AbeABJjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 04:39:19 -0500
Received: by mail-it0-f66.google.com with SMTP id b5so38195149itc.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 01:39:18 -0800 (PST)
In-Reply-To: <20180101122357.10465-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

On Mon, Jan 1, 2018 at 1:23 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> On some systems, some PCB traces attached to GpioInts are routed in such
> a way that they pick up enough interference to constantly (many times per
> second) trigger.
>
> Enabling glitch-filtering fixes this.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Unconditionally enable glitch-filtering for all GpioInts instead of using
>  a DMI list, as suggested by Mika Westerberg

Patch applied with Mika's ACK.

Yours,
Linus Walleij
