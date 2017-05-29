From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 05/10] gpio: exar: Fix iomap request
Date: Mon, 29 May 2017 14:32:39 +0200
Message-ID: <CACRpkdYUrzByYGT+5JgwZRSENv_rt4HRacxmb9+tJqXLbcUAbg@mail.gmail.com>
References: <cover.1495814557.git.jan.kiszka@siemens.com> <c21343907d05284978a19aaa09491fd873c708ff.1495814557.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:32941 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750986AbdE2Mck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:32:40 -0400
Received: by mail-io0-f178.google.com with SMTP id p24so40477060ioi.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 05:32:40 -0700 (PDT)
In-Reply-To: <c21343907d05284978a19aaa09491fd873c708ff.1495814557.git.jan.kiszka@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sascha Weisenberger <sascha.weisenberger@siemens.com>

On Fri, May 26, 2017 at 6:02 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> The UART driver already maps the resource for us. Trying to do this here
> only fails and leaves us with a non-working device.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
