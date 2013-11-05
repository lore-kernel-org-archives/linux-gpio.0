From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM/serial: at91: specify RTS in DT using gpio
Date: Tue, 5 Nov 2013 17:57:05 +0100
Message-ID: <52792361.6030803@atmel.com>
References: <1383654959-18112-1-git-send-email-linus.walleij@linaro.org> <1383665383-5606-1-git-send-email-nicolas.ferre@atmel.com> <A7887CC8-A1F9-4A05-B7F5-4F69FD942F22@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:56775 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304Ab3KEQ5L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2013 11:57:11 -0500
In-Reply-To: <A7887CC8-A1F9-4A05-B7F5-4F69FD942F22@jcrosoft.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, "<gregkh@linuxfoundation.org> KH" <gregkh@linuxfoundation.org>, Alex Courbot <acourbot@nvidia.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On 05/11/2013 16:59, Jean-Christophe PLAGNIOL-VILLARD :
>
> On Nov 5, 2013, at 11:29 PM, Nicolas Ferre <nicolas.ferre@atmel.com> =
wrote:
>
>> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
>> ---
>> Documentation/devicetree/bindings/serial/atmel-usart.txt |  3 +++
>> drivers/tty/serial/atmel_serial.c                        | 13 ++++++=
++++---
>> 2 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/atmel-usart.tx=
t b/Documentation/devicetree/bindings/serial/atmel-usart.txt
>> index 2191dcb..3adc61c 100644
>> --- a/Documentation/devicetree/bindings/serial/atmel-usart.txt
>> +++ b/Documentation/devicetree/bindings/serial/atmel-usart.txt
>> @@ -10,6 +10,8 @@ Required properties:
>> Optional properties:
>> - atmel,use-dma-rx: use of PDC or DMA for receiving data
>> - atmel,use-dma-tx: use of PDC or DMA for transmitting data
>> +- rts-gpios: specify a GPIO for RTS line. It will use specified PIO=
 instead of the peripheral
>> +  function pin for the USART RTS feature. If unsure, don't specify =
this property.
>> - add dma bindings for dma transfer:
>> 	- dmas: DMA specifier, consisting of a phandle to DMA controller no=
de,
>> 		memory peripheral interface and USART DMA channel ID, FIFO configu=
ration.
>> @@ -28,6 +30,7 @@ Example:
>> 		interrupts =3D <7>;
>> 		atmel,use-dma-rx;
>> 		atmel,use-dma-tx;
>> +		rts-gpios =3D <&pioD 15 0>;
>> 	};
>
> gpios means 2 gpio
>
> I=92ll rts-gpio as we can only use one anyway

Cf. Andrew's comment.


>> - use DMA:
>> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/=
atmel_serial.c
>> index b4e0794..71f8ea9 100644
>> --- a/drivers/tty/serial/atmel_serial.c
>> +++ b/drivers/tty/serial/atmel_serial.c
>> @@ -35,6 +35,7 @@
>> #include <linux/platform_device.h>
>> #include <linux/of.h>
>> #include <linux/of_device.h>
>> +#include <linux/of_gpio.h>
>> #include <linux/dma-mapping.h>
>> #include <linux/atmel_pdc.h>
>> #include <linux/atmel_serial.h>
>> @@ -2327,6 +2328,7 @@ static int atmel_serial_probe(struct platform_=
device *pdev)
>> 	struct device_node *np =3D pdev->dev.of_node;
>> 	struct atmel_uart_data *pdata =3D dev_get_platdata(&pdev->dev);
>> 	void *data;
>> +	int rts_pin =3D -EINVAL;
>> 	int ret =3D -ENODEV;
>>
>> 	BUILD_BUG_ON(ATMEL_SERIAL_RINGSIZE & (ATMEL_SERIAL_RINGSIZE - 1));
>> @@ -2364,13 +2366,18 @@ static int atmel_serial_probe(struct platfor=
m_device *pdev)
>> 	 * structs to indicate "no RTS GPIO" instead of open-coding some
>> 	 * invalid value everywhere.
>> 	 */
>> -	if (pdata->rts_gpio > 0) {
>> -		ret =3D devm_gpio_request(&pdev->dev, pdata->rts_gpio, "RTS");
>> +	if (pdata && pdata->rts_gpio > 0)
>> +		rts_pin =3D pdata->rts_gpio;
>> +	else if (np)
>> +		rts_pin =3D of_get_named_gpio(np, "rts-gpios", 0);
>> +
>
> 	use directly port->rts_gpio  so we can drop the assign after
>
> 	if the gpio is invalid the port->rts_gpio need to be < 0 too

Yes this is definitively an option. I cook a v2 right now.

>
> Best Regards,
> J.
>
>> +	if (gpio_is_valid(rts_pin)) {
>> +		ret =3D devm_gpio_request(&pdev->dev, rts_pin, "RTS");
>> 		if (ret) {
>> 			dev_err(&pdev->dev, "error requesting RTS GPIO\n");
>> 			goto err;
>> 		}
>> -		port->rts_gpio =3D pdata->rts_gpio;
>> +		port->rts_gpio =3D rts_pin;
>> 		ret =3D gpio_direction_output(port->rts_gpio, 0);
>> 		if (ret) {
>> 			dev_err(&pdev->dev, "error setting up RTS GPIO\n");
>> --
>> 1.8.2.2
>>
>
>
>


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
