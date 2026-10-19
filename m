Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136C64A68BA
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402603; cv=none; b=Zq8czuxG/3+lh8vccRV0Lyxd/QTWVduKVV6JNfy+D8zUZCsxqq+D/KVegtSPlSF1+IMSshrFzpZU/w7C+/HbEZ9dMna9gM4jPKD0FMwjXFZz9W0SUyoD1kAihMRdWfDgqprK81nmFp5qo49I7aq+H8zgSFH39ZioZ9AOwWOqldM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402603; c=relaxed/simple;
	bh=iBFTmkMP8PuN6ZW3szsaOElyFMbaPaWUjSQ2ZEvUTP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZmbT6Gwhp1oQpoDXdbs/vPbuX9aTkmv2DPqQLQArKetz9JfFj0eTzrFXcxRSOlBU8QC7vVbZXbnQIZe13SBkT2QGcBsyGtSOqTibcCU6xH0vWCUJBxsyi+0kUMGAwgWnGQu0RDaYSjtEFB8m3LR/xrg0iMNesuWEnHrNepuZE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yAlaZzv4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yAlaZzv4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso1382307f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402600; x=1793007400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44Qa1LQ6eICE2navxqvBq6MbiOP9jzE+4MSaCPYPCfE=;
        b=yAlaZzv4BRxQkJWm2Dii7cwjsnJLJBXGggPZGnWWarA1ZKGS291eNBbFX72C8Our+j
         Dj6tBKFgA9OsSGN5Q+uX/sBsNewUqYg8HpKRW4PVyxU5mdATaG0TPe4s1zg+TljXt6B3
         8efHJecOIarat2oL3VzMJkyZdr2NMuZ/kZP8kUqFKSxz8ZHaw9X5xRAo2TovrfxThFdG
         RDEmYQKACEbBpFzr+KstAoB+GggfD1LnZ90ckVtWZGbK5RcG8J2MZ0+WZ1j3lyRmbo04
         TF27Bwt7ZWgXABnY8x0NG9mwzWcio06I/4Q1s8ytSAVm/S3/+p9czcv26JQs4p3GnHKQ
         v56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402600; x=1793007400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44Qa1LQ6eICE2navxqvBq6MbiOP9jzE+4MSaCPYPCfE=;
        b=XHQCH7FzXD/xplEocmTXXl+avonrOoKSKlJnuuN4M+wW4Lkyl0qwJolHwKu3eK19sn
         xsk5GwMS+Q+v5dHMk17GgvY4wceJpxay0KtYfjK9Bc0ZVVhUaH8SmCK/AU0pjCPNGRRh
         QVX8LvftgU6Fz9XMLFlxv5xUhKj9HQ1bUWpLDWVBvGywfw03nyT2CL7Jpm1gA60NDfv0
         uR/17qcOmxU1xLU8jx0ZLsR9wK/bt3HgdadRti5pdwLxx09sv2foLV+MIKfUZj5n8y8J
         iSS+Jdedm75XhaxXm0zWd+BNOlthi9g8e43wEf1dvbW38I3o4bXyEOn0RUlznND34zGm
         lJeQ==
X-Forwarded-Encrypted: i=1; AKwUvByq+CGqq+oafr6sg05kSMTPGt+reMcI2dGVDhS4XG+XXQoUPYe+T0Mux1X0USOWz3gGqLYoszZe8Lxl@vger.kernel.org
X-Gm-Message-State: AFq9FYK8kG1p0kcBgzklt/7zuijsACrhEvo2D/08qiGbEQnE/bwJsaLy
	k9Ii8W/5KC0u0BDELtKyUIYvR6VsfhdubEgg8GlNVmZR8+/c/scrw7OEKm+mSvZCiDk=
X-Gm-Gg: AYBFou3LLlF7EDU+nYCWD4+0bCBHc4EhQt0srdhAqQ0y69U1uPsT1FBRO8LVqwwD6RW
	XbqnGzPW9IokJQaeoYXIOwy2bL2HeBbswSYtQ3IKDozDnDfeUI2rd+bj88L58v6qiJGmuAxU4W/
	WtYj0a+V9vxH/WKCFzcettXFJCK2Y6BClzoQZTIeD4YE/4Lxqj9Popzco4dwwFDf7Wu9HEve9Aw
	RmNXkrrDE4vfHksGJWzmLiM8DTpZghpEcgHXc8TT+uH5LXD0U03v/+PioSXnXtVKOB+NEhH4QeL
	MGNedpY2dyPgX2IpJBi1uxDS2zWuqoPWRj85d3tPeIXuhCxNnUFhZXyYzMQ/JY4MRDrBC4Ot8cz
	ltcpmg6dvPtyt8O4fGaJPRGxwYLF5mPqLZDmwxQhJds10j1hrneVBv//hgJ52cOsk2wn+F8QTVS
	5SfWlMfcmbcqxROG8NIvjMoP+Zi1qHzWfjeM7O5T3jBPlcZaR6dcOtBNd1psj2HE+hwGZW1aIyX
	B6q78AfCMF7DLSHordglKSRG4bPKi9WwjCYLhVJqdFsdewopQ==
X-Received: by 2002:a05:600c:3b23:b0:4a1:cd83:b240 with SMTP id 5b1f17b1804b1-4a1d75ab20bmr188477405e9.1.1792402600230;
        Mon, 19 Oct 2026 02:36:40 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm24062449f8f.27.2026.10.19.02.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:36:38 -0700 (PDT)
Message-ID: <8a8313f1-d525-45d3-9044-b5f7a00b256d@linaro.org>
Date: Mon, 19 Oct 2026 10:36:37 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
To: Andreas Kemnade <andreas@kemnade.info>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
 <20261017083957.7c2696f5@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261017083957.7c2696f5@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 07:39, Andreas Kemnade wrote:
> On Fri, 16 Oct 2026 16:41:21 +0200
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
> 
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>
>> USB node was not working correctly with DMA enabled as the supporting
>> code had been updated without updating this SoC's device tree. Bring the
>> device tree more up to date so that it works with DMA enabled.
>>
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>   arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
>>   1 file changed, 25 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> index 7f3ef3a00ab8..5be9efc60785 100644
>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
>>   		};
>>   
>>   		/* NOTE: USB needs a transceiver driver for phys to work */
>> -		usb: usb_otg_hs@47401000 {
>> -			compatible = "ti,am33xx-usb";
>> -			reg = <0x47401000 0x400000>;
>> -			ranges;
>> +		usb: target-module@47400000 {
>> +			compatible = "ti,sysc-omap4", "ti,sysc";
>> +			ti,hwmods = "usb_otg_hs";
> 
> Why do we still need this? It is depcrecated.
> 
> Regards,
> Andreas

Without that line we get the following on boot and USB does not work

[    0.110148] omap_hwmod: usb_otg_hs: no dt node
[    0.110163] ------------[ cut here ]------------
[    0.110169] WARNING: arch/arm/mach-omap2/omap_hwmod.c:2332 at 
_init+0x1a4/0x4c4, CPU#0: swapper/0/1
[    0.110198] omap_hwmod: usb_otg_hs: doesn't have mpu register target base
[    0.110204] Modules linked in:
[    0.110221] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
7.3.0-rc7-g8e3242ad06d4 #11 VOLUNTARY
[    0.110235] Hardware name: Generic ti816x (Flattened Device Tree)
[    0.110242] Call trace:
[    0.110254]  unwind_backtrace from show_stack+0x10/0x14
[    0.110284]  show_stack from dump_stack_lvl+0x54/0x68
[    0.110307]  dump_stack_lvl from __warn+0x8c/0x194
[    0.110331]  __warn from warn_slowpath_fmt+0x1a8/0x1b8
[    0.110350]  warn_slowpath_fmt from _init+0x1a4/0x4c4
[    0.110367]  _init from omap_hwmod_for_each+0x30/0x5c
[    0.110393]  omap_hwmod_for_each from __omap_hwmod_setup_all+0x34/0xf8
[    0.110412]  __omap_hwmod_setup_all from do_one_initcall+0x54/0x2a4
[    0.110431]  do_one_initcall from kernel_init_freeable+0x208/0x2bc
[    0.110453]  kernel_init_freeable from kernel_init+0x18/0x134
[    0.110471]  kernel_init from ret_from_fork+0x14/0x28
[    0.110484] Exception stack(0xdf009fb0 to 0xdf009ff8)
[    0.110496] 9fa0:                                     00000000 
00000000 00000000 00000000
[    0.110507] 9fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    0.110516] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    0.110611] ---[ end trace 0000000000000000 ]---

Andrew
