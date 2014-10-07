From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH RESEND] gpio: lib-sysfs: Add 'wakeup' attribute
Date: Tue, 7 Oct 2014 13:28:32 -0700
Message-ID: <f931db7ac1184254ba87b8abdba2a13a@BN1BFFO11FD013.protection.gbl>
References: <1409853506-26279-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1409853506-26279-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

just wanted to check on the status of this patch?

	Thanks,
	S=C3=B6ren

On Thu, 2014-09-04 at 10:58AM -0700, Soren Brinkmann wrote:
> Add an attribute 'wakeup' to the GPIO sysfs interface which allows
> marking/unmarking a GPIO as wake IRQ.
> The file 'wakeup' is created in each exported GPIOs directory, if an =
IRQ
> is associated with that GPIO and the irqchip implements set_wake().
> Writing 'enabled' to that file will enable wake for that GPIO, while
> writing 'disabled' will disable wake.
> Reading that file will return either 'disabled' or 'enabled' depening=
 on
> the currently set flag for the GPIO's IRQ.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> Hi all,
>=20
> I originally submitted this patch with a few fixes for Zynq's GPIO dr=
iver
> (https://lkml.org/lkml/2014/8/29/391). Since this change is not just
> Zynq-related and has broader impact, Linus asked me to post this agai=
n, separate
> from the Zynq series.
>=20
> Let me just quote myself from the original submission:
> "I'm still not fully convinced that the gpio_keys are the best
> replacement for the sysfs interface when it comes to inputs. For that
> reason and to have a way to do some quick wake testing, I'd like to
> propose adding the ability to control wake through the sysfs interfac=
e
> (patch 3)."
>=20
> 	Thanks,
> 	S=C3=B6ren
>=20
>  drivers/gpio/gpiolib-sysfs.c | 75 ++++++++++++++++++++++++++++++++++=
++++++----
>  1 file changed, 69 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysf=
s.c
> index 5f2150b619a7..aaf021eaaff5 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -286,6 +286,56 @@ found:
> =20
>  static DEVICE_ATTR(edge, 0644, gpio_edge_show, gpio_edge_store);
> =20
> +static ssize_t gpio_wakeup_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	ssize_t			status;
> +	const struct gpio_desc	*desc =3D dev_get_drvdata(dev);
> +	int			irq =3D gpiod_to_irq(desc);
> +	struct irq_desc		*irq_desc =3D irq_to_desc(irq);
> +
> +	mutex_lock(&sysfs_lock);
> +
> +	if (irqd_is_wakeup_set(&irq_desc->irq_data))
> +		status =3D sprintf(buf, "enabled\n");
> +	else
> +		status =3D sprintf(buf, "disabled\n");
> +
> +	mutex_unlock(&sysfs_lock);
> +
> +	return status;
> +}
> +
> +static ssize_t gpio_wakeup_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t size)
> +{
> +	int			ret;
> +	unsigned int		on;
> +	struct gpio_desc	*desc =3D dev_get_drvdata(dev);
> +	int			irq =3D gpiod_to_irq(desc);
> +
> +	mutex_lock(&sysfs_lock);
> +
> +	if (sysfs_streq("enabled", buf))
> +		on =3D true;
> +	else if (sysfs_streq("disabled", buf))
> +		on =3D false;
> +	else
> +		return -EINVAL;
> +
> +	ret =3D irq_set_irq_wake(irq, on);
> +
> +	mutex_unlock(&sysfs_lock);
> +
> +	if (ret)
> +		pr_warn("%s: failed to %s wake\n", __func__,
> +				on ? "enable" : "disable");
> +
> +	return size;
> +}
> +
> +static DEVICE_ATTR(wakeup, 0644, gpio_wakeup_show, gpio_wakeup_store=
);
> +
>  static int sysfs_set_active_low(struct gpio_desc *desc, struct devic=
e *dev,
>  				int value)
>  {
> @@ -526,7 +576,7 @@ static struct class gpio_class =3D {
>  int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
>  {
>  	unsigned long		flags;
> -	int			status;
> +	int			status, irq;
>  	const char		*ioname =3D NULL;
>  	struct device		*dev;
>  	int			offset;
> @@ -582,11 +632,24 @@ int gpiod_export(struct gpio_desc *desc, bool d=
irection_may_change)
>  			goto fail_unregister_device;
>  	}
> =20
> -	if (gpiod_to_irq(desc) >=3D 0 && (direction_may_change ||
> -				       !test_bit(FLAG_IS_OUT, &desc->flags))) {
> -		status =3D device_create_file(dev, &dev_attr_edge);
> -		if (status)
> -			goto fail_unregister_device;
> +	irq =3D gpiod_to_irq(desc);
> +	if (irq >=3D 0) {
> +		struct irq_desc *irq_desc =3D irq_to_desc(irq);
> +		struct irq_chip	*irqchip =3D irq_desc_get_chip(irq_desc);
> +
> +		if (direction_may_change ||
> +				!test_bit(FLAG_IS_OUT, &desc->flags)) {
> +			status =3D device_create_file(dev, &dev_attr_edge);
> +			if (status)
> +				goto fail_unregister_device;
> +		}
> +
> +		if (irqchip->flags & IRQCHIP_SKIP_SET_WAKE ||
> +				irqchip->irq_set_wake) {
> +			status =3D device_create_file(dev, &dev_attr_wakeup);
> +			if (status)
> +				goto fail_unregister_device;
> +		}
>  	}
> =20
>  	set_bit(FLAG_EXPORT, &desc->flags);
> --=20
> 2.1.0.1.g27b9230
>=20
