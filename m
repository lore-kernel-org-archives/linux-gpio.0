From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: suppress error message on EPROBE_DEFER
Date: Wed, 7 Feb 2018 13:57:04 +0100
Message-ID: <CACRpkdbKWrdnbBp2e1kFd_3fYZxtWKnWPPgOd_FXSvXcOetLwA@mail.gmail.com>
References: <1516566774-1786-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:37525 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753693AbeBGM5H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Feb 2018 07:57:07 -0500
Received: by mail-io0-f195.google.com with SMTP id f89so1905741ioj.4
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2018 04:57:06 -0800 (PST)
In-Reply-To: <1516566774-1786-1-git-send-email-david@lechnology.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Jan 21, 2018 at 9:32 PM, David Lechner <david@lechnology.com> wrote:

> This suppresses printing an error message during probe of gpio drivers
> when the error is EPROBE_DEFER.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: David Lechner <david@lechnology.com>

I'm not sure about this.

GPIO can be very basic system components. If we don't
print this, defer a few times (for some reason) and then
the kernel gives up on retrying, silently (as it happens)
there is no trace in dmesg of what happened. That makes
things hard to debug.

This happened to me with some other driver, so it is not
a made up example.

What about an explicit deferral message for now?

Yours,
Linus Walleij
