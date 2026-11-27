Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791715;
	b=WnMfhW6q9D1yQZ3sQ28aCyHKkscrbprw2x+cfUFKv13m/FSUpJ7DwPiik4sIVwKcPfbN
	 6HBTSeAr6Mx7UZ1fI6b7GBebNQeXcKBuA3KFpDMj3xXnzPKTXpkadnSO6LP3SD5aF1Jx+
	 fkkfXan4Rp7apBPEWuR/qLAvXevdhBhQsmjwomJHkAeoxSN46AG5OPrdHtbb6A2RBJ0Pi
	 dtA4yo0hY/b3Jtf8Sz1p7Zx2uourrUXRK9ByCDxjTD2WjntBlNRV9WKi+m92s1vi9949r
	 s4CfNdDmJxI1B4yo+opLtJE85qrcIt22hi/T1hU2aw3O7zTWZrPBZJxnlXvU6c2Xmew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791715;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VpcqBZLqN/HeuRlLjFgGKqVL/4WFgrZfbDvk+IxriQ0=;
	b=hRsSyj5jewzrx6XJkkll5v8UhJe1b0b7K05+2JKK8RgcMPulC59QKOsosBeY6ofUd0qI
	 LUowTq+kjZIfHRxOdyUy2v4GgahtCtG1bTrw6k6SbWKZCHCJDtLOw5R8oaQos37i+cMKb
	 7/rQ8yXPsJR0NHEBWBLptnkEsy5559soVnrPpeCwHBe9/7aIoIa6dDNAZmvQLqo5OOKzx
	 43QadKBqMeHBPx4DEA3NPxyEgyLtcS+/2bDQeCdYKe+1xWBQTDxdI9veryvD78N0cHYYo
	 dJ2NtlboA5+YAsgYxzkC84lkqgCR7qY2jkLjRy6cexxUhkOVTfCYsAxb2LZnpnsOZow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=afDIj2Rv;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7835E606A321;
	Fri, 27 Nov 2026 15:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7835E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=afDIj2Rv
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE051169E;
	Fri, 27 Nov 2026 07:01:50 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 379C23F86C;
	Fri, 27 Nov 2026 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795791713; bh=GBuVEdT6Zk0TtC4GdX7BeaJsy82EnhV3Za6uLt8WTuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=afDIj2Rv/AZ2ZhaedD+aQ7/sM6pMctKhmHlqaThdPXbkWWLZ4rcX8AcTCYZk6jJXG
	 HGrxsvcAwyS8kWygKXkQ3GHFJl9XcSI9+TEGxkyufaA5nodgFsxPh6y3xsf6KQ9SC9
	 yhvFJbx2UnmuEj5FjgywnCf1EwU86QSEsgs2Jwlc=
Message-ID: <49872d49-ddcb-4cd9-b4a5-ae6ab95e115f@arm.com>
Date: Fri, 27 Nov 2026 15:01:49 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one
 interrupt per implemented bank
To: Pablo Mazzini <pmazzini@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20261124215048.42074-1-pmazzini@gmail.com>
 <20261124215048.42074-3-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261124215048.42074-3-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/24/26 22:50, Pablo Mazzini wrote:
> The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
> implemented, and the driver no longer counts it. Go back to one

                    ^^^^^^^^^^

Just for the records: some Linux driver implementation is not relevant 
for a binding. This (or rather the changed, but undocumented semantic on 
how to count the IRQs) is a breaking change, unfortunately (and it's me 
to blame), but I think it's the more sustainable solution than the 
existing one. And since this is a revert, it's somewhat confined, and we 
can backport the Linux changes to mitigate the problems. The A523 IRQs 
were broken from the beginning, and my original change just somewhat 
papered over the problem.

> interrupt, and one debounce period, per implemented bank: 10 for both.
> 
> This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
> increase IRQ banks number").
> 

I wonder if we should have a Fixes: tag here? Pointing to the revert? 
It's somewhat debatable if that makes sense for a binding patch, though.


The actual change is fine:

> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> index d7d0ba32ced4..c04b04acf6e4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> @@ -36,7 +36,7 @@ properties:
>   
>     interrupts:
>       minItems: 2
> -    maxItems: 11
> +    maxItems: 10
>       description:
>         One interrupt per external interrupt bank supported on the
>         controller, sorted by bank number ascending order.
> @@ -63,7 +63,7 @@ properties:
>         bank found in the controller
>       $ref: /schemas/types.yaml#/definitions/uint32-array
>       minItems: 2
> -    maxItems: 11
> +    maxItems: 10
>   
>   patternProperties:
>     # It's pretty scary, but the basic idea is that:
> @@ -133,8 +133,8 @@ allOf:
>       then:
>         properties:
>           interrupts:
> -          minItems: 11
> -          maxItems: 11
> +          minItems: 10
> +          maxItems: 10
>   
>     - if:
>         properties:

