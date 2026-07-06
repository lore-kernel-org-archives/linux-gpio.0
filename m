Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A43D1CA8;
	Mon,  6 Jul 2026 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320525; cv=none; b=Qfvq/+EVqQfWEj+HA3F2OfvYF6TmaegQfrH+DX6M+FIB9G3dtPOl2vMP0Nq2nWxv1Lx9trCi8KmNg/wLielqLFwSoISb3V0l2kmbkO2Ql43p0/oIa4/v/n77SEOpWYOFzYGPCCq9NhB48Xwrf7j7Q+im1VZCVnNkGwTyQsPR8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320525; c=relaxed/simple;
	bh=a4hhhi3byI4t4BHiNCXXjlWZRC0mR3inuzTqhlW1Hjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQoyPnEQ/8aymAApOF2CgqWO0kOYsR9svZEzpQAK0IdoOr92IZzHgQ39ntu+zptXMJsfqxKcTpPBI4dYhycMti7OmbaTh3MgE+PRD2sEtxfOvlYNW0X4i/+AD3WnVzaibYSjIR5lnyuSiiWV3Ry7JMCexJcDLWxmkijTwUHoSvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNpwPhaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNpwPhaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5F31F000E9;
	Mon,  6 Jul 2026 06:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320517;
	bh=FyC6uLd4SG/eFVU0+S/jOwpK4vgRdKg92Yml7ndQ0uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aNpwPhaQw9RIwCkkdYM+Niad6l8inxvBTg0uE6F6r3bChE4b981OUFGWu1hzEQi4D
	 QtjyaZ0fsHh8nyTQd0PBJTpZa9R57N7+sV0jGHJTosRn+vuYgLLhF7jDDyCi5YrmYw
	 QAwj9EupMCxF4iKQxwo4eEmOSHweRJkgbmt0XHpZB4UvlTEFv7WvJWRCP/WtV/s0gu
	 m/5p0g9xtzBXKcpMnrMhT/IhJC4OOMgSSvBfdaNm6RDmZrZ/pnYyqTt2gY7+gRghSN
	 Zgo+d6oli8+2zZuQsiQ1QZ9M87MezP1ngGMO1lGmTvuTM51nlx+IVB4UUwYIjCRwYR
	 Fi0hf5vrgKTWw==
Date: Mon, 6 Jul 2026 08:48:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 03/12] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <20260706-piquant-arboreal-panda-b810f2@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-3-6c3e706e27dc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qe-pic-gpios-v1-3-6c3e706e27dc@bootlin.com>

On Fri, Jul 03, 2026 at 03:30:11PM +0200, Paul Louvel wrote:
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> new file mode 100644
> index 000000000000..1af99339ff40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl,mpc8323-qe-pario-bank.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8360-qe-pario-bank
> +              - fsl,mpc8569-qe-pario-bank

None of these were in the old binding. You need to mention and
explain (WHY) the changes you are doing to the binding during the
conversion.

> +          - const: fsl,mpc8323-qe-pario-bank
> +      - const: fsl,mpc8323-qe-pario-bank

Best regards,
Krzysztof

