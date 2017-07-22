From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/3] irq/irq_sim: add a simple interrupt simulator
 framework
Date: Sat, 22 Jul 2017 21:59:00 +0100
Message-ID: <20170722215900.3d0db97a@kernel.org>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
        <1500466814-32679-2-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1500466814-32679-2-git-send-email-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 19 Jul 2017 14:20:12 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Implement a simple, irq_work-based framework for simulating
> interrupts. Currently the API exposes routines for initializing and
> deinitializing the simulator object, enqueueing the interrupts and
> retrieving the allocated interrupt numbers based on the offset of the
> dummy interrupt in the simulator struct.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Mostly looks good.  A comment and a question inline.

Jonathan
> ---
>  include/linux/irq_sim.h |  37 +++++++++++++++
>  init/Kconfig            |   4 ++
>  kernel/Makefile         |   1 +
>  kernel/irq_sim.c        | 118 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 160 insertions(+)
>  create mode 100644 include/linux/irq_sim.h
>  create mode 100644 kernel/irq_sim.c
> 
> diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
> new file mode 100644
> index 000000000000..0c1abf0e3244
> --- /dev/null
> +++ b/include/linux/irq_sim.h
> @@ -0,0 +1,37 @@
> +/*
> + * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
> + *
> + * Provides a framework for allocating simulated interrupts which can be
> + * requested like normal irqs and enqueued from process context.
> + */
> +
> +#ifndef _LINUX_IRQ_SIM_H
> +#define _LINUX_IRQ_SIM_H
> +
> +#include <linux/irq_work.h>
> +
> +struct irq_sim_work_ctx {
> +	struct irq_work work;
> +	int irq;
> +};
> +
> +struct irq_sim_irq_ctx {
> +	int irqnum;
> +	bool enabled;
> +};
> +
> +struct irq_sim {
> +	struct irq_sim_work_ctx work_ctx;
> +	int irq_base;
> +	unsigned int irq_count;
> +	struct irq_sim_irq_ctx *irqs;
> +};
> +
> +int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs);
> +void irq_sim_fini(struct irq_sim *sim);
> +
> +void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
> +
> +int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
> +
> +#endif /* _LINUX_IRQ_SIM_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index 8514b25db21c..220456599c3f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -23,6 +23,10 @@ config CONSTRUCTORS
>  config IRQ_WORK
>  	bool
>  
> +config IRQ_SIM
> +	bool
> +	select IRQ_WORK
> +
>  config BUILDTIME_EXTABLE_SORT
>  	bool
>  
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 4cb8e8b23c6e..4472567c5835 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -97,6 +97,7 @@ obj-$(CONFIG_TRACE_CLOCK) += trace/
>  obj-$(CONFIG_RING_BUFFER) += trace/
>  obj-$(CONFIG_TRACEPOINTS) += trace/
>  obj-$(CONFIG_IRQ_WORK) += irq_work.o
> +obj-$(CONFIG_IRQ_SIM) += irq_sim.o
>  obj-$(CONFIG_CPU_PM) += cpu_pm.o
>  obj-$(CONFIG_BPF) += bpf/
>  
> diff --git a/kernel/irq_sim.c b/kernel/irq_sim.c
> new file mode 100644
> index 000000000000..062110c90d2a
> --- /dev/null
> +++ b/kernel/irq_sim.c
> @@ -0,0 +1,118 @@
> +/*
> + * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
> + *
> + * Provides a framework for allocating simulated interrupts which can be
> + * requested like normal irqs and enqueued from process context.
> + */
> +
> +#include <linux/irq_sim.h>
> +#include <linux/irq.h>
> +
> +static void irq_sim_irqmask(struct irq_data *data)
> +{
> +	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
> +
> +	irq_ctx->enabled = false;
> +}
> +
> +static void irq_sim_irqunmask(struct irq_data *data)
> +{
> +	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
> +
> +	irq_ctx->enabled = true;
> +}
> +
> +static struct irq_chip irq_sim_irqchip = {
> +	.name		= "irq_sim",
> +	.irq_mask	= irq_sim_irqmask,
> +	.irq_unmask	= irq_sim_irqunmask,
> +};
> +
> +static void irq_sim_handle_irq(struct irq_work *work)
> +{
> +	struct irq_sim_work_ctx *work_ctx;
> +
> +	work_ctx = container_of(work, struct irq_sim_work_ctx, work);
> +	handle_simple_irq(irq_to_desc(work_ctx->irq));
> +}
> +
> +/**
> + * irq_sim_init - Initialize the interrupt simulator: allocate a range of
> + *                dummy interrupts.
> + *
> + * @sim:        The interrupt simulator object to initialize.
> + * @num_irqs:   Number of interrupts to allocate
> + *
> + * Returns 0 on success and a negative error number on failure.
> + */
> +int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
> +{
> +	int i;
> +
> +	sim->irqs = kmalloc_array(num_irqs, sizeof(*sim->irqs), GFP_KERNEL);
> +	if (!sim->irqs)
> +		return -ENOMEM;
> +
> +	sim->irq_base = irq_alloc_descs(-1, 0, num_irqs, 0);
> +	if (sim->irq_base < 0) {
> +		kfree(sim->irqs);
> +		return sim->irq_base;
> +	}
> +
> +	for (i = 0; i < num_irqs; i++) {
> +		sim->irqs[i].irqnum = sim->irq_base + i;
> +		sim->irqs[i].enabled = false;
> +		irq_set_chip(sim->irq_base + i, &irq_sim_irqchip);
> +		irq_set_chip_data(sim->irq_base + i, &sim->irqs[i]);
Cool. That's nicer than what we have in IIO :)  This function really
doesn't have a clear name though as I initially thought the data
was shared by the chip, where as it is the chip_data associated with
a particular IRQ. Had me briefly confused!

Just goes to show the advantage of a unified bit of code for
similar users - the gpio code was nicer than the IIO one as it
turned out.
> +		irq_set_handler(sim->irq_base + i, &handle_simple_irq);
> +		irq_modify_status(sim->irq_base + i,
> +				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
> +	}
> +
> +	init_irq_work(&sim->work_ctx.work, irq_sim_handle_irq);
> +	sim->irq_count = num_irqs;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(irq_sim_init);
> +
> +/**
> + * irq_sim_fini - Deinitialize the interrupt simulator: free the interrupt
> + *                descriptors and allocated memory.
> + *
> + * @sim:        The interrupt simulator to tear down.
> + */
> +void irq_sim_fini(struct irq_sim *sim)
> +{
> +	irq_free_descs(sim->irq_base, sim->irq_count);
> +	kfree(sim->irqs);
> +}
> +EXPORT_SYMBOL_GPL(irq_sim_fini);
> +
> +/**
> + * irq_sim_fire - Enqueue an interrupt.
> + *
> + * @sim:        The interrupt simulator object.
> + * @offset:     Offset of the simulated interrupt which should be fired.
> + */
> +void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
> +{
> +	if (sim->irqs[offset].enabled) {
> +		sim->work_ctx.irq = irq_sim_irqnum(sim, offset);
Is this safe against more than one firing at a time?  Or is it
the responsibility of the caller to prevent that?
> +		irq_work_queue(&sim->work_ctx.work);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(irq_sim_fire);
> +
> +/**
> + * irq_sim_irqnum - Get the allocated number of a dummy interrupt.
> + *
> + * @sim:        The interrupt simulator object.
> + * @offset:     Offset of the simulated interrupt for which to retrieve
> + *              the number.
> + */
> +int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset)
> +{
> +	return sim->irqs[offset].irqnum;
> +}
> +EXPORT_SYMBOL_GPL(irq_sim_irqnum);

