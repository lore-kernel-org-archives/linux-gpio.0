Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492314;
	b=l0P+5NOcayf8p/irInLw6/nJvdNvL9tzvwpRj0jkSO6Yn/2KOmYbzFZ/IEKPTwV2bz3g
	 33rlxbq4at/j2NTfUKhW/AeMUVSBFukeEcZ87c6kXViFL2+l0OjVRZABPZcmsrzfKkmlg
	 LfR+8kCLhkW1IDy54a+Ot4VDRdLeXzn5gy8ZoIEzNkltUr7hdeukIlfQG6HEGqtIEmkhO
	 xsmL9dY84Fqcg2/nF/3TmaimbSn5iaTSJg1tKeotaUXqG6ty2P5kbw/vx0x3GLs9WE3Uc
	 GIa4YUAmTjYaUGWOCEtK7kLpbnG1JeJq5vSgz33jUw2+m01uXrcwX01tWDrI6mI4ZcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492314;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PU35ny+wD3G7KwfxvRKmpPfBgZDsD8roKZUSls846Xw=;
	b=ol0lUaeSN5RlPLM7NqjPGfPzKPaGWewlYio1PS/w2/rp53duajgIIVRgwUO19PF4fppz
	 6bRbK2Rkr/wsUMQAdPLgnPRbq+QSGFbmAWi6Tld7PFkWt+9KhEgvZKs3E/2HHi1NKgvyY
	 RKOhc7wCjV7ykuqUhCehr0UAfjbrH9oUnj0MhilcaNXWERDYllynLogiiDrqnxfSMm2wA
	 uczjZl1tMHJLXeSfJWaNKBWG24zpEDlEYvzfOpmNKNWOjSMr4Z5CsVyeWB/PEJmjhz/to
	 xs+uI8dn8VGxSMuiW4vtJTvtF9dR7/+wBQTP8Nix5M5a99rDypm5+gZj5kEK66ESRsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XoddtChb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B12606A32E;
	Thu, 12 Nov 2026 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XoddtChb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52A61F00A0E;
	Thu, 12 Nov 2026 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492313;
	bh=PU35ny+wD3G7KwfxvRKmpPfBgZDsD8roKZUSls846Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XoddtChb2Q0loR3LI5dgvXJje7fWTf6+typfh1PRahYoEVDwBgmuK/AR0WMTu7MmC
	 /SvNfoDv9V87wJcg2/1x2CVXnVMqOW97+4GgYKBYZ6uI9L2ZzjRMNb6ndhFhUZV87R
	 sz/xqp/k7XOfrqxNssbjvoXitiWk/tQ6NTERUBml/ZBEEczE2ZDpDJPkSEkIhxlWDA
	 U2Yd/LX4b3wDlYZR+RgEvpaUoJxCEZiE5HaHxfvWJ3xzyX8SJy/6kgweMQ6/u0AbWB
	 NkCTWNsFOiY/ahLF0gF6Rq0BB9LtGkxv+fBfMsG8LhBzqjTibHmTfXwpJk8KcI2xeg
	 WdMUNEFDfTpJA==
Date: Thu, 12 Nov 2026 08:05:11 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: abx500: Convert to DT schema
Message-ID: <20261112140511.GA360436-robh@kernel.org>
References: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
 <20261110-ux500-pinctrl-bindings-v1-1-a9f0e9d12d19@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-ux500-pinctrl-bindings-v1-1-a9f0e9d12d19@kernel.org>

On Tue, Nov 10, 2026 at 10:58:33AM +0100, Linus Walleij wrote:
> Describe the ABx500 GPIO and pin controller in DT schema, including
> the nested mux and configuration groups used by existing boards.
> Reference this schema from the AB8500 MFD instead of rejecting all
> pin configuration children. Found with CHECK_DTBS=1.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/mfd/stericsson,ab8500.yaml |  16 +-
>  .../devicetree/bindings/pinctrl/ste,abx500.txt     | 318 ---------------------
>  .../bindings/pinctrl/stericsson,abx500.yaml        |  68 +++++
>  3 files changed, 69 insertions(+), 333 deletions(-)

[...]

> diff --git a/Documentation/devicetree/bindings/pinctrl/stericsson,abx500.yaml b/Documentation/devicetree/bindings/pinctrl/stericsson,abx500.yaml
> new file mode 100644
> index 000000000000..59ca14992427
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/stericsson,abx500.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/stericsson,abx500.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST-Ericsson AB8500 and AB8505 GPIO and pin controller
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - stericsson,ab8500-gpio
> +      - stericsson,ab8505-gpio
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 53
> +
> +patternProperties:
> +  '^(?!phandle$|compatible$|gpio-controller$|gpio-line-names$|pinctrl-[0-9]+$|pinctrl-names$)[a-zA-Z0-9_-]+$':

Yuck! Looks like you want just any name which can be expressed as:

additionalProperties:
  $ref: '#/$defs/config-node'


> +    $ref: '#/$defs/config-node'
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +$defs:
> +  config-node:
> +    type: object
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +    patternProperties:
> +      '^(?!phandle$|pins$|groups$|function$|bias-.*$|drive-.*$|input-.*$|output-.*$|power-source$|slew-rate$|low-power-.*$|persist-state$|skew-delay$)[a-zA-Z0-9_-]+$':
> +        $ref: '#/$defs/config-node'
> +    unevaluatedProperties: false

       unevaluatedProperties:
         $ref: '#/$defs/config-node'

Rob
