Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1334A8A39
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821947; cv=none; b=cvE/8SRjuyh8gpEuRadqiWhoMzR+8zVQzQi7pPsmbifXwAZ7lumh7b7qIwThhR1lcbYDpQePm6uk5cNDVb27tUHFo1vsxHsaj+PTEA9sLDqP5fUEh45oCxzOvCKzW2M+M44XjCacjgWK3zp7sb5bNTNDxJlvI7QUhvDMyNyRHe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821947; c=relaxed/simple;
	bh=Dp44+brKrFOcP235mSwYDZ9WIHnNlOH7BQXjO8CdbhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJpZ8j70iQxYGNE+bHC8WeY4bM/XeJ54HZNdBWsMQiLMnnLaYY3dAfMD0nRSMn/MgwXlhrve323d6fmuN2lEcaU2lWrL/jJm7eFdunJaVLhfZepry5gCPp8+zfTjxo+iQnzR1VjesSB7/e030JKuZyi09OO1Bn8uH8zRxHhr+m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dBO8t4AF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dBO8t4AF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BEFF169E;
	Mon, 12 Oct 2026 09:19:01 -0700 (PDT)
Received: from [10.57.54.85] (unknown [10.57.54.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58A6B3F673;
	Mon, 12 Oct 2026 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791821944; bh=Dp44+brKrFOcP235mSwYDZ9WIHnNlOH7BQXjO8CdbhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dBO8t4AFnImNqcxlYS0vJVpSo5zXWMe2+9dIzuGX3Gz5nRD9nHD2INz4P6mL0cW2I
	 sCTb9jsidwpDuDZTzXAaO8DRlJb+LPU3+/y/iKd9pAHb0jbbCgYpEPB2+BlmQ9Xn+X
	 NpgH1St4absap8pjW2SJF+EgP+16PRA3cSJZFeZc=
Message-ID: <cb32f0e2-3c49-4228-bb45-e1855a992c6b@arm.com>
Date: Mon, 12 Oct 2026 18:18:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A733 support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yixun Lan <dlan@gentoo.org>,
 Enzo Adriano <enzo.adriano.code@gmail.com>, linux-gpio@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260910133519.459011-1-andre.przywara@arm.com>
 <20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thanks for the report!

On 10/8/26 21:47, Vinicius Pedrosa wrote:
> Hi Andre,
> 
> While bringing up the Radxa Cubie A7Z on mainline, I went through the
> A733 io-bias code against the user manual (v0.92). The register layout
> doesn't match, on both controllers.

Just for the records: this paragraph above would have been enough, with 
that hint it's pretty obvious that it's wrong.
If you have tested it in a before-after/broken-works fashion, you could 
mention this, but there is little need in going full bit details on 
something that's quite obvious.
So could you show that something doesn't work with the current code, but 
got fixed with some changes? Like the eMMC situation on the A523?

> On the main PIO, GPIO_POW_MOD_SEL (0x040) has two-bit fields per supply
> domain: PF is bits 11:10, PK is 21:20, and PB falls under the VCC-IO
> field at 25:24. sunxi_pinctrl_set_io_bias_cfg() treats it as one bit
> per bank, so a PF request writes bit 5 (inside the PC field) and a PK
> request writes bit 10, the low bit of PF.
> 
> The R-PIO has the same layout, PL at 1:0 and PM at 3:2. The a733-r
> compatible shares the A523-R descriptor, so it also gets the inverted
> encoding and the RMW at 0x344, which the A733 manual doesn't list.
> 
> PL is the case I like least. Running the unmodified helper on the host
> with the R-PIO state I read on my board (SEL 0x000aaaaa, 0x344 = 0) and
> a 3.3 V vcc-pl supply, SEL becomes 0x000aaaab. Per the manual table PL
> goes from 10 (fixed 3.3 V) to 11 (fixed 1.8 V). I haven't run that
> path on the board. With no A733 board DT upstream yet, I don't think
> anyone hits it today.
> 
> Locally I set BIAS_VOLTAGE_NONE for the A733 and gave the A733-R its
> own descriptor with NONE, leaving A523/A523-R as they are. That's
> roughly what the vendor BSP does too: its kernel never programs these
> registers and keeps the firmware setup (all auto on the main PIO here,
> PL/PM fixed at 3.3 V).
> 
> Tested on one board (the vendor kernel reports SoC version B),
> RAM-booted over FEL, with your pinctrl patches on an integration tree
> and fixed regulators for the 3.3 V PB and PM supplies. With a few
> printks I checked that UART0 (PB9) and a gpio-led on PM2 reach the
> helper on the first request of their bank and that SEL and SEL+4 stay
> unchanged. Same registers without the printks, and UART and the LED
> work. A523 is build-tested only.
> 
> Would you be OK with disabling the io-bias programming for A733/A733-R
> as a fix for now, and doing proper voltage mode support later? If so
> I'll send the two patches, with Fixes: tags for 0535bfbfa97b and
> 31d68e10381c.

What is the big problem with just extending the code to use 2 bits, for 
the A733? I sketched that here, looks pretty harmless, and is just a few 
lines.
The A523-R problem is more annoying, since Allwinner mixes and matches 
again here: the A733 register layout, but at an A523 offset. And I 
missed that part, which means it effectively breaks compatibility with 
the A523-R, so this needs more fixes, including the DT binding.

Cheers,
Andre

