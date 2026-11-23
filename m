Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424758;
	b=wfDoUauBtED4vD/KRh+4vs4hiP+S0XT6ewNpvGkOQ4hBL49o3iJ/gLFMj2AiSR8FjP51
	 C69if0AOLMITVlUFDZphJSwd9x2g9xmvhlgZzD1HlsslS62TGbOKOzYl4bL16Orc6tczH
	 ShkpQeeBICcuJiuGvN8KlnPFIqf0E5k2f3D2kQfAOAtHbG40CVPdjKZKNLsESQrJNCVNg
	 T0HMrex6hdNfvtOwjXQMO6TbF88TKlthzR3B5x6qoUTidOe90jsO/QSSIZT5KihtDANML
	 1MmitE32unZ2Mu7KvbJO5Aq+uioFnVZ0YgGknM7MXt7suWR+KAAVbYFM169aToU8mQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ThoBWvF9UKP7IAhnIrgbSiIRQtjKbR2YP1YxwW6EA0g=;
	b=im11iDSPzJO/9EHH0rcC2B+xt0U6yDrQ1HlYpQxYYTa3niW7kEBL0CZSqSuvHn0n+DvZ
	 8144f51R1+bJXUyfBL5z7lK4I1zOZgH5V6zXl1anKqIhUIrntZDY/V0jNLuwBMabmxhc3
	 PWEfCDakO41paR/qoZ8a2mkz/7MDza8FBWIgcoHDhDHpz2CtxnbtM0uvA7HRIFqeCLkWA
	 3etRBBv79yrsy0UPJ+cy+zVT7Gebpq9X3ySQ9Gz7kgkT0wq5XKXXvQuUuyysfvxsZCDMq
	 LfVIk63mOlzZpSuD/qJWn+vYL/3G5jWdqu1TLcrZfRcQ4Un3AJOiPS+njTwds3ks//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhRAdUrz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25347606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhRAdUrz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3381F000CF;
	Mon, 23 Nov 2026 09:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795424757;
	bh=ThoBWvF9UKP7IAhnIrgbSiIRQtjKbR2YP1YxwW6EA0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jhRAdUrzUhZrU0egfSed76WnQz0CNboZuqNUC3bWXoEzI3iPvk+EZYvWqDp38PHnw
	 57C3FuUViA8bCO2fAWVeVSiMcXV7DPSo+NRPPfaFm86NYQkGXVjRpQoHiG7un+KwqN
	 k6Aed7M+CdEzlBkWs8dty73iQEhN5TK/3n3jtqgM1GX7harlrMU+fVXl55gNbl/BcL
	 nE0I9KyprqVxOLwaHpqYpyijRX6YA7wB55mWrcJ06i/ycpM8B3sBtfDaQVpcxyxczR
	 zarShCgdrpUelLpJVDnhy4DtVgnUuY5brEWfVMg1AHFB53YCyEKn9mqnFmRgWTf0tl
	 W/Ruv+Cl6XBGw==
Message-ID: <sashiko-outbox-228932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] [v8] gpiolib: remove linux/gpio.h
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261123085723.156933-3-arnd@kernel.org>
References: <20261123085723.156933-1-arnd@kernel.org>
 <20261123085723.156933-3-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:05:56 +0000
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
- [High] gpiolib: build failure in rsk7203_devices_setup() after
  removing linux/gpio.h
--

commit 29b33c0e6261ed7e945f5222da273adda4c798f3
Author: Arnd Bergmann <arnd@arndb.de>

gpiolib: remove linux/gpio.h

This commit removes the remaining includes of <linux/gpio.h> in gpiolib,
rbtx4927, and mm81x, and deletes include/linux/gpio.h.

> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> deleted file mode 100644
> index b0d4942a65de2..0000000000000
> --- a/include/linux/gpio.h
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * NOTE: This header *must not* be included.
> - *
> - * If you're implementing a GPIO driver, only include <linux/gpio/driver=
.h>
> - * If you're implementing a GPIO consumer, only include <linux/gpio/cons=
umer.h>
> - * If you're using the legacy interfaces, include <linux/gpio/legacy.h>
> - */
> -
> -#ifndef __LINUX_GPIO_H
> -#define __LINUX_GPIO_H
> -
> -#include <linux/types.h>
> -#ifdef CONFIG_GPIOLIB
> -#include <linux/gpio/consumer.h>
> -#endif
> -
> -#ifdef CONFIG_GPIOLIB_LEGACY
> -#include <linux/gpio/legacy.h>
> -#endif /* CONFIG_GPIOLIB_LEGACY */
> -
> -#endif /* __LINUX_GPIO_H */

[Severity: High]
Does removing include/linux/gpio.h break the build for
arch/sh/boards/mach-rsk/devices-rsk7203.c (CONFIG_SH_RSK7203)?

That file still includes <linux/gpio.h>, which now resolves to
include/uapi/linux/gpio.h without pulling in <linux/gpio/legacy.h>, leaving
gpio_request() undeclared in rsk7203_devices_setup():

arch/sh/boards/mach-rsk/devices-rsk7203.c:rsk7203_devices_setup() {
    ...
	/* Select pins for SCIF0 */
	gpio_request(GPIO_FN_TXD0, NULL);
	gpio_request(GPIO_FN_RXD0, NULL);
    ...
}

Should arch/sh/boards/mach-rsk/devices-rsk7203.c be updated to include
<linux/gpio/legacy.h>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123085723.1569=
33-1-arnd@kernel.org?part=3D2
