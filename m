From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Mon, 28 Oct 2013 23:55:25 +0100
Message-ID: <CACRpkdabBSvPLZHXyGSrLVpjF0tsXOqoJjx=4Fvy0zgNuWXOkA@mail.gmail.com>
References: <1382510171-5937-1-git-send-email-haojian.zhuang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:51242 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001Ab3J1Wz0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2013 18:55:26 -0400
Received: by mail-ob0-f175.google.com with SMTP id wm4so4333991obc.6
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2013 15:55:25 -0700 (PDT)
In-Reply-To: <1382510171-5937-1-git-send-email-haojian.zhuang@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Patch Tracking <patches@linaro.org>

On Wed, Oct 23, 2013 at 8:36 AM, Haojian Zhuang
<haojian.zhuang@linaro.org> wrote:

> gpio-ranges property could binds gpio to pinctrl. But there may be some
> gpios without pinctrl operation. So check whether gpio-ranges property
> exists in device node first.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>

OK...

> +       /* Hook the request()/free() for pinctrl operation */
> +       if (of_get_property(dev->of_node, "gpio-ranges", NULL)) {
> +               chip->gc.request = pl061_gpio_request;
> +               chip->gc.free = pl061_gpio_free;
> +       }

This is quite hard for those not using pinctrl to understand, maybe someone
wants to use the request/free callbacks for something else in the
future.

Can't you:

- Add a variable bool uses_pinctrl to struct pl061_gpio

- Use the bool check:

if (of_property_read_bool(np, "gpio-ranges"))
  chip->uses_pinctrl = true;

- Alter the code in pl061_gpio_request() to do like this:

if (chip->uses_pinctrl)
   pinctrl_request_gpio()

And the same for pl061_gpio_free().

Yours,
Linus Walleij
