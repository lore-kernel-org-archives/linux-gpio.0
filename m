Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605460;
	b=ijgt9AtVLTI9llTmyEevVD8MU3hQl3aDodBnr5gZ76LFw65FWXrsmCq9/mkj3T/+bABq
	 oW3NSXM97qz5mbaHu8qP/8ZK4YLIpur8UDO/HYW9wNouPXuU4MbYgNEOlEJ5dKMVHHq24
	 i7op6cgiZDeVp5+1ma+wbkspZKHtvFAtH0ZKNTz97fIlH7qDOtugDhrU7wefCie2wMd7N
	 Whvsbf8eVS+SkAFgH9rhF82DqDXjxAtU4OdzUp7LDZOnmkHUAe2qL0AtVSmmPNwlX6NRq
	 GgEkManMuPI1zoV/+o5dej6AsYMhnaGNHjYpxsPqReyFv8fPUltQ8VmDk4umpNjVuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
	b=XRi8wD0FzsYmclEGQ48uVlK58JQkxLnEItjHb9apWwuR5T0vFpwg1OEVEC7LKR7TWfn9
	 B/Hs1RjSN22RwfHt5cNHm0Azvd+ewMdrt5UcSi1fGMRwaW2BQxx2gSra2KUzSC4KcnaC5
	 ho72NF1U7lQXgtS0OYnF2AO/p9IiZRA+PDt4RLhHuXMW/8su83ReSY7SO16t5UzFNfaei
	 NGfijfMSMkFu0KYf6OZ/E57kmkFGvUJgCBcGS16UU2Zt2KLAbuFcpDywh5LOnbuwv09wv
	 7Unn0DDbmMsu//OAeRjK5/cZ0/DOFl8B2M3ihWjvMjTe1S59g3vJ5tlLIJGYjTjnxvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KYdOc0fw;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D4606A329
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 004D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KYdOc0fw
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3295401f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605458; x=1796210258; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
        b=KYdOc0fw0XfpgWsOReTkFfKlAQWYh5bjBxSLc6c+GDe/HrXiZr1FoXzYrJn0x5py9p
         AroMR5c/ME3gJGrcz0A5Oy90P/yN1qKQf+pJgegmVWq0JBN7WgoskahOmvdspM7u/oN1
         2shHaODP3Gfc4taLmjHi8c7MKuvFK8/8mNcmZAh7rEmYK42dXcpRftLiZepXPNOOJIcM
         Ss1S590je9bVFOygYEZLwpCpT8h5UZWjrPmKx5x9AjgmJQUJoiDb2jUFfi2B3pQjFlGq
         ECu+PVX0diYk0dQl4mCVLw+KOT60043XRMvLPRiIOVD0+UN99u8rQbIZ9Xh4AsM6/7q7
         T+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605458; x=1796210258;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
        b=T2NvPdkGlJZHekIFW7sY65/08DA7aE1OWJPcFpmY+Gub9IskH5n0KMRyWKReewPeh3
         UeTqb47pU8NP6RqnzzzAGS1SgpChuGhSWsb91Hccu35zZAOylaBYPl4ggAsIKdnBfgQ/
         k4xMyq6Xl3kujouUWOHlEoGToWwFN/tw3iA8JEAWeP9mJCiQ8XbjvCtPFCCxpCnGsUwV
         JKsW9I8OIS4E+K5l2ipkgwNZaqOgPeELRoPI9+O9QKsvfvX7o0Pj1Hjsvh/GRiWl/f1s
         kGbIEtW663gOIzKPZc7Z4UCoZSXnxyrRoYC4kkLKbo7W74tqyD3QH736dxuNFLLVoppg
         EUlw==
X-Forwarded-Encrypted: i=1; AL+hErE5jo8bIJPkaffmi+IGbXcInJzPrIKtV0k8ei84M1wp2ExfV8gYZN7VATCMurVLKzkhd/3MOk0POrR2@vger.kernel.org
X-Gm-Message-State: APuU4Z/KrKu829BkXVhNFnATW87EelAoJ+jg1eqF4T41SDIGGBMf7uVH
	L5R4WruthEkQiozqT8S9loHrHvtWobeBBzl72na4d8OSl0MPGNf1Adcu
X-Gm-Gg: AZFdTZenRi6dvo5LxtQFUoxZ1IB5Z0uUEc94qGobvokiiOSNQj9wW4G8ft7rBNI0lm2
	2xXjj2AEQ9qbZ/rPY+9LnPtkduQrrduTLX59MH+IO/rxerI7G6hxGilFxDt9FA4O9HZET5hIKIT
	nIXj1Xo498CfyxkE/6hsC1pHCoCo8LIB85ZW40/wo0SeK9PqaHbaEvqyn5uJrotCDTcCSD70sG6
	DMeU9dg8Ed6A/JujmRT20sijXfpnUcIUzPknIb5+L/LgC3DxA3/byoq0OK/eYziEItlVX6VpU/n
	YW/M4wA8kYeDeHvZp4zHPubs+BI+QaRVrsms9RQIyGeFojSMlOYCcub48PX8jiQRWMDoSt6n5ch
	VwQYx5T3heg9Vko0maG/pY9tXrBHW01NH/AvHY7vzuZ/I620f96oU9QOhXR3XpTsyypGD5ayMuR
	0WPRNiXK/O+GkUmYWDdvpApXLdpnYzMkJ5hut26pLvDcs7lnEypPRl8gGF02jrVD2Tzchdq5vLC
	W0E1vtiH2RPzPst1hhdqbAeGMAXwELRNNhC73t7zcO4dkVl2Xsitzrdix2uHkUtTaJaer1rzJ+E
	+RhtzYkOCygfNGDWZ+E+eWUa3DLIFcb6ree6Ry7CX46Q8OSvD1PTGdk=
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr378366175e9.13.1795605458098;
        Wed, 25 Nov 2026 03:17:38 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm579874685e9.14.2026.11.25.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:17:37 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: sashiko-bot@kernel.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 3/6] clk: Add Cortina Systems CS7542 clocks
In-Reply-To: <sashiko-outbox-233158@kernel.org>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-3-3337bb0d3b48@gmail.com>
 <sashiko-outbox-233158@kernel.org>
Date: Wed, 25 Nov 2026 14:17:21 +0300
Message-ID: <179560544103.3.15793449705570350216@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks, confirmed. clk_core_is_prepared() stores this callback's result
in a bool, so a negative regmap error is treated as prepared.

I have changed cs7542_gate_is_prepared() to return
regmap_test_bits(...) > 0. The actual callback failed with the posted
code and passed with the fix for all negative Linux errnos, zero and
one under GCC and Clang. Both ARM compiler builds passed as well.

The fix is queued for v5 while the combined v4 review continues.

Thanks,
Fil
