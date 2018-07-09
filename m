From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: aspeed: fix compile testing warning
Date: Mon, 9 Jul 2018 21:52:48 +0200
Message-ID: <CAK8P3a1cHSkG33c0N+8sYSC2WSGTVLWvCJmitjTnxOQQzrd4jw@mail.gmail.com>
References: <20180709145612.4166409-1-arnd@arndb.de>
 <3652696.6JvIze6Ubc@ws-140106>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3652696.6JvIze6Ubc@ws-140106>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Thierry Reding <treding@nvidia.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 9, 2018 at 5:31 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> On Monday, July 9, 2018, 4:56:03 PM CEST Arnd Bergmann wrote:
>> Gcc cannot always see that BUG_ON(1) is guaranteed to not
>> return, so we get a warning message in some configurations:
>>
>> drivers/gpio/gpio-aspeed.c: In function 'bank_reg':
>> drivers/gpio/gpio-aspeed.c:244:1: error: control reaches end of non-void
>> function [-Werror=return-type]
>>
>> Using a plain BUG() is easier here and avoids the problem.
>>
>> Fixes: 44ddf559d579 ("gpio: aspeed: Rework register type accessors")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/gpio/gpio-aspeed.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
>> index 1e00f4045f9d..2342e154029b 100644
>> --- a/drivers/gpio/gpio-aspeed.c
>> +++ b/drivers/gpio/gpio-aspeed.c
>> @@ -240,7 +240,7 @@ static inline void __iomem *bank_reg(struct aspeed_gpio
>> *gpio, case reg_cmdsrc1:
>>               return gpio->base + bank->cmdsrc_regs + GPIO_CMDSRC_1;
>>       }
>> -     BUG_ON(1);
>> +     BUG();
>>  }
>>
>>  #define GPIO_BANK(x) ((x) >> 5)
>
> Is the semantic of BUG() (and BUG_ON as well) to never return?

On most architectures and configurations yes, but not on some of
the minor architectures if CONFIG_BUG is disabled.

> If so, then
> just an idea: Is it possible to add some macro magic in BUG_ON(x) to fail
> compiling if x is compile-constant? Giving a hint the passed condition always
> fails, which indicates a problem, at least to me.

Not sure, that might not work well in cases where it's a compile-time
constant in some configurations but variable in others.

> From a short search I found this in drivers/gpu/vga/vgaarb.c L630-633:
>>       if (vgadev_find(pdev) != NULL) {
>>               BUG_ON(1);
>>               goto fail;
>>       }
> You can't fail with a BUG_ON(1) and try to do some error handling after that.

Right.

Traditionally when CONFIG_BUG was disabled, we would have continued
here, so that could have been intentional, but in any case a WARN_ON()
would have been more appropriate here.

      Arnd
