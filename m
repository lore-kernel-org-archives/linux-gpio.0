From: Christian Ruppert <christian.ruppert@alitech.com>
Subject: Re: [PATCH] gpio: tb10x: Use the right include
Date: Mon, 20 Aug 2018 16:51:01 +0200
Message-ID: <2f031620-471a-aba5-ffaf-26a797e378a6@alitech.com>
References: <20180806142321.32025-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180806142321.32025-1-linus.walleij@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Acked-by: Christian Ruppert <christian.ruppert@alitech.com>

On 06.08.2018 16:23, Linus Walleij wrote:
> This driver includes the legacy <linux/gpio.h> and
> <linux/of_gpio.h> but all it needs is really <linux/gpio/driver.h>.
> 
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Christian Ruppert <christian.ruppert@alitech.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-tb10x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index ac6f2a9841e5..a12cd0b5c972 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -22,7 +22,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/slab.h>
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
> @@ -30,7 +30,6 @@
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> -#include <linux/of_gpio.h>
>  #include <linux/spinlock.h>
>  #include <linux/bitops.h>
>  #include <linux/pinctrl/consumer.h>
> 
