Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0812FC00D;
	Fri, 16 Oct 2026 04:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125622; cv=none; b=fVVU4eNNIKcHXGGfQqGIiIqrgSPkl2uDxsCS6aTID6Inhv/DXFnzgnmHKDTjrLFE7F6Ds2Bd0Q1eHwGGqxd/QUaul3kFN7tofnzgPCtkLu2Ehk6Do36rT5P/v9oHwoVFtkVkcA6/P5UqW+jFJW01Y/SuKGc2pxj5zGsPU9e6B8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125622; c=relaxed/simple;
	bh=Be7kAZtbPci2Lx5eAe0GgpJzAnFyAGBJ/c2V6FsDt18=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=f3UnizCjDIw99CD2CI+HnACmC6+DEVeNCRzX/AeUfHSjBIkqqwfjRUVe7JFZ4+UPzx62jv+HDYUgQQlE9HNMdhWYmpFWWolbFSh9fdCCA6Vi30VY9AmpoMObvXi8E+nDelvms0umQctcJlsGUEF55538HfO6ydiKnnUovBZDFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMyQl/io; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMyQl/io"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CDD1F000C4;
	Fri, 16 Oct 2026 04:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792125621;
	bh=4y2rYDHQw15yK47Tw3Nkh3SwtbqMrqo0WkKkldUSVAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMyQl/ioKvfGyoq/fMtUHDU+xaa4WGR/4Tvq46RUU6hoVWPjAqX5QgRp0QGtiX0/O
	 waWTylZBTiuaEzrFm1Xf1NiWMJYtzlWRKOs1eYAlXZjqGoVE9TluLyzAp0ZP0jJ2Zw
	 qRMgI/GT5XfLtFcj+wO8f5oYbwm6jGHqFbnh+wWn2eVgdi7NESG+oVjy8eeLA5F6l8
	 VDfky60O6t1tAErdEqcQ9zjXD8Ab+ziiH5E8okp6v/Fv5dnYfkOErfxwlqOxRxeUde
	 prEws8ShyEJXoJetf0r0PUtRK0i5FWggn6gDY2130cR413TpSVFvGLNXjjKN2PZHtc
	 qrk5VVZJ3d+dQ==
Message-ID: <sashiko-outbox-173794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: gpio-davinci: Add the tda54
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-upstream-tda54-gpio-v2-1-5c4f8b10cdbc@ti.com>
References: <20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com>
 <20261016-upstream-tda54-gpio-v2-1-5c4f8b10cdbc@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:40:20 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing interrupt-controller requirements for ti,td=
a54-gpio
--

commit 4e896075feb00707123d20bb29a2b6cd491b1238
Author: Aniket Limaye <a-limaye@ti.com>

dt-bindings: gpio: gpio-davinci: Add the tda54 support

This commit adds device tree binding support for the new TDA54 GPIO IP,
which supports level-triggered interrupts. It adds the "ti,tda54-gpio"
compatible string to the schema.

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/D=
ocumentation/devicetree/bindings/gpio/gpio-davinci.yaml
> index 1434d08f8b741..02b6b9a436a68 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> @@ -18,6 +18,7 @@ properties:
>                - ti,am654-gpio
>                - ti,j721e-gpio
>                - ti,am64-gpio
> +              - ti,tda54-gpio

[Severity: Medium]
Since the commit message indicates this hardware variant adds support for
level-triggered interrupts, implying the GPIO block acts as an interrupt
provider, should this binding enforce the presence of "interrupt-controller"
and "#interrupt-cells"?

Without an allOf/if-then conditional block requiring these properties
specifically for "ti,tda54-gpio", incomplete device tree nodes missing them
will silently pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-upstream-t=
da54-gpio-v2-0-5c4f8b10cdbc@ti.com?part=3D1
