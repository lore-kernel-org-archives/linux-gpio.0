Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649500;
	b=YkeKvPxXq6rCfcezw4UgRVRigdeo20xGpAeoNvzj4RkzqBW//FOrbrNpSc8wdic5IFTD
	 xAkmAI6i3fCMKjiqAs/2E+2QL8TZd3xCdsKu9wVrzpvucKBh7MovsgErVJby/uRZevyiH
	 PiKlzPoqxcJCQ8CzYZGWIXVV25WyQvdbp16NoNC98uUZzuefRw4bPeNdyPfKUJgImn8Rq
	 EOwkRCywjoDeEndnijQlK+VbIoMR6fRlmVXD/nPEgsBm/+5cuNadbCx2R1Q7lRP0bUI6q
	 EW9wLO5HxrdT1FELAYsm7eRFv6DqPC0Gx7BKtqQzNFU8tiHKUyH5jTzV3ShQiBLkiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649500;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=FvvNDtfsIabNA/On19BazK/OQL2ez6R5Vi/Cev7mYvk=;
	b=UhPt3U2bVAelEnMGkJ6986ZvaHkvvYQ69bVTp0cU2mi46T2J5tipsfrT4extHBvXJRZG
	 FWGm+lRudcBpDTuN6Y26TOp3icbEAGuc6RTInGNFen8Thlx3HRmW6Kxewn1g3G8brZQou
	 rrY7kFcozjrmJMEviTKoXhFDZ2qBlNVyPnxZeG0dKF0AOmVFELQyrmgbFeaymbwWhgymK
	 uuFG1XeYF9aSnE6T39x0xD/5oll5ASX2X5TEJYLHC0yhb0BXqSl4NJw+k73gYTgICha5B
	 8MR64fifPSSAhX8Vmms1XlXEuvsRkY0QFaEatGPaBNQTHbbe3G6LRWgtZ9NeddiH9Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O+8QmB4X;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274E7606A683;
	Wed, 25 Nov 2026 23:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274E7606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O+8QmB4X
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1344B1596;
	Wed, 25 Nov 2026 15:31:35 -0800 (PST)
Received: from [10.43.3.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19F6A3F86F;
	Wed, 25 Nov 2026 15:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795649497; bh=g4SLH4ntJ/Uj2nuvXWB8FADSkntEV5OWw71EFBWI27c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O+8QmB4X04m2jcI9M7lf3p+aZQGd5zPftioIuuFIPcj3BZHatl8xM9lk3BdvUiu9E
	 z+TbsQ1kjBzDZCqKqL1lK6RSPzZMdGwT9ACOiJeF5tCv1iLjx3REEREY6m2s/OJ5Vj
	 G8HlgVQwQTcQ/2tvEAzqVA9VVjpPwGC9RWVIHAQM=
Message-ID: <b9220cf0-ad6b-4719-aa67-154666c788ea@arm.com>
Date: Wed, 25 Nov 2026 23:31:30 +0000
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
Subject: Re: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
To: Alastair D'Silva <alastair@d-silva.org>, Linus Walleij
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Yixun Lan <dlan@gentoo.org>,
 Enzo Adriano <enzo.adriano.code@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20260910133519.459011-8-andre.przywara@arm.com>
 <20261125115703.3724690-1-alastair@d-silva.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261125115703.3724690-1-alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alastair,

On 11/25/26 12:57, Alastair D'Silva wrote:
> Hi Andre,
> 
> Two issues showed up while testing this A733 pinctrl series on the
> OrangePi 4 Pro:

While it's the right idea to reply to the patch that introduces some 
problematic behaviour, there are other things to consider here:
> 1. PIO_POW_MOD_SEL (0x0040) on A733 uses 2 bits per bank instead of

But we know that for a while now...

>     1 bit. With BIAS_VOLTAGE_PIO_POW_MODE_SEL, banks are written at the
>     wrong bit offset and left misconfigured (for example, bank H stays in
>     1.8V mode when supplied at 3.3V, breaking RGMII Gigabit TX).
>     Adding a 2-bit variant (writing 0b01 per bank with mask
>     0x3U << (2 * bank)) enables hardware auto-detect from PIO_POW_VAL
>     and fixes 3.3V RGMII TX (also addressed in Vinicius Pedrosa's
>     follow-up series).

Yes, Vinicius did the right thing, since this patch you reply to here 
has already been merged. If you want to support his series, please reply 
to the specific patch *there*, ideally with a Reviewed-by:, or at least 
with a Tested-by.
Replying to this old patch here is then not too useful.

> 
> 2. PA has 0 pins on A733, so PB..PK are hardware banks 1..10 while
>     irq_banks = 10 maps logical IRQ banks 0..9. Without .irq_bank_map
>     and sunxi_irq_hw_bank_num() in sunxi_irq_base_reg(), logical IRQ
>     bank 0 (PB) accesses PA's IRQ registers (0xc0) instead of PB's
>     (0x140). Adding:
>       static const unsigned int a733_irq_bank_map[] = {
>               1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
>       };
>     and using sunxi_irq_hw_bank_num(pctl->desc, bank) inside
>     sunxi_irq_base_reg() fixes the bank offset.

Again this is an issue we know about for a while, and for which patches 
are on the list. Please look at them, they solve this problem in a 
different way.
> Also, in patch 4/7, sunxi_grp_config_reg() takes an unused
> `const struct sunxi_pinctrl *pctl` parameter that can be dropped.

This again is an issue in a patch that is already merged. If you want 
that fixed, you need to send a patch on top of v7.4-rc1, and send it 
with a Fixes: tag, so that this can be remedied before the release.
If you just want to report this issue, do this as a reply to that 
specific patch, with the original patch text cited, and your report 
inline, directly after the problematic line. After all we have this well 
hung email patch submission system, to make this very clear and 
transparent.

Cheers,
Andre

> 
> Tested on OrangePi 4 Pro (Allwinner A733).
> 
> Thanks,
> Alastair

