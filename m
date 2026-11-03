Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730191;
	b=uqjHc4qkxiqriFjllS5gxX2G6jTdGK3znzLC259+O6uSP1ZVFFoclmhWraJwsL2e2kuH
	 Mmg9LWbcQ91eq2p1WV1uYnD19Af8cwdKnGRzGSsRoo2V/NmVP31MsC9EwngpEgUDYTMXp
	 U2qqXph6mA75Y+wuBKnvmolmjCvpnLuWkfz1CspUKwc9nOLf1wH1ckXCiywKKA+h9ArEz
	 Na3yX/Eq0CONFIOFyfKUaj60EJX43ma8Mydqhsuoryhp0vKK1Ht6hItzo0+u4iwJyZs+2
	 6pAGVNRP+5+2WwQWVvGxZmsvpvwjlq3iyXHbK9+uLaM2l787RvpeGRjvR2qIFVgTWRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SLn9woxh8f9RGTdlsIbxZAdrYooqEJ954SXQjVmLUxA=;
	b=BOY2FZS7mTG11cPbXCU0nWU8z09xlDtLWDA+snxMq0J39MIp52IEVExecv9ODOgIHg1X
	 hnijEFa7dVIiHMJok6wpVpfNxsTalVV68F8fSkb4NEQ61NyHot0rcUO3ATvDbSuUqPmJZ
	 a8bXQBfCYvK3O5gUooV/aIFVcSCgyBcrwyuRjXbnddIDdT5+MRZTxZx07vbzoztlKc0sM
	 D628WZ8I9JBDh1YQ0Ztyv7McVnAuScDWaiq9XKPRHbRqVed+SVQ4P/gJjF3bZQAKCJMdZ
	 GrS1OiJ4IHeX+LjAwGOtmu/S8Sjy7TeG3hbSNFLjclI/g82tbER6WyaxekMDNGl1okQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kD7HOXbb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33277606A31B;
	Tue,  3 Nov 2026 18:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kD7HOXbb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6367A1F000C1;
	Tue,  3 Nov 2026 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730190;
	bh=SLn9woxh8f9RGTdlsIbxZAdrYooqEJ954SXQjVmLUxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kD7HOXbbXkTc+fu7AfV37n3kw/sAQbCSNA2+3hSAOZPPoWgvSzWAY3VIB9ANK3zl+
	 f2l7nn2z42y9L0X7v9e2eYZcVrEK39i3NnDM5d92E6Kng7ZpuiO31vsFoowOuR8YCP
	 0ZbYAOhja7sUE1cEHOUhEVwtusy8qpZO/iS8/qobSir5Gm3peCEAvA32/Fa6kxYNkf
	 xC3xNQmWOz9y9EbBfXaZcnDUshUCCpXr4ZW5+BI6AQg/rgEO7ce7Td5pevI8osfkx8
	 S9vhIqN4kcCkPXrRWUagp3oA7HGgkonZS5LFEFm7PWBG+AV1zLzB99VRuPdfdreIOa
	 +s9i2BB65+WXQ==
Message-ID: <sashiko-outbox-195824@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW
 pad mux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-1-3aad0860b984@free.fr>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-1-3aad0860b984@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 18:23:09 +0000
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
- [Medium] dt-bindings: pinctrl: lx2160a: missing clk-out function for clk-=
out group
--

commit 099426f7b054b7c6ba8ac26438539221c6367516
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: pinctrl: add the NXP LX2160A RCW pad mux

This commit adds the Device Tree binding schema for the NXP LX2160A RCW
pad muxes, defining the valid pin groups and functions mapped to the
RCWSR12..14 registers of DCFG.

> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pi=
nmux.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmu=
x.yaml
> new file mode 100644
> index 0000000000000..b1ccd153a43bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,lx2160a-rcw-pinmux.ya=
ml
> @@ -0,0 +1,262 @@
[ ... ]
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    $ref: pinmux-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        enum: [ asleep, can, evt, flexspi, flextimer, gpio, i2c, irq,
> +                reset-req, sdhc, sdhc-clk, sdhc-data, sdhc-data4, sdhc-s=
pi,
> +                spi, uart, uart3, uart4 ]
> +
> +      groups:
> +        items:
> +          enum: [ iic1, iic2, iic3, iic4, iic5, iic6, xspi1-data74,
> +                  xspi1-data30, xspi1-base, sdhc1-base, sdhc1-dir,
> +                  sdhc2-data74, sdhc2-base, uart1-soutsin, uart1-rtscts,
> +                  uart2-soutsin, uart2-rtscts, irq11-8, irq7-4, irq3-0,
> +                  evt4-3, evt2-0, clk-out, asleep, reset-req ]

[Severity: Medium]
Should clk-out also be listed in the function enum (with a corresponding
if/then rule in allOf allowing the clk-out group)?

The other single-pad groups in RCWSR14 (asleep for ASLEEP_PMUX and
reset-req for RESET_REQ_PMUX) expose their encoding 0 primary functions
(asleep and reset-req) alongside their alternate functions.

For the clk-out group (CLK_OUT_PMUX in RCWSR14[5:3]), the schema permits
the gpio (0b001) and flextimer (0b010) functions in allOf, but omits the
primary clk-out (0b000) function, which prevents a board from selecting or
restoring the CLK_OUT function via pinctrl states without failing schema
validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-for-upstre=
am-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr?part=3D1
