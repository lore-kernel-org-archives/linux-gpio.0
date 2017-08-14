From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 1/3] irq/irq_sim: add a simple interrupt simulator
 framework
Date: Mon, 14 Aug 2017 15:06:29 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708141505160.1865@nanos>
References: <20170814112056.3751-1-brgl@bgdev.pl> <20170814112056.3751-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814112056.3751-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, 14 Aug 2017, Bartosz Golaszewski wrote:

> Implement a simple, irq_work-based framework for simulating
> interrupts. Currently the API exposes routines for initializing and
> deinitializing the simulator object, enqueueing the interrupts and
> retrieving the allocated interrupt numbers based on the offset of the
> dummy interrupt in the simulator struct.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  include/linux/irq_sim.h |  44 ++++++++++++++++++
>  init/Kconfig            |   4 ++
>  kernel/Makefile         |   1 +
>  kernel/irq_sim.c        | 121 ++++++++++++++++++++++++++++++++++++++++++++++++

Please move this to kernel/irq/ ... and the config option to kernel/irq/Kconfig.

Thanks,

	tglx
