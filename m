From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] RFT: gpio: adnp: switch to use irqchip helpers
Date: Wed, 4 Jun 2014 16:38:26 +0200
Message-ID: <20140604143825.GG28484@ulmo>
References: <1401715347-24996-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fnm8lRGFTVS/3GuM"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:55268 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752007AbaFDOlM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jun 2014 10:41:12 -0400
Received: by mail-we0-f175.google.com with SMTP id p10so8718020wes.34
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2014 07:41:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1401715347-24996-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Lars Poeschel <poeschel@lemonage.de>, Alexandre Courbot <acourbot@nvidia.com>, Roland Stigge <stigge@antcom.de>, Julian Scheel <julian.scheel@avionic-design.de>, Alban Bedel <alban.bedel@avionic-design.de>


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Adding a few more people from Avionic Design who might be able to test
this. I no longer have access to hardware with this controller.

Thierry

On Mon, Jun 02, 2014 at 03:22:27PM +0200, Linus Walleij wrote:
> This switches the ADNP GPIO driver to use the gpiolib
> irqchip helpers. Also do some random refactoring to make it
> look like most other GPIO drivers.
>=20
> Cc: Roland Stigge <stigge@antcom.de>
> Cc: Lars Poeschel <poeschel@lemonage.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> LPC32XX maintainers: please help out testing this.
> ---
>  drivers/gpio/Kconfig     |   1 +
>  drivers/gpio/gpio-adnp.c | 155 ++++++++++++++---------------------------=
------
>  2 files changed, 48 insertions(+), 108 deletions(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 4a1b5113e527..5db53cf49cd7 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -660,6 +660,7 @@ config GPIO_ADP5588_IRQ
>  config GPIO_ADNP
>  	tristate "Avionic Design N-bit GPIO expander"
>  	depends on I2C && OF_GPIO
> +	select GPIOLIB_IRQCHIP
>  	help
>  	  This option enables support for N GPIOs found on Avionic Design
>  	  I2C GPIO expanders. The register space will be extended by powers
> diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
> index b2239d678d01..c3a0cf497507 100644
> --- a/drivers/gpio/gpio-adnp.c
> +++ b/drivers/gpio/gpio-adnp.c
> @@ -6,10 +6,9 @@
>   * published by the Free Software Foundation.
>   */
> =20
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> -#include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/of_irq.h>
>  #include <linux/seq_file.h>
> @@ -27,8 +26,6 @@ struct adnp {
>  	unsigned int reg_shift;
> =20
>  	struct mutex i2c_lock;
> -
> -	struct irq_domain *domain;
>  	struct mutex irq_lock;
> =20
>  	u8 *irq_enable;
> @@ -253,6 +250,7 @@ static void adnp_gpio_dbg_show(struct seq_file *s, st=
ruct gpio_chip *chip)
>  static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios)
>  {
>  	struct gpio_chip *chip =3D &adnp->gpio;
> +	int err;
> =20
>  	adnp->reg_shift =3D get_count_order(num_gpios) - 3;
> =20
> @@ -272,6 +270,10 @@ static int adnp_gpio_setup(struct adnp *adnp, unsign=
ed int num_gpios)
>  	chip->of_node =3D chip->dev->of_node;
>  	chip->owner =3D THIS_MODULE;
> =20
> +	err =3D gpiochip_add(chip);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
> =20
> @@ -326,7 +328,8 @@ static irqreturn_t adnp_irq(int irq, void *data)
> =20
>  		for_each_set_bit(bit, &pending, 8) {
>  			unsigned int child_irq;
> -			child_irq =3D irq_find_mapping(adnp->domain, base + bit);
> +			child_irq =3D irq_find_mapping(adnp->gpio.irqdomain,
> +						     base + bit);
>  			handle_nested_irq(child_irq);
>  		}
>  	}
> @@ -334,35 +337,32 @@ static irqreturn_t adnp_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> -static int adnp_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> -{
> -	struct adnp *adnp =3D to_adnp(chip);
> -	return irq_create_mapping(adnp->domain, offset);
> -}
> -
> -static void adnp_irq_mask(struct irq_data *data)
> +static void adnp_irq_mask(struct irq_data *d)
>  {
> -	struct adnp *adnp =3D irq_data_get_irq_chip_data(data);
> -	unsigned int reg =3D data->hwirq >> adnp->reg_shift;
> -	unsigned int pos =3D data->hwirq & 7;
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct adnp *adnp =3D to_adnp(gc);
> +	unsigned int reg =3D d->hwirq >> adnp->reg_shift;
> +	unsigned int pos =3D d->hwirq & 7;
> =20
>  	adnp->irq_enable[reg] &=3D ~BIT(pos);
>  }
> =20
> -static void adnp_irq_unmask(struct irq_data *data)
> +static void adnp_irq_unmask(struct irq_data *d)
>  {
> -	struct adnp *adnp =3D irq_data_get_irq_chip_data(data);
> -	unsigned int reg =3D data->hwirq >> adnp->reg_shift;
> -	unsigned int pos =3D data->hwirq & 7;
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct adnp *adnp =3D to_adnp(gc);
> +	unsigned int reg =3D d->hwirq >> adnp->reg_shift;
> +	unsigned int pos =3D d->hwirq & 7;
> =20
>  	adnp->irq_enable[reg] |=3D BIT(pos);
>  }
> =20
> -static int adnp_irq_set_type(struct irq_data *data, unsigned int type)
> +static int adnp_irq_set_type(struct irq_data *d, unsigned int type)
>  {
> -	struct adnp *adnp =3D irq_data_get_irq_chip_data(data);
> -	unsigned int reg =3D data->hwirq >> adnp->reg_shift;
> -	unsigned int pos =3D data->hwirq & 7;
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct adnp *adnp =3D to_adnp(gc);
> +	unsigned int reg =3D d->hwirq >> adnp->reg_shift;
> +	unsigned int pos =3D d->hwirq & 7;
> =20
>  	if (type & IRQ_TYPE_EDGE_RISING)
>  		adnp->irq_rise[reg] |=3D BIT(pos);
> @@ -387,16 +387,18 @@ static int adnp_irq_set_type(struct irq_data *data,=
 unsigned int type)
>  	return 0;
>  }
> =20
> -static void adnp_irq_bus_lock(struct irq_data *data)
> +static void adnp_irq_bus_lock(struct irq_data *d)
>  {
> -	struct adnp *adnp =3D irq_data_get_irq_chip_data(data);
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct adnp *adnp =3D to_adnp(gc);
> =20
>  	mutex_lock(&adnp->irq_lock);
>  }
> =20
> -static void adnp_irq_bus_unlock(struct irq_data *data)
> +static void adnp_irq_bus_unlock(struct irq_data *d)
>  {
> -	struct adnp *adnp =3D irq_data_get_irq_chip_data(data);
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct adnp *adnp =3D to_adnp(gc);
>  	unsigned int num_regs =3D 1 << adnp->reg_shift, i;
> =20
>  	mutex_lock(&adnp->i2c_lock);
> @@ -408,26 +410,6 @@ static void adnp_irq_bus_unlock(struct irq_data *dat=
a)
>  	mutex_unlock(&adnp->irq_lock);
>  }
> =20
> -static int adnp_irq_reqres(struct irq_data *data)
> -{
> -	struct adnp *adnp =3D irq_data_get_irq_chip_data(data);
> -
> -	if (gpio_lock_as_irq(&adnp->gpio, data->hwirq)) {
> -		dev_err(adnp->gpio.dev,
> -			"unable to lock HW IRQ %lu for IRQ\n",
> -			data->hwirq);
> -		return -EINVAL;
> -	}
> -	return 0;
> -}
> -
> -static void adnp_irq_relres(struct irq_data *data)
> -{
> -	struct adnp *adnp =3D irq_data_get_irq_chip_data(data);
> -
> -	gpio_unlock_as_irq(&adnp->gpio, data->hwirq);
> -}
> -
>  static struct irq_chip adnp_irq_chip =3D {
>  	.name =3D "gpio-adnp",
>  	.irq_mask =3D adnp_irq_mask,
> @@ -435,29 +417,6 @@ static struct irq_chip adnp_irq_chip =3D {
>  	.irq_set_type =3D adnp_irq_set_type,
>  	.irq_bus_lock =3D adnp_irq_bus_lock,
>  	.irq_bus_sync_unlock =3D adnp_irq_bus_unlock,
> -	.irq_request_resources =3D adnp_irq_reqres,
> -	.irq_release_resources =3D adnp_irq_relres,
> -};
> -
> -static int adnp_irq_map(struct irq_domain *domain, unsigned int irq,
> -			irq_hw_number_t hwirq)
> -{
> -	irq_set_chip_data(irq, domain->host_data);
> -	irq_set_chip(irq, &adnp_irq_chip);
> -	irq_set_nested_thread(irq, true);
> -
> -#ifdef CONFIG_ARM
> -	set_irq_flags(irq, IRQF_VALID);
> -#else
> -	irq_set_noprobe(irq);
> -#endif
> -
> -	return 0;
> -}
> -
> -static const struct irq_domain_ops adnp_irq_domain_ops =3D {
> -	.map =3D adnp_irq_map,
> -	.xlate =3D irq_domain_xlate_twocell,
>  };
> =20
>  static int adnp_irq_setup(struct adnp *adnp)
> @@ -503,35 +462,28 @@ static int adnp_irq_setup(struct adnp *adnp)
>  		adnp->irq_enable[i] =3D 0x00;
>  	}
> =20
> -	adnp->domain =3D irq_domain_add_linear(chip->of_node, chip->ngpio,
> -					     &adnp_irq_domain_ops, adnp);
> -
> -	err =3D request_threaded_irq(adnp->client->irq, NULL, adnp_irq,
> -				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> -				   dev_name(chip->dev), adnp);
> +	err =3D devm_request_threaded_irq(chip->dev, adnp->client->irq,
> +					NULL, adnp_irq,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					dev_name(chip->dev), adnp);
>  	if (err !=3D 0) {
>  		dev_err(chip->dev, "can't request IRQ#%d: %d\n",
>  			adnp->client->irq, err);
>  		return err;
>  	}
> =20
> -	chip->to_irq =3D adnp_gpio_to_irq;
> -	return 0;
> -}
> -
> -static void adnp_irq_teardown(struct adnp *adnp)
> -{
> -	unsigned int irq, i;
> -
> -	free_irq(adnp->client->irq, adnp);
> -
> -	for (i =3D 0; i < adnp->gpio.ngpio; i++) {
> -		irq =3D irq_find_mapping(adnp->domain, i);
> -		if (irq > 0)
> -			irq_dispose_mapping(irq);
> +	err =3D gpiochip_irqchip_add(chip,
> +				   &adnp_irq_chip,
> +				   0,
> +				   handle_simple_irq,
> +				   IRQ_TYPE_NONE);
> +	if (err) {
> +		dev_err(chip->dev,
> +			"could not connect irqchip to gpiochip\n");
> +		return err;
>  	}
> =20
> -	irq_domain_remove(adnp->domain);
> +	return 0;
>  }
> =20
>  static int adnp_i2c_probe(struct i2c_client *client,
> @@ -558,33 +510,23 @@ static int adnp_i2c_probe(struct i2c_client *client,
>  	adnp->client =3D client;
> =20
>  	err =3D adnp_gpio_setup(adnp, num_gpios);
> -	if (err < 0)
> +	if (err)
>  		return err;
> =20
>  	if (of_find_property(np, "interrupt-controller", NULL)) {
>  		err =3D adnp_irq_setup(adnp);
> -		if (err < 0)
> -			goto teardown;
> +		if (err)
> +			return err;
>  	}
> =20
> -	err =3D gpiochip_add(&adnp->gpio);
> -	if (err < 0)
> -		goto teardown;
> -
>  	i2c_set_clientdata(client, adnp);
> -	return 0;
> =20
> -teardown:
> -	if (of_find_property(np, "interrupt-controller", NULL))
> -		adnp_irq_teardown(adnp);
> -
> -	return err;
> +	return 0;
>  }
> =20
>  static int adnp_i2c_remove(struct i2c_client *client)
>  {
>  	struct adnp *adnp =3D i2c_get_clientdata(client);
> -	struct device_node *np =3D client->dev.of_node;
>  	int err;
> =20
>  	err =3D gpiochip_remove(&adnp->gpio);
> @@ -594,9 +536,6 @@ static int adnp_i2c_remove(struct i2c_client *client)
>  		return err;
>  	}
> =20
> -	if (of_find_property(np, "interrupt-controller", NULL))
> -		adnp_irq_teardown(adnp);
> -
>  	return 0;
>  }
> =20
> --=20
> 1.9.3
>=20

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTjy9hAAoJEN0jrNd/PrOhff0QAI/y0NQhc1Z038GfH8CAiLxM
TOFW6cCltbqC1FpKhwnFX0VSnb/JGRsDiH7ssmmCCl36zvugafZDXroO3M4oI3U/
PwFmb1XA7r1W5OYbsEq4LFaaWroPE7VrNGFu63pzcSI243ZK8EPQzCmWE57yl6KP
P/K8429l0RNxG07MwHjVJ8dYiGJBMgmZvxjZGmhQQCe4nulDm71/FsR+KexLXAOQ
+qfBoCt2uuXUgFqnioD7D1HEMXvAFG6xlOdpSqpv226b+2MV0OzLHQZaaJzJ6BSz
+lj47+jn8AUDsZcwqYkXPFs84Vw+qTtTiUM9Zx/nANl5j2bbI7wESEvTmx5LnEuq
n21chd86Xz608MXM9pGjv8y/ijUsqyQqTx081OZzsjTcXgrI5lZUEJN4iXkLYebr
kkqCFwFZODRhYTnbQp/nZnHBMqSliE9fmzfRUV150Smk5oGR4zkQWyJa/c++AP1a
HxlewQ3VgNOcTMCNBl3f7NM8zzV/oRu/gkVPdJXPbESFcpnmwA9kX10q7FuInh5n
xtdXQSze1z2earODCpWhUtjTd2ZIbHG23O3gYQVZoiaR1LRpgtF4ip/42k3EuYm1
k90zl6vyJUR3eVPFQNuj8ys3olRXnLtSXhgdjiyGlITEygjvHbX+1kHsQYBgFDg5
W74br2JderTaNF+OGPW/
=ohHL
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--
