Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAA353977D;
	Tue, 13 Oct 2026 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929637; cv=none; b=HIne1Gc6DF88g/G1C7mfN185EjyTTuvFk4Lkoj1MFnaiiN8lole/1QU5deyhgmyc2h6ONAgXFbHno0aNnabNG/cER60KIHcVkAIGbORZLlxn/tylbAk6G7dRHY10R/U/Gzj0gGPoR6QJjYdAbLQ2WlMlZWJfOUq460ULWHsxnIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929637; c=relaxed/simple;
	bh=b9BtCWGkJHn0bMKGND0IyL2uVXPmtmkcN+nYesDBUN0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gLWbkd3bpNrWWDFaUYHF6lW1ame2/SFgexzI6v+zmrltSlGci5uIA9eqWR0767WNU+lJb+yGH9PvLE73FdhxdqR9hCs209prtGkwX2gNx4o7qMoDETGfGQMWbZ+IdZKcjm7SUy78WOcbouUgO6VVICItQfaD3DAj7HOTX4K5adY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C1rfY83B; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C1rfY83B"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE8101688;
	Tue, 13 Oct 2026 15:13:50 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28A93F871;
	Tue, 13 Oct 2026 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791929634; bh=b9BtCWGkJHn0bMKGND0IyL2uVXPmtmkcN+nYesDBUN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C1rfY83BkHnie2RRXlgSM0spEEod8PgaPuxpFHc0TfWCkwwT6A+J9lbPVQbi8/Zob
	 ds7qUjs0sZ6cvcThatuxZSggPOanDyou4n0L/87Y0HuAIEiVR1Tc0g8g8GPkxnWb+f
	 wWG5VvHpBfAHhVr89J/Rly0sMuxkD70ypumHEPhs=
Date: Wed, 14 Oct 2026 00:13:34 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Jerome Brunet <jbrunet@baylibre.com>, Yixun Lan
 <dlan@gentoo.org>, Enzo Adriano <enzo.adriano.code@gmail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Message-ID: <20261014001334.54dcf0b5@ryzen.lan>
In-Reply-To: <20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261013142351.771229-1-andre.przywara@arm.com>
	<20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 14:23:38 -0300
Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> wrote:

Hi Vinicius,

thanks for having a look and testing it!

> Thanks for the RFT. I found two things when checking it against the A733
> manual and my Cubie A7Z.
> 
> PB is an exception to bank * 2: its VCC-IO field is at bits 25:24, while
> bits 3:2 are reserved.

So PortB has no supply of its own, instead it's always supplied by
VCC-IO. That was even more common on older SoCs, with also PortH and
PortF being supplied by that. Which somewhat means that this is broken
there as well?

> With the board's SEL value (0x01155550), a 3.3 V

What do you mean with "the board's SEL value"? That's not the SoC reset
value, is it? So who programs that value, and why?

> request produces 0x01155558, leaving VCC-IO untouched.

... naturally, because nothing in mainline sets VCC-IO, which is beyond
the SoC's GPIO bank offset.

> I also think we should preserve AUTO (01). On my A7Z with vendor 5.15,
> PF=10 resulted in 22 SDR104 read timeouts and no rootfs, while PF=01 and
> PF=11 reached login.

So this means you hacked the register in the vendor kernel, for the
sake of an experiment? And I guess this just means that the vendor
kernel uses UHS, and uses register 0x70 to switch PortF to 1.8V? So you
need either auto or 1.8V for it to work, the same problem we hit with
PortC on the A523.

> This was one run per setting with one card, not a
> mainline before/after test. In my mainline setup, MMC0 already requests PF
> with a fixed 3.3 V supply, so the RFT would replace AUTO with 10 even
> without voltage switching. Preserving AUTO requires no special case for PF.

So can you say whether you observed a real problem with either the
current (broken) code, or with one the fixes? I am still confused about
your reports, whether they are just experiments, and comparing to the
BSP, or looking at the manual, or whether there is an actually observed
problem.

> I boot-tested your RFT with two small fixups for PB and AUTO on my Cubie
> A7Z (rev B). UART0 and MMC0 work, and GPIO_POW_MOD_SEL remains at
> 0x01155550. No voltage-field writes were expected with this DT. I haven't
> tested the RFT as posted.
> 
> I agree the full table and PI exclusion aren't needed, and found no
> evidence for restricting the encoding to revision B.

Thanks for the confirmation, and just curious where this revB
restriction came from, originally?

> A733-R still needs its own descriptor for the two-bit PL/PM fields. I'm
> happy for your RFT to supersede my patch 1 once PB and AUTO are addressed,
> and I'll rebase the A733-R fix on it.
> 
> I have the PB/AUTO fixups and the A733-R patch ready, and can send them if
> useful.

Well, this is getting really messy, isn't it? I never understood why
the IP even allows manual programming if there is an automatic setting.
Did you find any recommendation? IIRC manuals for other SoCs did
recommend one or the other method. If AUTO works, and is used by the
BSP, then we can just use that, but in a much simpler way: either use 
BIAS_VOLTAGE_NONE, or create a new AUTO name (better), and then skip
the whole action in sunxi_pinctrl_set_io_bias_cfg(). Instead just once
program the GPIO_POW_MOD_SEL to "all auto", once at init time.
Curious what others think about this.

Cheers,
Andre
