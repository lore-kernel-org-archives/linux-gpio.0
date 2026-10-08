Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53DA4908A8
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452871; cv=none; b=NJJQWd4Jlo2H08NXTAnSlKrin4Gi21kHVTR3a1WN6ThCXSKmJtzzJD0mYsKChmFbA0gf3jNfG8YLMu1MTj3FdkUfkjIVjekeL+UzX3V3I2Q2IBkyIM9wD34JiJgEAlA7ejSMDiRYpUfmK+KXwwVTH/KKp0M7euqcSi3voZShAT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452871; c=relaxed/simple;
	bh=dOROKu/Jdh1bOFXKKsQNfb5RwuuQe3PJaydRgSyfO4s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raZYcZV/y3ZOWHGt9MxtLP9EWqgyJ78avDYFc5nLn4cUHBeQQQ9AM6iXapbGsjohVA1srNa11bqmEl2gExm+MqoWWVENFBOPIoNZdQt/lzy2JB8SS7uBXWELyT1dEfmvAn7uF/s61p52hTb9n1HndaVCX4T84CRhgclGjrS6t+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzlgXUgO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzlgXUgO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2F31F00893
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791452870;
	bh=6wo/iEkiI8dCsPMnG7O/ng6DNPxf3ORx/tnngp4WQLI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CzlgXUgO5uRcDPFW9CcejBaCCjmYw8WfkgAfzbgzQ0VAraVk3RkE4ZUQ+re+dImYD
	 JW9oKXXCjrSlmJ8wjfpABwQDLBwOqpywXJWeVXnH/K+LXwPkFRKkvmyNZ6Tj4YHP+K
	 IFwkrNHWpyWNapCyaneuRjzWXK9sxtmQfahB52kYmukotpnuPMmqK4dscQN8oprM7C
	 GZeQ+U+GrlnVc19yBwnITPy0DuEOTbybvA0SxjrvUiDgLtni+y/qUT1NAFp9iAL1Ho
	 K8elxpSx37raNOvCx72w424i0LpRb1suRDlYmHETPuOot0rIGRDcqRXcsVJaz9z7Ad
	 1DJSxNavfwzCw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso6001729e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 02:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/KHG9RaJsiAJEJjIlocN5gNhvMHOxDKA9fApW+PtagPq+7yZXFT3fTxwN6EQr0RZSTra72DntsVzK@vger.kernel.org
X-Gm-Message-State: AFq9FYI2JVEuNmSRXnpdB2PFLLWUKMOlISHeojyarwPezCSmzXF4/BRK
	vmxijqAJDkQ++Sm6vxxQ8dr8hSaDs+wyFeNyJhNfnMOdHNM74DSJGI6+1KYsdonR0FNK9SaLLZ2
	+oakVxZcMhgddU9HeJqihyYBK54RNNdsAQHu/tEr9AQ==
X-Received: by 2002:a05:6512:a89:b0:5ba:3e55:88ce with SMTP id
 2adb3069b0e04-5bcd43b4282mr529479e87.21.1791452869354; Thu, 08 Oct 2026
 02:47:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 04:47:48 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 04:47:48 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <sashiko-outbox-162899@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-6-c9f5a8b50df9@nxp.com> <sashiko-outbox-162899@kernel.org>
Date: Thu, 8 Oct 2026 04:47:48 -0500
X-Gmail-Original-Message-ID: <CAMRc=McOb8Yh3h2oPn4GU-hnSff3UBd8WZzO0PirXm7U=+G56w@mail.gmail.com>
X-Gm-Features: AclHuK8uHoJTfsuyiDOmuhhtt28Djq0F_--GfUBbPO6hroMZ2z51SR254dKguTU
Message-ID: <CAMRc=McOb8Yh3h2oPn4GU-hnSff3UBd8WZzO0PirXm7U=+G56w@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] gpio: mxc: convert probe error handling to devres
To: sashiko-reviews@lists.linux.dev
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sashiko-bot@kernel.org, 
	linux-gpio@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 12:59:26 +0200, sashiko-bot@kernel.org said:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] pm: usage counter underflow due to mixed devm and manual autosuspend
> --
>
> commit dc287cc46ea891b838f3b39a1fd6ed65d627a965
> Author: Peng Fan <peng.fan@nxp.com>
>
>     gpio: mxc: convert probe error handling to devres
>
>     This patch converts the driver's probe error handling to use devres. It
>     replaces irq_domain_create_legacy() with devm_irq_domain_instantiate()
>     and updates the PM runtime initialization to use devm_ variants, eliminating
>     the need for manual cleanup labels.
>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index 5da603569d88d..54b09f1a4b509 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -484,9 +485,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  	if (IS_ERR(port->clk))
>>  		return PTR_ERR(port->clk);
>>
>> -	pm_runtime_get_noresume(&pdev->dev);
>> -	pm_runtime_set_active(&pdev->dev);
>> -	pm_runtime_enable(&pdev->dev);
>> +	err = devm_pm_runtime_get_noresume(&pdev->dev);
>> +	if (err)
>> +		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");
>> +
>> +	err = devm_pm_runtime_set_active_enabled(&pdev->dev);
>> +	if (err)
>> +		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
>
> [ ... ]
>
>> @@ -558,14 +567,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>  	pm_runtime_put_autosuspend(&pdev->dev);
>
> [Severity: High]
> Since devm_pm_runtime_get_noresume() increments the usage counter and queues
> a devres action to drop it on unbind, will this manual call to
> pm_runtime_put_autosuspend() cause an issue?
>
> Because the devres action remains queued, when the device is unbound (e.g.,
> via device tree overlay removal or hot-unplug), the devres cleanup will
> execute and decrement the usage counter a second time. Could this cause a PM
> usage counter underflow, corrupting the device and parent power state?
>

Sounds right, please remove this call.

Bart
