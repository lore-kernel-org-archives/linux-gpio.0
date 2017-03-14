From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: sunxi: select GPIOLIB
Date: Tue, 14 Mar 2017 14:15:58 +0100
Message-ID: <CACRpkdawMd98EwnWjKbvsbMc0j_RjMG1qiJ5TGQC2KLLQuYOUw@mail.gmail.com>
References: <20170228190815.10699-1-icenowy@aosc.xyz>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARBEG2T7DAKGQEOASBCHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170228190815.10699-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 28, 2017 at 8:08 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:

> Allwinner pin controllers are also GPIO controllers.
>
> Currently, if GPIOLIB is forgot to be chosen, the build of
> pinctrl-sunxi.c will fail for lacking a lot of gpiochip_* functions.
>
> Select GPIOLIB to ensure this driver can be built.
>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> This bug is found when I try to add sunxi drivers on an ARM64
> allnoconfig, in order to prove that sunxi-ng ccu driver depends on
> reset_controller framework.
>
> I proved the latter dependency, but how to satisfy it still needs
> some discussion.

Patch applied.

This is the right thing to do.

We used to have a restriction such that a pin control driver
could not simply select GPIOLIB, because the selection had
to be done from the platform instead.

But we have fixed that! We can now select GPIOLIB
directly from any driver that needs it.

Yours,
Linus Walleij
