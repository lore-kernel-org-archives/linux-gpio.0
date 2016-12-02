From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: merrifield: Add support for hardware debouncer
Date: Fri, 2 Dec 2016 13:56:36 +0100
Message-ID: <CACRpkdZV=s6tqmOcLkrBrv=YzwsKovSauxxV87DLZ6QqGUEerw@mail.gmail.com>
References: <20161201154551.179948-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:35283 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751608AbcLBM4h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2016 07:56:37 -0500
Received: by mail-qk0-f178.google.com with SMTP id n204so277589085qke.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2016 04:56:37 -0800 (PST)
In-Reply-To: <20161201154551.179948-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Dec 1, 2016 at 4:45 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> By default all pins are configured to use a glitch filter. Writing 1 to the
> certain bit of the specific register might be useful in case someone needs to
> bypass the glitch filter completely for a given GPIO pin.
>
> This patch adds support for that in the Intel Merrifield GPIO driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
