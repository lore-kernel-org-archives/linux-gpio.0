Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784774;
	b=WMcNtHKtm7vAZT5KlRBe2I2AstNdoNrF57bBi40JGuf0jUTGMur4v8lsq0QqmEVIvgYv
	 D7fnjCZp/EW6ZUR3gdEj1Q+NcnCcnSORGG+igxSQM9XpxML7qBwk/JWonj2WcizEaXZ+M
	 GkcyQon03vGs58xzymT+uYqngoUDNmzFZEuJPvW4DxpV0EpbQ7Axx9EXIDkWOsILsB8UX
	 w6KDW6R90qhFaxE7oZbyi04FtHUGvZqaxc/vVLRkzwNjujWyYSY/a1Xh/KUv+g29om5QT
	 GPGKikJpJrAkIyjmjjUFsSqmHwkqUoQbbqrK5BZmEMlrqzfHpxFHdUB4s076qu6BJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
	b=tpxU87Y/s1ilhprlfpAuu/0a3mlc8g/mzOHP3lUjX/9ba9flJpP2d3PAoYVnq0H9MXg9
	 wQdlKIVTMe2HAbtudW6VEKnsUo9mKEpAb5H8BK0uiczyE/FNcqODg3QGK0zXIzl05Bltt
	 XQPALC6scTqywEjZJuSHRZWdZd+wFIPj5ukoGE/kMZbj0X6KL4gnvL0N0Bomtmxd12mul
	 lg08B6Y5QLpuvcZ75oSwwimUABcBH1ahYjRiGka8hiFbHMsWS6p6A5G8YVCDmKBIqnCx7
	 NObXLA69t5wJU6ho9doh5AHP5VjX0rK9MynuU6ZLGkB/bRBF3BEtzL+78xy9b+ShHhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="PQ3pDL/W";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19A606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 09:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E19A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PQ3pDL/W
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so3822895e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793784772; x=1794389572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
        b=PQ3pDL/WaiOiomeexSMaOyFm+o2y1ATQPkbwmgNoTvH4LSLtI7Me6ph5fLKRtWMSRb
         UlAosgGGwz10zXab1eVlWIchC//rHjxJcHyFJ1v6xN4RtHsy9iuww+3PoW5spuDekUxR
         xBCn6aAOyX4c2QmznxlCnF2e1yAF1k2AQPtVD1gLIIdh++EJlC0P3HtUHd4oRoNX5/g5
         O/E1dgHn0Age90xTge7TUTGIfst6vdEO67tz4JFAAvLGnCT/9m3Llj4o2eGop8BEreU6
         FqabL6Jw2D/YHH6/ZgdXYWRkkqbJ0R4ALDaiYEAMYbfUTpRn8U+KPjM0j5RKMXcbXFc6
         hDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784772; x=1794389572;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkhmiTU3L0W+PtMKZoljzuVT2by2BnJf0VMN53m+45o=;
        b=GONpRO53o4S7sH3SziomTd1bMafpf+y5q7kgC7xeniaOC4+IBsR7xNwdAR/OiC0NAT
         Y75hyC+BpqMD+pRddNRMZXgGtCxwyb44IClXbK/1xmexSvv8/61tVrM4p6zuOhb5wTUX
         bro/aBFpUki6chV/fTxMDm4rbaCjN+Umxq84dcbMX6w0zzNqGYJooBjoz6qQy5zk+H/n
         ZgR2uRkryjAXJgJBxpE9Xe/Iqc81F6U1TPbWjAHpNq/35aM6v1jtFAv7MOSjz1kDYFht
         sR9+aoAOlwvsNGX58kjcmLTi3yoAxViIOLZMjTg5Dk/IMi/vGoXRUsSR4xmL89rv2VoV
         HAGA==
X-Forwarded-Encrypted: i=1; AKwUvBz89diwVH+IAW6I8BMZ4U8YeybgNnXmKyXF5oUMgAVzxUuH92p9/19zS9FD5j2TiZG/MogTxXv/sUfP@vger.kernel.org
X-Gm-Message-State: APuU4Z8czCqx1i+fhd4Wy2vEBg+K4l4BSHE86h4LEfsSCmNtTJCb4Zct
	WWDY3mnRJIB/5XeUIEZjX7ohNAEYqFKmJp0Y5LWJd3mKhn5TtoOTGjOpKQDthj/K8as=
X-Gm-Gg: AYBFou2OJu1ZCFV3P1V5+50LLXGCM9ARVyKgl0XhISHOxpRkr8V9DDlU2lLIXTCUdGr
	ozG3P+KOd6J58BRmiR/MwuxpjxRjr7zPaC+97l0/gkh7BvPaJqnLG4kDF2Vq+1nmjdPp1fUmhfd
	IFAoLiyisG206jq55MQiZoaCu+asXEmBTqhfxZn9jyWJiqtBredgulz/3ZhtZEnZzFiLlTQYk1+
	6lKrDDHSHWdP9HlMMcqe36wsHgL5L8EPSCNNjQJs93pCM0DPHM+8/B4RaD0NlQF11i0hZjWonb5
	za04AvXq1dLq/zaUk57wvH/B2/DWk8P3KGF2r7WyuZ5/S206c2XGzI9KZUAw8+fLkTqBuc6tv6m
	6YEsARF/0ZQrxaJ3LfFT1iZpP+TcvXuFeVF0sPE6JD4rdELqwocuTqoZmwmQjSQgB2GYMWiRsHS
	zMBcvCbog4nJM5AP3wdl3Ba9Ynsg2zyEXu83hnK3iC9LR4cWJKWeYvXeQe127fUdgNMJ86nyAkh
	gDTTiUp2N+2lXXsLRkUMO0xScjaE7VmGSRdkzngKSmC9oD+ouyUF+vz/mexmggJeDB/HmXdhCyL
	Aomz+RCgR5F+pLyOr+3RDz/O0M4+ITj2pwpL5fkIQmRI5Ws8g7cosAbXietx05gMRWrXJ7MXvJ9
	zGQ==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr393740865e9.11.1793784771558;
        Wed, 04 Nov 2026 01:32:51 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fedc09675sm2799433f8f.55.2026.11.04.01.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:32:51 -0800 (PST)
Message-ID: <1995c873-084e-462c-83eb-5bc454882c18@baylibre.com>
Date: Wed, 4 Nov 2026 10:32:50 +0100
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
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
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
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <aunHoe9PfumHp0Gh@ashevche-desk.local>
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
In-Reply-To: <aunHoe9PfumHp0Gh@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 11/3/26 12:38 PM, Andy Shevchenko wrote:
> On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
>> A get of a setting that is on or off, the flags and the pulls, returned
>> 0 as a value, so every one of them showed as set on every pin. Return
>> -EINVAL when the platform answers 0, which is how pinconf reports a
>> setting that is not active.
> 
> ...
> 
>> +static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
>> +					    u32 *value)
> 
> I would dare to keep it on a single line.

Alright, I'll do it here and wherever in the serie.

> 
>> +{
>> +	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
>> +		return -EINVAL;
>> +
>> +	if (param == PIN_CONFIG_DRIVE_STRENGTH)
>> +		*value /= MILLI;
> 
>> +	return 0;
>>  }
> 

Thanks,

Best regards,
Clément
