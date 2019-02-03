From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH -next 1/2] genirq: export irq_chip_set_wake_parent
 symbol
Date: Sun, 3 Feb 2019 13:05:33 +0000
Message-ID: <20190203130533.072b235e@why.wild-wind.fr.eu.org>
References: <20190203123131.28323-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190203123131.28323-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, tglx@linutronix.de, andy.gross@linaro.org, sboyd@kernel.org, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sun,  3 Feb 2019 07:31:30 -0500
Brian Masney <masneyb@onstation.org> wrote:

Hi Brian,

> Export the irq_chip_set_wake_parent symbol so that drivers with
> hierarchical IRQ chips can be built as a module.
> 
> This fixes a build failure in linux-next's spmi-gpio when using
> allmodconfig.

I don't think the mention of linux-next helps in the commit message. It
would have been better together with the note below.

> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Reported-by: Mark Brown <broonie@kernel.org>

Otherwise:

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

Thanks,

	M.

> ---
> See https://www.spinics.net/lists/linux-next/msg46362.html for Mark's
> message.
> 
>  kernel/irq/chip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index 34e969069488..086d5a34b5a0 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -1381,6 +1381,7 @@ int irq_chip_set_wake_parent(struct irq_data *data, unsigned int on)
>  
>  	return -ENOSYS;
>  }
> +EXPORT_SYMBOL_GPL(irq_chip_set_wake_parent);
>  #endif
>  
>  /**



-- 
Without deviation from the norm, progress is not possible.
