From: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
Subject: Re: [PATCH v6] Fix sun7i pin assignment for IRQ's
Date: Thu, 25 Feb 2016 06:26:22 -0800 (PST)
Message-ID: <280e414e-546e-4a91-91a6-a4fa7157db49@googlegroups.com>
References: <1456161251-2303-1-git-send-email-henry@nitronetworks.nl>
 <20160225005412.GB4736@lukather>
 <CACRpkdYmf8-ZPV5q9H3cdZtQDUkbx=bcrVg9a8M3zEAifXxF9A@mail.gmail.com>
Reply-To: henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_72_871703851.1456410382138"
Return-path: <linux-sunxi+bncBDJ57UPZYEDRBDU6XS3AKGQEUGRALFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACRpkdYmf8-ZPV5q9H3cdZtQDUkbx=bcrVg9a8M3zEAifXxF9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, draakje197-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, andre.przywara-5wv7dgnIgG8@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

------=_Part_72_871703851.1456410382138
Content-Type: multipart/alternative;
	boundary="----=_Part_73_1279141662.1456410382138"

------=_Part_73_1279141662.1456410382138
Content-Type: text/plain; charset=UTF-8



Op donderdag 25 februari 2016 15:16:49 UTC+1 schreef Linus Walleij:

>
> I'm taking this patch out of my tree now following Maxime's comments. 
>
> I'm a bit annoyed that it is iterating too quickly as well, I will 
> wait and see for a while. 
>
>  
All of Maxime his questions where already answered in a reply to him at:
Date: Sun, 21 Feb 2016 11:27:46 -0800 (PST)

Patch V6 is the latest and final.
Code itself is reviewed and tested and the last few iterations where only 
cosmetic (changing description, etc).


Regards,
Henry

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_73_1279141662.1456410382138
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>Op donderdag 25 februari 2016 15:16:49 UTC+1 schre=
ef Linus Walleij:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0;m=
argin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
<br>I&#39;m taking this patch out of my tree now following Maxime&#39;s com=
ments.
<br>
<br>I&#39;m a bit annoyed that it is iterating too quickly as well, I will
<br>wait and see for a while.
<br>
<br></blockquote><div>=C2=A0</div><div>All of Maxime his questions where al=
ready answered in a reply to him at:<br>Date: Sun, 21 Feb 2016 11:27:46 -08=
00 (PST)<br><br>Patch V6 is the latest and final.<br>Code itself is reviewe=
d and tested and the last few iterations where only cosmetic (changing desc=
ription, etc).<br><pre><br>Regards,<br>Henry<br></pre></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_73_1279141662.1456410382138--

------=_Part_72_871703851.1456410382138--
