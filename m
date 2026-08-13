Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580EC476070
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786625718; cv=none; b=FDoo/+UcMSkCSDr/QxfFIDoKgv9Z4TwWLbXtnDL/xTz74mlxd7K0yebz7THHJnkrGLz8HaegIPsykiKkW9wtg8Q86ec3g7nxywNJHdHroiJvi600RrEajB2b9Dc8rfrBIeSd+ZrkGsOS5IoGcJNwQ0PY+Xjle0U+aIMw1CzQt64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786625718; c=relaxed/simple;
	bh=HrpuHtXRs3lkzPV2KF4jr4RPVBEPyIUfTr35gw5M1iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQklAOVtX6DFjMLaE4yF97Emk4ErRDjPIqUPhDFSYmBCh+gUS7GIx0Sg7nLLWaYXDZKoLURfUZ4Eigja1FrYbnMCVBv6ZCfl/7HVITf58sU25nTBAUgUt7Cc2EfZA6XGzhWzdlG5IPnjYfQK9/xUMh3mLaUhn8ahIaaQQ3Bal0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOn0wESQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOn0wESQ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b021916bd3so939847e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 05:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786625714; x=1787230514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jhcvNWSwuNAllGIhB4lzw/CqsOc6VTmvp2k274Uc3o=;
        b=BOn0wESQ+2KXUfLqYEyKA7tfVWjGL0NzreOazkA7IAImC5ucSAw39LOMfRQ3UEcvEv
         wj3Rna02ifbHSVQffk3mukJmy+YYpoaa1kKKstx2j81X7rSSEANTzC1U7rUJ9qNm3JCN
         ommatv8rgP5qeRD+TuT52BSwfgkz4UnOZDUQZZHDnlp2gasjvEI9GaikuWeBbHJUdBkg
         63J+xha/o4O8sN6tQHm/SAMjYzHtNjd1AEVkpWnAEMIxjx6oFhZLntwfUERovklFT7bX
         SlcSo2AMaJjObiH5DpfPlcGQYwuub9X//jvfJXCsQewrat1qAnynTf9H7PPT++REqjBR
         x1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786625714; x=1787230514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jhcvNWSwuNAllGIhB4lzw/CqsOc6VTmvp2k274Uc3o=;
        b=HKBssJ0YMaVX6g10b7/+CcLXc+JUZyPhBQnW/RqvlimTMWPiV0f1w89iiDmbSf04i7
         tNak6ZQunCXi4rNgI5dbvS1h/SsxLOJxol95bSs2As3GFegxYvZUm6Aq/2c02vWnQAqF
         MgWN2H2+INfYWZH1ji736y4wcxLS6lratStuuV5Yk+h4S7RfWKM33JFzpy3NHePMgTDR
         EfHfVUU6Ih/dlC1GKWD1ckj46IYi4vxjzlKYG5LyNkawon2tsxTQhaO7cytniAa3892p
         22ddckQ1lVRGIBmnbU3vHGWuYEkcpFRb+A1+5to0MvIcbPfC2uFr5QK7qIDXuICo4nvL
         fdyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3XMN2ZGSg6bnvmzblu28HnSeJBmtBpkO7E49LMSjhXpjMzvG7I4s0vWZbMp0WNWsCN+/ao0An4wXh@vger.kernel.org
X-Gm-Message-State: AOJu0YwQqNXTjj+oBM/TgojlOrhpjNlNIlhfjP47tyulQtsOyHEC0mvu
	WUidPS1lxvYjYD1Uid2dn4drRcNiI6WZLouTwTjj97D9GXJbXOAotKMp
X-Gm-Gg: AR+sD103MZkiNGhkB/L5P3zTSsJy36VfXbZpyD4H3wlCYSpcVauuz8EgsE2pEpeeQrW
	cRrfK8MxRadkd4LztaXBZJUHVxXc+JXOPbU0o6qUwXGphxaaV9BXgtCURKnCsu7fm2E4r404rhN
	i8wBXEeuUIWa4WbCsCZDSwN9mo1b4DtdNdRZB/7xrS5gT7MGhNn3ZAmvBOgg8RaM95cOGgdJEEe
	2oizVdDlhN3SVdxHt0COG7mtr4jRg/96RRBXyZd8J0OFh7ub5fPg4NtQR9jIdOSqjsHQ4oLjpjH
	2YWeginudbpZoVJ1o8N8X0PM5Z14ndAZL4QB2ZDPeEWSrUd9+a5yPDWpLRKAofrhdviu4+aPnI0
	C80KYXFkK1A0NTFItsgvKxMD7PNBMC87x8FuYzyY2XbLoJSpiKifHLzH1/Ftm+Y7Dy9vB3Dv6v3
	mvx0bHYr3Sx2uhPBE0x8/9Cjkxzq020TN4Cjup1OXuzuAnmHihSzk7HHFryprkl3GSBenG6Gu2R
	ez5Dnk9X0eaDzpHCFBAYhBjaDHUYkiZGjqyQOrXcyVmQ45u958NF9cX
X-Received: by 2002:a05:6512:1284:b0:5ae:b0c0:16bc with SMTP id 2adb3069b0e04-5b453f77a1dmr809693e87.27.1786625714101;
        Thu, 13 Aug 2026 05:55:14 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539ea237sm456405e87.18.2026.08.13.05.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 05:55:13 -0700 (PDT)
Message-ID: <12f70e0f-5cef-4035-9b44-e2cb252932cf@gmail.com>
Date: Thu, 13 Aug 2026 15:55:12 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1785838584.git.mazziesaccount@gmail.com>
 <9774b8d6663ea55b1682b32f825ec5689be3e1d8.1785838585.git.mazziesaccount@gmail.com>
 <CAD++jLmatJFfqhNWfgx=qUW2fEwuatxmJR7NyJLAv45LfLHZnw@mail.gmail.com>
 <f5c241a2-00a8-4a32-bad5-3c89fb204b25@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <f5c241a2-00a8-4a32-bad5-3c89fb204b25@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/08/2026 11:34, Matti Vaittinen wrote:
> On 07/08/2026 23:29, Linus Walleij wrote:

...

>>   * @fixed_direction_output:
>>   *                      (Optional) Bitmap representing the fixed 
>> direction of
>>   *                      the GPIO lines. Useful when there are GPIO 
>> lines with a
>>   *                      fixed direction mixed together in the same 
>> register.
>>
>> It seems you can set up the fixed_direction_output mask from OTP
>> and just use the library, right?
> 
> The BD73800 uses different registers for 'out' and 'in'. So there aren't 
> really "GPIO lines with a fixed direction mixed together in the same 
> register".

...

> I think the BD73800 can indeed use the gpio-regmap, by keeping the pin 
> direction information in private data and adding a custom xlate, which 
> errors out if get is requested for output pin, or set is requested for 
> input. I am not sure how much of an improvement it is compared to the 
> patch v2, but I'll give it a shot :) I believe the new -rc1 isn't that 
> far away, and hopefully the gpio-regmap -stuff from the next will be in 
> it together with the regulator stuff bindings depended.

Gah. Please, ignore the erroring-out part. I don't know where I picked 
the idea that the hardware would always return '0' when reading the 
GPO_OUT register. I think this might have been something I have 
experienced on a setup where the pin was _not_ set to GPO by OTP. 
Furthermore, the xlate will never get called if user tries to set value 
for a GPI pin.

Anyways, implementing xlate with op-check allows me to support this 
PMIC, even though the register to read for pin status depends on OTP.

So yes, v3 should be able to use gpio-regmap. I will probably delay 
sending it until v7.3-rc1 is out so I get (all?) dependencies in.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
