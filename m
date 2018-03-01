From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] pinctrl/rockchip: Don't call pinctrl_force_* for nothing
Date: Thu, 1 Mar 2018 09:40:39 +0000
Message-ID: <04120632-73ce-d505-b9ba-9672c2b2c515@arm.com>
References: <20180224200732.6116-1-marc.zyngier@arm.com>
 <CACRpkdaBbH_2KiQdrE9yZfJd0c97rTr_tF7vhSA_vCJF0L_sGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CACRpkdaBbH_2KiQdrE9yZfJd0c97rTr_tF7vhSA_vCJF0L_sGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On 01/03/18 09:32, Linus Walleij wrote:
> On Sat, Feb 24, 2018 at 9:07 PM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> 
>> The rockchip pinctl driver calls pinctrl_force_default and
>> pinctrl_force_sleep on suspend resume, but seems to expect
>> that the outcome of these calls will be that nothing happens,
>> as the core code checks whether we're already in the right
>> state or not.
>>
>> Or at least, that was what the core code was doing until
>> 981ed1bfbc ("pinctrl: Really force states during suspend/resume"),
>> which gives the "force" qualifier its actual meaning.
>>
>> In turn, this breaks suspend/resume on the rk3399. So let's
>> change the rockchip code to do what it should have done from
>> the very begining, which is exactly *nothing*.
>>
>> We take this opportunity to tidy-up the RK3288 GPIO6_C6 mux
>> resume workaround, making it symetrical to the suspend path.
>>
>> Tested on a rk3399-based kevin Chromebook.
>>
>> Fixes: 9198f509c888 ("pinctrl: rockchip: add suspend/resume functions")
>> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> 
> I assume I should drop this patch for now and that
> Dough's long DTS patch with the long explanation was the
> right solution to the problem?

Absolutely. It also appears that this patch has the potential to break
other Rockchip systems, so let's drop it.

Thanks again,

	M.
-- 
Jazz is not dead. It just smells funny...
