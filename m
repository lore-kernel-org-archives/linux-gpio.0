From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/23] gpio: sysfs: drop redundant lock-as-irq
Date: Wed, 29 Apr 2015 23:48:57 +0200
Message-ID: <CACRpkdZjh1vwwogf4fu5jpyf-d4A2c4UnFtK-RxanUtmo0_-Gw@mail.gmail.com>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
	<1429630951-27082-4-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34233 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751909AbbD2Vs5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2015 17:48:57 -0400
Received: by obfe9 with SMTP id e9so30761989obf.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2015 14:48:57 -0700 (PDT)
In-Reply-To: <1429630951-27082-4-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 21, 2015 at 5:42 PM, Johan Hovold <johan@kernel.org> wrote:

> Drop redundant lock-as-irq in gpio_setup_irq, which has already been
> handled when requesting and releasing the irq (i.e. in the irq chip
> irq_request_resources and irq_release_resources callbacks).

Well we would hope they all do that. And I hope for the vast majority
that is true, but there is a TODO to go over all gpiochip drivers
(some which are elsewhere in the kernel than drivers/gpio) and
make sure they actually do so.

Right now it's a bit arbitrary if so happens, and in not marked by
the driver as IRQ then this kicks in and provides an additional
protection.

But maybe that's overzealous, what do people say?

Yours,
Linus Walleij
