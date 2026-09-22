Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5406B481FB0
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062998; cv=none; b=A9pnibXmpzPzUqczgqfF0CmU+p9DCiVQlMVjdA+dkxdI6XzKnnjQ7L8Ftzm3FVwAJM3LlnbxXTip8Zx20OmWZG7+GPE9i5k3/veuCJqGr1WUy7wytya5L8hykImiUpNDQMR3eXUpX20C8OEFW9EptNiKWuAtnabTGEHU4g7JjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062998; c=relaxed/simple;
	bh=97Ir2aMG3gIZXv6Fpum3LNGfsCPcR+2GjxSJF3hi6PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pebcv3MP0fE9Zg+b2+B78ywd42/GbEh8QgQNCjp3HHuTFp0cTuhhEqhN3InoTH1nbJ3h76wuqB3JeCd/mSJDfuIDR8O5+pmk/N671UB0OJdBVfdEM/NPLBMdkYrELYxzYfM29kDrmC1AN6f1wUkbIZqwbcPvZPnNOC+9tjUOYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=G+Gvuj8p; arc=none smtp.client-ip=62.149.156.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="G+Gvuj8p"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id 8v6gxQEfXbk7m8v6mxujtB; Tue, 22 Sep 2026 09:40:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790062808; bh=97Ir2aMG3gIZXv6Fpum3LNGfsCPcR+2GjxSJF3hi6PM=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=G+Gvuj8pOOVBTLVq9j3LQsWnPkDSzJr/r0qonH9VVqTRDO57aLOtRfmhJiRVWo2Rg
	 jjC1ei9Z/0YK5+IT5DyZdvi181lV1bYBn3kUiBJRWEUK+T0fILLzDEy6lVlyuJ1tIs
	 uNf9owLGeMfLuCyezg+TYFlTSXWe9rti8AS/F6D/qNbDpDWN9S+NtLCih17IROAHZV
	 Dd1CekUDI+uR7d52helVhsEuoNsI0FPIvGRdzuUWn+rPpJJP4MADR48wePJORvZVr2
	 mA/s9W73wDAcRYLq+dXHEkJHasDdYB5U8nA5JL6CRzhcszXUVhgfEqeKD+SUsMuslR
	 NkUkNRGXgqqgQ==
Message-ID: <9eb4bd5c-39f5-4236-a0e0-3c3679bf7f8c@enneenne.com>
Date: Tue, 22 Sep 2026 09:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] pps: clients: gpio: propagate probe error codes
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-2-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260919171157.5502-2-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfM8LsyeVrNknJiD938BPMgp80zFu9q4ITHrPYvomTu5P9Np3dpu1A739w58d7g/4bx9ZnHD8ca1O+n0GmNm+gJfPCFd+gtwLhR33xRS4oiHgd3J+I3/7
 cS5BiZXMnMD84s5sbH5hn789/pUXzpd4AitlEiQLY3DP+h1psDySgwPSPbzGzPwRaFHFHLpsN7X0y2RxhrHa0P1V5SnTSGnpJ8ZiAZ9oEAsoV950S0u2rszG
 jea4eA5KKjbeW5RyoB9LQ+yJI5zWz+SAlpCKWtxqeSAuP3V62jpO50N7A6nRIGsyUlpXZFitK3Qoo5edKESaPN6TtojJTDOvCc29dFIuR5OcyBqWBtLkEe42
 4AP3FXKpwm6u1s4m5YnewkX5zgF09bHUlx6ADLTTjqWv5EyfP7RTw4V6KSCELca68GFNouZ+q1F+ow8bTUiv/htMIy5mfV2RUNkf6bNnIuz4UkOFsFdScEHT
 QbKUlbjSinSTQbNrJhYght6mV/Z8EkkSLSsBTb1VqJ2UcVzIfavHsJwtOdg8jvuU4Qhd+doo6pqeNavsUiluGlR0Ra4+RUwUFVUimvtzDHpvUY4gWYOEefi+
 lWmDudYV1fkd1/3kuvseoJf/

On Sat, Sep 19, 2026 at 05:11:55PM +0000, Eliav Farber wrote:
> Fixes: 161520451dfa ("pps: new client driver using GPIO")
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

You are right and I was wrong on v3.  I went and looked: the hardcoded
-EINVAL on the gpio_to_irq() path is already there in 161520451dfa,
and 4461d65176b4 only turned gpio_to_irq() into gpiod_to_irq() while
leaving those returns alone.  The tag points where it should.

> @@ -165,7 +165,7 @@ static int pps_gpio_probe(struct platform_device *pdev)
>  	ret = gpiod_to_irq(data->gpio_pin);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to map GPIO to IRQ: %d\n", ret);
> -		return -EINVAL;
> +		return ret;
>  	}
>  	data->irq = ret;

Now that the real error survives, -EPROBE_DEFER survives with it -- and
this dev_err() will then shout once per retry, which is precisely what
dev_err_probe() exists to avoid.  Wouldn't it be the right thing here?
pps_gpio_setup() in this same file already uses it, and so does
pps_gpio_get_pins() in your patch 3, so it would also leave the file
consistent with itself.

> @@ -197,8 +197,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
>  			  data->info.name, data);
>  	if (ret) {
>  		pps_unregister_source(data->pps);
> -		dev_err(dev, "failed to acquire IRQ %d\n", data->irq);
> -		return -EINVAL;
> +		dev_err(dev, "failed to acquire IRQ %d: %d\n", data->irq, ret);
> +		return ret;
>  	}

Same question here, although I agree a deferral is far less likely on
this one.

Either way this is a nit, not an objection: the patch is right as it
stands.

Ciao,

Rodolfo
