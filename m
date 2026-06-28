Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077652BE63F
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jun 2026 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671963; cv=none; b=cQITI/cxPKmFUaruw9a07+EuHcTgUD/hElTGYgFwvrLjBdvsiVmHATuzSYA9DgoQ6b7ocIcZRQXMu3WSstzE8zAvImkYQIHx73Bzw2RcL9/+EEQYvmqBSA4fbP6a9enxpbB+negY8adEDbwolV180tIprqdi+XRrarBqhOGStws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671963; c=relaxed/simple;
	bh=qNq4KRQTcJB3kuyk2TWCUaCsh5689Ox38PhfKc+pS7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/OI8Aj7U0YXVB79l/rZD0XjJaaVDN5rxbxhNC7RBXvqvXkcZvHoPhVKH6Jnbz/iAFX04YTqphGwQerSVnoGpex4eVzcRHLQHt+8YMvIUnr+fleE+Rnyi+28WuG18jtxoMZkWDXXXmJ0+DpxaZW83XFk4nitNVbcjuJ2LyYCTrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=weV5uIdP; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="weV5uIdP"
Message-ID: <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1782671958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVCCSBfdLmf40fCF4zLOs895Qj39G3angj+93AFABXQ=;
	b=weV5uIdP06yw0zl+JxfjaujOy7fAxVx+IFSsgKvN3SNJRLNICUb10005pJMlLDO6/NVjGO
	elME7Jn7F+ZcwqbI2+LFe9r3XTOTIrqS0IHZI7NKeWVpsnpgj+K4affCFNuisxEbAXzUI+
	8/xLKPexgxOj1KxwWI9hTa+2neWaQusZ93uyzw7GxsshYXE9Muh1nKJWxzvkbQeE4o0IoR
	tj0ZrKfnJHbwdps+B+SqbSWxzJPzM6ZSGRMNUuGdkiKgQjFDbB0uMOhbi7H1MtoqmcmL4b
	PZbC4wTuJIquObYRG+ydyooLXvQ9vi510QfbDqLnoNZzSTO0/s0K6gE/vTDHAQ==
Date: Sun, 28 Jun 2026 15:39:07 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/16/26 6:25 AM, Maulik Shah wrote:
> [..]
> ---
> Maulik Shah (7):
>        irqchip/qcom-pdc: restructure version support
>        irqchip/qcom-pdc: Move all statics to struct pdc_desc
>        irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
>        irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
>        irqchip/qcom-pdc: Configure PDC to pass through mode
>        Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
>        arm64: dts: qcom: x1e80100: Add deepest idle state
>
> Stephan Gerhold (1):
>        pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
>
> [..]

Something about this series breaks the touchscreen interrupt (<&tlmm 81 
IRQ_TYPE_LEVEL_LOW>) on sm7325-motorola-dubai :(

With this series, that interrupt only happens once (stuck at 1 in 
/proc/interrupts) so events are not reported. Something something level 
triggered..??


Thanks,
~val

