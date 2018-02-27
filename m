From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pinctrl/rockchip: Don't call pinctrl_force_* for nothing
Date: Mon, 26 Feb 2018 19:37:38 -0800
Message-ID: <A60B94B7-5A04-476E-A752-3CB990390D19@gmail.com>
References: <20180224200732.6116-1-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180224200732.6116-1-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On February 24, 2018 12:07:31 PM PST, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
>The rockchip pinctl driver calls pinctrl_force_default and
>pinctrl_force_sleep on suspend resume, but seems to expect
>that the outcome of these calls will be that nothing happens,
>as the core code checks whether we're already in the right
>state or not.
>
>Or at least, that was what the core code was doing until
>981ed1bfbc ("pinctrl: Really force states during suspend/resume"),
>which gives the "force" qualifier its actual meaning.
>
>In turn, this breaks suspend/resume on the rk3399. So let's
>change the rockchip code to do what it should have done from
>the very begining, which is exactly *nothing*.
>
>We take this opportunity to tidy-up the RK3288 GPIO6_C6 mux
>resume workaround, making it symetrical to the suspend path.
>
>Tested on a rk3399-based kevin Chromebook.

Glad you are not reverting the changes I did, but I can't comment whether this is the right think to do on such a Chromebook, FWIW:

Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Florian
