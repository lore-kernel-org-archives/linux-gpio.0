Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514344;
	b=068akNsjelSxAxdF5UnbPizjzti0RjK2V8XYNhTz6d9tR8WSFUcJZ0MvNZsZ7AYJiYxl
	 U4eogufbnCUkHaq2/RjAxtaXAi4VI+DH2xpqDY2u6aP7omqIT4M+k2D1SPW2i/mvK9De+
	 ECG6rq8nWORUwOjEHHnqc64sfZH2PzoxdlCw3gEhfmyFqPkHIjNL1hnDm/0RO9Zt3hDtn
	 DJHzgOAdsWHMGk//4xEI7/W8yWo/4577/BfZxZSB4a7UbhacqWoWnpFdTo/qD/T0e3CQ3
	 9qtfqqlHPJ0p5yFZkCUooN6PVL4MMQnfrN4tTsBhywVF2cwfiqpYbjos3PWC8S7x9rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514344;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LM4WQJMgPgmGAQPx49J43+L3+FifhB+APgkJWZ64wOc=;
	b=0UrU92GC6aYL8gmMABR8LqhjV+J3DL9EaUl/Ra0BuPkQRZCPZoVjDhMSCy1+USd90Oec
	 oAQ3fLddZskpe5tOoI2RonQjUYq1OTy2dJG/zEmpthXVguPVCxjOToWM1erSTgMHbrMX4
	 lvCgHX0HGqib55gnnuyteRVn+49uyN/qqv4sPMiUqqUM9RKmjKjNxMmIbxiLainUeW+tt
	 L7xc1nghSHwmh9gaZkrRBaBJ1UXIKR3Tjfsuvtu07b7o1eKyU1XGDIjt9EAb0Ijhxg1IM
	 NdGrWWt50p5q/4GA/A5HP0gOHFyBhjlYxyTxHElEtI6yDRJlEOUIBIQHvYSlAAR/EaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X3kXZyp/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4B3606A32A;
	Tue, 24 Nov 2026 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3kXZyp/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9372D1F000C4;
	Tue, 24 Nov 2026 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514343;
	bh=LM4WQJMgPgmGAQPx49J43+L3+FifhB+APgkJWZ64wOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X3kXZyp/cmAewdv4SURvUj5FEpk7h3J5q/nGKn39RncyygRymn4LMGBCfC6lTDrS/
	 ONC1sBd3cTy0jWZlYNPy5dD1MPDRYDPbtJafj4d3YAehOczt/UUHfqspAyh+X8FYjE
	 MU3RcqajXhrDtNZI1gbRJVjhGVez2aiQJO/kWoE46KnE49/BjjVUx1qjc/VsbPMQO8
	 Q9Skbbr8yYkUA5/+yMAZazPrtADdc9+/YxngG75yyISY+ExUwAJXiyFgdTh9zzycuo
	 UXxXGPRTM8I7rfw0hQF+K7o2tDWFZF95IU5b6gxfg+XO+M1jpUsmN3272btTlxsI7W
	 K1F3XlpgKbyDQ==
Message-ID: <e2e7f13e-faa1-428b-9691-3e8842054e6f@kernel.org>
Date: Tue, 24 Nov 2026 10:58:57 +0100
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
Subject: Re: [PATCH v2 06/13] soc: synaptics: add SL2610 system controller
 support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-7-jszhang@kernel.org>
 <20261123-knowing-eggplant-buffalo-fddfc3@quoll> <awQyw9fp8qTj3kbU@xhacker>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <awQyw9fp8qTj3kbU@xhacker>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 13:34, Jisheng Zhang wrote:
> On Mon, Nov 23, 2026 at 11:31:42AM +0100, Krzysztof Kozlowski wrote:
>> On Sun, Nov 15, 2026 at 06:23:45PM +0800, Jisheng Zhang wrote:
>>
>>> +static const struct sl2610_syscon_data sl2610_mcu_data = {
>>> +	.cells = sl2610_mcu_cells,
>>> +	.num_cells = ARRAY_SIZE(sl2610_mcu_cells),
>>> +};
>>> +
>>> +static const struct sl2610_syscon_data sl2610_avio_data = {
>>> +	.cells = sl2610_avio_cells,
>>> +	.num_cells = ARRAY_SIZE(sl2610_avio_cells),
>>> +};
>>> +
>>> +static const struct sl2610_syscon_data sl2610_cpu_data = {
>>> +	.cells = sl2610_cpu_cells,
>>> +	.num_cells = ARRAY_SIZE(sl2610_cpu_cells),
>>
>> That's just MFD driver, so should be in MFD, no? Why placing standard
>> MFD code - nothing soc specific - in the soc directory?
> 
> I'm not sure which is better. But FWICT, sophgo, samsung, microchip put
> mfd drivers in soc directory. So I guess the reason behind this is these
> drivers are soc specific?

Samsung has no MFD driver in SoC. Samsung has FULL SoC driver there.

Others, dunno, but just like you they could be making random decisions.
That's MFD driver. MFD drivers go to mfd.



Best regards,
Krzysztof
