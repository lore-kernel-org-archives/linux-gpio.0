Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D52544D76
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081394; cv=none; b=fTVNiv7uBOOkp1OZS1sfQF4RAPOmrB0MIV+dYTdE5lkvAoN5QfLfSRpH2ublrE1AdOgHGSgMXGFFZ62rCVLx4ukKgjhl01bj8cg4T5ix37BwdRjkE94NVwBudTynMBxw5K9BfAINfPWPV8KDL/yaCZaUIGWBj/QNGYkZ1YYVs2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081394; c=relaxed/simple;
	bh=f0q0cC6lq7vVx5O0zXmTQLlKcPPRMuFaHUE0gETvub4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/7AojjQtnchzNU89h+9a1fy/CZv8v5RUn3oDCLJcQlvogqzkzpb4f3DzanQB8qWlRbi/mvcVmsLMFLHMW38zHDfYKHL+XhlGoNwY1MkIs3GQSb/kU6GjTCxmbPjUzzubhpOXZa9ohTJ25R6M8iOa2d8DzOfFqG/IVk0WdDPrbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=ddxPrJDG; arc=none smtp.client-ip=62.149.158.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="ddxPrJDG"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id 8ztQxxvaCXmot8ztTxj4ap; Tue, 22 Sep 2026 14:46:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790081204; bh=f0q0cC6lq7vVx5O0zXmTQLlKcPPRMuFaHUE0gETvub4=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=ddxPrJDGD2qAjkF/lIOWHPLnKqeC8ApMgVyA6B/MdfZb5wDnHiU53ep91aSq3RJB7
	 TkEh8iElX2sr+XrAVtdRoGt711MsERhM2r2Ti3FP81+EAk/m28ynvgYbM0TIlwA8az
	 jKdXd4sqYAoR/N2XdHoMo4PEC/5BRQ6Z6242/C4S4lmWBS9dTmoZuvoPdj8kLyzMUN
	 +m3wa0am+w0M9gmouPVoTcTF4VNEEU0mFZdlKlvfq3hmm+Wawpo7Tj72teYMXQMS1g
	 dSGCWJrRRZgNTpboZmcTj1Ah7ge1TD3073682msj9ubA7eANbP9yGR2DyKPMgFq/+C
	 a6aDS3Tf2nt+g==
Message-ID: <d9a9ecdf-8e29-4595-aedd-e62afa7ebb4c@enneenne.com>
Date: Tue, 22 Sep 2026 14:46:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
 <20260922103051.5257-5-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260922103051.5257-5-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfA2aDaQVKEbpTse9f45LNzMHDuaD8AVcB9Q6rWN6/9PL1cCiGJ1KVqZN0qipJb4HZhbBqy3tMhRLIrMCve4As6O9ENPY/28xGi7HGWyXmFtKnxyDx73c
 TvGPEchO0vACmVImkv1+RVPZQilda5M+fA3K/TwlWBzlk93Lv2GYL/tQyAaVuvo+dZNbouokZzBsjGtkFFTK0Dpv5FlwIm053uYqguRgMolFbGteZ7T6LFaa
 Z6n1K6zLbmgjeVf7BVU7SVZZfz6aTNh0C9CQxDS9UJFivwBTA+isBGBSEBmXTcQI1OqoC+Pkvvbxslf0BCg03aOqHjketpbWw351JfQDl1bKqOKcoR7yKgh2
 dgBOwj2bQMv3JytP51yKpvf2CrpW0BKdP0TZuP6KBKUGQxn8kKMxxqVGz+0sg/BzLflLmt1Chuf5pBzg5G/IOzZSQx43e+6RUHksKVigKOWZi2RG+P1jAo5Y
 3gXDcfnYMrdi1HFydeDxIo0bZRpq/11v+Gbs+6Y+n/6Mm6tnL5bjySvY4MZBqlVdCsG8KR7Im/XvSfyRgCxElXXbZ+k1qvpTC7sCYA==

On Tue, Sep 22, 2026 at 10:30:51AM +0000, Eliav Farber wrote:

The probe-failure path looks right to me now.  Only small things left.

> +static void pps_gpio_shutdown(struct platform_device *pdev)

This runs on every board, including the ones that describe no "inactive"
state, where the free_irq() and the echo teardown buy nothing.  Harmless
as far as I can see, but the commit message only speaks about the mux --
worth a line there?

>  	if (IS_ERR(data->pps)) {
>  		dev_err(dev, "failed to register IRQ %d as PPS source\n",
>  			data->irq);

This stayed dev_err() while both its neighbours became dev_err_probe().
Nothing is broken, but "matches the rest of the file" was the argument
for patch 1.

I would keep timer_delete_sync() here rather than moving to
timer_shutdown_sync(): the kernel-doc motivates the latter with the
circular-dependency case, which does not apply here -- the only rearm
path is the echo, behind free_irq().

Ciao,

Rodolfo
