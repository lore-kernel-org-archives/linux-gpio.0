From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: "gpioN" named functions for GPIO pins
Date: Mon, 9 Mar 2015 18:07:40 +0100
Message-ID: <CACRpkdbGLka+Kf61L2d+e0x7GT1AC1NoEsb-Kss9mgNoLjX4Sw@mail.gmail.com>
References: <CAOiHx==ZVc8z-zPqn4iPr-9Z_hmg95vrWGiexhZp_LJYg5NQSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:44056 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752496AbbCIRHl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 13:07:41 -0400
Received: by oifu20 with SMTP id u20so30555404oif.11
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 10:07:41 -0700 (PDT)
In-Reply-To: <CAOiHx==ZVc8z-zPqn4iPr-9Z_hmg95vrWGiexhZp_LJYg5NQSw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 6, 2015 at 12:26 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> As far as I understand the second paragraph, it should suffice to
> define functions named "gpio0", "gpio1", etc. instead of adding a
> gpio_request_enable().
>
> But I fail to see in pinctrl_request_gpio() where this happens:
>
> pinctrl_request_gpio() calls pinmux_request_gpio(), which calls
> pin_request(); pin_request() then calls ops->gpio_request_enable() if
> present and a gpiorange is given, or ops->request() if present.
> Nowhere I can see that any "gpio%d" function is even looked for, at
> least that was the heuristic I used to find that place where
> pinctrl_request_gpio was supposed to obtain the function "gpioN".

No you're right...

pinctrl_request_gpio() ->
pinmux_request_gpio() ->
pin_request() ->

Then you get to this:

        /*
         * If there is no kind of request function for the pin we just assume
         * we got it by default and proceed.
         */
        if (gpio_range && ops->gpio_request_enable)
                /* This requests and enables a single GPIO pin */
                status = ops->gpio_request_enable(pctldev, gpio_range, pin);
        else if (ops->request)
                status = ops->request(pctldev, pin);
        else
                status = 0;

It will try to acquire it as a single pin but not check that the function
name is correct.

So it's not very strict, this will be allowed no matter what function
name you set on that pin.

I guess people use this by setting the mux up in the usual way
with functions+groups e.g. through a device tree, then this will
just fall through nicely and the mux be correct.

But it should call:
.get_functions_count()
.get_function_name()
if a proper name is found, call
.set_mux() with the right function and group set to zero
(this should be OK, maybe we should even look for groups...)
THEN if that works, call ops->request()

But I fear regressions if we actually do this ...

If you want to fix it, go ahead!

Alternatively delete this from the documentation.

I'm quite perplexed this is so wrong :/ I must have been stressed
out when reviewing something. Or probably documented it the way
I thought it works but was just wrong about that.

Yours,
Linus Walleij
