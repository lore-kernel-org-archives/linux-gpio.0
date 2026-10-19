Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858DD4B1B56
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402091; cv=none; b=R8HqFzJB2dLFdxLCU5pBbJdbCOKujSFd9Vks3H2YarvVDKcUvwVvwzW5E7qoSr7DK19ojVEOYN2xnLb4aloeiLxld48OmHKMzCbAo0NYwGHOPa2CVPFfltbExip35b05ufMi9Xp3Yg28OF63svJmDHCNX15ndu61vaI+wDLHGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402091; c=relaxed/simple;
	bh=0dyPF7mE3t+RM/QADdAdf/PKx71VS8XRDDVPCLUpasc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSGbZT/w9KR42kYIVkjbqn3UlrWNIk4BbCk6nh8jAGQZKMTBxF3oGyNLRWaexp5PsDZPndztxexPAsirG9GM+Znw0x6FM+4M3L0edhVgZmwQmU2azmaSNfy/3qaKm17xpA5R5uuRYeA64fvJfwWKtVOhAO3YKjDylih5l3E88oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TabEt+4s; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TabEt+4s"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso985848f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402088; x=1793006888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=;
        b=TabEt+4syARpZYSS7IAUv/4kga+T5mT5y5YV4/TwUanxWgYT/3tSNCDXar14lM3s0H
         2IXDJb6fV0mk26cwkkFZijqxVxtT5Ahl72+Z0suNdAi2MaGf349Kl7Q71ylydqVvKJFT
         KyMqDVPxYmH6P0rDXOtqj36kHXvbsVWJ1wjxkaQKXvJ1LMhAWCtFjKhAxVWp0JQrPF1F
         MZImYUWGFPs/IvyKEJuRB7hzeGc8UZmOytgRX96KnwaunyDKGg+OrTulWUzkS7ju4+oN
         Dg8emLA38yAWd1v7qMBKI0kqOZW/I6e1UQzXhneL8ur/ver9WLJRdpeeZBJvH0qR9hnD
         vFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402088; x=1793006888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=;
        b=uqEFHnpV+OHDS6IEXKbnm9EapTxjKeyzfUKPR3eI/uzoSH1b/HP1/JIltVrG3udna+
         3ODh84bGRDhZlyGbGnWb6J5UamvDiJQqZhOWIBJ5GNTIeWZtiSh0oMsJs3+ZceniXlhS
         N9WVj25sglkWAqXbhkoyB4TwbiD8xhLqRQfXeT32ItAYBwlu447M7O1+gGBJuTcUOWW8
         xTe9Y4GxKljnyBMobecROiDEWA8hO5hJGBoLhYTehdhwhKaTt8S33tlIiGNYofEzNjap
         O9p9svMQq7TkeBJpjzea5XpGOKjA04AD3qhq/Pw3f2w/fVdoo4o7tt8fjdN+m+atZNc3
         XutA==
X-Forwarded-Encrypted: i=1; AKwUvByd//emQj8vYCFoF1Zn5uEm/9hqLYqTLgIkciOZANNkVpKLlrxiLts/BjUjBzvsQPhm8+77YCcWeAHO@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ+ppI8TiLGP56l4v02WlnwYNsX2VtWgSzJHAdogwEsBG6py6w
	vbxbb4j/Xw4dyDAtFIAk0i+5Qc4F9HWjhPxzgYCkVsNjN/zxLYOwROP6W20+KotnMMQ=
X-Gm-Gg: AYBFou3PnqDUusuCrGShMZnYTtFaqyCUwBX3RMPfrr+/sSqtSvh5f6NEMmHTiXBSiDQ
	hcPl7WJfbhyOMpV9SxvVC1DflCRkLmjh5vdSko2DRqHq0NJZP8dr8uA7moKhuQ+OdhAs5/SZUXa
	m6KCr59s/H/kFXU9KmW1ExKOnbpv4OI9dT3G+e1CNhYfjgMIFvD6PT/U+36iwXGxDFgin0fRO1f
	eqfXjNXGirWYXRj+ZKF8nMD9jUyrOWrwUslcgSSL5wK9cUc3Rm1SNkyxOjeCmL0mdSUob0faKYf
	I1a5Dix4XrVDkAQuEkXRvD8vnIftoo1mvqDzyu1DqrkFAE8DounFYncPpFL+Ywgd/d80T4IAaC9
	ImvgJPu8/FAl0GfHZeR4ydKs/r4M7QRNWpTrj0HWNIEZMG27ecaujoDY3+62RcPsM8VsOWedlws
	vD49YvksahrafRmi0cmUtadlrnXLGgPm+m31r7TXTV+sAkEFadw/0W4Lu/WNkyCFKK2frnKEKY3
	oiIk96lmcqK1fBNXxONzk85khdODescWmsUYyvg4F8Ogakgalm3/ofArmWM
X-Received: by 2002:a5d:59c1:0:b0:48c:4d32:ccfd with SMTP id ffacd0b85a97d-48e0797ff49mr16398545f8f.6.1792402087710;
        Mon, 19 Oct 2026 02:28:07 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm23498338f8f.6.2026.10.19.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:28:07 -0700 (PDT)
Message-ID: <cb24bc10-aa0f-481f-80d7-71fddf1e428d@linaro.org>
Date: Mon, 19 Oct 2026 10:28:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
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
 <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
 <20261017085339.3533e9ab@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261017085339.3533e9ab@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 07:53, Andreas Kemnade wrote:
> On Fri, 16 Oct 2026 16:41:16 +0200
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
> 
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>
>> There is an issue with USB being put into idle with DMA enabled and that
>> is mostly prevented with usbcore.autosuspend=-1 on the kernel command
>> line. Stop the ti,hwmod code from putting it into idle by setting the
>> appropriate flag. This stops the log entry 'clk:0058:0: failed to
>> disable' being generated.
>>
> So the module cannot be put into idle in certain conditions. Why do you
> disable idle under all circumstances and not e.g. adding some
> runtime_resume/suspend pair somewhere?
> 
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>   arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> index 9b5c728fb7da..2f55dc32e150 100644
>> --- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> +++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> @@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
>>   	.name		= "usb_otg_hs",
>>   	.clkdm_name	= "default_l3_slow_clkdm",
>>   	.main_clk	= "sysclk6_ck",
>> +	.flags		= HWMOD_NO_IDLE,
> 
> and why do we need this here and not in the ti-sysc node?
> 
> Regards,
> Andreas

Sorry for the noise, this can be dropped. It is not needed. It was a 
workaround for another problem that has since been fixed.

Andrew
