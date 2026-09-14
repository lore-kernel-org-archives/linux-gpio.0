Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D428331200
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372890; cv=none; b=thW9I+ci+mKHAZ0zF6UmVxyt5SSYf7J8ZdYKEsWTDGBvL4tQ0X1dH8/cEYBvzI577jNEEtKDikpv4duF4b76yBuywJ5U0D+yqltWXYC986AGP08awQyClCDWcPOQm2pAQRArYgN6zbE4CVnen3QJUWavE2ALvukcpraeSsQBMCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372890; c=relaxed/simple;
	bh=Xo/YVKFdhA4cl7GUif+SlopGxbp0/6LmEZVer1IxCDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nooeBcv5ooBMA4emM2NOsG+tc8HRgNK0Mif7VetcFkxaakMzWLbTlKnWdxPjNgy/vHAX2zI+gHeg4as+P7UoPUN4X7sqs1W3WZIawLe+RRL7i50afJCPEtnM1uvrCU8Fqk9UWTcnl3kMKpm7I5vcHLowvlzRfzag7/Uq6gvVoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KWXOO6Ci; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KWXOO6Ci"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46DB14E4059E;
	Mon, 14 Sep 2026 08:01:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19E2E60323;
	Mon, 14 Sep 2026 08:01:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 270FD11C7AFDD;
	Mon, 14 Sep 2026 10:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789372884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HVouu07tg5pqMlxJAfr/CL0stYr4/8k0YMnmcEacWtg=;
	b=KWXOO6CitKwgmO2FQwABvT9JPao60z4QnWKBSx63J0Gy+Gl33Yj6a9p7swWuJvblrTVq3o
	JVpbWqlFKRrLsuOEViLMLrzk1IScrrPCHMfL2TUTcxVHHa7s8tGU5/9sbEur7uVQHWZbzp
	KmS5OnYK8iCJJSlgZ1NEabP7ptYVuwObatpXphJk7QF3JeMleaXQUkxipQc8wRv2Bah+JY
	jdcKioWxco5TTqqmVj3Qm7SeTf79zF5UbGM8X0b0o4YhBJmaPUz9RLEq/awlG3kEHmblU5
	8zPKpBlzupFRot4bbgmo0GYlhtSh6UkAh03QadrLp+/Qy5Sbk5bwSPvLrqNZ1g==
Message-ID: <034a8506-f158-4fe1-af61-ff821744a63c@bootlin.com>
Date: Mon, 14 Sep 2026 10:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?B?QmlsbHlDaG91IOWRqOWNmuWAqw==?= <BillyChou@aaeon.com.tw>
Cc: GaryWang <is0124@gmail.com>, =?UTF-8?B?SnVuWWluZ0xhaSDos7Tkv4rnqY4=?=
 <JunYingLai@aaeon.com.tw>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 =?UTF-8?B?SmFzb25IdWFuZyDpu4Pku4HmnbA=?= <JasonHuang@aaeon.com.tw>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
 <alC3Kc2BcjkmUVwV@ashevche-desk.local>
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
 <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <anl8TtJweGgob1kp@ashevche-desk.local>
 <KL1PR02MB7239DF2E12270CC4B58F55429FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <aoadazG84iGSWCuI@ashevche-desk.local> <aoadmbnFae8C4y3q@ashevche-desk.local>
 <KL1PR02MB7239A0882DE535296B4ED5249FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <aqRF9CrO42-_nwMO@ashevche-desk.local>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <aqRF9CrO42-_nwMO@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 8:18 PM, Andy Shevchenko wrote:
> On Thu, Aug 20, 2026 at 10:04:13AM +0000, BillyChou 周博倫 wrote:
>>> On Thu, Aug 20, 2026 at 09:23:43AM +0300, Andy Shevchenko wrote:
>>>> On Thu, Aug 20, 2026 at 05:19:06AM +0000, BillyChou 周博倫 wrote:
>>>>>> On Mon, Aug 10, 2026 at 04:17:43AM +0000, BillyChou 周博倫 wrote:
>>>>>>> Dear Andy,
>>>>>>>
>>>>>>> Thank you for your feedback, and we sincerely apologize for the delay.
>>>>>>>
>>>>>>> We are currently updating the BIOS to configure the HAT
>>>>>>> connector pins to GPIO/GPO mode, which will ensure interrupt support
>>> on the OS side.
>>>>>>> We will update the BIOS as soon as possible and share it with you for
>>> testing.
>>>>>>>
>>>>>>> Thanks again for your patience and support.
>>>>>>
>>>>>> Thanks for the good news, I'm looking forward to test it!
>>>>>>
>>>>> The updated BIOS for the UPN-ADLN01 project with the HAT connector pin
>>> configurations is ready. Kindly download it here for testing:
>>>>> https://aaeon365-my.sharepoint.com/personal/nas_aaeon_com_tw/_layout
>>>>>
>>> s/15/onedrive.aspx?id=%2fpersonal%2fnas_aaeon_com_tw%2fDocuments%2f0
>>>>>
>>> 07%E8%BB%9F%E9%AB%94%E9%96%8B%E7%99%BC%E8%99%95%2fBIOS%2f
>>> _Released_B
>>>>>
>>> IOS%2fUPN-ADLN01%2fUNASAM36.zip&parent=%2fpersonal%2fnas_aaeon_co
>>> m_t
>>>>>
>>> w%2fDocuments%2f007%E8%BB%9F%E9%AB%94%E9%96%8B%E7%99%BC%E8
>>> %99%95%2fB
>>>>>
>>> IOS%2f_Released_BIOS%2fUPN-ADLN01&ga=1&LOF=1&xsdata=MDV8MDJ8Q
>>> mlsbHlD
>>>>>
>>> aG91QGFhZW9uLmNvbS50d3w5MDU1ZThjNmE5NjQ0YjA1ZWQxYjA4ZGVmZTgz
>>> YjJiZHw1
>>>>>
>>> NmEyZDRiZTlmZTM0MzBlYjUzOTdlMTNhNDc0NDg1N3wwfDB8NjM5MjI4MDM
>>> 4OTk2Njk3
>>>>>
>>> MjY5fFVua25vd258VFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1Vz
>>> SWxZ
>>>>>
>>> aU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYk
>>> NJc0ls
>>>>>
>>> ZFVJam95ZlE9PXwwfHx8&sdata=UldHMlhFNWxXM3htaDFCMGdKV3pZTTZ1Mz
>>> ZOMFBzW
>>>>> GdSNmthM2RsNnFzST0%3d
>>>>
>>>> Hmm... I can't login there with my @intel.com account. I suppose that
>>>> share is only for your company. Maybe MS Teams will work better?
>>>
>>> Or just sent an archive privately to my @intel.com address?
>>>
>> Sorry about that! I’ve updated the download link and fixed the permissions. Could you please give it another try? Thanks!
>> https://aaeon365-my.sharepoint.com/:u:/g/personal/billychou_aaeon_com_tw/IQAdsTdWUQhvQpAoS8lELTe8AZK70ORl6FB-Ndcf0lXUwus?e=ZV0MvS
> 
> Thank you!
> 
> Sorry for the delayed reply (for the record I have updated BIOS more than two
> weeks ago, but haven't had time actually perform any tests). Today I tried to
> use so called GPIO 11 and GPIO 12 (on 40-pin HAT connector) as input for the
> event generation. It works nicely. Also I have briefly looked at the 'pins' file
> for the pins 205 and 208 (Is that correct mapping? I took it from the _CRS of
> the respective Device object in DSDT), and also checked the whole list at a glance.
> All seems much better now — no [ACPI], no [LOCKED *] flags were set, which is the
> goal. TL;DR: I can confirm it works for me! Would this be an official one or should
> I wait for the official release and re-test?
> 
I have a Up Squared Pro 7000, so I'm also interested by this fix. Please
let me know once the official release is available.

Best Regards,
Thomas
