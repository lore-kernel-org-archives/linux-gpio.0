From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/2] ARM: pinctrl: stm32: Optimizes and enhances stm32gpio
 irqchip
Date: Wed, 21 Feb 2018 16:12:28 +0100
Message-ID: <ef3296cf-f0ed-e7a8-2b90-17defbf157db@st.com>
References: <1519221027-4028-1-git-send-email-radoslaw.pietrzyk@gmail.com>
 <1519221027-4028-3-git-send-email-radoslaw.pietrzyk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519221027-4028-3-git-send-email-radoslaw.pietrzyk@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Maybe you could remove ARM from commit header.

On 02/21/2018 02:50 PM, Radoslaw Pietrzyk wrote:
> 	- removes unneeded irq_chip.irq_eoi callback
> 	- adds irq_chip.irq_set_wake callback for possible
> 	in the future GPIO wakeup
> 
> Signed-off-by: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 617df16..5b1740d 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -268,10 +268,10 @@ static void stm32_gpio_irq_release_resources(struct irq_data *irq_data)
>   
>   static struct irq_chip stm32_gpio_irq_chip = {
>   	.name           = "stm32gpio",
> -	.irq_eoi	= irq_chip_eoi_parent,
>   	.irq_mask       = irq_chip_mask_parent,
>   	.irq_unmask     = irq_chip_unmask_parent,
>   	.irq_set_type   = irq_chip_set_type_parent,
> +	.irq_set_wake   = irq_chip_set_wake_parent,
>   	.irq_request_resources = stm32_gpio_irq_request_resources,
>   	.irq_release_resources = stm32_gpio_irq_release_resources,
>   };
> 
