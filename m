From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: intel-mid: switch to devm_gpiochip_add_data()
Date: Thu, 23 Jun 2016 09:52:01 +0200
Message-ID: <CACRpkdYPV819iTTqHQ=PNxR7T-qRiUa_qQLL8QvvSHAGhm76FA@mail.gmail.com>
References: <1466369397-99608-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35543 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbcFWHwD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 03:52:03 -0400
Received: by mail-oi0-f41.google.com with SMTP id r2so58561022oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 00:52:02 -0700 (PDT)
In-Reply-To: <1466369397-99608-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Jun 19, 2016 at 10:49 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The error handling is not correct since the commit 3f7dbfd8eea9 ("gpio:
> intel-mid: switch to using gpiolib irqchip helpers"). Switch to devres API to
> fix the potential resource leak.
>
> Fixes: commit 3f7dbfd8eea9 ("gpio: intel-mid: switch to using gpiolib irqchip helpers")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
