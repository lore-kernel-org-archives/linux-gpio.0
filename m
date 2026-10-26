Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032982;
	b=cgTvCDrwqRn0c0Qz0X544AU30ONLl+5dzdLRZnAIZMwpLpitUYjBiEqe2D3zCGxnB3LJ
	 mrg1QKqWYqjiQ2zeCEzH+IRo8maG/FoFXiyEACeAZFRHk9QDSqRTZd0m4BlOO7uEQxN5q
	 mlGEMPvAm818shsp3GeqSnZCvmMpzwdA66eeDiA3KzaaKXHqEmpOl1UDH5O1pTm3XUJOX
	 Yg98/zZCLmRLRVlaSKijq6eDnF0OjwwnK+3cG4RZlV6gJbDeXbKYx5Uodooju5j2axPoG
	 j/lIdtjEAJkOCsFpg1G31xL88w55SvpZEfRxvvCVD1ZMeAhJhvz98a+jcaTisx5HDEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032982;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=rl/sdudR8wX1+GEVh2fbN+8+vnr5jBWbAdmUCT1slSI=;
	b=y540RNOkNPoJIS1Lczot1luO1+nJ4JSjeG4TEF6L0F63xUTPFeh4CQHVGrBr1C0txjRW
	 eu6xUrRu5ROZQvhWwazWI0lrXr2h6Jysw9imb/KgRq82ZqjfheVC9NZK5J7jLtXc8+F1Q
	 XkT5dtnPhu2ntz8L1L9HKEqqkyrx5ASnMHcDOXJnGLed87v+yfgFi4LRNpcFJ9J1kJIbo
	 n7P7a4aC5ZQ7G8UAoUfJbqipknu1gLFwkeOpFJ2FHnNfiMBLMINrUjS4zfqTWlnxyL8FD
	 Komn3SDsZNuL8SqUGUDDOUn3gYPZQ1iqVQ1MbZHEON5Sn8hppcJIBtqiERSebObrdAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zr2s8SKr;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186EF606A31D;
	Mon, 26 Oct 2026 16:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186EF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Zr2s8SKr
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7295B1655;
	Mon, 26 Oct 2026 09:42:51 -0700 (PDT)
Received: from [10.57.60.72] (unknown [10.57.60.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86E553F7B4;
	Mon, 26 Oct 2026 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793032974; bh=7rUQZLP+SlM7AbMLViF+r61zYKGh+vmGw1BuFhIyhSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zr2s8SKrmcvfq6RKvLPEXc/cBwYmoEbGNi0zUkO4kq9deWneGSqXYqSqpPzXzcjU/
	 sWWP825ixEHEutVa39SjxwhGoWk6tT6A0FmdXnnTwxdvpiCOmVbWpd7InSXf/lA6+C
	 37u2CmBH7DJr8wMcBe/V91TS/kWm57pehuEfkP0I=
Message-ID: <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
Date: Mon, 26 Oct 2026 17:42:50 +0100
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
Subject: Re: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the
 first one that has IRQs
To: Pablo Mazzini <pmazzini@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20261025142412.112216-1-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pablo,

just some heads up about process:
- Please do not repost that quickly! The kernel doc says to wait at 
least a day, but that's only the lower limit, in case the series is 
almost ready and there were only minor comments from real(!) reviewers.
I would wait for a couple of days, after you got some proper reviews.
The reason is that reviews (by humans) take time, and it's not like 
people are bored waiting for some patches to look at. So they might be 
interrupted by something or need to do some checks and research. It's 
pretty bad if their effort is ambushed by a new revision, which now 
means they need to start over.
- Please do not repost just because Sashiko said something. Wait for a 
proper review. It's probably a good idea to acknowledge the comment, but 
don't just re-post then.
- Try to avoid posting inside the merge window. Depending on the 
subsystem and maintainer, your posts might just be ignored, because they 
might be busy fixing up conflicts. But more importantly: you are missing 
the correct base: you should always base your patches on an -rc1, unless 
being told otherwise explicitly. And since -rc1 won't be out till 
Sunday, this is not a good timing.

I will comment on the patch set separately.

Cheers,
Andre


On 10/25/26 15:24, Pablo Mazzini wrote:
> The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
> none. The A523 got a DT interrupt for its unimplemented PA bank to work
> around that, the A733 would need the same, and on both PK is written
> past the end of irq_array.
> 
> Number the IRQ banks like the static drivers do, with irq_bank_map for
> the A523 and A733, and drop the PA interrupt from the binding and the
> A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
> made-up interrupt.
> 
> v3:
> - apply irq_bank_map to the A733 register layout too (Sashiko)
> 
> v2:
> - give the A523 and A733 an irq_bank_map, and drop the PA interrupt
>    from the binding and the A523 DT
> 
> Pablo Mazzini (3):
>    pinctrl: sunxi: dt: number the IRQ banks from the first one that has
>      IRQs
>    dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
>    arm64: dts: allwinner: a523: drop the PA GPIO interrupt
> 
>   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
>   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
>   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
>   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
>   6 files changed, 17 insertions(+), 16 deletions(-)
> 
> 
> base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db

