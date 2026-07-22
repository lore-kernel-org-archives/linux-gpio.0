Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8A46EC9C;
	Wed, 22 Jul 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709153; cv=none; b=KmqE0vAyHNY0y2SeH7mCrh8O0v/JiprlUCoJVSAp/5ov+PGXrrkv3od9tQkwB2fikKJvQmY01AvPjSm+KjYZED+6eTlGUiLaZ+gOBejix84R64QMRxdN606SdvxTGut8LokuxL9qKNas+yyfSqBqiAbROV9tY/9kDzD01/gDA6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709153; c=relaxed/simple;
	bh=4FQG/3+PCJnRx6AG47GAfXdpziU9nwJtfPlED+L0aX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPB24qIpfZV4jsHR1aFbzCWekvaZeatAlSqxSS1EvO36wgmEOgRjCjFGXnv8sjkgLa1L3U1Dm0hjydzEWt0Jex15Pky5BGC9HIMtzfK7jwMvBmQJnLWf6Jyfz3lTvuBpOozCoOtn3kWoixdbxLT/7nE1ERQz5RHM5CzdErWl6/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h+rOqmhM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h+rOqmhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784709149;
	bh=4FQG/3+PCJnRx6AG47GAfXdpziU9nwJtfPlED+L0aX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+rOqmhMZRj+4zyyfjXhCZeF0HGWVVXAYkiC2/cPAUtTlHEMIBach5jj1K8xgK46V
	 kDkL/8w/kbJ0EfFJabNgK6Lk6iOIp0o4OEMb9CGFx8ZBOgclYnY0XxVszS9EggTf/b
	 QW0FYpqGNIRUaoG9J58rwWu7y1ZJlc37zX7tJ9NSM75Z8qsHxwK0HVrmwZQN9AWSZD
	 CQmq4bXDiKO6sP5ZQxrLLaLWcEQH/s2S1g6iiQ5qumjvyZ8/hqYIFRcejkd9m8fBD5
	 04xvO57R6EiJHDv2EkqYgwnpCchgQ3f900jqSClQ0LLgIuiST40SzF9DY9Cfai2DvE
	 d4x0a5Yld0O6w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2693917E0177;
	Wed, 22 Jul 2026 10:32:29 +0200 (CEST)
Message-ID: <a642b843-b828-4bb0-96d9-0f0d7466e29d@collabora.com>
Date: Wed, 22 Jul 2026 10:32:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] pinctrl: mediatek: free EINT resources on unbind
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260713083808.168957-1-justin.yeh@mediatek.com>
 <20260713083808.168957-3-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260713083808.168957-3-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/13/26 10:37, Justin Yeh wrote:
> mtk_eint_do_init() creates an IRQ domain, populates it with a mapping for
> every EINT line and installs a chained handler on the parent interrupt,
> but none of these are ever released. This was harmless while the drivers
> were built-in, but now that they can be built as modules and
> unbound/rmmod'd it leaves behind a dangling IRQ domain, interrupt mappings
> whose chip data points at freed memory, and a chained handler that keeps
> firing into that freed data.
> 
> The plain allocations in mtk_eint_do_init() already use the device-managed
> devm_*() helpers, so tear the remaining resources down the same way:
> register a devm action that detaches the chained handler, disposes of the
> per-line mappings and removes the IRQ domain. This mirrors the
> device-managed lifecycle adopted for the GPIO chip and keeps the whole
> EINT setup self-cleaning on unbind.
> 
> Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 47ac92ea98c2..7cd4c4a9fc77 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/device.h>
>   #include <linux/err.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/io.h>
> @@ -509,6 +510,24 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>   }
>   EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>   
> +static void mtk_eint_teardown(void *data)
> +{
> +	struct mtk_eint *eint = data;
> +	unsigned int i, virq;
> +
> +	/* Detach the demux handler so it can no longer reference freed data. */
> +	irq_set_chained_handler_and_data(eint->irq, NULL, NULL);

add here:

synchronize_irq(eint->irq);

...so that we don't risk race conditions when tearing down.

after which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
> +	/* Dispose of all child mappings before the domain is removed. */
> +	for (i = 0; i < eint->hw->ap_num; i++) {
> +		virq = irq_find_mapping(eint->domain, i);
> +		if (virq)
> +			irq_dispose_mapping(virq);
> +	}
> +
> +	irq_domain_remove(eint->domain);
> +}
> +
>   int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
>   {
>   	unsigned int size, i, port, virq, inst = 0;
> @@ -601,7 +620,7 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
>   	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
>   					 eint);
>   
> -	return 0;
> +	return devm_add_action_or_reset(eint->dev, mtk_eint_teardown, eint);
>   
>   err_eint:
>   	for (i = 0; i < eint->nbase; i++) {

