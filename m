From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: sirf: atlas7: remove set but not used
 variables 'conf, bank'
Date: Wed, 5 Sep 2018 12:13:42 +0200
Message-ID: <CACRpkdY5qurpthqB8=ek5RhD3egXbceWi0RYK1P8pboH-KcA7Q@mail.gmail.com>
References: <1535681346-152447-1-git-send-email-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535681346-152447-1-git-send-email-yuehaibing@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: yuehaibing@huawei.com
Cc: Rob Herring <robh@kernel.org>, Barry Song <baohua@kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, ext Tony Lindgren <tony@atomide.com>, kernel-janitors@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 31, 2018 at 3:58 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/pinctrl/sirf/pinctrl-atlas7.c: In function 'atlas7_pinmux_resume_noirq':
> drivers/pinctrl/sirf/pinctrl-atlas7.c:5545:6: warning:
>  variable 'bank' set but not used [-Wunused-but-set-variable]
>   u32 bank;
>
> drivers/pinctrl/sirf/pinctrl-atlas7.c:5543:28: warning:
>  variable 'conf' set but not used [-Wunused-but-set-variable]
>   struct atlas7_pad_config *conf;
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
