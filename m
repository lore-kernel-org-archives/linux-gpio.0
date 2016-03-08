From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Remove non existing irq's
Date: Tue, 8 Mar 2016 16:01:45 +0700
Message-ID: <CACRpkdYBSdriGZgJT9S1Dhmw-wpDOycEtRM-wWby2HmGekUj1g@mail.gmail.com>
References: <cover.1456698862.git.henry@nitronetworks.nl>
	<bd43820c6708d57ff2997dccd588faa28da11990.1456698862.git.henry@nitronetworks.nl>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARB6NJ7K3AKGQEEZUV5HI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <bd43820c6708d57ff2997dccd588faa28da11990.1456698862.git.henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 29, 2016 at 6:13 AM, Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org> wrote:

> While I was testing irq's on the cubietruck I found a couple of
> not working irq pins. Further diving into the problem it opened
> up a mess called "manual".
>
> This so called manual (A20 user manual v1.3 dated 2014-10-10) says:
>
> Pin overview:
>     Page 233:       EINT12 is on pin PC19 mux6.
>     Page 236:       EINT12 is on pin PH12 mux6.
>
> Now, it is a bit strange to have the same IRQ on 2 different pins,
> but I guess this could still be possible hardware wise. But then:
>
> Pin registers:
>     Page 253:       EINT12 is *not* on pin PC19.
>     Page 281:       EINT12 is on pin PH12.
>
> The manual is so contradicting that further tests had to be made
> to see which of the 2 statements where correct.
>
> This patch is based on actual outcome of these tests and not what
> the manual says.
>
> Test procedure used:
>
> Connect a 1 pulse per second (GPS) line to the pin.
>
> echo pin### > /sys/class/gpio/export
> echo in > /sys/class/gpio/gpio###/direction
> echo rising > /sys/class/gpio/gpio###/edge
>
> Check /proc/interrupts if a irq was attached and if irq's where
> received.
>
> Signed-off-by: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
