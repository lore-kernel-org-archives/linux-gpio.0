From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 03/10] gpio-exar/8250-exar: Fix passing in of parent
 PCI device
Date: Mon, 29 May 2017 14:31:32 +0200
Message-ID: <CACRpkdaFATbopXeH586Asd03MK3YY_tTVaAiT=1VKD45gqaDqg@mail.gmail.com>
References: <cover.1495814557.git.jan.kiszka@siemens.com> <272048835491193427a32c442627be985eeba649.1495814557.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:35774 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751017AbdE2Mbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:31:34 -0400
Received: by mail-io0-f177.google.com with SMTP id f102so40233430ioi.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 05:31:34 -0700 (PDT)
In-Reply-To: <272048835491193427a32c442627be985eeba649.1495814557.git.jan.kiszka@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sascha Weisenberger <sascha.weisenberger@siemens.com>

On Fri, May 26, 2017 at 6:02 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> This fixes reloading of the GPIO driver for the same platform device
> instance as created by the exar UART driver: First of all, the driver
> sets drvdata to its own value during probing and does not restore the
> original value on exit. But this won't help anyway as the core clears
> drvdata after the driver left.
>
> Set the platform device parent instead.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
