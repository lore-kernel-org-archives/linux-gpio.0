From: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: sunxi: set pin function as input
 on export
Date: Tue, 16 Feb 2016 09:00:05 +0100
Message-ID: <20160216080004.GA24625@box2.japko.eu>
References: <1454942242-25690-1-git-send-email-krzysztof.adamski@tieto.com>
 <CACRpkdbd4f3yj2MnR6PU5SuhV5Tj4HzWLc0UX8jQkcJp7MoTig@mail.gmail.com>
Reply-To: krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBD7ILP7VSEGBBPNORO3AKGQEDR5WTGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbd4f3yj2MnR6PU5SuhV5Tj4HzWLc0UX8jQkcJp7MoTig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2016 at 11:04:26PM +0100, Linus Walleij wrote:
>On Mon, Feb 8, 2016 at 3:37 PM, Krzysztof Adamski
><krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Default function of a pin in sunxi SoCs is "disabled". By default gpios
>> exported by sysfs are set as input and indeed, when reading "direction"
>> file you will get "in". The "value" pin won't return proper value,
>> though, confusing user of this interface.
>>
>> This patch sets direction of a GPIO as input when exporting it.
>>
>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
>
>As maxime says it's not a sunxi problem.
>
>So maybe it is wrong to set pins to either input or output when
>exporting them, I suspect they should be exported as is.
>
>Also: the sysfs ABI is deprecated. I suggest you invest your time
>in working on the new chardev ABI.

While sysfs API may be very limited it does have it's strengths too. One 
of them is that it's trivially scriptable even from bash or other 
scripting languages and the other one is that it's there for so long 
that it's very popular and it will take much time before all the 
tutorials and existing applications are updated. So, well, I still find 
it useful to have good support for it.

I find current behaviour of sysfs interface broken (it says that GPIO is 
in input mode when in reality it isn't) and still think it's a good idea 
to fix it. But putting sysfs issue aside, wouldn't it be safer to set 
some well known state of the pin when requesting it instead of leaving 
it at whatever was set before? The same question goes for freeing, 
actually, shouldn't the pin be disabled when we call gpio_free instead 
of leaving it at its last state?

There are existing drivers that set gpio direction to input when 
requesting the pin (for example pinctrl-plgpio.c, pinctrl-sirf.c) so 
sunxi wouldn't be the only driver to do this. This does also show that 
indeed the problem is not sunxi specific, though.

Best regards,
Krzysztof Adamski
