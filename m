From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH 1/2] pinctrl: sunxi: add a missing
 function of A10/A20 pinctrl driver
Date: Mon, 10 Jul 2017 18:23:32 +0800
Message-ID: <E5197E25-926B-42C5-BBFC-061BB289E707@aosc.io>
References: <20170706142822.20296-1-icenowy@aosc.io> <20170706142822.20296-2-icenowy@aosc.io> <20170706204646.3akr57fo6c2ok4wn@flea> <a55741a065b818d8ff3843471da61c0e@aosc.io> <20170710084400.wwrfjekv2fkoqvoa@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBNVLRXFQKGQEJS6Y4QQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170710084400.wwrfjekv2fkoqvoa@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.orgMaxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B47=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884:=
44:00, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Jul 07, 2017 at 07:21:19AM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
>> =E5=9C=A8 2017-07-07 04:46=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
>> > Hi,
>> >=20
>> > On Thu, Jul 06, 2017 at 10:28:21PM +0800, Icenowy Zheng wrote:
>> > > The PH16 pin has a function with mux id 0x5, which is the DET pin
>of
>> > > the
>> > > "sim" (smart card reader) IP block.
>> > >=20
>> > > This function is missing both in the old A10 and A20 drivers, so
>it's
>> > > not found during the merge of these two drivers.
>> > >=20
>> > > Add it to the driver. As we now merged A20 pinctrl driver to the
>A10
>> > > one, we need to only fix the A10 driver now.
>> > >=20
>> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> >=20
>> > I'm not sure what you mean there. It's not mentionned in the A10
>> > datasheet, and neither in the A20. Where did you get that info
>from?
>>=20
>> It's mentioned in all newest datasheets: "A10 Datasheet V1.70.pdf"
>and
>> "A20 Datasheet V1.41 20131230.pdf".
>
>Mentionning that in the commit log would be great.
>
>Where did you find those?

dl.linux-sunxi.org

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
