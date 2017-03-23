From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: pca953x: Introduce a long awaited ->get_direction()
Date: Thu, 23 Mar 2017 10:38:42 +0100
Message-ID: <CACRpkdbTAJK1QNM0Mnj-wrhaMcbayvLyhfhjHV8Z79uzoXqf=w@mail.gmail.com>
References: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:36163 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752993AbdCWJip (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:38:45 -0400
Received: by mail-it0-f50.google.com with SMTP id w124so36716918itb.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:38:44 -0700 (PDT)
In-Reply-To: <20170322141113.34396-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Wed, Mar 22, 2017 at 3:11 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> +       return (reg_val & (1u << (off % BANK_SZ))) ? GPIOF_DIR_IN : GPIOF_DIR_OUT;

The GPIOF_DIR_IN/GPIOF_DIR_OUT are part of the consumer API and should
not be used inside drivers.

I've fixed it up to 1/0 when applying.

Yours,
Linus Walleij
