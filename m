From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] ARM/serial: at91: specify RTS in DT using gpio
Date: Tue, 5 Nov 2013 23:59:38 +0800
Message-ID: <A7887CC8-A1F9-4A05-B7F5-4F69FD942F22@jcrosoft.com>
References: <1383654959-18112-1-git-send-email-linus.walleij@linaro.org>
 <1383665383-5606-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1383665383-5606-1-git-send-email-nicolas.ferre@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas FERRE <nicolas.ferre@atmel.com>
Cc: "<gregkh@linuxfoundation.org> KH" <gregkh@linuxfoundation.org>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, Alex Courbot <acourbot@nvidia.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, "<linux-arm-kernel@lists.infradead.org> mailing list" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org


On Nov 5, 2013, at 11:29 PM, Nicolas Ferre <nicolas.ferre@atmel.com> wrote:

> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
> Documentation/devicetree/bindings/serial/atmel-usart.txt |  3 +++
> drivers/tty/serial/atmel_serial.c                        | 13 ++++++++++-=
--
> 2 files changed, 13 insertions(+), 3 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/serial/atmel-usart.txt b/D=
ocumentation/devicetree/bindings/serial/atmel-usart.txt
> index 2191dcb..3adc61c 100644
> --- a/Documentation/devicetree/bindings/serial/atmel-usart.txt
> +++ b/Documentation/devicetree/bindings/serial/atmel-usart.txt
> @@ -10,6 +10,8 @@ Required properties:
> Optional properties:
> - atmel,use-dma-rx: use of PDC or DMA for receiving data
> - atmel,use-dma-tx: use of PDC or DMA for transmitting data
> +- rts-gpios: specify a GPIO for RTS line. It will use specified PIO inst=
ead of the peripheral
> +  function pin for the USART RTS feature. If unsure, don't specify this =
property.
> - add dma bindings for dma transfer:
> 	- dmas: DMA specifier, consisting of a phandle to DMA controller node,
> 		memory peripheral interface and USART DMA channel ID, FIFO configuratio=
n.
> @@ -28,6 +30,7 @@ Example:
> 		interrupts =3D <7>;
> 		atmel,use-dma-rx;
> 		atmel,use-dma-tx;
> +		rts-gpios =3D <&pioD 15 0>;
> 	};

gpios means 2 gpio =


I=92ll rts-gpio as we can only use one anyway



> =

> - use DMA:
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel=
_serial.c
> index b4e0794..71f8ea9 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -35,6 +35,7 @@
> #include <linux/platform_device.h>
> #include <linux/of.h>
> #include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> #include <linux/dma-mapping.h>
> #include <linux/atmel_pdc.h>
> #include <linux/atmel_serial.h>
> @@ -2327,6 +2328,7 @@ static int atmel_serial_probe(struct platform_devic=
e *pdev)
> 	struct device_node *np =3D pdev->dev.of_node;
> 	struct atmel_uart_data *pdata =3D dev_get_platdata(&pdev->dev);
> 	void *data;
> +	int rts_pin =3D -EINVAL;
> 	int ret =3D -ENODEV;
> =

> 	BUILD_BUG_ON(ATMEL_SERIAL_RINGSIZE & (ATMEL_SERIAL_RINGSIZE - 1));
> @@ -2364,13 +2366,18 @@ static int atmel_serial_probe(struct platform_dev=
ice *pdev)
> 	 * structs to indicate "no RTS GPIO" instead of open-coding some
> 	 * invalid value everywhere.
> 	 */
> -	if (pdata->rts_gpio > 0) {
> -		ret =3D devm_gpio_request(&pdev->dev, pdata->rts_gpio, "RTS");
> +	if (pdata && pdata->rts_gpio > 0)
> +		rts_pin =3D pdata->rts_gpio;
> +	else if (np)
> +		rts_pin =3D of_get_named_gpio(np, "rts-gpios", 0);
> +

	use directly port->rts_gpio  so we can drop the assign after

	if the gpio is invalid the port->rts_gpio need to be < 0 too

Best Regards,
J.

> +	if (gpio_is_valid(rts_pin)) {
> +		ret =3D devm_gpio_request(&pdev->dev, rts_pin, "RTS");
> 		if (ret) {
> 			dev_err(&pdev->dev, "error requesting RTS GPIO\n");
> 			goto err;
> 		}
> -		port->rts_gpio =3D pdata->rts_gpio;
> +		port->rts_gpio =3D rts_pin;
> 		ret =3D gpio_direction_output(port->rts_gpio, 0);
> 		if (ret) {
> 			dev_err(&pdev->dev, "error setting up RTS GPIO\n");
> -- =

> 1.8.2.2
> =
