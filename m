From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: use dedicated flags for GPIO properties
Date: Mon, 18 Nov 2013 10:48:41 +0100
Message-ID: <CACRpkdYqdXgVhX80_SEoHRGrpzs2REexykBdxGBXC3CQidAThg@mail.gmail.com>
References: <1384605892-10072-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:55598 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751171Ab3KRJsl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 04:48:41 -0500
Received: by mail-ob0-f181.google.com with SMTP id uz6so6765832obc.12
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 01:48:41 -0800 (PST)
In-Reply-To: <1384605892-10072-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Nov 16, 2013 at 1:44 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> GPIO mapping properties were defined using the GPIOF_* flags, which are
> declared in linux/gpio.h. This file is not included when using the
> GPIO descriptor interface.
>
> This patch declares the flags that can be used as GPIO mappings
> properties in linux/gpio/driver.h, and uses them in gpiolib, so that no
> deprecated declarations are used by the GPIO descriptor interface.
>
> This patch also allows GPIO_OPEN_DRAIN and GPIO_OPEN_SOURCE to be
> specified as GPIO mapping properties.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied for fixes.

Yours,
Linus Walleij
