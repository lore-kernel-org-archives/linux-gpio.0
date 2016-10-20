From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: merrifield: set default handler to be handle_bad_irq()
Date: Thu, 20 Oct 2016 14:13:25 +0200
Message-ID: <CACRpkdaiTQNezg+yMoc1mF8xg0aFzUiaw5Ag6eJD2ieQWy-F_A@mail.gmail.com>
References: <20161010090753.39450-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:34552 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750785AbcJTMN1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2016 08:13:27 -0400
Received: by mail-qk0-f176.google.com with SMTP id f128so86729059qkb.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2016 05:13:27 -0700 (PDT)
In-Reply-To: <20161010090753.39450-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 10, 2016 at 11:07 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We switch the default handler to be handle_bad_irq() instead of
> handle_simple_irq() (which was not correct anyway).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Yeah the right handler is set up in .set_type(), nice.

Patch applied.

Yours,
Linus Walleij
