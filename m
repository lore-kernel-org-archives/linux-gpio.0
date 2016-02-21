From: hp197 <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
Subject: Re: [PATCH] Fix sun7i pin assignment for IRQ's
Date: Sat, 20 Feb 2016 17:15:17 -0800 (PST)
Message-ID: <ca3f6d77-6d71-4723-8b5b-876d7b68dc84@googlegroups.com>
References: <1456003710-14807-1-git-send-email-henry@nitronetworks.nl>
Reply-To: henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_5921_1057355744.1456017318103"
Return-path: <linux-sunxi+bncBDJ57UPZYEDRBJU7US3AKGQELNKHYQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1456003710-14807-1-git-send-email-henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

------=_Part_5921_1057355744.1456017318103
Content-Type: multipart/alternative;
	boundary="----=_Part_5922_1898216422.1456017318103"

------=_Part_5922_1898216422.1456017318103
Content-Type: text/plain; charset=UTF-8



Op zaterdag 20 februari 2016 22:28:35 UTC+1 schreef hp197:
>
> IRQ pins are now according this page: http://linux-sunxi.org/A20/PIO 
>
> Signed-off-by: hp197 <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org> 
> --- 
>  drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c | 14 -------------- 
>  1 file changed, 14 deletions(-) 
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c 
> b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c 
> index cf1ce0c..4db5e19 100644 
>
>
NAK, v2 incomming 

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_5922_1898216422.1456017318103
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>Op zaterdag 20 februari 2016 22:28:35 UTC+1 schree=
f hp197:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0=
.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">IRQ pins are now accor=
ding this page: <a href=3D"http://linux-sunxi.org/A20/PIO" target=3D"_blank=
" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/ur=
l?q\75http%3A%2F%2Flinux-sunxi.org%2FA20%2FPIO\46sa\75D\46sntz\0751\46usg\7=
5AFQjCNHuBR5Ct_BburfazeHZMvpp2IRppA&#39;;return true;" onclick=3D"this.href=
=3D&#39;http://www.google.com/url?q\75http%3A%2F%2Flinux-sunxi.org%2FA20%2F=
PIO\46sa\75D\46sntz\0751\46usg\75AFQjCNHuBR5Ct_BburfazeHZMvpp2IRppA&#39;;re=
turn true;">http://linux-sunxi.org/A20/PIO</a>
<br>
<br>Signed-off-by: hp197 &lt;<a href=3D"mailto:henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org" targ=
et=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;mailto:henry=
@nitronetworks.nl&#39;;return true;" onclick=3D"this.href=3D&#39;mailto:hen=
ry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org&#39;;return true;">henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org</a>&gt;
<br>---
<br>=C2=A0drivers/pinctrl/sunxi/<wbr>pinctrl-sun7i-a20.c | 14 -------------=
-
<br>=C2=A01 file changed, 14 deletions(-)
<br>
<br>diff --git a/drivers/pinctrl/sunxi/<wbr>pinctrl-sun7i-a20.c b/drivers/p=
inctrl/sunxi/<wbr>pinctrl-sun7i-a20.c
<br>index cf1ce0c..4db5e19 100644
<br><br></blockquote><div><br>NAK, v2 incomming <br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_5922_1898216422.1456017318103--

------=_Part_5921_1057355744.1456017318103--
