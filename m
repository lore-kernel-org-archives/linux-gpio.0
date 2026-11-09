Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234881;
	b=xIHFNF6tBdzokfQR8nBTDwrq+gonRbHwG8lsq2m6trcGRhHkFPvOgpJZ04xMU/ly2ETI
	 4/VN1LoKxT2rC0eOZTYxznEXJPPwWZSxLnB8WLj7AVtRt6L9Eeb4+UHXpLPxUeBdZR9Ib
	 8IL2+lXqxyuiiv4oEpmYW3fjCYrLFhhlsNk1LfbNQXvaA2lMxJ3v/FFhm8hsBtZgYdqW+
	 9wwj4mI1XI2GlDcNoOihvLZiAfDn91Mb+Z1RJyCWNEYyWC8I+ffxn69/UDDzdg61NBzTN
	 49Q1H74Z7TxqbZOFZZpb4JOLkeieBirvHOy7HdAGk7vPdqb5YyRITXId7Mpxgdf812A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234881;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vo8rbuaeB0r9G7cEwH/mj66KH2pm8hQyOPB1Jv5nSyg=;
	b=ujn0/dujBmoHOs9BZ4rKG7qe0cajWoMk04KtYsUWlMbSsXRPEeSSVLAHX0bKJg+H9GnW
	 cD+BS76gzd8rjY5w0Rq8tfjSetctafG0k+MQnCHomOSzM5T8BP8OuI+XdzZFWMFN4Knx2
	 9RSF5iNLN54yOvvmZf1Rl+R1N30HR+Ff3kqg5PgCWo0Nmlre6Ln/woENdvHY/I82Ni7f7
	 KkT3fANTFeFxCPlZju0On7/x1bjSo1ACWtW7mM2MpiALuJ5MkjlAbA26NRFukQfy+dvfk
	 nDfFjHRj5tcxnA8/mB4ptXUOAoF3M7mLdr++vDYcw7DSoHB1E7BmIkd/wdoBkw+cNwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JcGS1fAU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AC606A31C
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JcGS1fAU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347251F008A1;
	Mon,  9 Nov 2026 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234881;
	bh=Vo8rbuaeB0r9G7cEwH/mj66KH2pm8hQyOPB1Jv5nSyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JcGS1fAUqxvXyKvuPvVq30O1bcgPaP2LpFiPMS8HsPS3FzNWm9gmuar0E4qNnCJJ4
	 k7l1AYzQX6LKF5wbCWsWIkMlsJivwBLheUel3s22ubJ4zAahCuhuqZNUKPmp1yI6pV
	 vaybqVrhIc8A8RIewbZPQoclbqhIAlIQnPGQqHLWacMU0RYe21J4yftpY1hslD3Jlw
	 6t9g6/2MdgU82l2Dm/BY8bBPBzzO0UCEBN7dcmPIjxtPnosaHmVI2pKbsIdh7SJvd+
	 9UW9cFXBaMDhKyF2dVPvKg7YM1ZXSwvhEGsaXISo5M2W8fuhgyOhxMfNPDrGY1IYrS
	 r8hjxuEubUx2g==
Message-ID: <sashiko-outbox-205116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpiolib: keep the line state workqueue alive until
 device release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261109-gpio-line-state-wq-uaf-v1-1-2e126ca3427d@oss.qualcomm.com>
References: <20261109-gpio-line-state-wq-uaf-v1-1-2e126ca3427d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 14:34:40 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] gpiolib: double destroy_workqueue() in gpiodev_release() on
  cdev add error
--

commit f0714550a8f7080c7dd00f07240622c9dd77f912
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpiolib: keep the line state workqueue alive until device release

This commit moves the destruction of gdev->line_state_wq from
gpiolib_cdev_unregister() to gpiodev_release() to avoid a use-after-free
race with concurrent gpiod_line_state_notify() calls during chip removal.

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index fbdeda2f27871..c954c7eec2bee 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c

[ ... ]

> @@ -898,6 +899,9 @@ static void gpiodev_release(struct device *dev)
>  	synchronize_srcu(&gdev->desc_srcu);
>  	cleanup_srcu_struct(&gdev->desc_srcu);
> =20
> +	if (gdev->line_state_wq)
> +		destroy_workqueue(gdev->line_state_wq);

[Severity: Medium]
Can this call destroy_workqueue() a second time on gdev->line_state_wq if
cdev_device_add() fails in gpiolib_cdev_register()?

drivers/gpio/gpiolib-cdev.c:gpiolib_cdev_register() {
	...
	ret =3D cdev_device_add(&gdev->chrdev, &gdev->dev);
	if (ret) {
		destroy_workqueue(gdev->line_state_wq);
		return ret;
	}
	...
}

When gpiolib_cdev_register() fails here, it destroys gdev->line_state_wq
without clearing the pointer.  The caller then unwinds via
gpio_device_put(gdev) -> gpiodev_release(), which sees the non-NULL
dangling pointer and calls destroy_workqueue() again, causing a
use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-gpio-line-=
state-wq-uaf-v1-1-2e126ca3427d@oss.qualcomm.com?part=3D1
