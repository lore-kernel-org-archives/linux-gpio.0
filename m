From: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
Subject: Re: [PATCH v3] Fix sun7i pin assignment for IRQ's
Date: Sun, 21 Feb 2016 11:27:46 -0800 (PST)
Message-ID: <4cf9dbe3-faa6-4729-87fd-0e7d9ce463b0@googlegroups.com>
References: <1456060845-20692-1-git-send-email-henry@nitronetworks.nl>
 <20160221171830.GD19169@lukather>
Reply-To: henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_7363_1379405858.1456082866803"
Return-path: <linux-sunxi+bncBDJ57UPZYEDRBM47VC3AKGQESTXBEMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160221171830.GD19169@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: draakje197-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

------=_Part_7363_1379405858.1456082866803
Content-Type: multipart/alternative;
	boundary="----=_Part_7364_1825373249.1456082866803"

------=_Part_7364_1825373249.1456082866803
Content-Type: text/plain; charset=UTF-8


Op zondag 21 februari 2016 18:18:37 UTC+1 schreef Maxime Ripard:

>
> Your commit log is going to need some work. Which bugs? What tests did 
> you make? Why are you making these changes while the datasheet says 
> otherwise? 
>

Its a fix for a not yet existing bug. I was fiddling around with IRQ's and 
couldn't get them to work.
I took a dumpster dive into it and found a shitload of contradicting 
manuals and datasheets.


Take for example the A20 user manual:
http://dl.linux-sunxi.org/A20/A20%20user%20manual%20v1.3%2020141010.pdf

(pin PI14)
Page 237: EINT26 is on mux *5* in the pin overview.
Page 288: EINT26 is on mux *6* in the registers.
 
Page 233: EINT12 is on pin PC19 mux6 in the pin overview.
Page 236: EINT12 is on pin PH12 mux6 in the pin overview.
Page 253: EINT12 is *not* on pin PC19 on the registers.
Page 281: EINT12 is on pin PH12 mux6 in the registers.

So manual may say otherwise, but I hope I have proven that the manual isn't 
to be trusted.

My patch is based onto testing from both me and Andre (apritzel).
He with a Banana PI M1 and me with a Cubietruck (both A20 soc).

We did a basic test by connecting a pulsing signal to a port and configure 
kernel to use irq.

e.g.
echo pin# > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio#/direction
echo rising > /sys/class/gpio/gpio#/edge

and check on /proc/interrupts to see if a irq was attached and if it was 
receiving.

Im not sure what andre his pulse source was, but mine was a 1pps coming 
from a gps.



> Have you tried to compile it? 
>
>
Yes, otherwise we could have never confirmed that the irq's where on mux6 
for the PI ports.

Regards,
Henry

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_7364_1825373249.1456082866803
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Op zondag 21 februari 2016 18:18:37 UTC+1 schreef Maxi=
me Ripard:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-l=
eft: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
<br>Your commit log is going to need some work. Which bugs? What tests did
<br>you make? Why are you making these changes while the datasheet says
<br>otherwise?
<br></blockquote><div><br>Its a fix for a not yet existing bug. I was fiddl=
ing around with IRQ&#39;s and couldn&#39;t get them to work.<br>I took a du=
mpster dive into it and found a shitload of contradicting manuals and datas=
heets.<br><br><br>Take for example the A20 user manual:<br>http://dl.linux-=
sunxi.org/A20/A20%20user%20manual%20v1.3%2020141010.pdf<br><br>(pin PI14)<b=
r>Page 237: EINT26 is on mux *5* in the pin overview.<br>Page 288: EINT26 i=
s on mux *6* in the registers.<br>=C2=A0<br>Page 233: EINT12 is on pin PC19=
 mux6 in the pin overview.<br>Page 236: EINT12 is on pin PH12 mux6 in the p=
in overview.<br>Page 253: EINT12 is *not* on pin PC19 on the registers.<br>=
Page 281: EINT12 is on pin PH12 mux6 in the registers.<br><br>So manual may=
 say otherwise, but I hope I have proven that the manual isn&#39;t to be tr=
usted.<br><br>My patch is based onto testing from both me and Andre (apritz=
el).<br>He with a Banana PI M1 and me with a Cubietruck (both A20 soc).<br>=
<br>We did a basic test by connecting a pulsing signal to a port and config=
ure kernel to use irq.<br><br>e.g.<br>echo pin# &gt; /sys/class/gpio/export=
<br>echo in &gt; /sys/class/gpio/gpio#/direction<br>echo rising &gt; /sys/c=
lass/gpio/gpio#/edge<br><br>and check on /proc/interrupts to see if a irq w=
as attached and if it was receiving.<br><br>Im not sure what andre his puls=
e source was, but mine was a 1pps coming from a gps.<br><br><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-l=
eft: 1px #ccc solid;padding-left: 1ex;">
<br>Have you tried to compile it?
<br>
<br></blockquote><div><br>Yes, otherwise we could have never confirmed that=
 the irq&#39;s where on mux6 for the PI ports.<br><br>Regards,<br>Henry<br>=
</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_7364_1825373249.1456082866803--

------=_Part_7363_1379405858.1456082866803--
