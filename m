From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpiolib: Defer gpio device setup until after gpiolib initialization
Date: Fri, 1 Apr 2016 10:14:03 +0200
Message-ID: <CACRpkdY8UQFfy26UJ-amEoC7D8=mdd5XDwuCpGzdVMcZvRyang@mail.gmail.com>
References: <1459437090-10029-1-git-send-email-linux@roeck-us.net>
	<1459437090-10029-2-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35509 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752830AbcDAIOF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 04:14:05 -0400
Received: by mail-oi0-f43.google.com with SMTP id p188so62871956oih.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2016 01:14:04 -0700 (PDT)
In-Reply-To: <1459437090-10029-2-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Mar 31, 2016 at 5:11 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> Since commit ff2b13592299 ("gpio: make the gpiochip a real device"),
> attempts to add a gpio chip prior to gpiolib initialization cause
> the system to crash. This happens because gpio_bus_type has not been
> registered yet. Defer creating gpio devices until after gpiolib has
> been initialized to fix the problem.
>
> Cc: Greg Ungerer <gerg@uclinux.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Fixes: ff2b13592299 ("gpio: make the gpiochip a real device")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Very elegant solution and also a nice refactoring.

Patches applied for fixes and I'm pushing it for test so we get
some rotation in linux-next.

Yours,
Linus Walleij
