Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9379429034
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380163; cv=none; b=hBYlFXfu1bZazi12+Zg+94bEnTojmjGzdM53BSUJY2F99Yjn5AgQIJJBwrfsWDrEvrvjlBmaDl2gVtXQgtrJmDoyLtD8ZXDBaiVq9ZI5lorZArIR8mlOKI2o88CI+RcDPYgjdtJbBfZf33xg44Vlz+vseA4klLYjA3T8KNzDC3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380163; c=relaxed/simple;
	bh=BHyJkKWPtabg9chKvlw5ajLWZWczWFC02vAW2qDPPtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XByIzVm75h9/uBURDD841OwD9sZh7Cuas9J6OuX70YQaHrzOTufTtXVtJru5y+TI7BKUtj0yySO7pFlkyqsJC7vCGS+y6o3lhtwSnk1F/aypscnb3jbSSI1ZxIrfv1OOz2tnekEC4QNh9Diuf1yku6rkOhcSYgvX1lYEI4/USSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OTcBvOkb; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OTcBvOkb"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6ae3faeb9c3so1007437eaf.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786380156; x=1786984956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MH5p5bgeIASO8oIGcJrEMux/A5GCFedD9u/VSUjCZzM=;
        b=OTcBvOkb9/qG+lSWL2VHfpGH8kWkXmgR67QGvpX79BL/8675QAMuvnraG87EFPua6Q
         g/wgvhgylk+JVQ6Ac9vu2GvKjE6RAQfO3NRM0qUoSbuQkfJuvu+rVKIJ/n14WkxiF/c+
         fYw9/25CcyO505609HjOkYpMdRVI+tj7nlR2BEpn+0RxYZx6bZ/hbLEz5KSOg5p40QiS
         z6OrsJ1uRklWZGLCp7yHQvKZOPFcQXvtzjJbawcwhn3xyk+c1jiZT4BQyXIkQQurwVMQ
         uvhfWmQ1gDwxjSlW3sZ9OnuCEFlsNoE+3e7mMduz7l06jA8zxOPSRMRXOCDiq7M627yF
         aMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380156; x=1786984956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH5p5bgeIASO8oIGcJrEMux/A5GCFedD9u/VSUjCZzM=;
        b=Ff1JnPEdvatU01wT9G7NOao4Hnprdl77tguwLt92L+VsJl1TPCjxPb2tfwoAyfuMPt
         F0o1kCIWK7HQffCd9q7KK+LJgWTnncb6HPrZTWwpGc98YSZo1gn0u2i4+0vvxRx3o0iU
         +7kuK4eE3HIbC+8QDu+S2aZAMLg5SB6rvvpgiLo84nPP7UvCqQubUox90pRA57mxs/lJ
         /nqTclwzfmdMmT72PEeOo79f8jDI7rXkgjDUf1gr/z1QVjnHV+tEqRraNBN04xJVcM5y
         AdMYvVAp9ayDXoIXAmGlb8WVSa0iSd+AH8TsuBHuUkPlByHDwEyLaq13kdbgNoARPXic
         z9nA==
X-Forwarded-Encrypted: i=1; AHgh+Rrwu67rljH+XUrXNP1q+5c9GCcWSGgAnRISEBdu4Qyg9ExBrglnG5OTwzef82FdpeaKFgBhhNTOzWgQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKmONs6ogGwdCbf+lIP61GDNIu4FeCJ34wj0UqxAMQPSJvRzQ
	7e3eI7B8s5hip+hZI3pL6N/j1qr2q4VOFocGolFwNa+80Ba0yV9cESpOK8D46vKy+3Y=
X-Gm-Gg: AR+sD13Z9mbU8sg+eDRLQsDR/Hj6/04lbDJwZcQ4cx3BMYHizWEBR+TFWFKC5U0Ssyh
	otl6n6Nak2t0i6WSofmTfR1nr7b17e5bWHAYF8KFbYFxCJFoBqVkfnDwnMOHUQTH5ovFEZv1a53
	Fs+NMMuibe/Z4LzAypFN/r0bXv6DAKmcILM89qzHiYiwhKCgJ8gbIrvIXA6c7UKWoQ6auNX+3Dl
	cw1GOwgbuoE5ilClKIqkIm/XQjBMlFucBFH/79no9/F3AzqzVs7K0gZZ6jhpqfwy66F4uynckB+
	UB2e/Gn90ASVjlIUn112CyahFRo4ZzC3cZVmgpbRDAv4o66+VYp0IG5tXd9lCMz8o3dBm7z9SRr
	5U2eXZXVqMGb995Pg1fTbrUpIPDKFOBpkpJjkaXNeLFGtgWTeHVJEV2xo43kCWKzF+NDCcE30fE
	utK1Bx7fnJhBUI/YMoKbB0SBVMnHH8lq2C5Sb4FLz/HgY3If0PZrCb+T4+t0lc9yLqRV4HNgbLS
	5GagYm9qBxGHDKo2WebpK+5ddXi2Yn+t1eudlE=
X-Received: by 2002:a05:6820:1c8a:b0:6ae:5250:dd1c with SMTP id 006d021491bc7-6b035366c4bmr12452912eaf.29.1786380156501;
        Mon, 10 Aug 2026 09:42:36 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e05b:7923:cf50:e4cf? ([2600:8803:e7e4:500:e05b:7923:cf50:e4cf])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0512521a1sm5971037eaf.5.2026.08.10.09.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 09:42:36 -0700 (PDT)
Message-ID: <7a42a318-780d-4bd0-baf1-55d030b39233@baylibre.com>
Date: Mon, 10 Aug 2026 11:42:35 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com>
 <ad95afb4-e667-4290-8878-fdd7067f20fe@baylibre.com>
 <DKK9QWYHOBOT.2VD8XMZTE65H4@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DKK9QWYHOBOT.2VD8XMZTE65H4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/9/26 3:26 AM, Kurt Borja wrote:
> On Sat Aug 8, 2026 at 1:39 PM -05, David Lechner wrote:
>> On 8/7/26 10:58 PM, Kurt Borja wrote:
>>> Add the ti-ads1262 driver with initial support for the primary ADC
>>> (ADC1). The ADS1263 auxiliary ADC (ADC2) is handled by a separate driver
>>> and interoperability considerations were taken into account.
>>

...

>>> +static int ads1262_dev_reset(struct ads1262 *st)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (st->reset_gpiod) {
>>> +		ret = gpiod_set_value_cansleep(st->reset_gpiod, 1);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		/*
>>> +		 * The RESET pulse timing requirement is 4 clock cycles, at the
>>> +		 * minimum clock rate this is 4 microseconds.
>>> +		 */
>>> +		fsleep(4);
>>
>> How long do we have to hold reset before the chip powers down?
> 
> For power down 65536 clk cycles. Less than that is simple reset.

How long is 65536 clk cycles in microseconds at the fasted clock rate?
Hopefully won't accidentally shut down the chip here even if fsleep()
goes significantly longer than requested.

> 
> [...]
> 
>>> +static int ads1262_wait_for_conversion(struct ads1262 *st)
>>> +{
>>> +	u64 max_lat_ms;
>>> +	long ret;
>>> +
>>> +	/*
>>> +	 * The first conversion latency is affected by the channel's data rate,
>>> +	 * filter, the configurable conversion delay and whether chop mode
>>> +	 * and/or IDAC rotation mode are enabled.
>>> +	 *
>>> +	 * The worst possible latency is calculated by taking the lowest data
>>> +	 * rate (2.5 SPS) and the sinc4 filter. This gives a latency of 1600 ms
>>> +	 * (Table 9-13). Then we scale it by the actual clock rate and multiply
>>> +	 * by 4 to account for chop and IDAC rotation modes (Equation 20).
>>> +	 */
>>> +	max_lat_ms = 4 * div_u64(mul_u32_u32(1600, 7372800), st->clk_rate);
>>
>> These are constant values, so don't need mul_u32_u32(). Also, given the wide
>> range of possible sampling rates, I would include the current sampling rate
>> in the calculation. No need to wate 1.6 seconds for something that should
>> take a few 10s of microseconds.
> 
> Can we leave it like this until I implement the settlingtime? That way I
> can calculate the actual first conversion latency.
> 
Sure. Just maybe mention it below the --- in the comment message on the
next revision to remind us.

