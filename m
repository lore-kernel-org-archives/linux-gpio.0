From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 0/3] simulated interrupts
Date: Wed, 16 Aug 2017 16:44:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708161642270.1987@nanos>
References: <20170814145318.6495-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:58613 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752066AbdHPOop (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2017 10:44:45 -0400
In-Reply-To: <20170814145318.6495-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org

On Mon, 14 Aug 2017, Bartosz Golaszewski wrote:

> Some frameworks (e.g. iio, gpiolib) use irq_work to implement simulated
> interrupts that can be 'fired' from process context when needed and
> requested just like normal interrupts. This is useful for testing and
> development purposes.
> 
> Currently this code is reimplemented by every user. This series
> proposes to add a new set of functions that can be used by drivers
> that want to simulate interrupts without having to duplicate any
> boilerplate code.
> 
> The first patch adds a simple irq simulator framework. The second
> extends it with resource management. The third uses the new
> functionality in the gpio-mockup testing driver.

I merged the irq part (1+2) into a separate branch, which can be consumed
by the gpio folks so the mockup driver patch can be merged as well.

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/for-gpio

Thanks,

	tglx
