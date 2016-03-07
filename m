From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5] Fix sun7i pin assignment for IRQ's
Date: Mon, 7 Mar 2016 10:25:46 +0700
Message-ID: <CACRpkdYV_aNKCunVGDVr6iZ4viodyTNaRYcCyknQ6846YPShcA@mail.gmail.com>
References: <1456129208-11490-1-git-send-email-henry@nitronetworks.nl>
	<CACRpkdbbOyp-=5n64QBhigtAebKV5BmFcnvFumjXv3f8bj8pbg@mail.gmail.com>
	<fe1c8052-f313-415d-a5aa-cac61b492dd6@googlegroups.com>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARBO7J6O3AKGQEMD36Q4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <fe1c8052-f313-415d-a5aa-cac61b492dd6-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Henry P <draakje197-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2016 at 4:37 PM, Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org> wrote:
> Op donderdag 25 februari 2016 10:36:38 UTC+1 schreef Linus Walleij:
>>
>> Aha there is a v5. I took out the v4 and applied this
>> instead.
>
> There is also a v6.

Sigh this is too high iteration rate for me. At this point any changes need
to come as patches on top of v5.

Yours,
Linus Walleij
