Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794774315;
	b=SYwj2Iv4eKgpYyodk3C/Mc4ynKp01PTC4BGDEzWIH8QM7E/PifmNfR6rxevtNZV2U82V
	 iZ1uhQSsKEI+9/6mHd3x29ZqvEf6fRy1ebHbmQgL+o4zATcdepuOn1CE4vAE/f1hQaSDq
	 8+Serbsk1HqJnrUzToAvYUqYDW08t3Bpsk50EuqLdiawcepfxmvH+C82mXZTeMs7rNi3M
	 g3KgdvbIQplLjS+d/KolT79cT9RM6qYHeIcYk7YYZeW1G2+iUpexi1yPri4qJoyQsIvws
	 EA3IEm75FdiHZIgJ5OznxZK6OJJwUAIEAcQLC/VB4rNnwnBbHuchXD60M2X9skOYThQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774315;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1nz1Ykq7g+3oRxt5ddabk8uqdrQNZUmiSqrKbbzB6r0=;
	b=b8aN63IO9NyrK3g4rVStdkCaZdsCYX36YlUtxh8A9HshnhwFzkXCwK1/B20ytjKiypOz
	 xaM8MqtdZfshZSMfehCr4MfhjQyhiHXrCKF8bMnwFjGpjy0M+dre5ifDAVhzim5+wWS7f
	 VRoXJMCHoaZqKj0FGr57yPvXhJg/LYxOErxLU0jhmgVK3F954VdhR+QXQ9oarTUGjioZN
	 ORjbkXbgzL6SWT/ewgRyxbqSLBq/IcB27JmNDC0vV+lDi+edOJ744+QIfBv10DmY6zXDB
	 ehT6HzCE1vEx8fJ0MVAyZyvqfcr/XQUJDWAFKvFbBvjxRIt+cbTQjJTW/+Zbkm5dsxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjnbdQJm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40E606A31F;
	Sun, 15 Nov 2026 20:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjnbdQJm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB07A1F000C4;
	Sun, 15 Nov 2026 20:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774315;
	bh=1nz1Ykq7g+3oRxt5ddabk8uqdrQNZUmiSqrKbbzB6r0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjnbdQJmSG/GNJHSUXyTFpmicMx0YVPrGOUqdRtv6vKHjw+VpD49nKxyzPJE/ID2M
	 WIOb2IsftL8MX30el6/C+PEITTXQNKqNszx0pQ0K/5hJTm2kJUN7cdM2nbEtLbiwLW
	 qUOg2lcYkIA4TXEY9MUZo5MmmeJIi9cpsSGamNnpmnKyW1OFDs4WfgwOpvJDlLToTC
	 bs/n4Nhihk7OUQwY89bANkLLpOdSq8dK8IYgYzeiG1mXkSIy7TOLqIm92+QGr4gZGe
	 gQ7Gasms1dA1PuCsGTdPN5SyoIha8zqnVg90eHLGyrzIQTSGhXY94fxItAFuRcQp74
	 imJuGxT1SwTiw==
Message-ID: <sashiko-outbox-215791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add Molokai TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-molokai-tlmm-v1-1-3ba4840002cb@yahoo.com>
References: <20261116-molokai-tlmm-v1-0-3ba4840002cb@yahoo.com>
 <20261116-molokai-tlmm-v1-1-3ba4840002cb@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 20:25:14 +0000
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
- [Low] dt-bindings: pinctrl: qcom: inconsistent indentation in
  molokai-tlmm example
--

commit 422a3a1a2e538d8b4b4ceddc48ac192080f17ae8
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

dt-bindings: pinctrl: qcom: Add Molokai TLMM

This commit adds the Device Tree binding schema for the Top Level Mode
Multiplexer (TLMM) pin controller on the Qualcomm Molokai (SM8845) SoC.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.=
yaml b/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml
> new file mode 100644
> index 0000000000000..9196902e37d6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tlmm: pinctrl@f100000 {
> +        compatible =3D "qcom,molokai-tlmm";
> +        reg =3D <0x0f100000 0x300000>;
> +        interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        gpio-ranges =3D <&tlmm 0 0 206>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +
> +        qup-spi4-state {
> +          pins =3D "gpio48", "gpio49", "gpio50", "gpio51";
> +          function =3D "qup1_se4";
> +        };
> +    };

[Severity: Low]
Should the properties inside qup-spi4-state be indented by 4 spaces
relative to the child node instead of 2?  Mixing 4-space and 2-space
indentation in the example triggers an indent-consistent warning from
scripts/dtc/dt-check-style.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-molokai-tl=
mm-v1-0-3ba4840002cb@yahoo.com?part=3D1
