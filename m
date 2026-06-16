Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA41A9FA4;
	Tue, 16 Jun 2026 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593224; cv=none; b=BGftUoPuAHcEu4ahkyCdzNmbFnEaIRL5PwSpJAZB4tqWjSOwSfriPEYGguuhfWP1RKOLWRxqtxcDFKQvD5Yj4eKxKU9EPIslX4Rz4BmaJCyoOVjumoRu5tpVcqsVE4lBUXP9GqZdvEBml5rNEvt5OLpjKncS7HoBnJyOuqTdx3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593224; c=relaxed/simple;
	bh=yoZrC20Rr/Cl7sij41NIAraYOQTowlZkzcUZDAlReHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqQqL3yC3wUdUPDX8x40G3Y96jZjTYCzgN3cF9eWS2f+pb45syjnslj69S6QC154s6WYV4sDN63B+BWlA5Sk0oo79slGXxgQD2eh2I2++eXNs2mDJ04ApXZQk6yLY/Dl1ESAkUoajxdGV9fCtWKSV74cAj+Cd9UrIdxEpwK3/kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RsfueAgC; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RsfueAgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=4NPwGkMgp0eY0WxVji1Jx5+S1nFDsXAjFrMfgpRjXls=;
	b=RsfueAgCIYvLWcFzZHxy7TpdzFbYm5JSlC9oERSqjwdBXYfj2zODaNnQ+8Gwnp
	iHC7TrRACuFbtKHsvkvYzqpNa1oWu6lSHjMC3jlcidauV2Zs+9oHs04lXc/ukzYw
	nkAFv5W1PVlaizEKw1QrFwtRgtwGzNSYITEszh1Mp7b6o=
Received: from [192.168.11.90] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3tIhj9DBqejHjDw--.42515S2;
	Tue, 16 Jun 2026 14:59:48 +0800 (CST)
Message-ID: <d1420a23-d0cc-4945-8591-312e1d385824@163.com>
Date: Tue, 16 Jun 2026 14:59:46 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pinctrl: Kconfig: fix unmet direct dependencies
 detected for MFD_STMFX
To: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260616065241.7478-1-haiyuewa@163.com>
Content-Language: en-US
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <20260616065241.7478-1-haiyuewa@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wA3tIhj9DBqejHjDw--.42515S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WryfAw4xGF4xAw48XF1rCrg_yoW8GryUpa
	93Kr4F9r1UXrZ8Ja17Cryxury3Cwn7CrWUuasakas8uFW5Zr4DC3s0krZ7WF4qkrZakr45
	Gay5Wa47WFWrt3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFApOUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC7wT8aGow9GRjEAAA3G

Linus,

Sorry, please ignore my patch,I found it has been fixed in next tree.

BR,
Haiyue

On 6/16/2026 2:52 PM, Haiyue Wang wrote:
> The commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
> on OF_GPIO") will cause:
> 
> WARNING: unmet direct dependencies detected for MFD_STMFX
>    Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
>    Selected by [m]:
>    - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]
> 
> PINCTRL_STMFX selects MFD_STMFX, which depends on OF. Previously this
> was gated transitively by OF_GPIO, which is dropped. So PINCTRL_STMFX
> can be enabled on non-OF systems and select MFD_STMFX in violation of
> its OF requirement. Add the missing "depends on OF".
> 
> Fixes: e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO")
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---
>   drivers/pinctrl/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 03f2e3ee065f..08218ef140e0 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -549,6 +549,7 @@ config PINCTRL_ST
>   config PINCTRL_STMFX
>   	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
>   	depends on I2C
> +	depends on OF
>   	depends on HAS_IOMEM
>   	select GENERIC_PINCONF
>   	select GPIOLIB_IRQCHIP

