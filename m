From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/3] simulated interrupts
Date: Mon, 21 Aug 2017 00:11:41 +0200
Message-ID: <CACRpkdaF+iZjYQn0t7OKStgaaaSTEPkmQmhTQCh2zwvgvCxXwA@mail.gmail.com>
References: <20170814145318.6495-1-brgl@bgdev.pl> <alpine.DEB.2.20.1708161642270.1987@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36104 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753344AbdHTWLm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Aug 2017 18:11:42 -0400
Received: by mail-oi0-f51.google.com with SMTP id g131so138588529oic.3
        for <linux-gpio@vger.kernel.org>; Sun, 20 Aug 2017 15:11:42 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.20.1708161642270.1987@nanos>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

On Wed, Aug 16, 2017 at 4:44 PM, Thomas Gleixner <tglx@linutronix.de> wrote:

> I merged the irq part (1+2) into a separate branch, which can be consumed
> by the gpio folks so the mockup driver patch can be merged as well.
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/for-gpio

Awesome, thanks Thomas. I pulled this into the GPIO devel branch.

Yours,
Linus Walleij
