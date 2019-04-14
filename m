From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 1/5] pinctrl: pistachio: fix leaked of_node references
Date: Sun, 14 Apr 2019 15:15:57 +0200
Message-ID: <d2957471-b2b2-0266-61d1-03bc4a643fb7@web.de>
References: <1555048943-39589-2-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555048943-39589-2-git-send-email-wen.yang99@zte.com.cn>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Yi Wang <wang.yi59@zte.com.cn>
List-Id: linux-gpio@vger.kernel.org

> @@ -1367,6 +1367,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>  		if (!of_find_property(child, "gpio-controller", NULL)) {
>  			dev_err(pctl->dev,
>  				"No gpio-controller property for bank %u\n", i);
> +			of_node_put(child);
>  			ret = -ENODEV;
>  			goto err;
>  		}
> @@ -1374,6 +1375,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>  		irq = irq_of_parse_and_map(child, 0);
>  		if (irq < 0) {
>  			dev_err(pctl->dev, "No IRQ for bank %u: %d\n", i, irq);
> +			of_node_put(child);
>  			ret = irq;
>  			goto err;
>  		}

Would you like to move such duplicate statements (and other function calls)
to additional jump targets for the desired exception handling?

Regards,
Markus
