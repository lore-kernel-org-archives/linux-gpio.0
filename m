Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822290;
	b=B7gDYCQMqnLELxKTmRYPlKDE3HSn+9S2FpI/UkwsQmTgyWI8+BNhed44lI632xMMWCQ/
	 mE+pns5XJarwjFBdVMlBW48ngu007KAKdqQyxKam5ylPIk9tJDd14i6eDEc3Kz73vx1T3
	 cQ6iy+vvphL9GwwNYwzmBa8xOUA0fhlLfLrHCpISlsOiivf+BVAlq7jJqL/Tm1bguc8mV
	 Q80tx+xXId0Ol8ZGO4UV/wR9daWuLaAjVl+d7/deoGD2noAQJOz9fCaaqgFW/VI7QFbHW
	 /4H7fFsAxLr/zp3rUsc5T9ECWhvuT1qoqBFFGqcWW4Vk4i9XXVdjNcwPq6tSOZRoGwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822290;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3mtkvv1fNsOPh1FCwjfp+QwHkU1cUPF1yUrVRHKAbu8=;
	b=0bSSJRGIDuzUjrSskoAXcbP87dvKMmJGDXNbpUO0Uqz9hlGJMKDQmqCovXR+b8+jPhzs
	 IQNzCch4rjbep3eJj0iIrX76Yq7rcIGOPmNHQzsKotBk6wmuiaNinn8rgtrtlflpvCo6i
	 niutTAKV3vPfZqygGF0G4q4DjJWICnDrQYn9BthawA9Cq0BsZlIAZKUXnskvNGmd7xnWy
	 9Oz/rPKU0Hwef5RVgg3c0sJTD2cP9BDDYErlo4uOA5Yu+FLfToNV4EAWRHH2JKryWtg5C
	 LPrkHfoIvIXaF2HDFImZqPdT+NP87i492g7HKHwps7D64GEycjs6rzDMlb+ijYZEk7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLxY5TMT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1686606A32A;
	Mon, 16 Nov 2026 09:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLxY5TMT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EBE1F000CB;
	Mon, 16 Nov 2026 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822289;
	bh=3mtkvv1fNsOPh1FCwjfp+QwHkU1cUPF1yUrVRHKAbu8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dLxY5TMT6HcksVebPvhqwoWpnjP/5TPNvZykyfilpR/skSoKcsAakQPHXNzfHg2e7
	 tAwoFVGSaQwvkRegGKcACbVFCat0AI2W3Z91R3Jr+KDgMXRU5OTP77jwNBl65iv4Ix
	 IgkS3weuCBtAYCVk5ACzfsWp/QRFyt8lJMf7Y+Zdxw2PQ3RswcQYQMXye54uPiQPRS
	 gr6SxdjhNIsv/WRebENO5wvYF15WEzC62adRRdo6W1PEO9lRLg3gqXABMWo/36Uhcz
	 HmpPzj5k+/GPIEDa1fi4iKfL3KLH79qioqHXLp1sWQUrv403GvR9Wm9FyNu1Pcq+ON
	 58+AcncfBJhRw==
Message-ID: <0ee712ec-438f-4943-8936-6d40d0c923a8@kernel.org>
Date: Mon, 16 Nov 2026 10:44:44 +0100
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
Subject: Re: [PATCH v2 1/4] gpio: aspeed-sgpio: propagate IRQ setup error in
 probe
To: shao.mingyin@zte.com.cn, linux-gpio@vger.kernel.org
Cc: linusw@kernel.org, brgl@kernel.org, linux-kernel@vger.kernel.org,
 andrew@codeconstruct.com.au, wbg@kernel.org, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, jelonek.jonas@gmail.com
References: <20261116172220285RZF6Zcof9cL_fYGhfKKyA@zte.com.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261116172220285RZF6Zcof9cL_fYGhfKKyA@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2026 10:22, shao.mingyin@zte.com.cn wrote:
> Hi Krzysztof,
> 
> Thank you for the direct reply. You are right about the patch, and you
> are right about the wider pattern. I was wrong on both, and I am
> responsible for them.
> 
> I cannot show how the parent interrupt controller could defer probing,
> and stable was not justified for this change. I should have established
> that before sending it. I am withdrawing it (v2 1/4); there will be no
> v3.

That's LLM reply, just like many of others. I am not wasting time on
talking to LLMs through a proxy.

Best regards,
Krzysztof
