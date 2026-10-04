Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B25722FDE6;
	Sun,  4 Oct 2026 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147746; cv=none; b=D6tAB5Pdr/4V8bgaWVJKkyhdxQ9TD23PteeCUB/+CFUqBYeaLf4UG9I0wef4ECL+yByB0K0o7pZK1Q1sj4c+uWjNvfv9Nt/2bbgyRt5u8UVVlHBIyGAaoW0otPkJ/KMpVy/+JoE3RbRKPJvIJLpO0OQ3rH14noNSneBpBFZunMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147746; c=relaxed/simple;
	bh=L8CykEMHJYwOt0EHko7Ar+PdxNSESH4QKQqzSpPvsyY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYBDMcJFY0e/1rNkooHmHoPo8fuj5gMN/fSUWWe/zMPaqJsMQ0s0R/hXRFZd29PyPNHBFCu8Vpz4WXDVxjVZLbBM69eIFEYZbdSKlX38m/NDIce50c0arBtsPFccA8zUYeXE/EVMTDV31xD++aCRWRbka5O/8aydU1NxgQ1Ib+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XrryI15A; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XrryI15A"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4317152B;
	Sun,  4 Oct 2026 14:02:18 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C7A23F86F;
	Sun,  4 Oct 2026 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791147742; bh=L8CykEMHJYwOt0EHko7Ar+PdxNSESH4QKQqzSpPvsyY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XrryI15AkdfMkkPNwFILx0swrNyjbuIaMUS1pbP0xtTUgafj9UJT/dqcGwLtN3Lqr
	 2LjD/EQAXPO3wVbXCPVYrPR14QDX+k1Xtg9ifhAy+5ANP7tF004Axj09sdlXcdBuWt
	 Ys+zRjqxbh0HYYhb8+daShac9XyV4/GqwB9z3dZY=
Date: Sun, 4 Oct 2026 22:57:24 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Norman Herms <dockseed@proton.me>
Cc: Linus Walleij <linusw@kernel.org>, Pablo Mazzini <pmazzini@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: pinctrl: sunxi: a733: irq_banks too small for port K
Message-ID: <20261004225724.0b821e9c@ryzen.lan>
In-Reply-To: <lqyUiTS5jK5vqN8dT8ByLl8sBPTW6eSDG_13v8UAkVIUCnnxLv4UBrlHTm0c7f4brqOd5ur4sDdgld0Ol4usnXOHgJscjqwJl2BrzPpJk5Y=@proton.me>
References: <lqyUiTS5jK5vqN8dT8ByLl8sBPTW6eSDG_13v8UAkVIUCnnxLv4UBrlHTm0c7f4brqOd5ur4sDdgld0Ol4usnXOHgJscjqwJl2BrzPpJk5Y=@proton.me>
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

On Sun, 04 Oct 2026 06:38:56 +0000
Norman Herms <dockseed@proton.me> wrote:

Hi Norman,

> Andre, Linus,
> 
> Observation on "pinctrl: sunxi: add support for the Allwinner A733"
> (Andre's series [2], now in linusw/devel for 7.4):
> the A733 pinctrl description sets .irq_banks = 10, but PA does not
> exist there, and prepare_function_table() in pinctrl-sunxi-dt.c counts
> IRQ banks from PA, so PB is 1 and PK is 10. This is the same
> numbering problem as in Pablo's thread [1].
> 

So I blame AI, but that below is a lot of words for a simple problem:
the number of IRQ banks should be 11, not 10. If we go with the dummy
IRQ. There are no official DTs for the A733 yet, so we need to decide
there, and I guess that depends on the outcome of the A523 problem.
I will send a fix after -rc1, with one of the solutions - unless you
beat me to it.

Thanks,
Andre

> With irq_banks = 10, PK (26 pins, bank 10):
>  - sunxi_pinctrl_init_with_flags() allocates irq_array for 320
>    entries but sunxi_pinctrl_build_state() writes PK to 320..345
>    (104 bytes past the end) at every probe;
>  - PK gets no parent interrupt and its hwirqs are outside the IRQ
>    domain, so there are no GPIO interrupts on port K.
> 
> Measured on two Radxa Cubie A7S boards, same kernel (v7.3-rc5 plus
> this series), once as is and once with irq_banks = 11. Requesting
> edge detection on PK0 through the GPIO v2 character device fails
> with ENXIO as is and works with irq_banks = 11. PB0 as a control
> works in both cases.
> 
> KASAN (generic) does not report the overflow on either board. devres
> rounds the allocation up to the whole kmalloc bucket, so the 104
> bytes still lie inside the object. The out-of-bounds write is
> therefore invisible to KASAN here.
> 
> Regarding Pablo's thread: with the convention Andre preferred there
> (count from PA, placeholder interrupt in the DT), the A733 needs
> irq_banks = 11, which also matches the binding (exactly 11
> interrupts). 10 would only be right with the renumbering from
> Pablo's patch, which is not applied.
> 
> I am not a kernel developer. The measurements were run on my boards
> by AI agents, and the analysis was done with the help of an AI
> assistant (Claude). This is a report, not a Tested-by.
> 
> [1] https://lore.kernel.org/linux-sunxi/20260929203634.32998-1-pmazzini@gmail.com/
> [2] https://lore.kernel.org/linux-sunxi/20260910133519.459011-1-andre.przywara@arm.com/
> 
> Thanks,
> Norman
> 

