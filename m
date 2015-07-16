From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: irqchip: prevent driver unloading if gpio is
 used as irq only
Date: Thu, 16 Jul 2015 13:20:13 +0200
Message-ID: <CACRpkdaY6c7qwc3DEiiKoB55v1Af2O705r=EHh-N8S6PG=gD=A@mail.gmail.com>
References: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35643 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752546AbbGPLUO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 07:20:14 -0400
Received: by oihq81 with SMTP id q81so48055537oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 04:20:13 -0700 (PDT)
In-Reply-To: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Thu, Jun 25, 2015 at 7:30 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Now nothing prevents GPIO driver from being unloaded if its gpios
> were requested as GPIO IRQs only (without calling gpio_request()).
>
> Hence, add calls of try_module_get()/module_put() into
> gpiochip_irq_reqres/relres() to track such scenario properly.
>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied with Alexandre's review tag.

Yours,
Linus Walleij
