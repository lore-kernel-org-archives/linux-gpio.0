From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Fri, 1 Jan 2016 09:56:01 +0800
Message-ID: <CAGS+omDesPTYHhVLv_EtQsYxa6MNuSi06MwcXz6RcY=uAcEtnQ@mail.gmail.com>
References: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
 <CACRpkdbRDzXunYK5d6Ld4Z2a=0mkp4KBvgL2P-St4P65Jajamw@mail.gmail.com>
 <20151230172212.GZ16023@sirena.org.uk>
 <CAGS+omA9AarzE2sp1Ry3RuOt8EOa-sL=DL1iDA2OeVVdjn=xgg@mail.gmail.com>
 <20151231220712.GD16023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20151231220712.GD16023-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Hi Mark,

Thanks for responding.

On Fri, Jan 1, 2016 at 6:07 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Dec 31, 2015 at 09:45:51PM +0800, Daniel Kurtz wrote:
>> On Thu, Dec 31, 2015 at 1:22 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> > I really don't think we should be applying this sort of stuff unless
>> > things are actively broken right now.  It's a bit of a rabbit hole we
>> > could spend a long time going down tweaking things for different
>> > systems in the same way that tweaking the link order can be and it masks
>> > the underlying issues.
>
>> Things are actively broken right now, in the sense that there are many
>> needless probe deferrals on boot.
>
> That's just noisy, everything does end up loading OK.

It's not just noisy, it also adds to boot time.

>  If the noise is a
> problem working on fixing the underlying problem with not being able to
> figure out dependencies seems like a better thing.  When we discussed
> this on the kernel summit list it wasn't clear everyone was convinced
> this was even a problem (I think it is since it obscures real
> information).  Actual breakage to me is something that never sorts
> itself out.
>
>> These are pinctrl drivers, which are required to load before every
>> other driver that requests a gpio.
>> AFAICT, the pinctrl is part of the platform "architecture", hence why
>> I suggest we move this to arch_initcall().
>
> This is exactly the sort of hacking that leads to problems

What problems?
More patches as people adjust / tune / optimize boot time, or something else?

> you can
> also make the same argument for a bunch of other things like regulators
> but then you find there's circular dependencies or extra devices with
> different requirements on some systems that cause further issues and
> need more special casing, or you find that some other device gets pushed
> earlier so you have to go round tweaking everything it uses.

For regulators, I think things are a bit more subtle.  Most regulators
are external components that can be used on different boards for
different purposes, so I can see an argument for treating them in a
more generic way by using a later device_initcall.  The exception
being architecture specific PMICs that only make sense when paired
with a specific small set of CPUs - and if you look, there are many
PMIC regulator drivers that are at earlier initcall levels, presumably
because they are required by cpufreq drivers, and/or their initcall
level is set as the same as the rest of the functions exposed by the
same PMIC MFD.

> It's not
> that the device is magic, it's that we don't understand how to handle
> dependencies well enough.  Raphael did say he was going to work on
> something for this, I'm not sure where it got to though.

Glad to hear it is a well recognized problem, and that people plan to
look into a fix.

>> arch_initcall() is also consistent with 39 other pinctrl drivers in
>> drivers/pinctrl.
>> 19 others use subsys_initcall(), core_initcall() or
>> postcore_initcall(), any of which would also work.
>
> It's fairly clear that there's at least a case for simplifying the
> existing practice here, for example by moving everything into a single
> (perhaps aliased) initcall rather than by randomly picking a level per
> system or by actually fiddling with the link ordering if the case is
> sufficiently clear that pinctrl in general ought to load earlier than it
> does.

Nothing above sounds like a reason not to merge this patch, however.
Why should we block useful patches that use existing tools to fix real
architecture-specific issues until new infrastructure is merged that
solves general problems?

-Dan
