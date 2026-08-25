Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626334F479;
	Tue, 25 Aug 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787642367; cv=none; b=gBqM6Lj2xWLwqC2FdQc1bdJcbmbkA7Nly0p8Yq5X3yKYlsd9jvr6sxkfYEpOsgMHQHfX6MYHmkmk4qu1+8anqtedEtvaIhN6Ph4i5Pcq9A8+AUE/ygPR8EBflR3YtEdBKl5f645AshZePBXqehutOb/l3Muzjy1f5dQD/0Ft6F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787642367; c=relaxed/simple;
	bh=PlAd0+5gOTNKNhRaNCaeHUNi+ThRt4Ds49wzRnnsfOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lwYdCfKvL38wY8MkxRjzqxr5endXZx6ncoEYA6dgcjP7BRIKb2eyFhZ7yv4fm1ok4sb441tG5Iz2icovE+okRTNHu2uL2UtZQwSL5faRzBczF9+6R2wAFFobezzbeDXxwP/An2RJeZkMEYmc+eoeoufW5mymxknIPmJEUT3IGII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=e/r3DmhX; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="e/r3DmhX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=JFUwKTn4gkob/ASKsHj6HhQUTISQAuY9+eAMnMI/GpY=; b=e/r3DmhXhVonE6qyIEZEAoyjyg
	CB3jj6Y02jtDRahg0dF47xwBJrOOYVk2SVUmlj5LOzDF+3GL+QxrARH6sH0paKp8djOL8oYFE+uTr
	nOFpTw5V9O8ZNeThl789IbnGmhHdI3c3SGI6yTb0RSKzD5yzXHfi4Ka9EZMCiAS77wGPrYJItHyEv
	xinTnTi1bDpxWhCfA6HawgvZMbugk+R6xeCe63WpAiopCMbgzKy9t0uQDeqsHOvXBJ7SCug/ELDKM
	056FvMrpmrOngtWON9gM7kFb4ArvsvqPQAh6eLYi3Jb4DL2r+2eBAFJabXIYD0i+U8jI4VlN8NvUR
	iVLVekcA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wyl56-000N2p-0L;
	Tue, 25 Aug 2026 08:56:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wyl55-000CgB-2B;
	Tue, 25 Aug 2026 08:56:23 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 vjardin@free.fr
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
Subject:
 Re: [PATCH v2] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes
Date: Tue, 25 Aug 2026 08:56:22 +0200
Message-ID: <13423320.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20260824-for-upstream-dt-qoriq-gpio-hog-v2-1-58bbc82b881e@free.fr>
References:
 <20260824-for-upstream-dt-qoriq-gpio-hog-v2-1-58bbc82b881e@free.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28102/Mon Aug 24 08:23:58 2026)

Am Montag, 24. August 2026, 23:54:40 CEST schrieb Vincent Jardin via B4 Rel=
ay:
> From: Vincent Jardin <vjardin@free.fr>
>=20
> The binding sets additionalProperties: false and describes no child nodes,
> so a gpio-hog on a QorIQ/Layerscape GPIO controller is rejected by
> dtbs_check as an unmatched node name, even though the hardware and the
> kernel both support it.
>=20
> Hogs are not a controller feature and need nothing from the driver:
> gpio-mpc8xxx.c does not mention them at all. A hog on this controller
> works today, only the schema rejects it.
>=20
> QorIQ and Layerscape boards do need them. These SoCs bring board-level
> reset, enable and mux-select lines out on the SoC GPIOs, and those lines
> have to be driven to a safe level at boot before any consumer claims them,
> which is exactly what a hog is for.
>=20
> Some boards in the tree already express this need where they can:
> fsl-ls1088a-ten64.dts and the tqmls1012a/ls1028a boards all carry hogs, b=
ut
> on I2C GPIO expanders, because that is the only place the schema currently
> supports them. No board uses one on this controller yet, so this fixes no
> current failure.
>=20
> Other GPIO bindings already carry the same block. gpio-mvebu.yaml and
> gpio-davinci.yaml use the identical "^(.+-hog(-[0-9]+)?)$" object requiri=
ng
> gpio-hog.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
> Changes in v2:
> - Change the commit message. Drop the dmesg excerpt: those hog names come
>   from my out-of-tree dev git repo and are not in the tree (Frank Li)
> - Note: the hog call path is: gpiochip_hog_lines(), called from gpiochip_=
add_data_with_key()
> - Explain why these QorIQ SoCs need it
> - No change to the diff
> - Link to v1: https://lore.kernel.org/r/20260824-for-upstream-dt-qoriq-gp=
io-hog-v1-1-d75923bcecad@free.fr
> ---
>  Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b=
/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> index 4cb2a6b9fabfb..a6252440e099b 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> @@ -63,6 +63,13 @@ properties:
>        GPIO registers are used as little endian. If not
>        present registers are used as big endian by default.
> =20
> +patternProperties:
> +  "^(.+-hog(-[0-9]+)?)$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +

Shouldn't you reference gpio-hog.yaml schema instead? This already has (amo=
ng
others) patter and required properties. But I'm no expert on bindings.

Best regards
Alexander

>  required:
>    - compatible
>    - reg
>=20
> ---
> base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
> change-id: 20260824-for-upstream-dt-qoriq-gpio-hog-5092a0f4d089
>=20
> Best regards,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


