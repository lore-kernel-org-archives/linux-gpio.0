From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] gpio: 104-idio-16: Utilize devm_ functions in driver
 probe callback
Date: Thu, 26 Jan 2017 15:54:55 +0100
Message-ID: <CACRpkdbGwqeM+gM5Ac61u0wHeyePxr5qSL-+Z3rmQ08W7hWEQg@mail.gmail.com>
References: <cover.1485287208.git.vilhelm.gray@gmail.com> <b0562b512f25c17e060847161ab613079ebc1462.1485287208.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:35451 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752833AbdAZOy5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 09:54:57 -0500
Received: by mail-io0-f175.google.com with SMTP id j18so38195757ioe.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 06:54:57 -0800 (PST)
In-Reply-To: <b0562b512f25c17e060847161ab613079ebc1462.1485287208.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 24, 2017 at 9:00 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The devm_ resource manager functions allow memory to be automatically
> released when a device is unbound. This patch takes advantage of the
> resource manager functions and replaces the gpiochip_add_data call and
> request_irq call with the devm_gpiochip_add_data call and
> devm_request_irq call respectively. In addition, the idio_16_remove
> function has been removed as no longer necessary due to the use of the
> relevant devm_ resource manager functions.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
