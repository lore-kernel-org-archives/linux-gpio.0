From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Set pin direction properly
Date: Wed, 11 Jan 2017 13:50:27 +0100
Message-ID: <CACRpkdY8fUR6-WE9TE9V3AxsWWjKs-gwQbUG5Afoe9fmYUnkmQ@mail.gmail.com>
References: <20170102120722.178343-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:35516 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966156AbdAKMu2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 07:50:28 -0500
Received: by mail-qt0-f169.google.com with SMTP id x49so127886351qtc.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 04:50:28 -0800 (PST)
In-Reply-To: <20170102120722.178343-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>

On Mon, Jan 2, 2017 at 1:07 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There are two bits in the PADCFG0 register to configure direction, one per
> TX/RX buffers.
>
> For now we wrongly assume that the GPIO is always requested before it is being
> used, which is not true when the GPIO is used through irqchip. In this case the
> GPIO is never requested and we never enable RX buffer for it.
>
> Fix this by setting both bits accordingly.
>
> Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I applied this patch for fixes on top of Mika's pad offset
fix.

Hope this is right... There is some noise in the thread but
AFAICT there are more fixes coming.

Yours,
Linus Walleij
