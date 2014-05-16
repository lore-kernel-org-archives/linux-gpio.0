From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: sysfs: wait for GPIO interrupt
Date: Fri, 16 May 2014 18:37:24 +0200
Message-ID: <CACRpkdZQhd_2dhHsy0_YdweLq8DGDNKGCy=shiGHYQ2_p-4YPA@mail.gmail.com>
References: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
	<CABxcv=k7QTiNWNbHTLFKkjHdgk9o9xB4E4uq75wuKyvXYhqWMQ@mail.gmail.com>
	<CACRpkdZU+P_8NK_YX6aqcp5WtbAzgv7V73Uzj0_RxAQaQgaDzg@mail.gmail.com>
	<CAGm1_kuZGs0=hzPwUs7aC34PQVn7pL2r7V_rdbwXAtwCHxXBkA@mail.gmail.com>
	<CABxcv=m8go203DcdAy6kdQm0=vOo9TxFSKKdt1bwDMbW_72W-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:42827 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751753AbaEPQhZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 May 2014 12:37:25 -0400
Received: by mail-ob0-f177.google.com with SMTP id wp4so3128911obc.22
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2014 09:37:24 -0700 (PDT)
In-Reply-To: <CABxcv=m8go203DcdAy6kdQm0=vOo9TxFSKKdt1bwDMbW_72W-g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Yegor Yefremov <yegorslists@googlemail.com>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, jack@embed.me.uk

On Wed, May 14, 2014 at 11:32 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:

> I was wondering the same. Unfortunately writing a small device driver
> that uses gpiolib from the kernel is sometimes not possible for many
> companies.

This is one of the promises of device tree. Certainly customers of
a Linux BSP can make device trees.

So for a heartbeat LED on some GPIO for example, compile
in the necessary LED and trigger modules and:

        leds {
                compatible = "gpio-leds";
                used-led {
                        label = "user_led";
                        gpios = <&gpio4 14 0x4>;
                        default-state = "on";
                        linux,default-trigger = "heartbeat";
                };
        };

Simple key input:

        gpio_keys {
                compatible = "gpio-keys";
                #address-cells = <1>;
                #size-cells = <0>;

                button@1 {
                        debounce_interval = <50>;
                        wakeup = <1>;
                        linux,code = <2>;
                        label = "userpb";
                        gpios = <&gpio1 0 0x4>;
                };
       };

We need to enable users to use such stock items, not
teach them to shoot themselves in the foot in userspace.

Yours,
Linus Walleij
