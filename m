Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754711;
	b=2LKnLLXVaxMN+ACrMsCR3GyiHZPI+PXDsgR5+ENv5Pz3nG7dFrTDcwDt+iK1n80yNWUT
	 IpCJOON/KSOdeeHIYSX81m8f7Hd5bpYiOQUefQRbAyDoroi6XhDhdzRceDm5vjTotpJ4U
	 PatHpbwY1kcxJ/av4WsKIa2DeKBu1uLxGkTRzhot3PFIc1DGXG8w9ejnBiRtlkWR2nh1b
	 tAweqb/pH/u4/kDPkwFToNOWa/B5gBavN6ylZWFODvh6mCYHGblvpcpVrbAUBlHu0wpXi
	 gbzui+cMoF+IQKQVylbVhc/xEYWVFRrtfPCnwzwBX2zzFDIDksY7QrJEHaJ6TlrWTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754711;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=W2nKm0rLN392hw5JmRVlu3U7b96TGQMs8eVI+K1UXmU=;
	b=WZLX7IrPCA6j3F02TeywHMMMj+qUkATMhIlJANUp/scLNHTK5AehceN3TZzYFa6UNcNZ
	 JkjBOgAev2hWy1aOF7Z/ohH61UJMfCtKAadiyOjWiHoUvBPRJKu92uLGRyd1MOnU8kRdF
	 74U/V2SfGDt0g92k9J4A/dSUT8xl7UN/plR+4DBpnPILhFQVywGhpF2KBPZPO82eHufF8
	 FlSZUdCDIc88YLGe0nMd8jsUUXykI+FL14I+7ZMVNMrKwkB1SI1Ve9taGNFQCJD1pUD8e
	 18Z+3ZJN7r0spLntYPryXu7QLyFuM4fH596lr1fZ8X4CtpszmusjBzQEDH366VK1hLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWvVjhEq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA30606A31A;
	Fri, 23 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWvVjhEq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCF81F01825;
	Fri, 23 Oct 2026 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792754710;
	bh=W2nKm0rLN392hw5JmRVlu3U7b96TGQMs8eVI+K1UXmU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PWvVjhEqdNCWIJQohhYTxa8/jS+/m5syrySjHqxZiY25CQ1RbRA1T23IvLi5MoxQs
	 wGdDgkjGIrJlqdGO+cCk6h7g8UWjh/9y6QiN7x+bpqwGAPpUKcHHpoGJTbaV6bKszm
	 IbZ+0yPieE6eL3JRmgrUtlp9vvwR2AB8Bi8ibAUrINtuf2Ei+EGxmI/7Xt5JKQEKUL
	 FP7HjVHha4l/OJsCUsXfMRqpPQ01cuThewl195hjXC0YafzA3GDZEwkVgZ5vaszMrW
	 TidZCp47zvTK1FzTtsAOQW9f2vXYsDNFBWU5xxqBKH/KEM1skSt0ltPSWZ7vi9pgPd
	 pSHDdWFXVaujg==
Message-ID: <051bd988-9817-49e3-bfc4-0e3ca86bc91a@kernel.org>
Date: Fri, 23 Oct 2026 13:25:00 +0200
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
Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
To: Biju Das <biju.das.jz@bp.renesas.com>,
 wsa+renesas <wsa+renesas@sang-engineering.com>
Cc: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "magnus.damm" <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
 <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
 <ats6zi2lZW09Bs2e@shikoro>
 <TY3PR01MB1134645CCEF0656592B93690586642@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
In-Reply-To: <TY3PR01MB1134645CCEF0656592B93690586642@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2026 13:01, Biju Das wrote:
> Hi Wolfram,
> 
>> -----Original Message-----
>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Sent: 23 October 2026 11:46
>> Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
>>
>> On Fri, Oct 23, 2026 at 10:28:16AM +0200, Krzysztof Kozlowski wrote:
>>> On Tue, Oct 20, 2026 at 10:14:58AM +0100, Diogo Ivo wrote:
>>>> Add support for the I3C Bus Interface on the Renesas RZ/G3L
>>>> (R9A08G046) SoC by adding the renesas,r9a08g046-i3c compatible to
>>>> the OF match table.
>>>>
>>>> The controller is very similar to the IP on the RZ/G3S. However, for
>>>> instance the RZ/G3L variant has no HDR Exit Pattern detection interrupt:
>>>> RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16. A RZ/G3L node
>>>> therefore cannot be described with the RZ/G3S compatible, as its
>>>> bindings require at least 17 interrupts. The same point applies to
>>>> RZ/G3E, that requires 3 clocks while the RZ/G3L requires 2.
>>>>
>>>> From the driver point of view there is no difference between the two
>>>> SoCs: the driver only consumes the tclk clock, the presetn and
>>>> tresetn resets and seven named interrupts (resp, rx, tx, st, sp,
>>>> tend, nack), all of which are among the 16 shared ones. No driver
>>>> changes are needed besides the new compatible.
>>>>
>>>> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
>>>> ---
>>>>  drivers/i3c/master/renesas-i3c.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/i3c/master/renesas-i3c.c
>>>> b/drivers/i3c/master/renesas-i3c.c
>>>> index 4fddc1b4fdbb..80a6df1151bf 100644
>>>> --- a/drivers/i3c/master/renesas-i3c.c
>>>> +++ b/drivers/i3c/master/renesas-i3c.c
>>>> @@ -1625,6 +1625,7 @@ static const struct dev_pm_ops
>>>> renesas_i3c_pm_ops = {
>>>>
>>>>  static const struct of_device_id renesas_i3c_of_ids[] = {
>>>>  	{ .compatible = "renesas,r9a08g045-i3c" },
>>>> +	{ .compatible = "renesas,r9a08g046-i3c" },
>>>
>>> So fully compatible? If so, drop this and express compatibility in the
>>> bindings.
>>
>> Well, this SoC has 16 irqs / 2 clocks. The other variants have 16 / 3 and 17 / 2. So, to which one should
>> it be compatible? I'd think 17 / 2 is the easier one.

The number of inputs really does not matter here - all are anyway
expressed in DTS. Question is whether these number makes a difference
for driver.

>>
>> Or should we even refactor r9a08g047-i3c to be compatible with r9a08g045-i3c ? We currently don't use the
>> third clock as well. That would mean deprecation of the old plain 'r9a08g047-i3c' binding, of course.
>>
>> Opinions?
> 
> RZ/G3E I3C does not have analog filter compared to RZ/G3L and RZ/G3S
> Moreover, it supports - High-speed mode (Hs-mode): 0 to 3.4 Mbps.

Features define compatibility, but nevertheless this has to be addressed
in the commit msg. That's why I referred to writing bindings in other patch.

Best regards,
Krzysztof
