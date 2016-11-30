From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: set default handler to be handle_bad_irq()
Date: Wed, 30 Nov 2016 13:52:48 +0100
Message-ID: <CACRpkdbcmkjeW0T_gRaZLGuxbSG004n=4-ce4OSikdApCtQQbg@mail.gmail.com>
References: <20161125113116.28193-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:32846 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932233AbcK3Mwt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 07:52:49 -0500
Received: by mail-qt0-f182.google.com with SMTP id p16so186041490qta.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 04:52:49 -0800 (PST)
In-Reply-To: <20161125113116.28193-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Fri, Nov 25, 2016 at 12:31 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We switch the default handler to be handle_bad_irq() instead of
> handle_simple_irq() (which was not correct anyway).
>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
