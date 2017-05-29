From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 02/10] gpio-exar/8250-exar: Do not even instantiate a
 GPIO device for Commtech cards
Date: Mon, 29 May 2017 14:30:46 +0200
Message-ID: <CACRpkdaKNdsSM9zR++TFYiCjMqAq3a3yFzkMOG=DjCOBZBYGow@mail.gmail.com>
References: <cover.1495814557.git.jan.kiszka@siemens.com> <096688442ac54d85b6a3e0577592bc2a6891569b.1495814557.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:33416 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750925AbdE2Mas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:30:48 -0400
Received: by mail-io0-f178.google.com with SMTP id p24so40452821ioi.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 05:30:48 -0700 (PDT)
In-Reply-To: <096688442ac54d85b6a3e0577592bc2a6891569b.1495814557.git.jan.kiszka@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sascha Weisenberger <sascha.weisenberger@siemens.com>

On Fri, May 26, 2017 at 6:02 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> Commtech adapters need the MPIOs for internal purposes, and the
> gpio-exar driver already refused to pick them up. But there is actually
> no point in even creating the underlying platform device.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
