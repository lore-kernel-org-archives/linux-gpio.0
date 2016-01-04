From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: reason for Allwinner SoC specific pinctrl drivers?
Date: Tue, 5 Jan 2016 01:27:26 +0800
Message-ID: <CAEzqOZu8wkPKLp6bZZ7JuiM07ixDksdD=U-WK=3kFPYJZMon4Q@mail.gmail.com>
References: <568A514D.7070102@arm.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a113ff69c4a80170528856ffa
Return-path: <linux-sunxi+bncBD64TFVR3YIBB7WWVK2AKGQEMENC6KY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <568A514D.7070102-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

--001a113ff69c4a80170528856ffa
Content-Type: text/plain; charset=UTF-8

Hello Andre,
This is something we can do for future SOCs.

On 4 Jan 2016 19:02, "Andre Przywara" <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
>
> Hi,
>
> while looking at the Allwinner A64 SoC support, I was wondering why we
> would actually need a pinctrl driver (file) for each and every Allwinner
> SoC that we support.
> Looking at both the A20 and the A64 doc I don't see any differences in
> the port controller implementation apart from the actual
> muxval <-> subsystem assignment, which is just data, right?
> Comparing the code files in drivers/pinctrl/sunxi seems to support this,
> as those drivers only consist of the table and some boilerplate code.
>
> Now I was wondering whether we could get away with one generic Allwinner
> pinctrl driver and put the SoC specific pin assignments in DT instead.
> It looks like adding an "allwinner,muxval" property in addition to the
> existing "allwinner,function" in the SoC's .dtsi would give us all the
> information we need. This could look like:
>
>         uart0_pins_a: uart0@0 {
>                 allwinner,pins =   "PB22", "PB23";
> +               allwinner,muxval = <0x02    0x02>;
>                 allwinner,function = "uart0";
>                 allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>                 allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>         };
>
> Would it make sense that I sit down and prototype such a driver?
>
> We should keep compatibility with older DTs by keeping the existing
> drivers in (or maybe emulating the current behaviour by providing just
> those tables as a fallback) , but newer SoCs (like the A64?) would not
> need a SoC specific driver, but just go with that generic driver and
> appropriate DT properties.
>
> I appreciate any comments on this, especially if I missed something
> which would render this approach impossible or tedious.
AFAIK, there are lot of holes in pin conf registers.
This will complicate the dtsi configuration.
The current pinctrl driver is best possible solution with respect to time
and availability of limited people working on sunxi with the cost of
increase in code size.

It's better to give it a shot to make it generic driver for future SOCs
atleast. Like A83, A64, etc.

Possible solution will always be examined by experts Linus, Maxine, etc.

Regards,
Vishnu

>
> Cheers,
> Andre.
>
> --
> You received this message because you are subscribed to the Google Groups
"linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an
email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a113ff69c4a80170528856ffa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hello Andre, <br>
This is something we can do for future SOCs.</p>
<p dir=3D"ltr">On 4 Jan 2016 19:02, &quot;Andre Przywara&quot; &lt;<a href=
=3D"mailto:andre.przywara-5wv7dgnIgG8@public.gmane.org">andre.przywara-5wv7dgnIgG8@public.gmane.org</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; while looking at the Allwinner A64 SoC support, I was wondering why we=
<br>
&gt; would actually need a pinctrl driver (file) for each and every Allwinn=
er<br>
&gt; SoC that we support.<br>
&gt; Looking at both the A20 and the A64 doc I don&#39;t see any difference=
s in<br>
&gt; the port controller implementation apart from the actual<br>
&gt; muxval &lt;-&gt; subsystem assignment, which is just data, right?<br>
&gt; Comparing the code files in drivers/pinctrl/sunxi seems to support thi=
s,<br>
&gt; as those drivers only consist of the table and some boilerplate code.<=
br>
&gt;<br>
&gt; Now I was wondering whether we could get away with one generic Allwinn=
er<br>
&gt; pinctrl driver and put the SoC specific pin assignments in DT instead.=
<br>
&gt; It looks like adding an &quot;allwinner,muxval&quot; property in addit=
ion to the<br>
&gt; existing &quot;allwinner,function&quot; in the SoC&#39;s .dtsi would g=
ive us all the<br>
&gt; information we need. This could look like:<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 uart0_pins_a: uart0@0 {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner,pins=
 =3D=C2=A0 =C2=A0&quot;PB22&quot;, &quot;PB23&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,muxv=
al =3D &lt;0x02=C2=A0 =C2=A0 0x02&gt;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner,func=
tion =3D &quot;uart0&quot;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner,driv=
e =3D &lt;SUN4I_PINCTRL_10_MA&gt;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner,pull=
 =3D &lt;SUN4I_PINCTRL_NO_PULL&gt;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;<br>
&gt; Would it make sense that I sit down and prototype such a driver?<br>
&gt;<br>
&gt; We should keep compatibility with older DTs by keeping the existing<br=
>
&gt; drivers in (or maybe emulating the current behaviour by providing just=
<br>
&gt; those tables as a fallback) , but newer SoCs (like the A64?) would not=
<br>
&gt; need a SoC specific driver, but just go with that generic driver and<b=
r>
&gt; appropriate DT properties.<br>
&gt;<br>
&gt; I appreciate any comments on this, especially if I missed something<br=
>
&gt; which would render this approach impossible or tedious.<br>
AFAIK, there are lot of holes in pin conf registers. <br>
This will complicate the dtsi configuration.<br>
The current pinctrl driver is best possible solution with respect to time a=
nd availability of limited people working on sunxi with the cost of increas=
e in code size.</p>
<p dir=3D"ltr">It&#39;s better to give it a shot to make it generic driver =
for future SOCs atleast. Like A83, A64, etc.</p>
<p dir=3D"ltr">Possible solution will always be examined by experts Linus, =
Maxine, etc.</p>
<p dir=3D"ltr">Regards,<br>
Vishnu</p>
<p dir=3D"ltr">&gt;<br>
&gt; Cheers,<br>
&gt; Andre.<br>
&gt;<br>
&gt; --<br>
&gt; You received this message because you are subscribed to the Google Gro=
ups &quot;linux-sunxi&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send=
 an email to <a href=3D"mailto:linux-sunxi%2Bunsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">=
linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br>
&gt; For more options, visit <a href=3D"https://groups.google.com/d/optout"=
>https://groups.google.com/d/optout</a>.<br>
</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a113ff69c4a80170528856ffa--
