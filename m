From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/7] misc: ixp4-beeper: switch to use gpiolib
Date: Tue, 10 Sep 2013 23:48:55 +0200
Message-ID: <201309102348.55478.arnd@arndb.de>
References: <1378816210-7977-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378816210-7977-1-git-send-email-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Halasa <khc@pm.waw.pl>
List-Id: linux-gpio@vger.kernel.org

On Tuesday 10 September 2013, Linus Walleij wrote:
> The platform using this beeper has support for gpiolib, so there
> is no point to use the custom gpio_line* API. A strange ambiguity
> where a line was first set as input and then driven high was
> solved by first driving the line high as output and then switch
> it to input.
> 
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Krzysztof Halasa <khc@pm.waw.pl>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Arnd/Greg: seeking your ACK to take this through the GPIO tree
> as part of the attempt at cleaning out custom GPIO implementations.

Acked-by: Arnd Bergmann <arnd@arndb.de>

>  
> -	 if (count) {
> -		gpio_line_config(pin, IXP4XX_GPIO_OUT);
> -		gpio_line_set(pin, IXP4XX_GPIO_LOW);
> -
> +	if (count) {
> +		gpio_direction_output(pin, 0);
>  		*IXP4XX_OSRT2 = (count & ~IXP4XX_OST_RELOAD_MASK) | IXP4XX_OST_ENABLE;
>  	} else {

Too bad we can't just clean up all the open-coded mmio accesses as well. It shouldn't
be hard, but some platforms are full of them, and there is definitely some regression
potential.

	Arnd
