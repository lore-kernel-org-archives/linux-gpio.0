From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: pxa: add pin control gpio direction and request
Date: Tue, 15 Dec 2015 14:17:40 +0100
Message-ID: <CACRpkdbRxzFqgXC8tzSCR+r3_-8Ko3n7yq3c7xcCU4+ibqxqVA@mail.gmail.com>
References: <1449960921-19002-1-git-send-email-robert.jarzmik@free.fr>
	<1449960921-19002-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36128 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753405AbbLONRl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 08:17:41 -0500
Received: by mail-oi0-f51.google.com with SMTP id n133so4417153oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2015 05:17:41 -0800 (PST)
In-Reply-To: <1449960921-19002-2-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Dec 12, 2015 at 11:55 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> If a pin control driver is available, use it to change the gpio
> direction. If not fallback to directly manipulating the gpio direction
> register.
>
> The reason to use the pin control driver first is that pin control in
> pxa2xx architecture implies changing the gpio direction, even for non
> gpio functions. In order to do it atomically, only one driver should
> control the gpio direction, and if a pin controller is available, it has
> to be him.
>
> There is a small catch : if CONFIG_PINCTRL is selected, then a pinctrl
> driver has to be probed. If not, gpio_request() will return
> -EPROBE_DEFER as pinctrl_request_gpio() returns it in that case.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v1: expand commit message to state the gpio possible breakage if
>           CONFIG_PINCTRL is selected and no pinctrl driver is built.

Patch applied.

Now you only need to send the incremental diff for patch 1/2.

Yours,
Linus Walleij
