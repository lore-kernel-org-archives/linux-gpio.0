Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354031;
	b=nsmVsDRMX4c2FnE75kQRmLhy87+8jF8Y/PTY6vc6wTeHccGh9zFgZ63KyFi0gwiw6hSm
	 KAFfIqESmI1CW6VnZ4wIzOdvAgXf1ZES3vtT/Gi40VEQgFMAKTVEehVuDHMy8y2sFXGBY
	 +2jDI7L5h0mwH2hJysSLhkweUySeBeNSYfRAd70itfjF+ODBLHjCN2VT9rKzmeTRg/p4R
	 M2tjFl2ZLZbp104rgktlOy8/EtV1wykySgd3omQI3wQ5yMfQtWYjUJUcn7Du9TVy7N8Sd
	 LrcL8e6ZuhTZxl2/zkGDV0AucnrgRU3HCSO9Y2aTe7pRCqp5zxYJEQo70Da9f/IpLYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354031;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=tec5x/2dGLaxGvcIGRCgXowgWhcPg/cS7EQKOEE5zN4=;
	b=kcBu5hhWCjvyO3Ce3Xt0mXx9d5ovz5Hty2TZqRwHBRSxEyNfAaA/7x93PPtft2AM759V
	 1BhyhGYrnPE45WcGGiRU+KAJFLavAMyv0aLOpvDh2trGc1hFMCGkRBo4i+iTKpIj43PIr
	 OqhuyjE+E3GTzN/daNd35WjaCVh56VeyZoDO2l924HvusCheBR/44z3x6eAhL1w/oTvau
	 sq3HlhTAimJJlyIXJeXhtFrO40E4susY3dHZBaYh+VuRgO4064LT84PuGRI1DOk8StC9b
	 UFTOlHlHgT4IOTRGD+ufZ6LwFXB/loGiHc/V/FKskmimriybSTh0xH2zaFUm5MLbwTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=N5ISwb0k;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF3B60A2607
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 09:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF3B60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=N5ISwb0k
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261030095347euoutp023b3e09726d2cd11e40367cd1ff1f5104~jRfxvcq-l1068710687euoutp02_
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 09:53:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261030095347euoutp023b3e09726d2cd11e40367cd1ff1f5104~jRfxvcq-l1068710687euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793354027;
	bh=tec5x/2dGLaxGvcIGRCgXowgWhcPg/cS7EQKOEE5zN4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=N5ISwb0kpg9R51Na1jCpIWImFAxsWP4sGtR8DmIQat/+wduPcHOFX0tFANHsT6BCO
	 kzjnhORYLW/fjKx5yx3/h4h75l7SAbrCkime8yTU695comWIVG7EOpX57NFci4Wlfu
	 B92WQ+1HD3mSDYcCyGHwMFPyn0duTpEwZOh/hX2M=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261030095346eucas1p1911bcbd6595ffdce775263d47d46557c~jRfxkMbA52500625006eucas1p1m;
	Fri, 30 Oct 2026 09:53:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261030095346eusmtip124e0cf71d00519b4073cc04b4a33ba1c~jRfxJwp5C1953619536eusmtip1e;
	Fri, 30 Oct 2026 09:53:46 +0000 (GMT)
Message-ID: <e3a30185-f5be-4bd2-932e-d2ba8d035f7e@samsung.com>
Date: Fri, 30 Oct 2026 10:53:45 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] gpio: shared-proxy: don't refuse the first direction
 setting
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <5fhprmrrbfvu4gzsvru7h2z5b3tac37raf5vg3q3zqr56pv5ib@bc36imj2qjpz>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261030095346eucas1p1911bcbd6595ffdce775263d47d46557c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420
X-EPHeader: CA
X-CMS-RootMailID: 20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420
References: <CGME20261028222815eucas1p12f4ceb1dca96576cb395430cc2544420@eucas1p1.samsung.com>
	<20261028222803.2682808-1-m.szyprowski@samsung.com>
	<5fhprmrrbfvu4gzsvru7h2z5b3tac37raf5vg3q3zqr56pv5ib@bc36imj2qjpz>

On 30.10.2026 10:07, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2026 at 11:28:02PM +0100, Marek Szyprowski wrote:
>> When more than one consumer has requested a shared GPIO, the proxy
>> refuses to change the direction, based on the current hardware direction
>> of the line. However the hardware direction is not necessarily set by
>> any of the consumers - it may be just the power-on or bootloader default.
>>
>> This makes the result racy when the consumers probe asynchronously. On
>> RubikPi3 two fixed regulators (vreg_es8316_1v8 and vreg_es8316_3v3) share
>> TLMM GPIO 117. When both proxies get requested before either of them
>> configures the line, usecnt is already 2, the line still reads as input,
>> so gpiod_configure_flags() of both regulators fails with -EPERM:
>>
>>   reg-fixed-voltage regulator-es8316-1v8: setup of GPIO (default) failed: -1
>>   reg-fixed-voltage regulator-es8316-3v3: setup of GPIO (default) failed: -1
>>
>> and the audio codec and the sound card stay deferred forever. When the
>> regulators probe one after the other, the first one configures the line
>> while usecnt is still 1 and the second one succeeds.
>>
>> Track whether the direction has been set by any of the users of the
>> shared GPIO and allow the first user to configure it, regardless of how
>> many consumers have already requested the line. Reset this state once
>> the last user releases the GPIO.
>>
>> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
> Hi! Does the larger series[1] by Shawn fix this problem as well by any chance?
>
> Bartosz
>
> [1] https://lore.kernel.org/all/20261028123448.510401-1-shengchao.guo@oss.qualcomm.com/
I looks that it fixes the same issue. With Shawn's patchset applied I was
not able to reproduce my issue, even with some artificial delays added for
debugging purposes.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

