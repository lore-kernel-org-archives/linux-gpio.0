Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771015;
	b=BS9XEVhgNu04ObGl4W1j5hiYDlycK8fjt+BLQ+FShctzY7OLo6JpLhyt3OzLDUEAu2jK
	 ZkDagOUCNDgXqhKakH10Hu+ka1d3fhMoHHpDHyRVe1ehJNYHFXAoQ65KJGH+k30CTRaGR
	 fjsWuJQeFj9ehs9vTJAUXXh8MZ81ng/XMacudU0jX6t4cZSYrZTVSOvCJ6YcOaT3WnzlT
	 HKkvKDZdcIcuKAlUyfDjBlOSvEtedDKXyITiZyoE09Eg/orxKqJBsh2I/wvOt4V3QCYdp
	 7B+cSOI/8uCVJ5CwqkWTfAB84j51a3EGwGtba0GUdnTy5c1PgC5RPoigZ8z13Nt1P6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
	b=k+NRBUNYbz2QDqxQGTli2V/dg2LgAOO+GOks4hmCwCkd6wqGirPRMWJU9ZLjjC+a5zub
	 EWbvV81pdzZq+CVy8QLnwIJgwcvJquPsrwnUzyVspxPTntK9FdymAcZ1p85mo569DV6qM
	 zdF4ZbTGcAz2bhrTmJ11DpFI4Rd122lSU3q9JjXhop8h9Ste8KJsV6Smm8i5/8hnqrfij
	 K6XijscjJj295HzlUlRgl6j4/0JmxP3ViT9m9OlldFlG85Z1P5YStvyeuPjeXDFjjqrKW
	 HbLFJJmFLtEVdJa4aNwbhVsBDnE1cVlqaORhQPuTWFbbyH8yhzprjKgaD1LIr0ib0dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b="VZl/IlJW";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C074B606A327
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C074B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=VZl/IlJW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so37978455e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 01:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771013; x=1796375813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
        b=VZl/IlJWSTPQEx3kzZixxBHdoo7HxTaWIlhn7M84mCtSRGyLmzMnOwbhKMFpYJVCId
         emKq5axdQzhT02uh1q9SxLotymBikjKdtjKqWXm/qh8EimPtNhmowWfDThbdF/nr9nqu
         WIZthNzQfusgbHf8Xg2y13RainI+sV0raFlp4r1PKwA9JDPTpAnoSjXjvL5HMTc3mU66
         iTsvbv7qpYAkmD5OFlxkBEygevhq63D2NC7Avc2pgYvG4nLLGoDl0kpqhnt9rCaWPAWG
         9MHXNRCwu9vbkGeyoKOrBUM0zuKqj3f465SBdlaVdOEr51hHCnBeDIGT9Dk6v8ZHSGEf
         AXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771013; x=1796375813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
        b=mBnXPeavBfGuQ3PQ1a8swuVNkgs0wcwfnkav7QrHclB7YrC/Jt5g0L+L9O8YFZbpSN
         nTI0G76zDsGskBTiKle/x/0DB96NK7x7n4xZhjehd69EHfxbLdqFoZJgkX1Yopb580Zd
         Dd3RVpWoA944JE1gIoWQxYF8Egc6oy7gPOGKwkDyTPiCpWE1/5lv39wcKywzoQC5vJZk
         Y9wwgEd3zWWoMA3AWvilBzTNMdqbOLQnHypbNwbdjJg1Np27rjobJNGjmtmVd2D89b6K
         TRz1XeED9Vg5NDiEfPKoyYbYBhT9bUTGesSbtWhcmkavkf1aKQ9KtkV0dy/OWB8ebI74
         CH7Q==
X-Forwarded-Encrypted: i=1; AL+hErHMtSGqmzDPsiQca7J/FsIj++4VtXAam9NGyzNUxOcJ4lZ5cff/zy28LTfTkRRm75F9BLqx/3uM0b6P@vger.kernel.org
X-Gm-Message-State: APuU4Z/gdz+4kh/lc9mrvzp2g2QRcuGInSTwr0SDTmUIfwfDrudzyler
	kAR19O5qZWrLX2HHzgK9+LtWEsuUtyc9spAmRvm3oqAOBLhXtaJGeB7HvdQHA9p6xATPvyj6HCk
	sNAzL
X-Gm-Gg: AZFdTZe5BTQFtY4cIhtqOA/AyU3iL+TRBRfXXLak5UAcgFI0Xt4hCWxKYDtbuWa4rOD
	/MkFXAb3vBjwvyeaAPUzujKi+7tPe3XmU0Ukexs390S6jv3YgseOAnha4klad2dYwQD9Fe7P96J
	Ik8y1ZB2cb+t4H0waRWNmkbccUGesAkwJsKwfYrm9Yrf8pmVLnVzg1/eMGEPrl69Aa5VdpNoWfW
	v95AEDoJr09OcZfE15CQQwT6tE48hj4PTRkA8Z3VswGgUWJULXfQmGzUmw9SGDg416fzMR3BbbL
	zj5TsW/jqpAsLEH7kXwL9YX3WbvkWwUpvGREV9d5UP7YpsSNnCEfHaQCCQbkSs+puER2P9MAGuv
	Q8BL8sxBFEIGcTXGO4f9Lw/bKM1d4vZ6oodcw4wBIpwGAJAYtndXX8YXJVy8MT8QhSUe9/XRKdy
	jRUrGV6drUP+yi8b3CcyncIE+tsMCtcF1vCp4STJLtcYqzGDtyC5A4sX6YqahLRXYqlIo7QGaYr
	A6B4bOA97XeLNjf5BeFuEW8QI5UboMEz8owH4WJIR89MHWiFrAAGHlmSGwZBvgL/PWLR/XI4V3G
	4geMAaJZ+AoH5v8e9t9cxT6k8osfOglDRWuP
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb88824fc8mr506682605e9.34.1795771013014;
        Fri, 27 Nov 2026 01:16:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1231003765e9.4.2026.11.27.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:16:52 -0800 (PST)
Message-ID: <121cc552-86b6-40de-ba9d-0ae40f8a1ed2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:16:50 +0200
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
Subject: Re: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Split SoC-specific masks
 in struct rzg2l_register_masks
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Diogo,

On 10/26/26 13:35, Diogo Ivo wrote:
> struct rzg2l_register_masks declares the masks of the OTHER_POC register
> of RZ/G3L and of the I3C_SET_POC register of RZ/G3S in two branches of an
> anonymous union. As both branches share the same storage, initializing both
> other_poc_pvdd1833_oth_awo_poc and i3c_set_poc on RZ/G3L would have the
> designated initializers override each other, ending up with the I3C_SET_POC
> value in the PVDD1833_OTH_AWO_POC mask.
> 
> Split the union into a common area, for masks shared by multiple SoCs, and
> per-SoC areas: the RZ/G3S and RZ/G3L I3C_SET_POC mask moves to the common
> area, and the RZ/G3L OTHER_POC masks stay in a dedicated RZ/G3L area. This
> way every mask gets its own member,

 > and new SoCs can be described by> adding their own struct
> (possibly inside a union).

That may be missed by the next person adding it...

> 
> The existing RZ/G3S data only initializes i3c_set_poc, so it is not
> affected by this change.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
>   - No changes
> ---
>   drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 9bf3743dc1ce..f73d273df362 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -278,18 +278,14 @@ struct rzg2l_register_offsets {
>    * @i3c_set_poc: I3C_SET_POC mask
>    */
>   struct rzg2l_register_masks {
> -	union {
> -		/* RZ/G3L masks */
> -		struct {
> -			u8 other_poc_pvdd1833_oth_awo_poc;
> -			u8 other_poc_pvdd1833_oth_iso_poc;
> -			u8 other_poc_wdtovf_n_poc;
> -		};
> -
> -		/* RZ/G3S masks */
> -		struct {
> -			u8 i3c_set_poc;
> -		};
> +	/* Masks common to multiple SoCs */
> +	u8 i3c_set_poc; /* RZ/G3S, RZ/G3L */

I would drop the names of the SoCs close to the i3c_set_poc. That have the 
opportunity to grow over time. As Geert considers better.

> +
> +	/* RZ/G3L masks */
> +	struct {
> +		u8 other_poc_pvdd1833_oth_awo_poc;
> +		u8 other_poc_pvdd1833_oth_iso_poc;
> +		u8 other_poc_wdtovf_n_poc;
>   	};

OK, we can drop the union but the next SoC addition may be:

/* New SoC masks */
struct {
	u8 x;
	u8 y;
};

If we want to keep the initial form we may need to pay attention.

Patch is OK for me, just with the mention that we need to pay attention if we 
want to keep, for the future, the approach before this patch.


Thank you,
Claudiu
