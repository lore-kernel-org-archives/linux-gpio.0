Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE343033E0;
	Thu, 19 Mar 2026 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929801; cv=none; b=V44F2eh7WKLVmpG/Jk6iGmD0b8D+8nzk19LL+mQI68XUk8o46aHvk56WTM9K9bkwWNwvceSyA1/8X1ifCC8GcWslm132qe+uRI35o7iOvODB2GDTO7MRRHHIgscqp1GkEpGeWNQKEO/X3zabp8y/lwOx2hghNS7lboo9+CagblM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929801; c=relaxed/simple;
	bh=dh4tiSZ0JU9s0rUFKCuq6abboXS2Xjn4z2r2vKp7M/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMp0BoGEcJfxW+gqlv8FPXDNH8etkrl6DRquDoE8I7LQm3f5AAH1a6xLs8KeusEQGMxJT6AfRtydSBA+BlQ1M0hCLN0yGm8LVhbtz4gi5TpI72vR2pIG1KTriwwSq76mQrvEMHcBOM464L0vutqJWoKPBqUzflr6ZimdEd8oaIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD07E1A25;
	Thu, 19 Mar 2026 07:16:31 -0700 (PDT)
Received: from [192.168.178.23] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A5133F7BD;
	Thu, 19 Mar 2026 07:16:35 -0700 (PDT)
Message-ID: <dd275884-665b-46ca-a72a-c32aa189fc25@arm.com>
Date: Thu, 19 Mar 2026 15:16:33 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: wens@kernel.org, Linus Walleij <linusw@kernel.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
 <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 3/19/26 15:06, Chen-Yu Tsai wrote:
> On Thu, Mar 19, 2026 at 9:46 PM Linus Walleij <linusw@kernel.org> wrote:
>>
>> On Sat, Mar 14, 2026 at 9:10 AM Michal Piekos
>> <michal.piekos@mmpsystems.pl> wrote:
>>
>>> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>>>
>>> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
>>> is in unitialized state.
>>>
>>> Solution is to set pinmux to GPIO INPUT in
>>> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
>>> earlier.
>>>
>>> Tested on Orange Pi Zero 3.
>>>
>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
>>
>> Should this have a Fixes: tag and should it be applied as an urgent fix?
> 
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> 
>> Tag for stable?
> 
> The original patch wasn't tagged for stable. And it doesn't seem like it
> was auto picked.
> 
>> Also: is there consensus with Andre that this is the way to proceed?
> 
> As Andre mentioned, the mux value for "disabled" is different between
> generations. So we likely need to make the value part of
> |struct sunxi_pinctrl_desc|.

There is already the SUNXI_PINCTRL_NEW_REG_LAYOUT flag, which describes 
exactly that: the new layout increased the bit field to 4 bits, moving 
the HiZ value to 0xf.
But it's just a flag passed to sunxi_pinctrl_init_with_flags(), not 
stored in desc, and not available during runtime. Which is what I tried 
to fix for my A733 series:
https://lore.kernel.org/linux-arm-kernel/20250821004232.8134-3-andre.przywara@arm.com/

So maybe we can cherry-pick just this patch, then check for that flag?

Cheers,
Andre

> 
> Michal, can you respin a version so that we can get this fixed in the
> same release?
> 
> 
> ChenYu
> 

