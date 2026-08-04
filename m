Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E0A3822BB;
	Tue,  4 Aug 2026 18:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867556; cv=none; b=qW25rTjJlZmkCcqslXsdi98r+qVa4ReSdqmB+JkCG34wFabBkltPYx0qPmiDKJwB4QB+vpCGdnMdXc31e3KNfOa5Q7mGgIY5SiPCAIkEmuObSmc2VHXzSH8NFbl1pRaGiouVdukXx981yUzm3uiHGQSGMT+hnN2WmeqZTwvV4mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867556; c=relaxed/simple;
	bh=pqEyvuAgj4GHvdPWbh4YKGY7vhRzDLYuGUPAC3ah4wg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=chv+oiaUuGaZ0c4ra/+EH6caHLEgoR+51JJLK+Q9tBslRr20rVa1tpfhH8EkaR8FZYTEgpgNEux6YhWQ08KCiheGXf81Sl2aegOM88D9lGExOzAdWiVdCtg3YpLL5ilj1YLtDOm2H0L9KoZZIjJO+IWS56U78HMr7PA+o5/I8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIdyKCk8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIdyKCk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E571F000E9;
	Tue,  4 Aug 2026 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867553;
	bh=A9vLb3qBKhiB+XAO8QaHVpvoUO2rQtkOyTAA7HizyS4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=hIdyKCk889GcbC+2fVuxQpIA1Xe33DyxhXN7qOiOJW8sXQy5IfR7KjyF4f6NZrvYG
	 0Tw7Ltqy2WhlLDpYkOn24mU452dj8aHiHuewPdqubUq6g7VX30Dx7YtQ1lP4DKaGL2
	 IWJWPjswbdFjbkBKGPZLX810a8IE0Zdh83nGNZgjX4UsP9PyPYfzQ0FMoW9niunVd3
	 u3Zg0PHp+aX7YW/YCmj+AbXzvg2Dtzvy169Uqyjsub93aRbky3skjyvcehNIUOlfo+
	 R/tiRqwgdKLLVJxY8XfhyoYLZs/BRCOPCq3sFJKpXm1ROlvKV8h0CHxjmgUkUPMezr
	 j8OlCj0kWannA==
Date: Tue, 04 Aug 2026 13:19:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Markus Gothe <markus.gothe@genexis.eu>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178586755049.1262514.15920447848565154981.robh@kernel.org>
Subject: Re: [PATCH v9 34/36] dt-bindings: pinctrl: airoha: add support of
 en7523 pin controller


On Tue, 04 Aug 2026 19:04:17 +0300, Mikhail Kshevetskiy wrote:
> This patch adds device tree binding schema for Airoha EN7523 SoC pin
> controller.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,en7523-pinctrl.yaml        | 379 ++++++++++++++++++
>  1 file changed, 379 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml:28:3: [error] duplication of key "gpio-ranges" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml: error loading YAML: while constructing a mapping
  in "./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml", line 16, column 3
found duplicate key "gpio-ranges" with value "{'maxItems': 1}" (original value: "True")
  in "./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml", line 28, column 3

To suppress this check see:
    https://yaml.dev/doc/ruamel.yaml/api/#Duplicate_keys

./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml:28:3: found duplicate key "gpio-ranges" with value "{}" (original value: "True")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dts'
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml:28:3: found duplicate key "gpio-ranges" with value "{}" (original value: "True")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1703: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

