From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 1/1] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Tue, 25 Oct 2016 11:34:40 +0200
Message-ID: <CACRpkdab5d71TgrTD-4U95R6MvWdFcaqRcGpPS0D8sExKi=b3g@mail.gmail.com>
References: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:40357 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932541AbcJYJel (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 05:34:41 -0400
Received: by mail-qk0-f178.google.com with SMTP id d23so4645065qke.7
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 02:34:41 -0700 (PDT)
In-Reply-To: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

Good work on this patch, nice that it got merged.

I was just thinking that as an add-on, you may want to name
the gpio lines so they have meaningful names in userspace
when you use this with the chardev (I have reasons to believe
these GPIOs will be used from userspace, tell me if that
is wrong).

We currently support naming lines for devicetree and
ACPI (in -next).

I was thinking on either reusing the .names field of the
struct gpiochip to name the lines for the userspace
chardev. With the sideeffect of the names getting reflected
also to sysfs if using that.

We could otherwise add a special function to name the
lines from drivers like this that hang off a pluggable bus.

Johan/Martyn what is your idea?

Yours,
Linus Walleij
