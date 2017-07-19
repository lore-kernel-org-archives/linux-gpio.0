From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/3] simulated interrupts
Date: Wed, 19 Jul 2017 14:25:15 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1707191424190.2286@nanos>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 19 Jul 2017, Bartosz Golaszewski wrote:

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
> 
> NOTE: The next candidate for using this API would be iio-dummy-evgen.

I like the general idea - have not looked at the code yet. Just a quick
question: How many copies/variants of this scheme do we have in tree?

Thanks,

	tglx
