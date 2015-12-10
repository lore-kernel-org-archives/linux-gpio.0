From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 4/4] gpio: pxa: add pin control gpio direction and request
Date: Thu, 10 Dec 2015 18:33:10 +0100
Message-ID: <878u52jjjd.fsf@belgarion.home>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<1448746665-13422-5-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448746665-13422-5-git-send-email-robert.jarzmik@free.fr>
	(Robert Jarzmik's message of "Sat, 28 Nov 2015 22:37:45 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> +static int pxa_gpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +	return pinctrl_request_gpio(chip->base + offset);
> +}
> +
> +static void pxa_gpio_free(struct gpio_chip *chip, unsigned int offset)
> +{
> +	pinctrl_free_gpio(chip->base + offset);
> +}

This part will need a bit of rework : in the case of a platform data board,
pinctrl_*() returns -EPROBE_DEFER, preventing any gpio user to claim a gpio.

Either I hold with this patch to see how pxa pinctrl goes, or drop it, but in
any case this one is not ready yet for merge.

Cheers.

-- 
Robert
