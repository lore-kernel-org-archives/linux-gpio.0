From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v1] usb: phy: generic: migrate to gpio_desc
Date: Sun, 30 Nov 2014 21:32:16 +0100
Message-ID: <87bnno1lbj.fsf@free.fr>
References: <1415535787-21868-1-git-send-email-robert.jarzmik@free.fr>
	<20141121154358.GF7508@saruman>
	<CACRpkdZtwYb77ytGiadFnZAUOkr8y_HPQoM3vmXBc+N6dszAJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZtwYb77ytGiadFnZAUOkr8y_HPQoM3vmXBc+N6dszAJw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Linus Walleij's message of "Fri, 28 Nov 2014 11:37:47 +0100")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio@vger.kernel.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> This definately make things better so:
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Thanks.

> One comment though:
>
>>>       if (dev->of_node) {
> (...)
>>> +             nop->gpiod_reset = devm_gpiod_get(dev, "reset-gpios");
>>> +             err = PTR_ERR(nop->gpiod_reset);
>>>       } else if (pdata) {
> (...)
>>> +             err = devm_gpio_request_one(dev, pdata->gpio_reset, 0,
>>> +                                         dev_name(dev));
>>> +             if (!err)
>>> +                     nop->gpiod_reset = gpio_to_desc(pdata->gpio_reset);
>>> +     }

> So a next step would be to add support for getting the
> devm_gpiod_get(dev, "reset-gpios"); outside of the if (dev->of_node)
> clause, and possibly convert the board files for affected
> platforms to use descriptors, if they will not be replaced by
> device tree only.

OK, if we were to do this, is there a way to build a static platform data with a
gpio descriptor ?
Ie. can I write something like :
struct generic_phy_pdata {
	struct gpio_desc *reset_gpio;
};

And in machine code :
static struct generic_phy_pdata usb_phy __initdata {
       .reset_gpio = XXX(19),
};

What should "XXX" be like to describe reset_gpio as a ACTIVE_HIGH gpio number 19
?

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
