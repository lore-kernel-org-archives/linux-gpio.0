From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Protect set wake flow by spin lock
Date: Mon, 11 Jul 2016 11:16:17 +0200
Message-ID: <CACRpkdZkOrSdzVzCazGVzDm7mWWdhaNxDgiwPFGY3=-7JQ+w=g@mail.gmail.com>
References: <1467977446-73452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33391 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752669AbcGKJQS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 05:16:18 -0400
Received: by mail-oi0-f42.google.com with SMTP id u201so138969015oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 02:16:18 -0700 (PDT)
In-Reply-To: <1467977446-73452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 8, 2016 at 1:30 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It seems intel_gpio_irq_wake() misses lock protection against I/O flow.
> Use spin lock here as well.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
