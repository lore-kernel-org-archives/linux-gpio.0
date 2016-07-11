From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: merrifield: Protect irq_ack() and gpio_set()
 by lock
Date: Mon, 11 Jul 2016 14:22:51 +0200
Message-ID: <CACRpkdY+AZ-Jg0twvy4GfA_bNChbKzPu1p9uf+hD6LBnRXQvNg@mail.gmail.com>
References: <1468231586-104167-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34128 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203AbcGKMWx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 08:22:53 -0400
Received: by mail-oi0-f41.google.com with SMTP id s66so144659774oif.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 05:22:52 -0700 (PDT)
In-Reply-To: <1468231586-104167-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>

On Mon, Jul 11, 2016 at 12:06 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is a potential race when two threads do the writes to the same register
> in parallel.
>
> Prevent out of order in such case by protecting I/O access by spin lock.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

May I convince you to send a patch adding yourself as maintainer
for this driver in the MAINTAINERS file?

Yours,
Linus Walleij
