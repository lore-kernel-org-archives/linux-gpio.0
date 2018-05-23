From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: rockchip: Add set_config callback support for
 gpiolib
Date: Wed, 23 May 2018 11:36:29 +0200
Message-ID: <CACRpkdaGTLgE-bApn5arUFhHT_4bJMrJN1oYk5LNW3mKSUzkjQ@mail.gmail.com>
References: <1525334682-222918-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1525334682-222918-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 3, 2018 at 10:04 AM, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:

> Could only support PIN_CONFIG_INPUT_DEBOUNCE now as the HW block
> is too simple to support others. But even wrt. debounce capability,
> it now could only support very limited period of time to satisfy the
> real usecase. But still be useful to enable the crippled HW debounce
> to prevent any spurious glitches from waking up the system if the
> gpio is conguired as wakeup interrupt source.
>
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Hi Linus,
>
> This patch comes from our early discussion of debounce of cd-gpios for sd card
> that I pointed out that rockchip's platform lacks HW debounce support, but I
> think it's overkilled. It does have HW debounce but not really useful as the
> debounce period is toooo short and almost fixed. But something is better than
> nothing, so I'd like to enable it for filtering glitches, since cd-gpios for
> sd card is allow to configured as wakeup source. ;)

OK with the fat comment in there it sure makes sense like this,
so patch applied.

What I want to do is to pull in the timer-based debounce emulation
from gpio_keys.c into GPIOLIB so this callback will fall back to
using timers to provide debounce on all platforms and not needing
reimplementations of debounce timers all over the kernel.

Yours,
Linus Walleij
