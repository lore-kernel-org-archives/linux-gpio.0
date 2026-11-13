Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539991;
	b=zsi+PkclXYJxfbBK7iDId56v94BRQQVHR90W8mqWOqaIhlSCcZpRnzm2WxTG0ZY2p+zW
	 rAeJoOSunepxV0CEK1pNxdYHCuW+H4ST8qec1TrkeohDD4RpDM8nM914dhYiHB2rdknxi
	 qysn/gb+bVr3HEsCGLQucgSW/Hcs9VTGV78NKdRexhm3G8UTUkUtoq4rqbKDJQr7M7bM1
	 Naui2kukJRu+9AxCu48uoMGDdKEEILtmaddUsZoNUGW4CxnDNc1k6B/mI+C0tM5Vbymp0
	 ZmgDiL3VV03ahfnnKw3sth9myDqQSMrt6NaAOMB0UwlGDXqCTd6/tsX58sOR47B2DIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=voIys8EwQkhUIwCPX9c3iOQmu5IoCkbo4OFDmG1MZKU=;
	b=FEq3d56okpQlMhVBv2SnE7p+SkIXJ0Tm3kipYGRZotHvGVU6yFi8o7RcZt9PAXj/2ybM
	 kebkl5k5xMT39hG4yLs1EQ2HHxufkO6dY7AgtkHzwEtu09BfGz+3fukovpF9c8KUlL2pf
	 gGvwf/bP8M4Gh6DKjlaYcQoQlttBsTkwQLS+3OFsHFZCeLs8zq5QFDKdp3KVk02v3MT/I
	 GWW+E7AmsPfLLVh8XFGJVMaIB0hpYo9i+pQY7qr4t4TRqFwxHi61x+nLoKS0cILMrDZeT
	 IsAC47qkBIuOxmDqtSsNYc1sWV23ODu8T1ExxjApnGMIGrbxQ4l3yfvd+0OdJJNY1Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=inbDH7TG;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAC606A321
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CAC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=inbDH7TG
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05b210703so205126b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 19:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794539991; x=1795144791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=voIys8EwQkhUIwCPX9c3iOQmu5IoCkbo4OFDmG1MZKU=;
        b=inbDH7TGQaS8YIhofdyopjaj2vvIPI0MTAVjELPvx6T6yv1rExDdkos8qLpXEzBV8s
         rxjjuabXt9Yk1UQfzs/6nVzU8OqKotcTOuwtPs6quzFFqFvd3g26xehO7hCtbIFbEHvG
         XzrnV0CaAiiDqw5y2bz09mWyTLLB4NlNw5oW3Uat+GXEqGRxgb0M2Z2FLdgXGNsKljLH
         10Uf8DjwaXdkPK93j0BNkU2N/w3iGR3O+45l97ydQCR6qVMOqmYat9Sd6tFFdycaJT1n
         sFDsiOm51XoRPLfzQWd5DVgadoQCH+7WGh+zac5y6UpmlEMd2ZANkGOEff2vVS9TWX0u
         R75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794539991; x=1795144791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voIys8EwQkhUIwCPX9c3iOQmu5IoCkbo4OFDmG1MZKU=;
        b=VGDX9WvrDZEV03sgbg6phCjltnDyjflnyvvFwvJG+oTecQQXi6PEWRCHlVTZkIfSj5
         gZUrwoTRo1C1Rq65pUOhcq7vqx25CbOtoOhI9bt84yhQ0er8CB5HVOGPtVA47X9//hTf
         h9MFAnndL39VacmKCcIgRs0FLAFxyCfkRsezegfhdYYQsz70dAa4Wwf95Rx91PPcH+Mp
         1TbzylvZEqBr83Rbd7rbl/ulmG1cO995THgvwWD4hRkLCZ821wgfSyoxwIPpLS3dYySO
         pry2YEFByIhGr2qN2ay3R9yfbWyxmZeNKq7dx2tLUh32Acppb9V2CMZAbSMaAI6mYmI0
         UKAQ==
X-Forwarded-Encrypted: i=1; AL+hErHnu1lT0zh8rdkWP6KQZkY0lix+3sjj3nMREjOQXHIcpsbsNq8yoMeDaMxLzYsMHDk7jntfDrRIprNA@vger.kernel.org
X-Gm-Message-State: APuU4Z+v+sPiGfdKPPpbUiwFHv37PZ4JfdM6Zr5G+NcHuNj8mnChDdm4
	dZbgn3k2/98GABHmCqACYzPHVgcvbfaJVs8KjghFitFxKPfjuln2aHsHwEz5zw==
X-Gm-Gg: AYBFou3zkh2nMH3bFSLVDpJ3Y+x4K4seTFu3/+OkQ6fb7xYHjIiGuvwDX9gknVrtAaR
	ng4Xi6RnD8B4AcvbhJVbvHgPDiT6XJcqX3QZ89lpuGjnRZVAp2swZPdHzCCFdzoIEq2mwe6kqXt
	9B6Mt0t/kAnlqneH782AsqEpe9ZjsuCHDhQYSbow+bgBngFjyze7LYR8jg4FVzSi4Yb7n6bcvN9
	HGcVjA+h316L3eVMu+XgXKcQGeYC45mKvZqI4BGqNv1939Y81a1PKeq+iKzo/uZl5qjewUTTKsr
	WkCZuS9rCm5p0223UH9FzlUMf2Sp3FinSfq6L3ChovlWELnBkEnbLrUd6e+QYdjF2cOOtm9ib2Z
	6W68yNM53j9UR0TOpusGXFNJyA0aWQubbz+2pIxcSlcKGnTVTVTtOsAcIpx+90PGfcliqKhPthh
	ahZ2KiORS+cs5g2ZRov5USR9oRPOcTr+5Ksl9UyIuwPhS/Dld2GQKf5rPUMUUJEjRHlgkzcfI1y
	AwzEz22g8rvKtsB+OZo6B7+I352bHqmefzFYnFTpmkGONpDxnLUGWM17zsLS/sUUaCx+4O5noXV
	fDiJM0iKzdsS2XDdOqlFHS3yLkwVvqB7TNjGzVYU2unBD5Yj
X-Received: by 2002:a05:6a00:1989:b0:89e:33ba:54ce with SMTP id d2e1a72fcca58-8beb753d177mr1447093b3a.46.1794539990691;
        Thu, 12 Nov 2026 19:19:50 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243e643sm388162b3a.42.2026.11.12.19.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:19:50 -0800 (PST)
Date: Fri, 13 Nov 2026 11:19:43 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 5/5] gpio: cdev: don't overwrite the whole flags field
 when configuring lines
Message-ID: <20261113031943.GA39484@rigel>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
 <20261110-gpio-desc-flags-atomic-v3-5-2f463bce8086@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-5-2f463bce8086@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 02:47:05PM +0100, Bartosz Golaszewski wrote:
> linehandle_flags_to_desc_flags() and
> gpio_v2_line_config_flags_to_desc_flags() read the flags word with
> READ_ONCE(), modify the local copy and write it back with WRITE_ONCE().
> 
> The per-request config_mutex does not exclude sysfs, the irq core or
> drivers touching the same descriptor, so bits they set or clear
> concurrently can be lost.
> 
> Build the mask of bits owned by the line configuration and their new
> values locally and apply them with gpiod_update_flags(). The whole
> group changes in a single atomic step.
> 
> While at it: rename the functions whose semantics changed from
> "conversion" to "flags update" accordingly.
> 
> Cc: stable@vger.kernel.org
> Fixes: b7adfb6076ff ("gpio: cdev: update flags at once when reconfiguring from user-space")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Kent Gibson <warthog618@gmail.com>

for the series.

Cheers,
Kent.
