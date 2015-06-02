From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATH] Fix ies/smt and register irq fail bug.
Date: Mon, 1 Jun 2015 19:34:00 -0700
Message-ID: <1433212440.11936.3.camel@mussux00.eus.mediatek.inc>
References: <1432719835-18939-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1432719835-18939-1-git-send-email-hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2015-05-27 at 02:43 -0700, Hongzhou Yang wrote:
> Hi Linus,
> After integration test, we found some bugs in the code you just merged.
> The first is that I missed ies/smt configuration for MSDC3.
> The seconed is the if judgement for "interrupt-controller" I added last
> time should on the contrary. So adding these two patches to fix them.
> Sorry about this. And please help to merge them, many thanks.
> 
> These patches include below changes:
> - Adding MSDC3 ies/smt support for mt8173.
> - Since mt6397 is no need to support interrupt controller,
> I judged "interrupt-controller" property to skip it last time,
> but the if judgement should on the contrary, this is a bug.
> so adding this patch to fix it. 
>  
> Hongzhou Yang (2):
>   pinctrl: mediatek: Fix bug of ies/smt setting for mt8173.
>   pinctrl: mediatek: Fix pinctrl register irq fail bug.
> 
>  drivers/pinctrl/mediatek/pinctrl-mt8173.c     |   10 +++++++++-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    4 ++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> --
> 1.7.9.5
> 

Hi Linus,

Do you have any suggestion about these two patches?
Since we can't boot up device without these two patches, could
you please help to merge them?
Thank you very much.

Yours,
Hongzhou
