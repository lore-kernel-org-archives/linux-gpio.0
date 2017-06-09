From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 01/11] serial: exar: Leave MPIOs as output for Commtech adapters
Date: Fri, 9 Jun 2017 09:20:43 +0200
Message-ID: <CACRpkdYeTGkp1e1gGAzhwXjS8dBCJiWror68Wov-j4g4t4zt2Q@mail.gmail.com>
References: <cover.1496388533.git.jan.kiszka@siemens.com> <0c7b59cdc5a4cb7035656b081e36457eb675fc29.1496388533.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:33827 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751541AbdFIHUp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 03:20:45 -0400
Received: by mail-io0-f171.google.com with SMTP id i7so29697324ioe.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 00:20:44 -0700 (PDT)
In-Reply-To: <0c7b59cdc5a4cb7035656b081e36457eb675fc29.1496388533.git.jan.kiszka@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sascha Weisenberger <sascha.weisenberger@siemens.com>

On Fri, Jun 2, 2017 at 9:28 AM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> Commtech adapters apparently need the original setting as outputs, see
> https://marc.info/?l=linux-gpio&m=149557425201323&w=2. Account for that.
>
> Fixes: 7dea8165f1d6 ("serial: exar: Preconfigure xr17v35x MPIOs as output")
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Greg can you pick this up for fixes?

Yours,
Linus Walleij
