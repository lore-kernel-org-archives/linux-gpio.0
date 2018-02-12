From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] gpio: merrifield: Delete an error message for a failed
 memory allocation in mrfld_gpio_probe()
Date: Mon, 12 Feb 2018 12:08:23 +0200
Message-ID: <1518430103.22495.252.camel@linux.intel.com>
References: <d73420c9-60ee-ab28-e881-299441815afc@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <d73420c9-60ee-ab28-e881-299441815afc@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sun, 2018-02-11 at 13:42 +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 11 Feb 2018 13:30:14 +0100
> 
> Omit an extra message for a memory allocation failure in this
> function.
> 
> This issue was detected by using the Coccinelle software.
> 

Linus, I have no strong opinion here, so, up to you to decide.

If you decide this patch to go, 

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpio/gpio-merrifield.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-
> merrifield.c
> index dd67a31ac337..eec21122299e 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -408,10 +408,8 @@ static int mrfld_gpio_probe(struct pci_dev *pdev,
> const struct pci_device_id *id
>  	pcim_iounmap_regions(pdev, BIT(1));
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv) {
> -		dev_err(&pdev->dev, "can't allocate chip data\n");
> +	if (!priv)
>  		return -ENOMEM;
> -	}
>  
>  	priv->dev = &pdev->dev;
>  	priv->reg_base = pcim_iomap_table(pdev)[0];

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
