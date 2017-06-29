From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [patch 0/5] genirq: Distangle irq_request/release_resources() from
 irq_desc->lock
Date: Thu, 29 Jun 2017 23:33:34 +0200
Message-ID: <20170629213334.375848050@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Julia Cartwright <julia-acOepvfBmUk@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

The irq_request/release_resources() callbacks are a problem on RT as they
are called under irq_desc->lock with interrupts disabled.

Aside of that calling them under irq_desc->lock is conceptually wrong and
has a (hard to trigger and probably theoretical) issue in free_irq(). See
patch 4/5 for a detailed explanation.

The series contains also a fix for the exynos gpio driver, which fiddles
with the irq masking in the resource callbacks, which is bogus and
potentially harmful.

Finally it moves the irq timings deallocation out of the spin locked region.

Thanks,

	tglx
---
 drivers/pinctrl/samsung/pinctrl-exynos.c |    4 --
 include/linux/irqdesc.h                  |    3 +
 kernel/irq/irqdesc.c                     |    1 
 kernel/irq/manage.c                      |   47 +++++++++++++++++++------------
 4 files changed, 34 insertions(+), 21 deletions(-)
