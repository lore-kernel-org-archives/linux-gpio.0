From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [RFC PATCH 4/9] clk: sunxi-ng: support R40 SoC
Date: Tue, 28 Feb 2017 23:50:14 +0800
Message-ID: <CAGb2v66AZK+g3xX4cXd8Q6Ob_+SxpYsxHBEfC9Ec2QsdN4eA9A@mail.gmail.com>
References: <20170222231738.HXRSmi86@smtp1o.mail.yandex.net> <20170224002028.miupa6dzefgxbfse@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBTVY23CQKGQELPAN2AY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170224002028.miupa6dzefgxbfse@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hi Icenowy,

On Fri, Feb 24, 2017 at 8:20 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Feb 22, 2017 at 01:54:58PM +0800, Icenowy Zheng wrote:
>>
>> 2017=E5=B9=B42=E6=9C=8822=E6=97=A5 07:03=E4=BA=8E Maxime Ripard <maxime.=
ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>> >
>> > Hi,
>> >
>> > On Sat, Feb 18, 2017 at 01:37:17AM +0800, Icenowy Zheng wrote:
>> > > Allwinner R40 SoC have a clock controller module in the style of the
>> > > SoCs beyond sun6i, however, it's more rich and complex.
>> > >
>> > > Add support for it.
>> > >
>> > > As the user manual is still not available, this driver is made with
>> > > knowledge from clk-sun8iw11.c in the BSP kernel source.
>> >
>> > Missing SoB.
>> >
>> > Why are some patches tagged as RFC and some don't?
>>
>> There's still no open User Manual for R40, so I tagged CCU-related
>> drivers RFC.
>>
>> Pinctrl driver can be written with the datasheet draft, which is
>> available now.
>>
>> For USB we have never user manual so everything is educated guess --
>> so it's not RFC.
>
> It's still kind of weird to mix and match patches with and without RFC
> tags.

Allwinner just released the docs today. See

    https://github.com/tinalinux/docs/tree/r40-v1.y

Could you check your patches against it, and maybe we don't need the
RFC tags anymore?

ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
