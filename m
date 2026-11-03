Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707409;
	b=YGBzaZEHqJBOnsK+AwOorkIRU8byPBdSb87ZZJ/mJ48JBdVPtfJs3T/drioNdkVjEyDZ
	 /Lrs3NOuSdimp+8kijg5iGvomIUo8OvgB1hDEFeAT3lf5aPy1rUxENIErwwGNRf/CPPWt
	 DJqSJ1iOLWn9QwZWBzXNz+9JRoB5V+yPNtOPgEek1teU/f6f7k0lW3Wjw1jwuLkdocqfH
	 86+JynUinOBqW7cn5tyJhc1TI5AIuCLPj0NNlvTQdW7pv0gl8LHWCL6pnMcjRVEyI6elN
	 zI5IVlPsJCqZQGnoxcUbPDXy9Fnoptf14YY7BxA2sm3c/iaY0/eocK89LruIFnTzG8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707409;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y9aPNFGCvOBfYL6yagKJAZ1xf+M/uZ25jLOYEAEuavI=;
	b=suM257AakGjHFo2AHPCj3NucyRZ+ibXkHX2z4/BDJzNAMxJlIn/pjFQLyxjJLMZO711g
	 y7Tmnm+LQPnN8FWzrDRGlMD5whsfFJhbaBycf8kwxYW1bL0Z18xk2xXgjWyTBZo0vJx43
	 ngyFXtPR79sYdTYvQ75b1kMs2euBbGiEsUPOFU3NN8caE01zr2Gqx+SHW0QPPytSusPwJ
	 Fin8y1jmj2uI333EaNMEbb9zGSDBo/TCd0b67hWQ0S2FlJo54XOz+RkTJ6OX18DrY3vAW
	 m3SLteC2W/g5EG3vq+1OU0/JzW++Rga+7JrLn2X7tHYU/5/5q3zqV9DexQrXHEIAYKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gENvvwNA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C4F6082BD9
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gENvvwNA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82B71F00A21;
	Tue,  3 Nov 2026 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793707408;
	bh=y9aPNFGCvOBfYL6yagKJAZ1xf+M/uZ25jLOYEAEuavI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gENvvwNASVGvKxMfFIYUwM5zRjcywQyitw8Z9F10em4bd6laaTxDDATDJ5mBk0yi8
	 eje0wzcoJWIDGj9QpAm69FVuHLaDH0hh4HLFJPDwhneN4IqnNUqOjzSXVI1qGAvCVh
	 hIKJ1UqvHl7s4PhkeMa0P1ZjGW7cMzzjgSUYRSNASrvqgNwHhyyfWc4qTTrvt/ivQz
	 YM9jwmgAY1ecUjDABVeA1qBIi+lR2dsrALlcmBr7cRYMAqge8SCbyrwfMiDasOpntU
	 PDq6+3Ebwg5o8ufeBzPpQDnw5nfazTn3plChh+4w3NfzunsneTf+DUD+sBsrcrXgHd
	 6c7o4G3CV+zuA==
Message-ID: <sashiko-outbox-195211@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] gpiolib: let the character device free its IRQs
 first on chip removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261103-gpiolib-chip-removal-v5-7-aambrozewicz@nvidia.com>
References: <20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com>
 <20261103-gpiolib-chip-removal-v5-7-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 12:03:28 +0000
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
- [High] gpiolib: gpiochip_remove() frees remaining IRQs before shared prox=
y teardown
--

commit 07e6ca00e41fdaf7c8e36bd7d53c2988f88d1da3
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

gpiolib: let the character device free its IRQs first on chip removal

This commit reorders GPIO chip removal so that the device unregistration
notifier is invoked after clearing gdev->chip and waiting for an SRCU grace
period, allowing the character device to free its IRQs before
gpiochip_free_remaining_irqs() force-frees any remaining ones. It also
serializes character device release paths with the removal notifier so IRQs
are freed before unregistering from the notifier chain.

Link: https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@boot=
lin.com/

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ec5f81f4fd9e6..2aba76f79fd6c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c

[ ... ]

> @@ -1431,6 +1441,14 @@ void gpiochip_remove(struct gpio_chip *gc)
>  	/* Numb the device, cancelling all outstanding operations */
>  	rcu_assign_pointer(gdev->chip, NULL);
>  	synchronize_srcu(&gdev->srcu);
> +
> +	/*
> +	 * No new interrupts can be requested through the character device now.
> +	 * Have it free the ones it holds before forcibly freeing the rest, and
> +	 * both before the irqchip and its mappings go away.
> +	 */
> +	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
> +	gpiochip_free_remaining_irqs(gc);
>  	gpio_device_teardown_shared(gdev);

[Severity: High]
What happens here when the physical gpio_chip exposes shared lines through
gpio-shared-proxy devices?

When a character device client requests edge detection on a proxy gpio_devi=
ce
(proxy_gdev), gpio_shared_proxy_to_irq() delegates the IRQ mapping to the
underlying physical descriptor:

drivers/gpio/gpio-shared-proxy.c:gpio_shared_proxy_to_irq() {
	struct gpio_shared_proxy_data *proxy =3D gpiochip_get_data(gc);

	return gpiod_to_irq(proxy->shared_desc->desc);
}

Requesting the IRQ sets GPIOD_FLAG_USED_AS_IRQ on the physical chip's
descriptor via gpiochip_reqres_irq() -> gpiochip_lock_as_irq(), while the
character device registers its device_unregistered_nb notifier on
proxy_gdev->device_notifier.

During gpiochip_remove() on the physical chip, calling
blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL) only notifies
users of the physical gdev. Because gpiochip_free_remaining_irqs(gc) runs
before gpio_device_teardown_shared(gdev) tears down the child proxy devices
and triggers proxy_gdev->device_notifier, gpiod_free_irqs() will force-free
the IRQ still owned by the proxy character device while proxy_gdev is activ=
e:

drivers/gpio/gpiolib-cdev.c:free_line_irq() {
	const char *name =3D *label;

	if (irq && irq_has_action(irq))
		free_irq(irq, dev_id);

	free_irq_label(name);
	*label =3D NULL;
}

If linereq_free(), lineevent_free(), or linereq_set_config() on proxy_gdev
runs concurrently with gpiod_free_irqs(), could both paths call free_irq() =
and
trigger the "Trying to free already-free IRQ" warning, or could
free_line_irq() see irq_has_action(irq) return false right after __free_irq=
()
clears desc->action (before __synchronize_irq() and irq_stop_thread() finis=
h)
and free irq_label and the line state while the IRQ teardown or threaded
handler is still using them?

Should gpio_device_teardown_shared(gdev) be called before
gpiochip_free_remaining_irqs(gc) so that proxy character devices also relea=
se
their IRQs via their notifier before the remaining IRQs are force-freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-gpiolib-ch=
ip-removal-v5-0-aambrozewicz@nvidia.com?part=3D7
