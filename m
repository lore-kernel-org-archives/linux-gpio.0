From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: pca953x: Introduce a long awaited ->get_direction()
Date: Thu, 23 Mar 2017 10:37:23 +0100
Message-ID: <CACRpkdZ1HaXghy9XqZJrmedcGFN+HS2AK_8qYpYhy-LuSBFHSw@mail.gmail.com>
References: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:35046 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752442AbdCWJhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:37:25 -0400
Received: by mail-it0-f45.google.com with SMTP id y18so36857504itc.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:37:25 -0700 (PDT)
In-Reply-To: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Wed, Mar 22, 2017 at 3:11 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Introduce ->get_direction() callback for the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  v2: fix direction (0 for out, 1 for in)

This v2 patch applied.

Yours,
Linus Walleij
