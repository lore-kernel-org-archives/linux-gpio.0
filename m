From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH] gpio: stmpe: fix interrupt handling bug
Date: Tue, 13 Dec 2016 09:59:42 +0100
Message-ID: <88564c16-62b5-7ff6-1621-274a7c4d3865@st.com>
References: <1479939677-8617-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1479939677-8617-1-git-send-email-linus.walleij@linaro.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



On 11/23/2016 11:21 PM, Linus Walleij wrote:
> commit 43db289d00c6 ("gpio: stmpe: Rework registers access")
> reworked the STMPE register access so as to use
> [STMPE_IDX_*_LSB + i] to access the 8bit register for a
> certain bank, assuming the CSB and MSB will follow after
> the enumerator. For this to work the index needs to go from
> (size-1) to 0 not 0 to (size-1).
> 
> However for the GPIO IRQ handler, the status registers we read
> register MSB + 3 bytes ahead for the 24 bit GPIOs and index
> registers from MSB upwards and run an index i over the
> registers UNLESS we are STMPE1600.
> 
> This is not working when we get to clearing the interrupt
> EDGE status register STMPE_IDX_GPEDR_[LCM]SB: it is indexed
> like all other registers [STMPE_IDX_*_LSB + i] but in this
> loop we index from 0 to get the right bank index for the
> calculations, and we need to just add i to the MSB.
> 
> Before this, interrupts on the STMPE2401 were broken, this
> patch fixes it so it works again.
> 
> Cc: stable@vger.kernel.org
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Fixes: 43db289d00c6 ("gpio: stmpe: Rework registers access")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-stmpe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index e7d422a6b90b..e2e1b16a42db 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -413,7 +413,7 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
>  		    stmpe->partnum != STMPE1801) {
>  			stmpe_reg_write(stmpe, statmsbreg + i, status[i]);
>  			stmpe_reg_write(stmpe,
> -					stmpe->regs[STMPE_IDX_GPEDR_LSB + i],
> +					stmpe->regs[STMPE_IDX_GPEDR_MSB] + i,
>  					status[i]);
>  		}
>  	}
> 

Hi Linus

Sorry for the delay

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Patrice
