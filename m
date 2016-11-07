From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [BUG] pinctrl: sunxi: sunxi-pinctrl fail to load
 with CONFIG_DEBUG_TEST_DRIVER_REMOVE
Date: Mon, 7 Nov 2016 17:58:42 +0800
Message-ID: <CAGb2v657vYjJcO5EmSw2veuxUfDpps-oDysi1GKggx5VsHwSyg@mail.gmail.com>
References: <20161107081832.GA23580@Red> <CAGb2v65MHBUwWzcqwPYDtFNxgGnMECUMjHdZNOv6YPP4HVzwTw@mail.gmail.com>
 <20161107095612.ih5ns24m2qiwujy5@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB25AQHAQKGQE6RMTKDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161107095612.ih5ns24m2qiwujy5@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 7, 2016 at 5:56 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Mon, Nov 07, 2016 at 05:48:43PM +0800, Chen-Yu Tsai wrote:
>> Hi,
>>
>> On Mon, Nov 7, 2016 at 4:18 PM, LABBE Corentin
>> <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Hello
>> >
>> > With CONFIG_DEBUG_TEST_DRIVER_REMOVE=y pinctrl-sunxi fail to load on the second try.
>> >
>> > [    3.900061] sun8i-h3-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
>> > [    3.916251] gpio gpiochip1: GPIO integer space overlap, cannot add chip
>> > [    3.923016] gpiochip_add_data: GPIOs 0..223 (1c20800.pinctrl) failed to register
>> > [    3.931099] sun8i-h3-pinctrl: probe of 1c20800.pinctrl failed with error -16
>> > [    3.944709] sun8i-h3-r-pinctrl 1f02c00.pinctrl: initialized sunXi PIO driver
>> > [    3.960796] gpio gpiochip2: GPIO integer space overlap, cannot add chip
>> > [    3.967594] gpiochip_add_data: GPIOs 352..383 (1f02c00.pinctrl) failed to register
>> > [    3.975633] sun8i-h3-r-pinctrl: probe of 1f02c00.pinctrl failed with error -16
>> >
>> > Without it, all subsequent drivers fail to load.
>> > Tested on Orange PI PC board.
>>
>> I don't think the pinctrl drivers were designed to be removed.
>> And I thought the lack of a .remove callback in the driver blocks
>> the core from removing the device? Maybe I remember wrong...
>
> Using a builtin_platform_driver should be enough to prevent it to be
> removed.

Labbe, can you test it again on linux-next? Or at least with this patch

    0c8c6ba00cbf pinctrl: sunxi: make bool drivers explicitly non-modular

from linux-pinctrl applied. This should fix it.

ChenYu
