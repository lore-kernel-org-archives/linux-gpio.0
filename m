From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] pinctrl: at91: fix deferred probing support
Date: Fri, 13 Jul 2018 11:47:17 +0200
Message-ID: <20180713094717.GQ16084@piout.net>
References: <20180712192222.32481-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180712192222.32481-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Hi Rob,

On 12/07/2018 13:22:22-0600, Rob Herring wrote:
> AT91 pinctrl deferred probing support is broken if the GPIO devices
> haven't probed first and set gpio_banks to non-zero. The later condition
> that only some GPIO devices haven't probed can't actually happen as
> either all the GPIO devices have probed first or none of them have. Plus
> the pinctrl driver has already returned -EINVAL, so it's not on the
> deferred list to retry probing.
> 
> Fix this by consolidating the checking that all GPIO devices are probed.
> 
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This is a result of trying to remove of_platform_default_populate from 
> at91 code and relying on the DT core handling populating devices. That 
> changed the probe order and broke booting.
> 

This solves part of the issue but when tested with the
of_platform_default_populate removal, many drivers will fail with
gpiod_set_value: invalid GPIO (errorpointer)

or 

gpiod_get_value: invalid GPIO (errorpointer)

This happens both before and after the pinctrl driver probed.

I didn't investigate much yet.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
