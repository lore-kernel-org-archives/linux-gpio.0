Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50514A6CE5;
	Mon, 12 Oct 2026 17:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827023; cv=none; b=D9dVggi3aaBbE3CQmRA0Gtv61Vx3ve+AIVs6bsmS0MWEl9ZftaKKNgJzb/esVmJrglN3y6BAfayF8u6bUw7HZA2QQ2f8wbHWtaOoDxS8F8ePEM4Z2GVweIEzEWaexuheDUM8bLHyUGyh4Xh8dJVeKvDNTgrIFK4jgwRzerEzHbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827023; c=relaxed/simple;
	bh=w4U2mjQrgrV2jinDY0uFmNpCmvJFibVAQ5YCWasR28M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GE53md1GwNyEEjN/5YF55dPRSV/yFle7CXHFOEcEL4N/eBc3ZJ8TKy7BeQTTNxQgQ6HodusVCRlHI0tVT6hGyBzyDgtbWBxfAd2Vvv324lgw4066L2+ItqSBCtKgZeTPgANfRQVtq35dmN/rV/HUWmgnzHz4yDqbwtjQKsBg+Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c00C3BT3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c00C3BT3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FACF1F0089B;
	Mon, 12 Oct 2026 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827022;
	bh=UDm18gR+jo6D+mQhGXenWu+V9QGjyv3Ut2UJKTZT7e4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c00C3BT3dU6T2WY5EWm3r6ahbNsFzZT02Xvyg3PPXF+PLIPr0k9xNajl9wyEz0Q/g
	 RG2BHVryvZjGPRahNDxOc8MX8UHhWQd+VRHpF3EIZQHOXsoJO/472G6iAnQlxoPO3n
	 mxeitWRJzrAgYplUCN4VF3vkH8ZrJ2PU/X8ZqISvnEOkH2kHXV04didfoLAnx0vP5w
	 BU3jrZ2+r8W7Jcqput8NGyFrPJ9NwiUwOoC8K1XoXnsQ4KXwkuRUR687myiihV5T8y
	 bAftfYMjuxR42rfUMTGWlU0t7EJHYD5AF8+09eMowaOEzj/McF3K5zM4+8khZ+83zz
	 6wRrkKW3aPRUQ==
Message-ID: <sashiko-outbox-168484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: gpio: Add NVIDIA LSTP GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: robh@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-1-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-1-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:43:41 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing interrupt-controller in required list
--

commit aeb4a4fc6444001bea560a7fa11534922cb0e28e
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

dt-bindings: gpio: Add NVIDIA LSTP GPIO
   =20
Add the binding for a GPIO channel of an NVIDIA LSTP USB adapter. The
node is a child of the adapter's USB device or interface node, matched
to a channel the device reports by reg and compatible.

> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml=
 b/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml
> new file mode 100644
> index 0000000000000..4ca5081e509d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml

[ ... ]

> +dependentRequired:
> +  interrupt-controller: ["#interrupt-cells"]
> +  "#interrupt-cells": [interrupt-controller]
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"

[Severity: Medium]
The documentation states this hardware is also an interrupt controller, but
this required list omits the interrupt-controller and #interrupt-cells
properties.

Should interrupt-controller and #interrupt-cells be moved from
dependentRequired into this unconditional required list? Subsystem rules
mandate that core hardware provider capabilities like an interrupt controll=
er
must be globally required with appropriate constraints. Placing them in
dependentRequired treats them as optional rather than globally required.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* Minimal: let firmware define pin count and names */
> +    interface {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        gpio@3 {
> +            compatible =3D "nvidia,lstp-gpio";
> +            reg =3D <3>;
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +        };
> +    };

[Severity: Medium]
Does this example omit the interrupt provider capabilities?

Subsystem rules require that all examples include all required properties.
If the interrupt-controller properties are made globally required, examples
1, 2, and 4 will also need to be updated to include them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D1
