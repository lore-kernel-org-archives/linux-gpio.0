From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 02/10] gpio-exar/8250-exar: Fix passing in of parent
 PCI device
Date: Tue, 20 Jun 2017 10:13:36 +0200
Message-ID: <CACRpkdZdkYvji9NyjLY0NpmTBcboQawv23RxO+KZojj586t+mQ@mail.gmail.com>
References: <cover.1497033197.git.jan.kiszka@siemens.com> <6f2e19cfb8bcb9acf4b042e4db716e93286862d6.1497033197.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:37072 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbdFTINi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 04:13:38 -0400
Received: by mail-it0-f49.google.com with SMTP id m47so9377467iti.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 01:13:38 -0700 (PDT)
In-Reply-To: <6f2e19cfb8bcb9acf4b042e4db716e93286862d6.1497033197.git.jan.kiszka@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sascha Weisenberger <sascha.weisenberger@siemens.com>

On Fri, Jun 9, 2017 at 8:33 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> This fixes reloading of the GPIO driver for the same platform device
> instance as created by the exar UART driver: First of all, the driver
> sets drvdata to its own value during probing and does not restore the
> original value on exit. But this won't help anyway as the core clears
> drvdata after the driver left.
>
> Set the platform device parent instead.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Patch applied to the GPIO tree so we advance this series.

Patch 1 does not apply.

Let's see how it goes.

Yours,
Linus Walleij
