Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81E3BCD38;
	Sun,  9 Aug 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786268586; cv=none; b=dKuXGTpev7MoVGdhGK68+9A9Zz3mOgz8Dim3mHSKL9+DsOMMd+z83Z7wqH7An8xbeLgHcbSpevHcJcX5ZdEUqANla5KafEVRuoUUUY+8niAJZsnMWWgMmIOtTQLnsc59wXLioNjK9yNj9+zmmAgpCClew2G5VltnMsvJ82rHeFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786268586; c=relaxed/simple;
	bh=q2VnP8DOibUjXyXElz3gggxpCnvDoZ2C6N6euK/kxKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgS+ND0kOq3Znx+TAPaS9dic4UvcO8YV8JxLuMLA5Flogy1XhchnAxtlf8PLq5JgB3DthTUcoADp8cfeISzdbyZz4RatRNQqUK9OP8x6kZucePTzAOU0CDjtDxzmQL3xMFcvIYkWJXn/GAAY7u7s9UOyTz84ktVU1+T0d/K62jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=aOdAsLCt; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="aOdAsLCt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8w5NT48wx/0aBVuRvm9KEpkK3uGPxkWdWOwg4cuAyEs=; b=aOdAsLCti6rJxfN1ry8ER+vdoN
	aQFot3rF1t5ihXUUMb/Q3nZPaQcoQLkOhczZEErcJ0GERffpHj0Clq2mJBJYMm09ysPnFQTbi2ZY+
	aqxkE0j5I9sTTERSNdi1uZK+lAROrXhyv90dZzg2ATt7nzojptcSGLduxCsxJXJASev8U5KVqNdmC
	x7Ol0YgYXRGhcoWfHB8FR49d0Q9xMeDbfcjP7Mc4M+ssSKV+5ud7jCUNp9aoyKcqi54ERktlEi4Er
	GTyBZEk4MRgJDaa9z3p7B9Fb61yuAOjyakjFVNz0dSZWXc+cq3ci4oO7NkXEFxwk/u+Qwk6TryJhM
	TLb4tViQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 2/4] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf
 property
Date: Sun, 09 Aug 2026 11:42:47 +0200
Message-ID: <5555671.NgBsaNRSFp@diego>
In-Reply-To:
 <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
References:
 <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 29. Juli 2026, 15:27:26 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
> IO control (IOC) register block rather than grouping the registers of
> all banks into a shared GRF region. Add an optional rockchip,grf
> property to the gpio-bank binding so that each bank node can reference
> the syscon for its own IOC block.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Part of me fears what next abomination hw-engineers will come up with,
but I find this solution pretty elegant to handle that per bank pinconf-GRF.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Add new patch for the per-bank IOC reference
>=20
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.ya=
ml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index bdd83f42615c..774e9c7de606 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -44,6 +44,13 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node managing the IO control registers
> +      of this bank, on SoCs such as the RV1106 where each GPIO bank has
> +      its own IOC block.
> +
>  patternProperties:
>    "^.+-hog(-[0-9]+)?$":
>      type: object
>=20




