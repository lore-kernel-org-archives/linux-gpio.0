Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0CC125A0;
	Sat, 29 Aug 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788002456; cv=none; b=eVHN/1u22e3rs84lRx+EQ0pkfVnCfxepZ9l0Yq25Z6XegdIsPJiG1EdT5FnfMJKXoUdg3fZibjz4rwWmqiirQ5iFDNwbEg/61WuCGBK3/ETWE4FRIBYkDnH8Hao17YFtw3XpiJMiBSjp2rLtXOaRfPoqY6xhpOSAl+Njw3T+gJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788002456; c=relaxed/simple;
	bh=aih4fbchMjpaTHd7Uaz+aGqp+O5TVAcl+oXYIYpCNS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YByJMkGDvN9KicHjfQZB/xm2YnF7KNJXFjZx3HKcZBu105ssZ2hH4A2jn1NRswTZO+nyQ6eGUNgD2O3BX65erf9EChBjmskH8zGL72q+KSTUdux5Jx20+iBJ6hgjOD1805823papD/b/2JHhWhCrjSx5S2JtnOqSw12zs+sEJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TEFXuUck; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TEFXuUck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bQ+pM52Z9d9nH2LW96A3uCNySOonoA9pMirLJW0HCh4=;
	b=TEFXuUckI/Pn4sONOUGuMFyHYOcYIlgy0z27KZpCM2Ve2zmXJg9iDAC2kRZp3H
	bVj6KoMT4CjdTbjdjwJ8WurtpGFp/mcMOH7K255Sk37+2XeVxoj/m9dBuOK3Aqy1
	DCuVteMRkPW1cFHHn/OcyYJ7ZlKaRSExyTc6aQOIkdlC8=
Received: from [IPV6:2409:8a62:3e6:7890:62cd:186:f39c:9f61] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDn3+tiwJJqGlPIEA--.37249S2;
	Sat, 29 Aug 2026 19:20:03 +0800 (CST)
Message-ID: <e1f544bb-a338-4360-8158-a373881a9121@163.com>
Date: Sat, 29 Aug 2026 19:20:02 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: stm32: fix the unit of the hwspinlock timeout
To: antonio.borneo@foss.st.com
Cc: alexandre.torgue@foss.st.com, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com
References: <9b0f76a08a7c1dbaec4684b4bc013263e0149a4b.camel@foss.st.com>
 <20260827141127.25789-2-junan76@163.com>
Content-Language: en-US
From: Ju Nan <junan76@163.com>
In-Reply-To: <20260827141127.25789-2-junan76@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDn3+tiwJJqGlPIEA--.37249S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr47Zr4DZFW3Cr13Ar48Crg_yoWDXFg_ua
	1rJ3srCa4qkFyF9w1DCrn3Za4F9anrXw409rs0gF13Cr9Fvw4jkrZ5uF93C3Z3ua13ta4D
	AF95Xr1Sy3y7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjasj5UUUUU==
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1AaIOmqSwGZYRwAA3h


> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index d97057ec2..0d888d30f 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -87,7 +87,7 @@
>  #define gpio_range_to_bank(chip) \
>  		container_of(chip, struct stm32_gpio_bank, range)
>  
> -#define HWSPNLCK_TIMEOUT	1000 /* usec */
> +#define HWSPNLCK_TIMEOUT_MS	1
>  
>  static const char * const stm32_gpio_functions[] = {
>  	"gpio", "af0", "af1",
> @@ -633,7 +633,7 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
>  
>  	if (pctl->hwlock) {
>  		ret = hwspin_lock_timeout_in_atomic(pctl->hwlock,
> -						    HWSPNLCK_TIMEOUT);
> +						    HWSPNLCK_TIMEOUT_MS);

Please ignore this patch for now, since it has a dependency issue with this one:
https://lore.kernel.org/lkml/4dcb0fb67e12ec6e6aa812e6e93b435704c6105b.camel@foss.st.com/

Thanks Antonio, I will think more about what you said.

Regards,
Ju Nan

