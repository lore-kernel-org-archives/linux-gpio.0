From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [PATCH] gpio: fix a potential NULL pointer dereference
Date: Sun, 24 Mar 2019 19:12:06 -0400
Message-ID: <f4d27985-376a-42bb-b781-bdc96c0cef21@www.fastmail.com>
References: <20190324231002.2106-1-kjlu@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190324231002.2106-1-kjlu@umn.edu>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kangjie Lu <kjlu@umn.edu>
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>, pakki001@umn.edu, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org



On Mon, 25 Mar 2019, at 09:40, Kangjie Lu wrote:
> In case devm_kzalloc, the patch returns ENOMEM to avoid potential
> NULL pointer dereference.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 854bce4fb9e7..217507002dbc 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1224,6 +1224,8 @@ static int __init aspeed_gpio_probe(struct 
> platform_device *pdev)
>  
>  	gpio->offset_timer =
>  		devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
> +	if (!gpio->offset_timer)
> +		return -ENOMEM;
>  
>  	return aspeed_gpio_setup_irqs(gpio, pdev);
>  }
> -- 
> 2.17.1
> 
>
