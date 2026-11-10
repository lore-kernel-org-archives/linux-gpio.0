Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322057;
	b=as9Je9nJjrGoIrAAoPL1zgmmqIpjoxwAHbT0KoZPl6hDR1ZliXAqGOJWKE5ioK9l51WB
	 COij6O48VdhXEzmqGO2yXgDumU/4biDkTaG/RLv9JJ0Z/FUVwQQOnCEoQXQcDpBDhNOOS
	 P722eSRxer5nSuhpc5cT4wlOvXaIf/eXQvThQWiTXIq38wwXuOW2F7XZhX9OQcC2MnU95
	 EZyJHiyYgjGvmmK/Ete66QFfJwMjpaPSbM+povyur/W6s+VfSLR05i99NnzNxwtu3hZpf
	 HR1UcyGvnUj5swXj7hjDVayQkMoMunPtB8PG3QgQyVhVVuc+MINBB6mLbPb/NsWBnTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
	b=XM6ksX6vAHG5i/6nKgleUigvZY+rKmgh+zY69RV1m4pd6GRr2w9O33huTbGzLQawkWs5
	 yof0uBMIkqs0Kyo/7LLA5X7Rai016ZK8oG1zREb9ScaFb/4RG6mrhsru0y1Cvxn/8TZG2
	 D0WFqLBptOrHKuzkoYQlr0oWwXOq373nPp4kZRGa4JljoeBYnqx6en9INLv9GNRsvdMB+
	 a7OPOvcC5OzZKJxbzg9po85wMd7inXtlj7gF8LRAuYt4vM6T/XkDK26J+U7/0PSGtuxu0
	 9Dxm7b6kWyKZRwfOA3Po0Mz/xPq7nL8MdyeqCAume/SoHJbkraYUgYY8BKCm/OiQ+0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="lxQqOG7/";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45BD606A338
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 14:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45BD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lxQqOG7/
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1396144f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 06:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794322054; x=1794926854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
        b=lxQqOG7/ja3vQA3ubzTTIQQXnhHfPS+0aO2YnX7lae2OVRufASV1+doafyCZBTaKNr
         j+LVB34btw2XqAN9zO80UB04MX2wvWDSAaeIgqgzy09tS7K03khvWHJfsbJ3yE5fG7w1
         V1Y2hyUUGrxfopBFqMceSlnDujFZCC7M4rETAOUwOtRgmyj9Dz2JqaENxkNpcTKvOCYJ
         FOHoAKiTaLPRDLPo2MEqmTxxOSMRnZoSAp8o5sxRuz1y4ZYpS8h2JO2oPTuDHc8OyqpE
         gdkdqPf5esqDTQBfb9CPFOQjrCFdLQE9c1uI9wEa2IRvjK9dLYjshru49vGfQPPYXEgg
         yDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322054; x=1794926854;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
        b=TIlSl1zqjRnrCVvXQuo3lL1bvrLLnloGvoqUPXeSINa3v80c3k421KFVAncG3bQrBP
         WtpUl0VBjiV8uDiw2jP+TH3POeE3Fc1TZ4D3TL+rgSlQLFa2e4lvyGSUScZ3/H3URxW0
         3V7MeKWwPE9F6VJenIVQ3VMW6XcMuigiWgauhyA/uIv1MKwc6yO57FUy4KJ8mH45speQ
         lA/RyMxLG2BFyuCw1NbC6JIYcz+Q2aaRU2h2OXwyS91rrhjLNVrn9hnBMt44gfOzjtLL
         H3uX2GxBO8emx0gCVfvitaKa/vCFkKxsspU7dp56v7ElH8QQOCotXG4Hlk761XA6VFjA
         BRPg==
X-Forwarded-Encrypted: i=1; AL+hErEXhHGuygIUVsFXsqsnHo66dvDwtjvtYDWd1b8DXhFiLYH/en8/l/kbt19hV9Sid4ruUvOTLvQ5y9P+@vger.kernel.org
X-Gm-Message-State: APuU4Z9we123e7pqKeu12QrNjKp57LAYs9xCrZdhYyFVPbNGjYeYD/24
	9xXGwijS9eWFd50AeActyVMonngtVhTune7PDylQL+vSyujU4+tzyyGeHOEfiz/OTLA=
X-Gm-Gg: AYBFou2KD+Si4/nHCQv1B1fSI88SkG42O7uv/NLddjSrXu47ZXe4gFkjKTuoSaE0LY5
	IKMX6X9oAqFXJWf8WkzEwEVfUdsOoASAr9GB8gHkXIWklLh81FTnqTU1fwC73j/NfVViO47iUSS
	vttFMu57QDnp7QU1Fc94L5EVros0KyTFNfV8c9a4W3afXMQ+elWNjucVwShdlwgH8gZy0iBrNtk
	8TS2D5Zn3dv+GrxuawM1W63jdsixeWdZ6zYF/ph2MmpjrjoOXpWJ/gk5QutenVrb9m7KhPGrFEh
	X2OEU+5d+IimtX+fjaO2N/+QFZC24OW8MIBbkoaMvXbXVwp4ph05aRj3R2IHp3xzjtyZ7mNaTqn
	ZyaSGRnaLWXCXAUtmz+c3iX2vAMElbn3H+XI1H8r5XGdQbaV5brXGQXV5t3t6rILBpTL6Xb6ZJc
	N4OmfhkVlbCtmRUBT4Bsiec7P32NA789DBXFIFAcwI52ta5Ni98+wxrx462YqG8xqEJ8pIqkfn7
	mK6iOT3tVufW8JYNc4eyNO9m3u3WMJwE68+1jZZaMmlEytPxIyRU6x6HnDeCt8Kh2+PBCsDpbgD
	fLx5JCRhfF0dNQtvl1H73No0EW/jhMURdOJ7gVrA63UodKF6FL5lDzyaFA==
X-Received: by 2002:a05:6000:29cd:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-4982e82c642mr3775637f8f.13.1794322054505;
        Tue, 10 Nov 2026 06:47:34 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm5253059f8f.55.2026.11.10.06.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:47:34 -0800 (PST)
Message-ID: <7f613b00-bafa-4f4d-889b-4e37f5009b6f@baylibre.com>
Date: Tue, 10 Nov 2026 15:47:33 +0100
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
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <avL-4lquUqW9lUNh@pluto>
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
In-Reply-To: <avL-4lquUqW9lUNh@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Cristian,

On 11/10/26 12:24 PM, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
>> A get of a setting that is on or off, the flags and the pulls, returned
>> 0 as a value, so every one of them showed as set on every pin. Return
>> -EINVAL when the platform answers 0, which is how pinconf reports a
>> setting that is not active.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>> ---
> 
> LGTM.
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

I'll apply Andy remarks. Can I keep your Reviewed-by with those fixes?

Best regards,
Clément

