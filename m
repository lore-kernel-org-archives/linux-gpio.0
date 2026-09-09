Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7F0376A06;
	Wed,  9 Sep 2026 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934303; cv=none; b=UHmV9VqQveYwoW3w75RV4Q3K7gxyfpEFh+hmnaiSh3UomBeehlV77A15hluRQXllX2w4/2TuPdfZm5TkRuZ7Uerp/sJtpMxdAeyqn1xKjZ5RUNsnh8D6aiVNWRYmdzdW/wwaJwRycaUY3TpsyCr3zbMDKHyAdBkVnfyfrAV7cmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934303; c=relaxed/simple;
	bh=AA88sVHu2RjejiGwmGjLyptcgv7EEHaQUyZCPpvyB4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJmnGTjC6LtlixGW0Fm1fUoj1/480zq0OR7Yn7WG7YBaJaV5OlxttWBX6IDSBVUKiudPnxtcf3n7+NnzEO4NevBkfz56I7kS6QXXfpwHtXZ7u22x7MYS6SAtTWJVbguHiStbaJk9QQ3+NAbw2wmkshFpgls0p2rR96qcvp3SWgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koO1jTZd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koO1jTZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B4B1F00A3A;
	Wed,  9 Sep 2026 06:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788934299;
	bh=wKVzZ3DXomIuSaP/EgVD76UrmtWu9SrVhn2lBA4cc7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=koO1jTZdY8lUmp8ZIlLpM90UDSszO2+fNjIIL8oOLPp6yYIZ9zwkkDPUNwu/czmmd
	 0jgjB+zPzqrQTa+8Try6aE55cVpJ12vSylOoS2jCIgIlOalhMzcojIruawC7K6fpdM
	 JzwmL0HmircrECSv1Ozk9OpZkAnc/tRfcrz+pKr1PucClnBotMW5Wx5s5pSVAVrO7j
	 V9rvbMmV1mk3gGv/g4uss/ohBF6bVJ3/uKBtr247YVtj1EcmSBrf99MQb8OWr/Q64c
	 G4N0HvCL4fsrg4pu1koYH4vL66Odli4Xb/0aHAS/zmGkKHJkBNOVJ4eRKj8pdzjkhO
	 wMJHKN/9pxvDw==
Message-ID: <219e88c6-5f49-4db3-8a30-54d387711fcc@kernel.org>
Date: Wed, 9 Sep 2026 08:11:29 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, Benjamin Larsson
 <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <cover.1786262697.git.naseefkm@gmail.com>
 <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
 <20260828-adorable-bug-from-arcadia-fcad00@quoll>
 <apGcOAUpb6XZ2Iud@DESKTOP-TIT0J8O.localdomain>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <apGcOAUpb6XZ2Iud@DESKTOP-TIT0J8O.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2026 16:33, Ahmed Naseef wrote:
> On Fri, Aug 28, 2026 at 08:59:57AM +0200, Krzysztof Kozlowski wrote:
>> On Sun, Aug 09, 2026 at 12:04:59PM +0400, Ahmed Naseef wrote:
>>> +maintainers:
>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>>> +
>>> +description:
>>> +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
>>> +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
>>> +  registers have a different layout.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: econet,en7528-pinctrl
>>> +
>>> +  airoha,chip-scu:
>>> +    description: phandle to the chip SCU syscon
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>
>> If the entire address space is part of the SCU, then this device should
>> be part of the SCU, e.g. its subnode.
> 
> It is not: the registers are split over two blocks. The GPIO, interrupt
> and PWM flash-mode registers are in the block the node sits under, and
> the IOMUX and pin configuration registers are in the SCU. Both are
> needed, so whichever of the two is the parent, the other one has to come
> in by phandle.

Sure, one is parent and other is sibling. This is standard. But
non-standard is to claim to have no MMIO but then get that MMIO from
someone else...


Best regards,
Krzysztof
