From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] gpio: add a userspace chardev ABI for GPIOs
Date: Thu, 28 Jan 2016 12:14:30 +0100
Message-ID: <CACRpkdZS-=2EH7gKZaHqcVhL6a_5huGtbQUv4F5_XJoV0pHdbA@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
	<CAFy1USR62NooHEjHw0nJmsuHRuq0QDhKentjf40gDOqC+HPrdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36057 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964950AbcA1LOa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 06:14:30 -0500
Received: by mail-oi0-f51.google.com with SMTP id o124so24320556oia.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 03:14:30 -0800 (PST)
In-Reply-To: <CAFy1USR62NooHEjHw0nJmsuHRuq0QDhKentjf40gDOqC+HPrdg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Wed, Jan 27, 2016 at 11:05 AM, Bamvor Zhang Jian
<bamvor.zhangjian@linaro.org> wrote:

> From the api(ioctl GPIO_GET_CHIPINFO_IOCTL: gpiochip_info), it seems
> that I could list all the gpiochips or list only one gpiochip. But
> I could not list gpiochip belongs to one gpio driver.

I think you can get that information from parsing sysfs?

Yours,
Linus Walleij
