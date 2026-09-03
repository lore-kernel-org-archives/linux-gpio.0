Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65E4A1DFA
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437337; cv=none; b=U4RACJ2EQ4BzCFXtTQmnQdiqRoQq7LkuNe1vg2WH1OmX/9CH4MXXS75eCECJhuXvQIOr7RRmi5sGw2GfO8uSmHrrPn3O0s5RpIu/89aUziRXH9JAN13WuxbAyrkzsEZe/06PrGxaGXMtYFvXe4j7RByj8ThmTzNaVEnnPrE7lRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437337; c=relaxed/simple;
	bh=BRKIuIMQwGJz+W0+V2Cv4f46rDoN+QkQp0uwFbNfBIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0KL6901Yfj8Q3qY7e2oRVX3wTmwh28UBqwffTdV1lWUH8VahE45kLyvTx4HOhcvt35KGyCk52WefzlGrxyh2zwCmGrHEGaswuTi7v6GUf+mUFZ7QYMKmwotNxViHxv56OaH5k0xwyCdBhn+98VL7nRO0hapFLGaRHsYkcu9kqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNTleZLj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNTleZLj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482fc3327fdso1510734f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788437332; x=1789042132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRKIuIMQwGJz+W0+V2Cv4f46rDoN+QkQp0uwFbNfBIs=;
        b=LNTleZLjtLgIkdeZGbBPeA9ZsjsvEyJPAhQhNw2PZd7ulApEWLz537mrDf9ZD5zD1W
         IKRBieQ9ZE3yGWPobxeG6n5BXCN5/89i/ov0Hy5ANlwABc6aLPvxpegb5+l79KI6X6Jo
         l+vN6k2xe86K3nisCWYEpHTA7W2K9seBjLKwpUhDxHnaCXI8KzgJRYAqrxjPPrFF4pK7
         oJV3tXY7t5rvjU5gIw4KkjJdJXJ2Jp0YSmz9uJ06ODrtEjzDrZu+sZSay4S6Upq0eK7c
         xB7EzuW9XtK2N2yhAq5gu0jbPGqKb/czT2e3Z6vn0F1ejmGraUuNngCFotffaXXogYwJ
         uJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437332; x=1789042132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRKIuIMQwGJz+W0+V2Cv4f46rDoN+QkQp0uwFbNfBIs=;
        b=GO3TN501N8VeSWcier9P1fcFIWhsdyjQ/H9lzpt6TKvvxg4ahwExYoq915KvJXAsJi
         ni1CRqjag42ZRDqW1Kik+DhvEv1lJCyms9SbTW+ALJiBlI5R6MscEOBsmyohpoXW0Ja6
         Dkc1/DPQeVqopKlgp3suzWaWqRzq0YUtnVcis3x7lPAQgT50deNUJ/G7YLkuTKksPUIy
         3ZwsR+l3dhPVxWUr8YtWEASZIDM0hsPb517G5F1SsX5Pn5PCB8K2zPYiP3OFOrBRxNcJ
         lqNdGs/3BGgm8Jp3ly8q2XmIul2OaZ7TrQWR5io1FDCMi+Zw4TTENMWwvkNSk9Hxsxr7
         hHkA==
X-Forwarded-Encrypted: i=1; AKwUvBxaXG4NqkIbOiMcAwp2u4FehrQOV7rgzyjhafdEvcBpHDMxFP7uH68nId8byD2nl5vbzqF63PXtxHJI@vger.kernel.org
X-Gm-Message-State: AFuF++nECWCPWK1I2RsmASMoWNyTf2g5lmE5aHp2QK/c14fGMwMQxqXc
	bGZVfNXGBqr7ZdLCMXBQ/rrjuMbtiehGZOlJv789f27SAdMK6NIXVcXt
X-Gm-Gg: AYBFou2Jiw/62tvLBSVb2WMb9+P3Z83dPNufM+czxII1fF9trFDp7TgK6t2QLo1Rm9T
	rJSPrN4Vjlu0yjcsDyHxrdrdTdDtzR2jOn++aDGjcsJ2sjLiudAlL9Tr6XOS/tAgwxqKLkJI+IW
	EnYxYMc8ow3yJukH9+yXrNXjQiJNEhrboAfgsyoxGDWWLBEN6U66P6Wk1Qg0lzupRuFqWmk4FAH
	JEcLVLXmjdfHsKmqPN4PMi1igr0EoclElDAWbOfvDTFENXMPW9ZjnPvowsqIVCRFuO+4Cn9OvWu
	kT1F2UdANZI0lKSewMe+uBr5pMt/PT6mXCTrzvDyigM4cqHEf0qEh00oSAhvU8WIjmMnF2jk+gv
	SY8n/yOSmEZaq1pB7EXEw43VTroeBamyvD/yJkodP2wnAImn2W3DPDCIAsza8RVE4BbhhB71MWG
	rbPOi2G+RvDdx/xXSumO5a+l6LeYfgH4SGSE8wqvgbFlKYYPopl7+3PUM5ug2rggLxGc50YSa+0
	O008O4qVrnsseFUHEXy++HSk5hWwB7ylmZzIM3iueGF9QcO4ul3cVvhER7wZ4VLOw==
X-Received: by 2002:a05:600c:630e:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49ce55ecea8mr213777445e9.3.1788437331849;
        Thu, 03 Sep 2026 05:08:51 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-247-184.092.208.pools.vodafone-ip.de. [92.208.247.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf0c1728bsm52458095e9.15.2026.09.03.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:08:51 -0700 (PDT)
Message-ID: <98851819-2079-4505-b8fa-1b6943ef71e2@gmail.com>
Date: Thu, 3 Sep 2026 14:08:50 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/20] gpio: regmap: Use regmap_test_bits() for single
 bit reads
To: Bartosz Golaszewski <brgl@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Michael Walle <mwalle@kernel.org>
References: <20260828-ad7768-driver-v5-0-e33ca6f841a2@analog.com>
 <20260828-ad7768-driver-v5-17-e33ca6f841a2@analog.com>
 <CAMRc=MfV+ziruvdyFU-RTbD09E_Jhpxgaab9T6bG=tuPg-jhLA@mail.gmail.com>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <CAMRc=MfV+ziruvdyFU-RTbD09E_Jhpxgaab9T6bG=tuPg-jhLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/26 15:48, Bartosz Golaszewski wrote:
> On Fri, 28 Aug 2026 17:30:40 +0200, Janani Sunil <janani.sunil@analog.com> said:
>> Use regmap_test_bits() when reading a single GPIO value from a normal
>> register and when reading the direction bit.
>>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
> Janani: the GPIO patches don't apply on top of current gpio/for-next. Can you
> rebase and resend just the GPIO bits separately?
>
> Thanks,
> Bartosz

Hi Bartosz,

Done. I split out the three GPIO patches, rebased them onto the current gpio/for-next branch and resent them separately as v6.

https://lore.kernel.org/r/20260903-ad7768-gpio-v6-0-4254ef6c9b38@analog.com

I will drop these patches from the next version of the main AD7768 IIO series.

Best Regards,
Jan

