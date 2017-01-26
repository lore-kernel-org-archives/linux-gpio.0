From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: 104-dio-48e: Utilize devm_ functions in driver
 probe callback
Date: Thu, 26 Jan 2017 15:53:02 +0100
Message-ID: <CACRpkdbK86RoXFXOM8MHi=U=DafF8A5Hi+jmnVcSbQeOFL6MKg@mail.gmail.com>
References: <cover.1485287208.git.vilhelm.gray@gmail.com> <282c88e9bee6c5edc16637e37cecb4b4b4c80898.1485287208.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:35539 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752396AbdAZOxE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 09:53:04 -0500
Received: by mail-io0-f170.google.com with SMTP id j18so38151054ioe.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 06:53:04 -0800 (PST)
In-Reply-To: <282c88e9bee6c5edc16637e37cecb4b4b4c80898.1485287208.git.vilhelm.gray@gmail.com>
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
> devm_request_irq call respectively. In addition, the dio48e_remove
> function has been removed as no longer necessary due to the use of the
> relevant devm_ resource manager functions.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
