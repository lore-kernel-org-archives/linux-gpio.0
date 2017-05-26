From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/8] serial: exar: Preconfigure xr17v35x MPIOs as output
Date: Fri, 26 May 2017 17:22:56 +0300
Message-ID: <CAHp75Vd5Z+rnRKYYpnjD55PXSih_ynpdHqGbDVgVpkaW36BKsw@mail.gmail.com>
References: <cover.1494660546.git.jan.kiszka@siemens.com> <6155891d19531be018d30fd55ffd6d42493af8c1.1494660546.git.jan.kiszka@siemens.com>
 <9bb8d972-6535-1611-8fa7-f5fe89760531@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:33244 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S943720AbdEZOW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2017 10:22:57 -0400
In-Reply-To: <9bb8d972-6535-1611-8fa7-f5fe89760531@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Sascha Weisenberger <sascha.weisenberger@siemens.com>

On Fri, May 26, 2017 at 4:04 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> Greg,

> Please drop from this tty-next, it may break Commtech adapters. I have
> an update ready.
>
> I may also send a fix on top if that is preferred, just let me know.

AFAIK what is in tty-next is left there, so, looks like latter is the option.

-- 
With Best Regards,
Andy Shevchenko
