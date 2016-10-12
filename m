From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [patch] gpio: stmpe: || vs && typo
Date: Wed, 12 Oct 2016 09:10:03 +0200
Message-ID: <72f9aaa3-4efb-2173-ba6c-96d961898ab0@st.com>
References: <20161012062520.GY12841@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20161012062520.GY12841@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Dan

On 10/12/2016 08:25 AM, Dan Carpenter wrote:
> && was obviously intended here.
> 
> Fixes: 6936e1f88d23 ('gpio: stmpe: Write int status register only when needed')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index e7d422a..5b00427 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -409,7 +409,7 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
>  		 * 801/1801/1600, bits are cleared when read.
>  		 * Edge detect register is not present on 801/1600/1801
>  		 */
> -		if (stmpe->partnum != STMPE801 || stmpe->partnum != STMPE1600 ||
> +		if (stmpe->partnum != STMPE801 && stmpe->partnum != STMPE1600 &&
>  		    stmpe->partnum != STMPE1801) {
>  			stmpe_reg_write(stmpe, statmsbreg + i, status[i]);
>  			stmpe_reg_write(stmpe,
> 

Well spotted ;-)

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
