Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883528;
	b=5UU8qdUGeqZ2Q2YwR8uQQHU16NmPrb+C937JPaVruqV/T1lx4QUZ8+LqVOlaYzMAOS3y
	 9wRrKSyNLceAV7EhGeABPFoWvZ6SN4vL3zNxoqTYE1v9BarPtIVhMHXYHp7UVXzwrVaXi
	 v9A2ywnarWrFvvXuCwso6+0G6Rbc64umZxzbbsEADqsZmp0ZE8ilIF1qY49zmqkJ8+AEQ
	 zmDfwCrp5yCItdTDyNK+pRYfDhRnUquXeoheigK2IEAH5y5XM2vv1ppYXoq26E/udvCIv
	 i63D5E+quIKX4JBT0nXDzGk55szcO7uLQ3ytXu48i0M3ldwK6MEbTbsRZtNd5pCEpzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
	b=3IWpSNaAK/CoyK1fXr6G66dji0iJCzOzX3Rw68LhnW+Jr3Te6S9RUT1eh7gmq7a53M3V
	 EfHqhbLasbXclfxSJFmmu7GiK1tVRlvEVvoUmtlSvvBG81w7r/zXI8SQ1ye6vqVAJ3+EY
	 9pGbxuH5jt+cmKDaJdWoaQmkABdUDf0Dejh0x4gme2sK5eiGt7JaiB+lXP+y/NSCHMZXJ
	 GOn0wXg1sPCnoCS08jUiaUUuEdYQOLyZCixk040IoF+tWolKu18h/bsi2A3q2xFtwAIaN
	 uaWGt9LrIfzDvWQCVhg3kwuwA+L04DzNmSbZHUMn1c2WACrRIyNF+b9Biclz5GrKZag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="L/wD4a/y";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63B606A32D
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 12:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A63B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=L/wD4a/y
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so15767545e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 04:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793883525; x=1794488325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
        b=L/wD4a/ylJXV0XF6/0PTSkMyL+0qSb6ZlhBosU4BX5Pj7KjRTFLwMBonjApHISxwI/
         qFX7A4EodJjv05cV1+Pvp5a9CnM4jSs7QUtlDgey5lt5MO/bWOIyVehVkIb+rUQiO7nD
         wKsQKIq2EEO0D6T13iNaiR4S2XmKG1xswSwlgamKifo8fMU5iRG2ESLyWyyF8njfzBKP
         hDhjc74qZsFhiomidhtIFh7xPrwvp3uZEhfh88UPF81e9sb+yoKFGmm0d63HpJuTTThK
         TwVr+c0za+UngVjYzur+ILK68hcWgncUpdmnjBRY0klqXtSxfQ7I1LRYEppK3SZNw9sl
         qNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883525; x=1794488325;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30cvqab0GneMjzQY9b3Yhah4cXyfQoNJoQir3EuyP94=;
        b=g1To0iovi4hbr8Q4/5c+177c1YzKryYlhIfyVJzbU4Iwb81z8sOhurE3ICAx/EDaHI
         I8d97So2QILP7cc4lnrotH5JdavGcN1IfAbFxip+SYxrgAZnZ06K/mxEr2l8LaPfvcWd
         EP3CwdL0z5pIr3w/VNjsvabR8JEUNzdQzw99VX/8wsIRUp9Pkcv+eVryEa9AH9Y5d5R4
         vWlPU9+0y/WD5uxMnkc1BkmpVchghiMw1DrtO2EkwlSo7zPicCLZ4C8shDE/R/ssXYh1
         nOAa39AylGHDKhgXlOozCB6zsVEK+DbhNJOXBH5VTytBPS6c0TgzKGKTVEgUhpNUSWdy
         /drg==
X-Forwarded-Encrypted: i=1; AKwUvBxFiLckSlUPEh6gRyzzuagyvIa66nP0jhMWt5Tegqxr+j+jz6VHW+uRBrRI+S7u41nBV/mC8GnMBmYU@vger.kernel.org
X-Gm-Message-State: APuU4Z8E+RTt8JKyt/xeHxCzxptMsn3F4a6UFFWi6COqXqx8pPKuBBkW
	YUnq0IKu0dYVkTJdiOgdi3DCLN5tRVql65YheFTh1b6rWLI1uevefTW1HzTRqKn/YxQ=
X-Gm-Gg: AYBFou2MANl2OAAnZ0DgzoA048/PtmHU9okqUGBpuM4rM8ZIj/uOQH1miGdZpeAro6S
	ODFvtjwefo7/CSWOzSOeHrXiU2axkqZazgyUhOkhG9q0CXeGObqTN6X4n8aykn/crqiWqoSk78d
	+cURFk8b0mmrsygI0ZpBPVt4Z6ufl5IMCa/SwDE1pwkBksP7R5DF/Vg1OPlnhvd5nr8qzMXb+uI
	lkZSr7ctGFRiMEoQzeTUsrNVzmjSmS+ddjBnVo4724qhSino5ga0gvXeVZE1rHznUgFu2V93Hp0
	+px5cb0MBBQqomNAVouzLGslpipbLB+XQsn5Tskoa8nKrTvpqP0yB25Q+JNGl8FT0jWKtRpg8yD
	sJ+aUdIpkej1+PVcGS+K+g387hf6+F0gpaNt4Lho0yubjgooj3dOxlU0Pciog0+qmdV6zW9wnqh
	GPqJGO8rBlIhVjTlgMuCx0snM/1hZNdJv+vE4PhKRl8o3OhoJ9EJtFFuPWOixyuhkyl763HGjgZ
	v81HBuuGDV2Xu5gPQWBk2FXily6yUxrmGl7mtBELNLqrXoGd7EqjFX1Hb2FHZPPXNxl+IXRR7LO
	4f+2NHwVsvxnEKEnV/zn3xFprp0fcLs9wl8DqC7emGjMKTyO7rfh/Zb2
X-Received: by 2002:a05:600c:6212:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ac17ffa395mr401888755e9.22.1793883525271;
        Thu, 05 Nov 2026 04:58:45 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm27861675e9.2.2026.11.05.04.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:58:44 -0800 (PST)
Message-ID: <56932f47-2e35-4152-afc6-6cd41c8393cf@baylibre.com>
Date: Thu, 5 Nov 2026 13:58:44 +0100
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
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <aunIVW4JeM_P2WOa@ashevche-desk.local>
 <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
 <ausPFWOj-usp084X@ashevche-desk.local>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <ausPFWOj-usp084X@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/4/26 11:55 AM, Andy Shevchenko wrote:
> On Wed, Nov 04, 2026 at 10:38:11AM +0100, Clément Le Goffic wrote:
>> On 11/3/26 12:41 PM, Andy Shevchenko wrote:
>>> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> 
> ...
> 
>>>> +	int nr_functions, func, ret;
>>>> +
>>>> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
>>>
>>> Is nr_functions signed for a purpose? Can it hold an error code?
>>
>> No indeed, will fix in v2.
> 
>>>> +	for (func = 0; func < nr_functions; func++) {
>>>
>>> 	for (int func = 0; func < nr_functions; func++) {
> 
> With the above in mind, the type of func has to be adjusted accordingly.
> 

Yes will do

Best regards,
Clément
