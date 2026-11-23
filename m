Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433798;
	b=uCqKo6zb9AfXcq6GHciCJOVNbOFZeG3B7KAGVx+LHfob7SuXRnXBINTyRRwN/8qbaDhH
	 /+3MBHMnPAtfMFV2BDJy5NUv4EG2L/La4bXjkDmoilpTVyKKmZJl/ld1Ef3IdYxllrBKA
	 7vL+zsT1glqQghKwSXwQFTqxMT/V2XdS7T1+6zmBqMZgET9KecX5ppF/9wW33ij3caxy3
	 hl6Y6YeEf8uiYQDvF+CHmRkuq6ATzv/4uZseDEFphx30injC1QnT05fyZm4zJHSMVemw7
	 sI0i54tsApMzvHZkhHKGHw7626HC9zMI25M6t76+HdQgVrxtfuJ6EZ4ydf5F/5YMeLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vZYdA0fjzo7NjFJLaf6czIKNNxABIHmPQ8aqnddB+K8=;
	b=KfYAesWe3G0Ni706UsTA9bpvxL5SusR49cXYtyfB5JsGFH/puyqevCUpAetJhJERh+1h
	 qLlY2RQr8ok3KyDFaN0f8XwJoM7HPD2+lVBWUArqmhipdBklyyIgIINhRu1S4xDwhSU74
	 gd/s8oBhujPj7pdvjOujHkz5EzpwaC3PAmSTSagCRbbK9rqTJuXVOqUumDIH0aHb5zMZd
	 tgoCdozK5+d/1V4pVYiaAHD/WJHQJFzVvB7VkUmeu/nuc0LxI1Hy1tmvBjuqkb5lKZ24y
	 5X7bHy2ofctpaM5Gc/oSgd2Z+BEwu+aEJeUMBk1rDCVKGEqdz9rVSEbMrHC5hJG9RcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwQS4Kvc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC55B606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC55B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwQS4Kvc
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4c5d8c7f326so1273142b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 03:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795433796; cv=none;
        d=google.com; s=arc-20260327;
        b=iqoga9aj+VvGMWGbnCipnwNJayYHmrzzYNjNi2f2Y2BkdMmd7Y0NluCz7pdCOy+Nkb
         D/kAwnJWduAdUm26l6Wdx+WEaoEOza8fRs/h6wVAQyqpcGmi/MfTRQR0jxg0EUi6XgR9
         ogawNkfgBNanV/qfHZnPICrNddv/DmD3JNVdntyW2RBnYYh6W/es1rozXgb8HVrJEs3e
         DS4CCil61kHi/ZR4joh+cwSmJqiV55biB0fub4ICLR71QvaiQHTRic3e4WKmCTLY7ZGe
         oihHYuJQnlgogeUnMfOltQkIunw0L7iw7GNBshoPWEFfNQkRqExxwWH8a5vdQjNcqsk1
         c8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZYdA0fjzo7NjFJLaf6czIKNNxABIHmPQ8aqnddB+K8=;
        fh=VTfPfR6x6POwJjpcxStCC08LXB+WDKQKUZlOd00NBaA=;
        b=ZMyJa6j/aB1ugpgJ6yP11IuuV0FjeOnL+yTtBmxL5iykOBtoF1s72FuNwPz6fZ+QhM
         jShBAe61+rAJEttKzPcV/xuRs9l8spfoP2ekXT4/5Ijz2wLTiHQBLLuw8llXXRw/Fhum
         c5/XSxoJf3cCZ0IZE8Sa/7CkqPStUynIbyfSaFR6tmdWTJTL8TD9csU2qgtfrXGsXTTx
         K6PsQstUQqr33qFtsKLKqkI1627kqLeGnL5ogCDkhDT04naowpW34N3J+iLGzGDOquHh
         e0FrYV+7VMuhzEzKCedfVrivJjpioKw2fEkL7uBIMZoisyVjam4Yk6ch+O+GOUkmWc0y
         aE+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433796; x=1796038596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZYdA0fjzo7NjFJLaf6czIKNNxABIHmPQ8aqnddB+K8=;
        b=QwQS4Kvcmd9vEb9+JAVD5aspwCvbTumysoQQcTus9TF8U/CaBSd5oCYabzHDFOuQ07
         MJkNAsCZBDj1wjxufBnjMibbFVdh2QPtjnzQURGXXe4253k1vNxgSSunhgGTzEUj3Gbi
         H+C75OnI06SY7zJNZczKDJR1ovbVkWDzh+vjDdCnUPp3GowrdjW+4A5tj0UyUl/+d5A6
         i5niABJpDMHlOuM9YWAwx2BVlObp+cFJzKRGSDdqY2wYX/+RqYmhB/KhB2iI00242FAR
         Ctm6d10zT4+SrrXwmWC3UsoD9LWrk1IS9s2BghiEildugMzaEkvfIMBNjdqN3wfiqJOI
         YMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433796; x=1796038596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZYdA0fjzo7NjFJLaf6czIKNNxABIHmPQ8aqnddB+K8=;
        b=a2081nc3Hq+XDXCNO1UgYKcQibDj1/LR6zjVfg4b1iPASMWVNQk2kWvTx2JDikoyRo
         7sxA9J+IybslG0c5hTY4eaS3o8iRChXe6m0cdqwisaLkgB5/c3ULfvdspjrjCDR+VjQS
         pV+MSO4tlNR+QGAyUWln4J0FcUi0eRyHEOHNVVOv6IOQXDBh82wI4DQVLh+0XG3Bqdx/
         8AgP35Ls8fSOkrDJrV8VuvItA4CnaRIAaeT9lOw+hW1iYO9yowP+YtLAau+x5ybU7/BB
         UuisZM57SOmW4zGo6btHy5xcQalA2Z9ZYEBcdDSkZXOe0/2JJE1SIu/b2HIeLBH/5FFR
         sc3A==
X-Forwarded-Encrypted: i=1; AL+hErFv+U0ewIdlZOBgObAgB463TjSyQiuKSLXqe4DzcIeKX6XMywN6XYahpWtJEU7ZYfreky6ZiX/FzpWv@vger.kernel.org
X-Gm-Message-State: APuU4Z8wbry068IHHXyHBhyaeaxoMfgBP71XxcOEuLSKHFDi942NmqeR
	72Dk9F8UMmKgUddmQK19CbSA41UuZsKd1UHhg2EfTkVmRsxS4vEg28ilkGEcJMDVRaaPTZK3RZZ
	m1waDdVNRhPRLt1aIwd++NFP3pPYzP28=
X-Gm-Gg: AZFdTZeekYJzilYW4A6yYJlEkIxfcmNTqb4PU5vt6xqUr3qs826yENcGi5l5XcFf0h/
	GtoCR9ppJLUzzTRz1gDtWOD/E/wppOz78PW0tcFf/uwGz2LaLkr4f71YLWJpqgJ6MkFGRHuMlP5
	ZrfYUllZYGafSKLCU3sK4faghdIab/4/67GKUrX7V3pXAxdtSFg1QNOGhsD5ctFdXjPeQ+dcRfx
	p1WLgmXHX2TMxW8Z/ImIykMWOXuqVNRBa+kemTCC1kHVI1v/YTpnKaavaBd8/Sn6a7qXBcl1E9G
	KxpCU8uxcj6UUldA2gQem1RaixIvxK8z/P/K0ORgH00SXC0hgR1NzQguqNNKub0GG6eWj7WxSeV
	jzgE1/13w3T1UeMCcvbRv0MalD6T5K33vClBOpQ==
X-Received: by 2002:a05:6808:c1d3:b0:572:f1d1:d6b0 with SMTP id
 5614622812f47-57a0c9c5064mr10468841b6e.65.1795433796427; Mon, 23 Nov 2026
 03:36:36 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0935c08b-828e-4a8f-95fc-04b82ab30fe7@bytesatwork.ch>
 <knel65hfjbq3j4trrtrkdwg5brf4mu6md4fzudtkrf2mznqrnp@6nitoipqu7k5>
 <CAFOBSkR9eHu_2UZkyu-v8saQ2YrKNcQxbLbyKNkFWtZw3XvMMQ@mail.gmail.com>
 <CAFOBSkSHt5nwdqsf=V0esBh23oTkOzy--9-vBQFPBoroGK3-HA@mail.gmail.com> <0a4623a1-0c3e-4802-a7fd-cfceb84de40f@bytesatwork.ch>
In-Reply-To: <0a4623a1-0c3e-4802-a7fd-cfceb84de40f@bytesatwork.ch>
From: =?UTF-8?B?TWFyw61hIEdhcmPDrWEgRmVybsOhbmRleg==?= <mariagarcia7293@gmail.com>
Date: Mon, 23 Nov 2026 12:36:25 +0100
X-Gm-Features: Aa3M54rdAVV7C_gJbRBedZf3DzILP08z6Wnb27-Si90wiryMu0y7LUZ2-qCn2xc
Message-ID: <CAFOBSkRmgT2k37LEhxjfZBORgFnz-GiYayGKpy_Oo4ankO+P7Q@mail.gmail.com>
Subject: Re: gpio: pca953x: TCA6418 support and driver design
To: Guy Morand <guy.morand@bytesatwork.ch>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guy, Bartosz,

You may be surprised by my recent submission after Guy had also just
sent something. We discussed privately and have been testing and
discussing the fix together (on our respective setups that is), and
agreed on me sending it since we ended up using my code.

Thank you for your time.

Kind regards,

Maria Garcia.

El jue, 19 nov 2026 a las 9:55, Guy Morand
(<guy.morand@bytesatwork.ch>) escribi=C3=B3:
>
> Hi Bartosz, Mar=C3=ADa,
>
> Thanks for the quick feedback.
>
> Maria, my intention is not to assign blame. These issues can look like
> userspace bugs, so I would like to help prevent others from spending
> time debugging the wrong layer. I would be happy to work together on
> more specific test scenarios.
>
> Bartosz, I have implemented a preliminary set of changes to the TCA6418
> support in gpio-pca953x and tested input, output and interrupts on our
> board. I=E2=80=99ve included the patch below as a starting point for disc=
ussion,
> it is not yet a formal submission.
>
> My preference would be to move the TCA6418 support to a dedicated
> driver, since it requires a number of chip-specific operations. Our
> existing driver could serve as a starting point:
> https://github.com/bytesatwork/linux-imx/blob/baw-lf-6.18.20-2.0.0/driver=
s/gpio/gpio-tca6418.c
>
> By keeping the existing ti,tca6418 compatible, it will remain compatible
> with existing device trees.
>
> Maria, if you have time to test the dedicated driver with your hardware
> and use case, I would highly appreciate your feedback.
>
> Would you prefer that I prepare the dedicated driver as an RFC, or clean
> up the gpio-pca953x changes instead?
>
> Best regards,
> Guy Morand
> --
> bytesatwork
> Technoparkstrasse 7
> CH-8406 Winterthur
> Switzerland
>
>  From 5e4be90be3d240893bb1125b5b763493be6d2605 Mon Sep 17 00:00:00 2001
> From: Guy Morand <guy.morand@bytesatwork.ch>
> Date: Wed, 18 Nov 2026 09:33:49 +0100
> Subject: [PATCH] gpio: gpio-pca953x: Fix tca6418 support
>
> The original support was only working when configuring a single line,
> without changing its value at runtime (gpioset -c xxx 0=3D1). When
> toggling the line at runtime, multiple write was generated on the i2c
> bus which lead to corrupted register due to auto increment not being
> supported by the chip (gpioset -c xxx -t 10ms,10ms,0 0=3D0).
>
> Moreover, gpioget was not working due to regmap INPUT register not
> declared as volatile, reading a staled value.
>
> Interrupt handling was missing.
>
> To make it work, the following changes were done:
> * Do not use auto increment
> * Declare INT_STATUS and INPUT registers volatile
> * Add configuring interrupt handling registers
> * Add tca6418 specific interrupt handler
> * Revert the first bank bit order in set multiple line
>
> Signed-off-by: Guy Morand <guy.morand@bytesatwork.ch>
> ---
>   drivers/gpio/gpio-pca953x.c | 252 +++++++++++++++++++++++++++++++++---
>   1 file changed, 234 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index ead20c357418..bbedbd35e97c 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -10,6 +10,7 @@
>
>   #include <linux/atomic.h>
>   #include <linux/bitmap.h>
> +#include <linux/bitrev.h>
>   #include <linux/cleanup.h>
>   #include <linux/device.h>
>   #include <linux/errno.h>
> @@ -38,9 +39,14 @@
>   #define PCA953X_INVERT                0x02
>   #define PCA953X_DIRECTION     0x03
>
> +#define TCA6418_INT_STATUS     0x02
> +#define TCA6418_GPIO_INT_STATUS        0x11
>   #define TCA6418_INPUT         0x14
>   #define TCA6418_OUTPUT                0x17
> +#define TCA6418_GPIO_INT_ENABLE        0x1a
>   #define TCA6418_DIRECTION     0x23
> +#define TCA6418_GPIO_INT_LEVEL 0x26
> +#define TCA6418_GPI_INT                BIT(1)
>
>   #define REG_ADDR_MASK         GENMASK(5, 0)
>   #define REG_ADDR_EXT          BIT(6)
> @@ -385,22 +391,45 @@ static bool pcal6534_check_register(struct
> pca953x_chip *chip, unsigned int reg,
>         return true;
>   }
>
> +static void tca6418_revert_low_byte(unsigned long *reg_val)
> +{
> +       bitmap_set_value8(reg_val, bitrev8(bitmap_get_value8(reg_val, 0))=
,
> +                                         0);
> +}
> +
>   /* TCA6418 breaks the PCA953x register order rule */
>   static bool tca6418_check_register(struct pca953x_chip *chip, unsigned
> int reg,
>                                    u32 access_type_mask)
>   {
> -       /*  Valid Input Registers - BIT(0) for readable access */
> +       /*
> +        * BIT(0) readable
> +        * BIT(1) writable
> +        * BIT(2) volatile
> +        */
> +       if (reg =3D=3D TCA6418_INT_STATUS)
> +               return access_type_mask & (BIT(0) | BIT(1) | BIT(2));
> +
> +       if (reg >=3D TCA6418_GPIO_INT_STATUS &&
> +           reg < TCA6418_GPIO_INT_STATUS + NBANK(chip))
> +               return access_type_mask & (BIT(0) | BIT(2));
> +
>         if (reg >=3D TCA6418_INPUT && reg < (TCA6418_INPUT + NBANK(chip))=
)
> -               return (access_type_mask & BIT(0));
> +               return (access_type_mask & (BIT(0) | BIT(2)));
>
> -       /*  Valid Output Registers - BIT(1) for writeable access */
>         if (reg >=3D TCA6418_OUTPUT && reg < (TCA6418_OUTPUT + NBANK(chip=
)))
>                 return (access_type_mask & (BIT(0) | BIT(1)));
>
> -       /*  Valid Direction Registers - BIT(2) for volatile access */
> +       if (reg >=3D TCA6418_GPIO_INT_ENABLE &&
> +           reg < TCA6418_GPIO_INT_ENABLE + NBANK(chip))
> +               return access_type_mask & (BIT(0) | BIT(1));
> +
>         if (reg >=3D TCA6418_DIRECTION && reg < (TCA6418_DIRECTION + NBAN=
K(chip)))
>                 return (access_type_mask & (BIT(0) | BIT(1)));
>
> +       if (reg >=3D TCA6418_GPIO_INT_LEVEL &&
> +           reg < TCA6418_GPIO_INT_LEVEL + NBANK(chip))
> +               return access_type_mask & (BIT(0) | BIT(1));
> +
>         return false;
>   }
>
> @@ -711,14 +740,18 @@ static int pca953x_gpio_get_multiple(struct
> gpio_chip *gc,
>         if (ret)
>                 return ret;
>
> +       if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +               tca6418_revert_low_byte(reg_val);
> +
>         bitmap_replace(bits, bits, reg_val, mask, gc->ngpio);
>         return 0;
>   }
>
> -static int pca953x_gpio_set_multiple(struct gpio_chip *gc,
> -                                    unsigned long *mask, unsigned long *=
bits)
> +static int pca953x_gpio_set_multiple(struct gpio_chip *gc, unsigned
> long *mask,
> +                                    unsigned long *bits)
>   {
>         struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> +       bool is_tca6418 =3D PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA64=
18_TYPE;
>         DECLARE_BITMAP(reg_val, MAX_LINE);
>         int ret;
>
> @@ -728,8 +761,15 @@ static int pca953x_gpio_set_multiple(struct
> gpio_chip *gc,
>         if (ret)
>                 return ret;
>
> +       /* TCA6418's first bank is reversed relative to GPIO offsets. */
> +       if (is_tca6418)
> +               tca6418_revert_low_byte(reg_val);
> +
>         bitmap_replace(reg_val, reg_val, bits, mask, gc->ngpio);
>
> +       if (is_tca6418)
> +               tca6418_revert_low_byte(reg_val);
> +
>         return pca953x_write_regs(chip, chip->regs->output, reg_val);
>   }
>
> @@ -925,6 +965,74 @@ static void pca953x_irq_print_chip(struct irq_data
> *data, struct seq_file *p)
>         seq_puts(p, dev_name(gc->parent));
>   }
>
> +static int tca6418_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct pca953x_chip *pca953x =3D gpiochip_get_data(gc);
> +
> +       if (type !=3D IRQ_TYPE_EDGE_RISING && type !=3D IRQ_TYPE_EDGE_FAL=
LING) {
> +               dev_err(&pca953x->client->dev, "Only rising or falling ed=
ge are
> supported\n");
> +               return -EINVAL;
> +       }
> +
> +       return pca953x_irq_set_type(d, type);
> +}
> +
> +static void tca6418_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct pca953x_chip *chip =3D gpiochip_get_data(gc);
> +       struct device *dev =3D &chip->client->dev;
> +       DECLARE_BITMAP(irq_enabled, MAX_LINE);
> +       DECLARE_BITMAP(irq_level, MAX_LINE);
> +       DECLARE_BITMAP(irq_inputs, MAX_LINE);
> +       unsigned int offset;
> +       int ret;
> +
> +       bitmap_or(irq_inputs, chip->irq_trig_raise, chip->irq_trig_fall,
> +                 gc->ngpio);
> +       bitmap_copy(irq_enabled, chip->irq_mask, gc->ngpio);
> +       for_each_set_bit(offset, irq_inputs, gc->ngpio) {
> +               ret =3D pca953x_gpio_direction_input(gc, offset);
> +               if (ret) {
> +                       dev_err(dev, "failed to set IRQ line %u as input:=
 %d\n",
> +                               offset, ret);
> +                       clear_bit(offset, irq_enabled);
> +               }
> +       }
> +
> +       bitmap_copy(irq_level, chip->irq_trig_raise, gc->ngpio);
> +       tca6418_revert_low_byte(irq_level);
> +       tca6418_revert_low_byte(irq_enabled);
> +
> +       {
> +               guard(mutex)(&chip->i2c_lock);
> +               ret =3D pca953x_write_regs(chip, TCA6418_GPIO_INT_LEVEL,
> +                                        irq_level);
> +               if (!ret)
> +                       ret =3D pca953x_write_regs(chip, TCA6418_GPIO_INT=
_ENABLE,
> +                                                irq_enabled);
> +       }
> +       if (ret)
> +               dev_err(dev, "failed to configure TCA6418 interrupts: %d\=
n",
> +                       ret);
> +
> +       mutex_unlock(&chip->irq_lock);
> +}
> +
> +static const struct irq_chip tca6418_irq_chip =3D {
> +       .irq_mask               =3D pca953x_irq_mask,
> +       .irq_unmask             =3D pca953x_irq_unmask,
> +       .irq_set_wake           =3D pca953x_irq_set_wake,
> +       .irq_bus_lock           =3D pca953x_irq_bus_lock,
> +       .irq_bus_sync_unlock    =3D tca6418_irq_bus_sync_unlock,
> +       .irq_set_type           =3D tca6418_irq_set_type,
> +       .irq_shutdown           =3D pca953x_irq_shutdown,
> +       .irq_print_chip         =3D pca953x_irq_print_chip,
> +       .flags                  =3D IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>   static const struct irq_chip pca953x_irq_chip =3D {
>         .irq_mask               =3D pca953x_irq_mask,
>         .irq_unmask             =3D pca953x_irq_unmask,
> @@ -1011,6 +1119,80 @@ static bool pca953x_irq_pending(struct
> pca953x_chip *chip, unsigned long *pendin
>         return !bitmap_empty(pending, gc->ngpio);
>   }
>
> +static int tca6418_irq_pending(struct pca953x_chip *chip,
> +                              unsigned long *pending, bool *asserted)
> +{
> +       struct gpio_chip *gc =3D &chip->gpio_chip;
> +       struct device *dev =3D &chip->client->dev;
> +       u8 int_status[MAX_BANK];
> +       unsigned int status;
> +       int i, ret;
> +
> +       lockdep_assert_held(&chip->irq_lock);
> +       lockdep_assert_held(&chip->i2c_lock);
> +
> +       *asserted =3D false;
> +       ret =3D regmap_read(chip->regmap, TCA6418_INT_STATUS, &status);
> +       if (ret || !(status & TCA6418_GPI_INT))
> +               return ret;
> +
> +       *asserted =3D true;
> +       ret =3D regmap_bulk_read(chip->regmap, TCA6418_GPIO_INT_STATUS,
> +                              int_status, NBANK(chip));
> +       if (ret) {
> +               dev_err_ratelimited(dev, "failed read int status: %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       for (i =3D 0; i < NBANK(chip); i++)
> +               bitmap_set_value8(pending, int_status[i], i * BANK_SZ);
> +       tca6418_revert_low_byte(pending);
> +       bitmap_and(pending, pending, chip->irq_mask, gc->ngpio);
> +
> +       ret =3D regmap_write(chip->regmap, TCA6418_INT_STATUS, TCA6418_GP=
I_INT);
> +       if (ret)
> +               dev_err_ratelimited(dev, "failed to handle TCA6418 IRQ: %=
d\n", ret);
> +
> +       return ret;
> +}
> +
> +static irqreturn_t tca6418_irq_handler(struct pca953x_chip *chip)
> +{
> +       struct gpio_chip *gc =3D &chip->gpio_chip;
> +       struct device *dev =3D &chip->client->dev;
> +       DECLARE_BITMAP(pending, MAX_LINE);
> +       bool asserted =3D false;
> +       int level, ret;
> +
> +       for (;;) {
> +               bitmap_zero(pending, MAX_LINE);
> +               {
> +                       guard(mutex)(&chip->irq_lock);
> +                       guard(mutex)(&chip->i2c_lock);
> +                       ret =3D tca6418_irq_pending(chip, pending, &asser=
ted);
> +               }
> +
> +               if (ret || !asserted)
> +                       break;
> +
> +               for_each_set_bit(level, pending, gc->ngpio) {
> +                       int nested_irq =3D
> +                               irq_find_mapping(gc->irq.domain, level);
> +
> +                       if (unlikely(nested_irq <=3D 0)) {
> +                               dev_warn_ratelimited(
> +                                       dev, "unmapped interrupt %d\n", l=
evel);
> +                               continue;
> +                       }
> +                       handle_nested_irq(nested_irq);
> +               }
> +               if (ret)
> +                       break;
> +       }
> +
> +       return IRQ_RETVAL(asserted);
> +}
> +
>   static irqreturn_t pca953x_irq_handler(int irq, void *devid)
>   {
>         struct pca953x_chip *chip =3D devid;
> @@ -1019,6 +1201,9 @@ static irqreturn_t pca953x_irq_handler(int irq,
> void *devid)
>         int level;
>         bool ret;
>
> +       if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +               return tca6418_irq_handler(chip);
> +
>         bitmap_zero(pending, MAX_LINE);
>
>         scoped_guard(mutex, &chip->i2c_lock)
> @@ -1042,6 +1227,27 @@ static irqreturn_t pca953x_irq_handler(int irq,
> void *devid)
>         return IRQ_RETVAL(ret);
>   }
>
> +static int tca6418_irq_init(struct pca953x_chip *chip)
> +{
> +       DECLARE_BITMAP(disabled, MAX_LINE);
> +       u8 int_status[MAX_BANK];
> +       int ret;
> +
> +       bitmap_zero(disabled, MAX_LINE);
> +
> +       guard(mutex)(&chip->i2c_lock);
> +       ret =3D pca953x_write_regs(chip, TCA6418_GPIO_INT_ENABLE, disable=
d);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_bulk_read(chip->regmap, TCA6418_GPIO_INT_STATUS,
> +                              int_status, NBANK(chip));
> +       if (ret)
> +               return ret;
> +
> +       return regmap_write(chip->regmap, TCA6418_INT_STATUS, TCA6418_GPI=
_INT);
> +}
> +
>   static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
>   {
>         struct i2c_client *client =3D chip->client;
> @@ -1067,21 +1273,30 @@ static int pca953x_irq_setup(struct pca953x_chip
> *chip, int irq_base)
>         if (!(chip->driver_data & PCA_INT))
>                 return 0;
>
> -       ret =3D pca953x_read_regs(chip, chip->regs->input, irq_stat);
> -       if (ret)
> -               return ret;
> +       if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE) {
> +               ret =3D tca6418_irq_init(chip);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               ret =3D pca953x_read_regs(chip, chip->regs->input, irq_st=
at);
> +               if (ret)
> +                       return ret;
>
> -       /*
> -        * There is no way to know which GPIO line generated the
> -        * interrupt.  We have to rely on the previous read for
> -        * this purpose.
> -        */
> -       pca953x_read_regs(chip, chip->regs->direction, reg_direction);
> -       bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->ngpio);
> +               /*
> +                * There is no way to know which GPIO line generated the
> +                * interrupt.  We have to rely on the previous read for
> +                * this purpose.
> +                */
> +               pca953x_read_regs(chip, chip->regs->direction, reg_direct=
ion);
> +               bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->n=
gpio);
> +       }
>         mutex_init(&chip->irq_lock);
>
>         girq =3D &chip->gpio_chip.irq;
> -       gpio_irq_chip_set_chip(girq, &pca953x_irq_chip);
> +       if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +               gpio_irq_chip_set_chip(girq, &tca6418_irq_chip);
> +       else
> +               gpio_irq_chip_set_chip(girq, &pca953x_irq_chip);
>         /* This will let us handle the parent IRQ in the driver */
>         girq->parent_handler =3D NULL;
>         girq->num_parents =3D 0;
> @@ -1236,7 +1451,8 @@ static int pca953x_probe(struct i2c_client *client)
>
>         pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
>
> -       if (NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) =3D=3D PC=
A957X_TYPE) {
> +       if ((NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) =3D=3D
> PCA957X_TYPE) &&
> +           PCA_CHIP_TYPE(chip->driver_data) !=3D TCA6418_TYPE) {
>                 dev_info(dev, "using AI\n");
>                 regmap_config =3D &pca953x_ai_i2c_regmap;
>         } else {
> --
> 2.47.3
>
>
> On 18/11/2026 16:16, Mar=C3=ADa Garc=C3=ADa Fern=C3=A1ndez wrote:
> > (Resending in plain text mode, sorry)
> >
> > Hi Bartosz, Guy,
> >
> > Very sorry about these bugs you encountered. The testing I did back
> > then did not reveal any of these problems, and the teams that use this
> > chip in one of the products at the company where I work have never
> > complained about the chip not working properly. I will raise it ASAP
> > and have a look. We can try to work together on this and define more
> > specific testing scenarios other than the few tests I did by hand
> > myself. I do think at this point we may be better off moving the
> > TCA6418 to its own driver if the differences are so many.
> >
> > Thank you.
> >
> > Kind regards,
> >
> > Mar=C3=ADa Garc=C3=ADa.
> >
> >
> > El mi=C3=A9, 18 nov 2026 a las 16:04, Mar=C3=ADa Garc=C3=ADa Fern=C3=A1=
ndez
> > (<mariagarcia7293@gmail.com>) escribi=C3=B3:
> >>
> >> Hi Bartosz, Guy,
> >>
> >> Very sorry about these bugs you encountered. The testing I did back th=
en did not reveal any of these problems, and the teams that use this chip i=
n one of the products at the company where I work have never complained abo=
ut the chip not working properly. I will raise it ASAP and have a look. We =
can try to work together on this and define more specific testing scenarios=
 other than the few tests I did by hand myself. I do think at this point we=
 may be better off moving the TCA6418 to its own driver if the differences =
are so many.
> >>
> >> Thank you.
> >>
> >> Kind regards,
> >>
> >> Mar=C3=ADa Garc=C3=ADa.
> >>
> >> El mi=C3=A9, 18 nov 2026 a las 15:48, Bartosz Golaszewski (<brgl@kerne=
l.org>) escribi=C3=B3:
> >>>
> >>> On Wed, Nov 18, 2026 at 01:25:35PM +0100, Guy Morand wrote:
> >>>> Hi Linus, Bartosz, Maria,
> >>>>
> >>>> We have been testing the TCA6418 support added to gpio-pca953x by th=
e
> >>>> following patch:
> >>>> https://lore.kernel.org/all/20250703205740.45385-3-mariagarcia7293@g=
mail.com/
> >>>>
> >>>> On our board, using a 6.18-based NXP linux-imx kernel, the following=
 command
> >>>> does not toggle the requested GPIO as expected:
> >>>> gpioset -c /dev/gpiochip4 -t 10ms,10ms,0 0=3D0
> >>>>
> >>>> While investigating, we found several issues in the TCA6418 support:
> >>>> * The driver uses the PCA-style i2c auto-increment which is not docu=
mented
> >>>> in the TCA6418 datasheet, leading to corrupted registers.
> >>>> * Input-status registers are not marked volatile, so reads can retur=
n stale
> >>>> cached values.
> >>>> * The bulk get/set paths do not reverse the bit order of the first G=
PIO
> >>>> bank, so they can read or update the wrong line.
> >>>> * Interrupt handling is incomplete: the generic IRQ path does not co=
nfigure
> >>>> the TCA6418=E2=80=99s interrupt-enable and edge-selection registers =
or handle its
> >>>> status and acknowledgement registers.
> >>>>
> >>>> I have spent some time trying to fix the integration, but the TCA641=
8 seems
> >>>> to require several chip-specific operations.
> >>>> Before this support was added, we used an out-of-tree TCA6418 driver=
 that
> >>>> worked well for our use case.
> >>>>
> >>>> I think the current support needs to be fixed, but I=E2=80=99m unsur=
e whether it
> >>>> would be preferable to add the necessary chip-specific operations to
> >>>> gpio-pca953x or replace its TCA6418 support with a dedicated driver =
based on
> >>>> our existing one.
> >>>>
> >>>> I=E2=80=99m not familiar with the subsystem=E2=80=99s design prefere=
nces. Which approach
> >>>> would you prefer?
> >>>>
> >>>
> >>> It really depends on how much model-specific operations there are. If
> >>> every callback needs a completely different implementation for TCA641=
8
> >>> then clearly, a separate driver is the way to go. Just make sure it
> >>> doesn't break the ABI for OF systems.
> >>>
> >>> Bart
>
> --
> bytesatwork
> Technoparkstrasse 7
> CH-8406 Winterthur
> Switzerland
>
> phone: +41 52 213 79 79
>
