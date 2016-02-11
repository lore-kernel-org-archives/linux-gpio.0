From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 5/5] pinctrl: sunxi: Use pin number when
 calling sunxi_pmx_set
Date: Thu, 11 Feb 2016 21:21:05 +0800
Message-ID: <CAGb2v659R2SjZW2aTrycv28uyepQCfcGa9HqFg8z923RA3EObA@mail.gmail.com>
References: <1454448113-18810-1-git-send-email-k@japko.eu> <1454448113-18810-6-git-send-email-k@japko.eu>
 <CACRpkdbc0SfKiCGwUGA2fAPPsUhGv=qGV607Lht6ByYKKgTHjA@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWEV6K2QKGQEZL3BZ6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACRpkdbc0SfKiCGwUGA2fAPPsUhGv=qGV607Lht6ByYKKgTHjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Adamski <k@japko.eu>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Thu, Feb 11, 2016 at 9:17 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Feb 2, 2016 at 10:21 PM, Krzysztof Adamski <k@japko.eu> wrote:
>
>> sunxi_pmx_set accepts pin number and then calculates offset by
>> subtracting pin_base from it. sunxi_pinctrl_gpio_get, on the other hand,
>> gets offset so we have to convert it to pin number so we won't get
>> negative value in sunxi_pmx_set.
>>
>> This was only used on A10 so far, where there is only one GPIO chip with
>> pin_base set to 0 so it didn't matter. However H3 also requires this
>> workaround but have two pinmux sections, triggering problem for PL port.
>>
>> Signed-off-by: Krzysztof Adamski <k@japko.eu>
>
> Waiting for Maxime to review this. I guess this patch can be merged
> independently of the other patches?

FYI there's a v4 of this patch that both Maxime and I acked.

ChenYu
