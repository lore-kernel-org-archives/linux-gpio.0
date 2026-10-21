Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616197;
	b=PShnZnoIbkVwU7+04wFzg/6qw+HyTXhQDl0WEQM/PfMobw+wXsjCkYPrpjx88jap4jOx
	 PWJ0X1hXtqckjBZZ4RXx9MqDqa7/VdrVP2/p9ZOLjl/iefz0S/JcB2KFZ9Ulnur49hqQ8
	 vdrUBtOV0adn55AqTBeVXrQ9El3hxyNj+XJ2We0yzi1DFebSAB+2NFwTIFK1XtP/9caZa
	 IapUb5d9iWTgv0BDxCs35u8bWjuerWs0WwecAjCkwA9tbAo4JbQOXVbsC22hgnBVW6Akx
	 UjfZ8V6/bN2Pw7hYbgqip4CsR3BMPb8ZbAvkqyX/ZTeC+9rKcLW+EQ22Dvtou8hBcQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616197;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SyWw9riuY6evqe3+3SGGkGZ6bbCseAd9xjqX87/jjeM=;
	b=ohyEYH6ip85AsRM6qybK8u30/FGmDjXLULv9lztRGx0Ijhd3//CbbJOJejbg2mDTfwyq
	 7eOxibZ8K1EPL9ehMzP6z8tLOvEiWIxNDmMSwOT5Tp1lnP6BzzkYL9eoFFzfWRtlnL81V
	 1uqFZufIOrUNn9a3DWQYTdZ5kgd05huNA+11DxLyUawI5+rWA69+rqA6stkpxth52J5yn
	 +EU58NUmlB+uRope0om6KQ6wneEfj02sS5eZtj6POCOFIIkw1gmQHdpkD30G2MC7DzH6t
	 rtvZlUu43SdeVxP5yeOsM2kkxAOmz8GcoPYOibQ8QYgMAWgKrsttUVzXpp0jJqVXP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYyvTiwO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C43606A322
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 20:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYyvTiwO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2341F000C1;
	Wed, 21 Oct 2026 20:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792616196;
	bh=SyWw9riuY6evqe3+3SGGkGZ6bbCseAd9xjqX87/jjeM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=iYyvTiwOZscrrEagHvsJoIGfNrVYyrFInKNHqnN8Qc9OQloqy/bdutX6OuFbqKYYW
	 SQTRi7+b9XOo0mz2Ze5LylTKBv6JiGBK8ShqtKpWnvBzG0yIjvvvvPwbVZHO2H6e5j
	 XFCpwCBLt+egZZZF8KLgVyBggq4f4Ur+iEHHCkCmgUDY0/X7jBnLbIw2Pq/GOKEoqT
	 xNXn8dmuG8GOzW7cofUyAlQ8YVhfphdWvva4EDhb+97I65W5L1YNnMdua3lGOhBi3T
	 ZuGz6SVO33dqeXOJVSUHwwyfcHugzjhUt4AhZ/aUio9Lr+zCEoBkpzdCj+/5fp9uSR
	 l0tsAoI7RtrwA==
Message-ID: <sashiko-outbox-180664@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] gpiolib: Introduce
 devm_gpiochip_dispose_irq_mappings()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org
In-Reply-To: <20261021204654.1001101-2-andriy.shevchenko@linux.intel.com>
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
 <20261021204654.1001101-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 20:56:35 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpiolib: build failure in gpiochip_dispose_irq_mappings() without I=
RQ_DOMAIN
--

commit c8fefed15e55a94335f2d9f38c7ab3dbbe263c9b
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

gpiolib: Introduce devm_gpiochip_dispose_irq_mappings()

This commit introduces the devm_gpiochip_dispose_irq_mappings() helper in
drivers/gpio/gpiolib-devres.c to deduplicate disposing of GPIO chip IRQ
mappings on device removal.

> diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
> index 2ec825ffab7da..e7e6690d699e7 100644
> --- a/drivers/gpio/gpiolib-devres.c
> +++ b/drivers/gpio/gpiolib-devres.c
[ ... ]
> @@ -323,6 +324,38 @@ void devm_gpiod_put_array(struct device *dev, struct=
 gpio_descs *descs)
>  }
>  EXPORT_SYMBOL_GPL(devm_gpiod_put_array);
> =20
> +struct gpiochip_irqdomain {
> +	struct gpio_chip *gc;
> +	struct irq_domain *domain;
> +};
> +
> +static void gpiochip_dispose_irq_mappings(struct device *dev, void *res)
> +{
> +	struct gpiochip_irqdomain *gcirq =3D res;
> +
> +	for (unsigned int i =3D 0; i < gcirq->gc->ngpio; i++)
> +		irq_dispose_mapping(irq_find_mapping(gcirq->domain, i));
> +}

[Severity: Low]
Will gpiochip_dispose_irq_mappings() in drivers/gpio/gpiolib-devres.c fail
to build when CONFIG_GPIOLIB=3Dy and CONFIG_IRQ_DOMAIN is disabled?

In drivers/gpio/Makefile, gpiolib-devres.o is built whenever CONFIG_GPIOLIB
is enabled:

    obj-$(CONFIG_GPIOLIB)		+=3D gpiolib-devres.o

In drivers/gpio/Kconfig, GPIOLIB does not select IRQ_DOMAIN (only
GPIOLIB_IRQCHIP selects it).

In include/linux/irqdomain.h, irq_find_mapping() is only defined inside the
CONFIG_IRQ_DOMAIN block, while the fallback block for !CONFIG_IRQ_DOMAIN
provides a stub for irq_dispose_mapping() but omits irq_find_mapping():

    #else /* CONFIG_IRQ_DOMAIN */
    static inline void irq_dispose_mapping(unsigned int virq) { }
    static inline struct irq_domain *irq_find_matching_fwnode(...)
    {
            return NULL;
    }
    #endif /* !CONFIG_IRQ_DOMAIN */

Without a stub for irq_find_mapping() or a CONFIG_IRQ_DOMAIN guard, does
compiling drivers/gpio/gpiolib-devres.c with CONFIG_GPIOLIB=3Dy and
CONFIG_IRQ_DOMAIN=3Dn result in an implicit declaration error for
irq_find_mapping()?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021204654.1001=
101-1-andriy.shevchenko@linux.intel.com?part=3D1
