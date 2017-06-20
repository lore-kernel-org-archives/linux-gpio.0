From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 04/10] gpio: exar: Fix iomap request
Date: Tue, 20 Jun 2017 10:15:51 +0200
Message-ID: <CACRpkda3kekwhmOpRbUjT1D2poJOEh87H_WWbHFEyM-yR0kzvw@mail.gmail.com>
References: <cover.1497033197.git.jan.kiszka@siemens.com> <eeae5567f93fe044828e572e336cc65464c0e1ea.1497033197.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:34828 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750955AbdFTIPx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 04:15:53 -0400
Received: by mail-it0-f46.google.com with SMTP id m62so9598283itc.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 01:15:53 -0700 (PDT)
In-Reply-To: <eeae5567f93fe044828e572e336cc65464c0e1ea.1497033197.git.jan.kiszka@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sascha Weisenberger <sascha.weisenberger@siemens.com>

On Fri, Jun 9, 2017 at 8:33 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> The UART driver already maps the resource for us. Trying to do this here
> only fails and leaves us with a non-working device.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

This patch does not apply to the GPIO tree.

I don't know why.

Yours,
Linus Walleij
