Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370246D085;
	Tue,  4 Aug 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855468; cv=none; b=UceqM1ycngmTCf4owSkFotGySbC5Jt57hoaOe3LW83997ev8BQ5okt33kyo7TwhVQ8CoyiKCcRpf0XRqmNFHYgLUNY6eawdMgMwl1JlkQnk79PuATYGeu9TCELaFGqhBjX5rGHwpoNMS/gd5oRjrw8xHOfFfMdOepv32MDD2bC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855468; c=relaxed/simple;
	bh=Bxsf/tM/inm4tWB5FckFDrW3RfUJDXeHauOssflYyFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uAZ/ARQJrkmnn+zYBieMdpYrgM1gowkSXWver9pglm3NP1ORY51DLCbD21lTW9kErLaC/kmCPzyQHH6C3uC7wKbvUyYxin9LuaGG3e0QUUO+kt3cUZVXjsZDQAV2FM3Xg4l7CEC2AauXWjmzrzetdyO0mWV/c4Se1OeFGamfDNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LP7eRLHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LP7eRLHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22341F000E9;
	Tue,  4 Aug 2026 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785855463;
	bh=Jld8QoXOyiRKxKiV6Ij6KMsJftWjnRzT1IjV73V8qmY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LP7eRLHsIvkuDUhDSJnSpHvpTQWt3F61j6RQKNDy07FNsBlrRb807tlFflrNdton7
	 XAAWF3/uHfejsdwVyu3UYh8aDyqjiV9O2zxhZvfCtrMSDyKFsbrpiG0qTiiw2QGx8R
	 XPFIDoWdCpVtWxNEvQXq2SsDvpu22+Uxz/+/bpoyVHbfxrRYUyKK6y1OVB2lbE63no
	 Hrk0msCy4GNs/mv6QYbsMxzu12Ux4S//vDdVp72Q+ZoHAMC2XUS+kLzNNK40PwsBL7
	 ETWz6LzTpv+hGaBnabnBVAtquqd+BMSvESxoICuiSRroJ8LH9vbVBfFkUFQXrxe2ZI
	 AywwE0tVdjK/Q==
Message-ID: <b99c478d-302b-4c50-8a8b-94aa0f4f7fad@kernel.org>
Date: Tue, 4 Aug 2026 16:57:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 30/35] dt-bindings: pinctrl: airoha: an7583: add olt
 function/group
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Markus Gothe <markus.gothe@genexis.eu>,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-31-mikhail.kshevetskiy@iopsys.eu>
 <20260727-chivalrous-legendary-goat-b9ab93@quoll>
 <d92137d6-5dde-468a-95ec-3acc506444f9@iopsys.eu>
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
In-Reply-To: <d92137d6-5dde-468a-95ec-3acc506444f9@iopsys.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/08/2026 16:43, Mikhail Kshevetskiy wrote:
> 
> On 7/27/26 23:15, Krzysztof Kozlowski wrote:
>> On Mon, Jul 27, 2026 at 08:41:36PM +0300, Mikhail Kshevetskiy wrote:
>>> Add support for olt pin function for olt pin group.
>>>
>>> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
>>> ---
>>>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +++++++++-
>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
>>> index 7deb48db52c3a..f016e0da65a57 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
>>> @@ -60,7 +60,7 @@ patternProperties:
>>>            function:
>>>              description:
>>>                A string containing the name of the function to mux to the group.
>>> -            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
>>> +            enum: [pon, olt, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
>> You just changed this line in previous patch, no?
>>
>> Why binding patches are spread all over instead of properly grouped?
>> This makes it difficult to review. Please read submitting patches (both documents).
> 
> I tried to create a separate binding patch per change. Could you clarify
> your suggestion?

Adding missing functions is one patch, unless there is reason to split.

Best regards,
Krzysztof
