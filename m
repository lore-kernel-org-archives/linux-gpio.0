From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH -next] gpio: thunderx: fix error return code in
 thunderx_gpio_probe()
Date: Wed, 10 Jan 2018 09:13:51 -0800
Message-ID: <3fb7f3e4-3544-0c33-7ca5-e2bdb8ba3c03@caviumnetworks.com>
References: <1515595033-83888-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1515595033-83888-1-git-send-email-weiyongjun1@huawei.com>
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 01/10/2018 06:37 AM, Wei Yongjun wrote:
> Fix to return error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 5a2a30024d8c ("gpio: Add gpio driver support for ThunderX and OCTEON-TX")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

This patch looks correct.  Thanks for finding and fixing this...

Acked-by: David Daney <david.daney@cavium.com>


> ---
>   drivers/gpio/gpio-thunderx.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
> index b5adb79..d16e9d4 100644
> --- a/drivers/gpio/gpio-thunderx.c
> +++ b/drivers/gpio/gpio-thunderx.c
> @@ -553,8 +553,10 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
>   	txgpio->irqd = irq_domain_create_hierarchy(irq_get_irq_data(txgpio->msix_entries[0].vector)->domain,
>   						   0, 0, of_node_to_fwnode(dev->of_node),
>   						   &thunderx_gpio_irqd_ops, txgpio);
> -	if (!txgpio->irqd)
> +	if (!txgpio->irqd) {
> +		err = -ENOMEM;
>   		goto out;
> +	}
>   
>   	/* Push on irq_data and the domain for each line. */
>   	for (i = 0; i < ngpio; i++) {
> 

