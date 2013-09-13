From: Krzysztof Halasa <khc@pm.waw.pl>
Subject: Re: [PATCH 5/7] staging: media/lirc: switch to use gpiolib
Date: Fri, 13 Sep 2013 14:15:32 +0200
Message-ID: <m3d2ocvrx7.fsf@intrepid.localdomain>
References: <1378816283-8164-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378816283-8164-1-git-send-email-linus.walleij@linaro.org>
 (Linus Walleij's message of "Tue, 10 Sep 2013 14:31:23 +0200")
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
Cc: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> +++ b/drivers/staging/media/lirc/lirc_serial.c
> @@ -839,6 +839,16 @@ static int lirc_serial_probe(struct platform_device *dev)
>  {
>  	int i, nlow, nhigh, result;
>  
> +#ifdef CONFIG_LIRC_SERIAL_NSLU2
> +	/* This GPIO is used for a LED on the NSLU2 */
> +	result = devm_gpio_request(dev, NSLU2_LED_GRN, "lirc-serial");

Will this succeed with the LED driver already loaded? Should the user
unload it first?

Otherwise, while I don't have any of the hw in question, I can't see
other obvious problems, so for the whole patchset:

Acked-by: Krzysztof Halasa <khc@pm.waw.pl>
-- 
Krzysztof Halasa
