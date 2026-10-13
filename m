Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C34B04AC
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872374; cv=none; b=a9ymLi60t7/0arZBhXeVB2cLlq02SYe75iCBXG8ES0DOkwg7gMEO5zaVvG//sG78RBBxoi70NY9dUtfIEnYMd7Xg87fM6jqGwtF/xp0Fhl0rIHfVOZjRIXE3j2BBOr0lB5A+NV37a8R5eAZGNuZYMswlxOaWeBFVL478/RcVBcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872374; c=relaxed/simple;
	bh=qVZJr6BGUqZMkmvvywtMFv4Y+FRBCFB7MBPZsxpnpp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S3LBUALlVqmrB7X3mlUyRTODFhWzv9G8TN0BYXMfct8NFYu9rwoM+dYqUwFE7+6OXgdLFvBLF/xqzfTBPaxQO84TG2igBQI9VUsNTuNFlnE4HIFTxa9STL3Nn8APeXLwpwPxpGcfqxuz6aY2g9lXXZn+98rew0CQMNIv5JJTW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbFOB+kH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbFOB+kH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-486e70f2457so1089585f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 23:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791872372; x=1792477172; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVZJr6BGUqZMkmvvywtMFv4Y+FRBCFB7MBPZsxpnpp8=;
        b=LbFOB+kHfGIvJmHW/7rO5K/rmUnwR2M0fAdOf3rpNk9XKwJQ8m/0tGz0SIKZCQh0Rb
         9OVUCCltNrgwGPfmKYa8beaOh3q5aOKoVMnagYIXLhleuYENI2uHmATmG1R3yN9EXxEd
         9wtxTyZ5CrXgG1PG0Fs+NOyvm829MLuhzqUd+liDSIHuWoiD3RYKLRtdGLou03QVa2LI
         PRB/wn9Uh4jtutFzV266YZ1NOu5LZMF87UKclgiNCaDJMKBnzKPGRwGMhw6oraijCcRu
         rXSdLrN06o9EZA6MClFoA1ZXwNY2zqw7zlKH+ighaPpDulr2Vk2ojhiHCQUTqUSMxpxM
         5plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872372; x=1792477172;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVZJr6BGUqZMkmvvywtMFv4Y+FRBCFB7MBPZsxpnpp8=;
        b=XRSzg8qIzdgmzkkswh+mC21lrEx/PrWtNmUCsp2DxCntC6Z2SAZ2vZeXvbamtSUIlp
         sRkNxyFGLA0682f9GCB7fT/HAiCW9sTxAMjF47Tw5COeWwJQ2Yy4eXigDTDQi+iB2QsJ
         ATtCP7Rf3cTsURHcpfg/ZaKL29rPrTQl8VepD/5XHtEMoe9MLRs6LwDOOGkvZ5SCuWix
         Y9JMoTwqahnfBiLrTD+K9vWQNNC6HiXHesAlVXunk8o7KjB0la3ggVukO76FI65gXFLa
         xa9C7PCagzG5AOLs+fzoUwHEvrMHmC61MilNkA8AFjEa3FCF3xDanBsNs9TqC7FU6+DZ
         BZJA==
X-Forwarded-Encrypted: i=1; AKwUvBxtzFQFkff8d4hcMJHG4UxSmb0w3bp3APwtvZXGVvCuG+6FkeOfxU2Csz5rHj3cNANT8sYoJm84hp2W@vger.kernel.org
X-Gm-Message-State: AFq9FYJXc9YlWIyeRzrbq825U3DZUbRYAg2dhziU9kSgrwITAajPSn9Y
	2FKgz/gyahsLukYWjfdyyrR2yZTXWedPivoqh42QH0OWu53hZoQDvpbh
X-Gm-Gg: AYBFou2tFkh4fE3N4InqA3HUSHcyLBFZIcWJf7CgulYs7Wr90r5e4ua5yv6uQrNrBX8
	w+PxL8mMR9inO9NYoXHmVeBJOBv0Cn01ktZt3I/QJOpfYNVbCVsqquDVoo3AhAU7V25ReZeaC3f
	glM7wQRpxysTravI55y6EyV2S/1H1Gwzu4S31XCNP1oeHXT9JBZY9djZSxk9CoEIAn9u6P6mOIU
	8fEBXIm2snL56LMe1kAGCo9XTRzR4mMosOu19OuoNBPF7nu4yccF7JqOtOKplgS+6m0GCrKUY+N
	9EE6vakVm+uEUL8obM+NG/3cfYHxTjUTCV/ui1xLjTdDkXyDmR5FmqE6ym6WITnzR/8T40Bg9OS
	oIMe9jmydub9wIkNw2JfA8jNMvBloLeUWi0LWpvfcSrQ1lHvl3hMSuorFlcCCT1x/ZkxPM4JO2o
	CopTNql61tm/p3WlSGxI7fNDPp7FazaqVedRwlpxPTaTlh4OuBY98l5JbCbWlnxKisMUVx4dHnk
	0aGQwu5eqtjxFroN0JvJLz5mRTuPBk9F+YRRZIln8pz0U3E/eX4+Kppqg==
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr250154825e9.17.1791872371668;
        Mon, 12 Oct 2026 23:19:31 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm264395905e9.3.2026.10.12.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:19:31 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Cortina Systems CS75xx: interrupt controller,
 GPIO, I2C and TWD watchdog
In-Reply-To: <ad388a91-404f-40cd-8153-3a0df3411c16@kernel.org>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <ad388a91-404f-40cd-8153-3a0df3411c16@kernel.org>
Date: Tue, 13 Oct 2026 09:19:25 +0300
Message-ID: <179187236532.3113955.136062642054162547@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On 13/10/2026 08:18, Krzysztof Kozlowski wrote:
> Slow down. One small patchset per 24h. If you send some big work, then
> once per 48h.
>
> Implement previous review.

Sorry, understood. Your comments on v2 arrived after v3 had gone out;
they are done in my tree (I2C and GPIO as modules in multi_v7_defconfig)
and will be in v4, which I will not send before 48 hours have passed,
and the platform series likewise.

Thanks,
Fil

