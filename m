From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 1/3] irq/irq_sim: add a simple interrupt simulator
 framework
Date: Mon, 24 Jul 2017 09:31:44 +0200
Message-ID: <3444eb00-4097-9776-2e40-e19db6be5ab3@metafoo.de>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
 <1500466814-32679-2-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500466814-32679-2-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 07/19/2017 02:20 PM, Bartosz Golaszewski wrote:
[...]
> +void irq_sim_fini(struct irq_sim *sim)
> +{

Not very likely to happen in practice, but for correctness we should
probably put a irq_work_sync() here for each of the IRQs to make sure that
the memory associated with the irq_sim_work_ctx struct is no longer accessed
and that handle_simple_irq() is not called after irq_free_descs().


> +	irq_free_descs(sim->irq_base, sim->irq_count);
> +	kfree(sim->irqs);
> +}
> +EXPORT_SYMBOL_GPL(irq_sim_fini);
