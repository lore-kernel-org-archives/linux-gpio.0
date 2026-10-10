Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D130E83A
	for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791654435; cv=none; b=guR0RdYNr/B67apMSAAgt/vmhPoPiygUgWqNIImlvwWuvfNAiUyFcbelEd9iJ5z+fXZMbRyB7qyFnusOo6DFEvZAXu2PO9bQCIYLE0OlUUtRLKIl7h9zZLqbkj2CmWDuM8IWIVAfsVdcimPHWW8oz4m+rRu8uRd5RFDOkTjrjoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791654435; c=relaxed/simple;
	bh=0pDEB726iZux5u7NawPt1O2YXLRnxNu6qkge1CUmHkY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZaBl/t8ldGsXejtcokQkYl65LiLxwuCP0F+e3Or3BrRGFAGGOfrcJnwlk/QHNkSDIItWVyBbwscjWIg6tmztDQM0OZ/7T45CIi4F+VWdlWqC2beZhp4c86AFity4yf/jFQ8qRqojuatKz/uvzr6FSKllmSuzcBaEW5LMDcFFd+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TKnVyIjU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TKnVyIjU"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A177E82BFB;
	Sat, 10 Oct 2026 19:47:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FS1pE1VIQjhE; Sat, 10 Oct 2026 19:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791654429; bh=0pDEB726iZux5u7NawPt1O2YXLRnxNu6qkge1CUmHkY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TKnVyIjUi57rNM2lIben3ytf3m5eVx5jvXrrFJ1SZI3UMWwPeokA2y294OpRcH34U
	 cI9oiMaIOMCKQrmmoOXv/+Y8Zeg7YfpsUp7ycHkblUYSSymaPXE9c9EV1I0/j3a37M
	 gGCJkb1aiH+lSXaOc2qDVp4yofQGnGRtUVOzRXsXFM71VFVMFI1ITw8cwygAfJZ5CP
	 AmHfLF2qi/4sLemk3ZgKNU7D7jK5n/bO5EtCfyLpXFKvp5zE91XYn/gyHsDWwak8R1
	 39unfK8BQDdoIjnO63XGwBkMCkGL5kyVObb6OBvTtnYfEgW3hhQ3BeulxDHpItD4EW
	 MQabYtoQzDMvA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 17:47:08 +0000
From: Rustam Adilov <adilov@disroot.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: single: add big endian support
In-Reply-To: <sashiko-outbox-166741@kernel.org>
References: <20261010161545.62959-1-adilov@disroot.org>
 <sashiko-outbox-166741@kernel.org>
Message-ID: <2091eb9e8e54cfb30664c3bdfe8eb685@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-10-10 16:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] api: undefined readl_be/writel_be macros break generic build
> --
> 
> commit 37f4a78fd7a9ab63fc123070591147a5473d3fdf
> Author: Rustam Adilov <adilov@disroot.org>
> 
> pinctrl: single: add big endian support
> 
> This commit adds big-endian support for pinctrl-single to handle big-endian
> device tree properties. It implements custom I/O accessor functions for 
> big-endian MMIO access, intended to support MIPS platforms like RTL930X.
> 
>> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
>> index e0eb7240a9859..001a0c157d6a0 100644
>> --- a/drivers/pinctrl/pinctrl-single.c
>> +++ b/drivers/pinctrl/pinctrl-single.c
>> @@ -265,6 +265,26 @@ static void pcs_writel(unsigned int val, void __iomem *reg)
>>  	writel(val, reg);
>>  }
>>  
>> +static unsigned int pcs_readw_be(void __iomem *reg)
>> +{
>> +	return readw_be(reg);
>> +}
>> +
>> +static unsigned int pcs_readl_be(void __iomem *reg)
>> +{
>> +	return readl_be(reg);
>> +}
>> +
>> +static void pcs_writew_be(unsigned int val, void __iomem *reg)
>> +{
>> +	writew_be(val, reg);
>> +}
>> +
>> +static void pcs_writel_be(unsigned int val, void __iomem *reg)
>> +{
>> +	writel_be(val, reg);
>> +}
> 
> [Severity: Low]
> Will this break the build on architectures like ARM and ARM64?
> 
> The macros readw_be, readl_be, writew_be, and writel_be are strictly
> architecture-specific and do not exist in standard generic headers like
> <asm-generic/io.h>. Since pinctrl-single is a generic driver heavily used on
> architectures like ARM and ARM64, compiling these macros will result in build
> failures due to undefined reference or implicit declaration errors.
> 
> Should this use the generic kernel APIs ioread32be / iowrite32be (and their
> 16-bit equivalents ioread16be / iowrite16be) for big-endian MMIO access
> instead?

Interesting that these macros are not in generic files... Why then this is a
low severity if it will cause build issue on some architectures is questionable
to me but i will change the patch to use the the mentioned functions instead.
