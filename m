From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Mon, 21 Dec 2015 14:51:14 +0800
Message-ID: <CAGS+omCDxj_wMDiAiywSv4hAtq6E9vm+CxgG8gs1TmrrS499mQ@mail.gmail.com>
References: <1450412497-25872-1-git-send-email-djkurtz@chromium.org>
 <1450451196.19539.9.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1450451196.19539.9.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 18, 2015 at 11:06 PM, Yingjoe Chen
<yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Fri, 2015-12-18 at 12:21 +0800, Daniel Kurtz wrote:
>> Move pinctrl initialization earlier in boot so that real devices can find
>> their pctldev without probe deferring.
>>
>> Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  drivers/pinctrl/mediatek/pinctrl-mt6397.c | 2 +-
>>  drivers/pinctrl/mediatek/pinctrl-mt8127.c | 2 +-
>>  drivers/pinctrl/mediatek/pinctrl-mt8135.c | 2 +-
>>  drivers/pinctrl/mediatek/pinctrl-mt8173.c | 2 +-
>>  4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
>> index f9751ae..a3780d4 100644
>> --- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
>> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
>> @@ -70,7 +70,7 @@ static int __init mtk_pinctrl_init(void)
>>       return platform_driver_register(&mtk_pinctrl_driver);
>>  }
>>
>> -module_init(mtk_pinctrl_init);
>> +arch_initcall(mtk_pinctrl_init);
>
>
> MT6397 is PMIC, which depends on pwrap on main AP to work. Since
> pmic-wrap itself is module_platform_driver, I think it make sense to
> keep this one as module_init. Maybe adding a comment to explain why it
> is different from others will help.

I interpret this the other way - I think that since the PMIC wrapper
provides a bus required for the system PMIC it should also be a
builtin and use arch_initcall.

WDYT?

-Dan
