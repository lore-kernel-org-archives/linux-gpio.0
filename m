From: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
Subject: Re: Re: [PATCH v3] Fix sun7i pin assignment for IRQ's
Date: Sun, 21 Feb 2016 15:15:38 -0800 (PST)
Message-ID: <647915c7-8c4f-417a-87d0-93d59c83b5bc@googlegroups.com>
References: <1456060845-20692-1-git-send-email-henry@nitronetworks.nl>
 <20160221171830.GD19169@lukather> <4cf9dbe3-faa6-4729-87fd-0e7d9ce463b0@googlegroups.com>
 <CAGRGNgUHQM6GtOK5OV7ppS=zOVP1UmuKnxna=qTUF172fi6hjw@mail.gmail.com>
Reply-To: henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_709_745563192.1456096538848"
Return-path: <linux-sunxi+bncBDJ57UPZYEDRBG4KVG3AKGQECOWPVTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGRGNgUHQM6GtOK5OV7ppS=zOVP1UmuKnxna=qTUF172fi6hjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org, draakje197-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

------=_Part_709_745563192.1456096538848
Content-Type: multipart/alternative;
	boundary="----=_Part_710_1912963017.1456096538849"

------=_Part_710_1912963017.1456096538849
Content-Type: text/plain; charset=UTF-8



Op zondag 21 februari 2016 22:55:31 UTC+1 schreef Julian Calaby:

>
> I think Maxime is referring to the fact that your patch removes two 
> closing parenthesis when one would expect that you'd only remove one. 
>
> You have compiled the kernel with this patch applied and no other 
> modifications, right? 
>   
>

Hmm, I see your (and Maxime his) point.
I guess the C bank changes made it into the diff after testing the build.

For what its worth, I corrected and completely checked the new upcoming 
diff.
My apologies.

Regards,
Henry Paulissen

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_710_1912963017.1456096538849
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>Op zondag 21 februari 2016 22:55:31 UTC+1 schreef =
Julian Calaby:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0;marg=
in-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
<br>I think Maxime is referring to the fact that your patch removes two
<br>closing parenthesis when one would expect that you&#39;d only remove on=
e.
<br>
<br>You have compiled the kernel with this patch applied and no other
<br>modifications, right?
<br>=C2=A0
<br></blockquote><div><br>Hmm, I see your (and Maxime his) point.<br>I gues=
s the C bank changes made it into the diff after testing the build.<br><br>=
For what its worth, I corrected and completely checked the new upcoming dif=
f.<br>My apologies.<br><br>Regards,<br>Henry Paulissen<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_710_1912963017.1456096538849--

------=_Part_709_745563192.1456096538848--
