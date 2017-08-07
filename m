From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH] pinctrl: sunxi: fix V3s pinctrl driver IRQ
 bank base
Date: Mon, 07 Aug 2017 21:18:26 +0800
Message-ID: <7ed40135b06d4389c2165cf260d0e50a@aosc.io>
References: <20170801145416.61854-1-icenowy@aosc.io>
 <CACRpkdYJX6SX5NjLMopoD7nKkmhseBMMTei-FoxzXwRnNDUaFg@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBJGRUHGAKGQEJ4Z35XI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CACRpkdYJX6SX5NjLMopoD7nKkmhseBMMTei-FoxzXwRnNDUaFg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

=E5=9C=A8 2017-08-07 21:09=EF=BC=8CLinus Walleij =E5=86=99=E9=81=93=EF=BC=
=9A
> On Tue, Aug 1, 2017 at 4:54 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>=20
>> The V3s pin controller doesn't have the bank 0 (starts at address
>> 0x200), which is like A33. However, this is not workarounded when
>> developing the driver, which makes IRQ not working.
>>=20
>> Fix the IRQ bank base.
>>=20
>> Fixes: 56d9e4a76039 ("pinctrl: sunxi: add driver for V3s SoC")
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>=20
> This patch only applies on the devel branch so I don't see why it is=20
> tagged
> for stable.

I can apply it on v4.12 tag.

The V3s pinctrl driver is introduced in 4.11.

>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>=20
> Patch applied.
>=20
> Yours,
> Linus Walleij
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
