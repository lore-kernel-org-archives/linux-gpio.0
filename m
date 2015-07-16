From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpiolib: assign chip owner to dev->driver->owner if
 not set
Date: Thu, 16 Jul 2015 13:22:04 +0200
Message-ID: <CACRpkdYbVros042MPKx4eYv4RiMM30KUh8ej3Ouwbn2LE+9EDA@mail.gmail.com>
References: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>
	<1435253451-19817-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35614 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753147AbbGPLWF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 07:22:05 -0400
Received: by oihq81 with SMTP id q81so48081510oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 04:22:04 -0700 (PDT)
In-Reply-To: <1435253451-19817-2-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Thu, Jun 25, 2015 at 7:30 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Assign GPIO chip owner field to chip->dev->driver->owner if it was not
> configured by GPIO driver.
>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied with Alex' review tag.

>  There is also one positive additional side effect:
>  lines like below can be removed from a lot of GPIO
>  drivers
>         rdc321x_gpio_dev->chip.owner = THIS_MODULE;

Yes let's do this :)

Yours,
Linus Walleij
