From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] pinctrl/rockchip: Don't call pinctrl_force_* for nothing
Date: Thu, 01 Mar 2018 10:52:12 +0100
Message-ID: <8494129.Zhd8RdA9ep@diego>
References: <20180224200732.6116-1-marc.zyngier@arm.com>
 <CACRpkdaBbH_2KiQdrE9yZfJd0c97rTr_tF7vhSA_vCJF0L_sGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CACRpkdaBbH_2KiQdrE9yZfJd0c97rTr_tF7vhSA_vCJF0L_sGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Am Donnerstag, 1. M=E4rz 2018, 10:32:22 CET schrieb Linus Walleij:
> On Sat, Feb 24, 2018 at 9:07 PM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrot=
e:
> > The rockchip pinctl driver calls pinctrl_force_default and
> > pinctrl_force_sleep on suspend resume, but seems to expect
> > that the outcome of these calls will be that nothing happens,
> > as the core code checks whether we're already in the right
> > state or not.
> > =

> > Or at least, that was what the core code was doing until
> > 981ed1bfbc ("pinctrl: Really force states during suspend/resume"),
> > which gives the "force" qualifier its actual meaning.
> > =

> > In turn, this breaks suspend/resume on the rk3399. So let's
> > change the rockchip code to do what it should have done from
> > the very begining, which is exactly *nothing*.
> > =

> > We take this opportunity to tidy-up the RK3288 GPIO6_C6 mux
> > resume workaround, making it symetrical to the suspend path.
> > =

> > Tested on a rk3399-based kevin Chromebook.
> > =

> > Fixes: 9198f509c888 ("pinctrl: rockchip: add suspend/resume functions")
> > Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> =

> I assume I should drop this patch for now and that
> Dough's long DTS patch with the long explanation was the
> right solution to the problem?

Correct this patch is not needed.

Thanks
Heiko
