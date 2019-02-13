From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] iio: adc: ti-ads7950: add GPIO support
Date: Tue, 12 Feb 2019 18:47:44 -0800
Message-ID: <CE4AF546-6CC0-4292-B5F5-6715C3EE7B6A@gmail.com>
References: <1550021937-12202-1-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550021937-12202-1-git-send-email-justinpopo6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, david@lechnology.com, linux-kernel@vger.kernel.org, jic23@kernel.org, Justin Chen <justinpopo6@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Justin,

This looks good, one comment below:


[snip]

>+static int ti_ads7950_init_gpio(struct ti_ads7950_state *st)
>+{
>+	int ret;
>+
>+	/* Initialize GPIO */
>+	mutex_lock(&st->slock);

Lock is acquired here=2E

>+
>+	/* Default to GPIO input */
>+	st->gpio_direction_bitmask =3D 0x0;
>+	st->single_tx =3D cpu_to_be16(TI_ADS7950_CR_GPIO |
>+				    (st->gpio_direction_bitmask &
>+				    TI_ADS7950_GPIO_MASK));
>+	ret =3D spi_sync(st->spi, &st->scan_single_msg);
>+	mutex_unlock(&st->slock);

then released here=2E

>+	if (ret)
>+		return ret;
>+
>+	/* Default to signal low */
>+	st->gpio_signal_bitmask =3D 0x0;
>+	st->single_tx =3D cpu_to_be16(TI_ADS7950_CR_MANUAL |
>+				    TI_ADS7950_CR_WRITE |
>+				    (st->gpio_signal_bitmask &
>+				    TI_ADS7950_GPIO_MASK));
>+	ret =3D spi_sync(st->spi, &st->scan_single_msg);
>+	mutex_unlock(&st->slock);

and here as well, presumably there should be a mutex_lock() guarding the s=
ignal bitmask and transaction, right?

Thanks!
--=20
Florian
