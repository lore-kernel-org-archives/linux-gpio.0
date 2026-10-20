Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460248;
	b=kOQr0pYyd3CQimyjMRl3zQtyt4RZxMERzfMpc/8RS1WJPgw6ZkUV1W+X4+LQkpz9GSii
	 RnfSfZVuLAtBNTSOSIQWhA93ofV7kVAKNlC1qRJm4FAwcG6GjMnQpUGTT7C/Y+qtsRDUE
	 HC0zMVmHkVtWk2CBvxEjIZ/DAZM9jXh0RBBlESBId7I7b5ZYLZ84jtHwz8aDsySQ5IzGB
	 8SMN4+Ebo4o5xB5hNgyyh8ERdecaSeIn6fMW4gp2pLWQNgBh3fWC626F0ACN9UfYMzCkK
	 wNQ/WP8s78Dy8Qx2QJPEDmXgYDTeWhfz5/qHrJ+5G4T6W+4sUeDNJga2l/Oc6/sZaqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
	b=Dfqyii+PrDyhwipwqB2dkzgII9mwMnbW745aA+HbnXHy/pgimj7pVDLD9JNBSDyfpR+N
	 oKsOlmREIgMGyD+5qevt1vr8BabduWTJw2KAz2sGJRK8saqme9/M+wSsZ0qa2PnWDrlfu
	 VT5nhXs/Rm+bdbzt6oA57FnJRjQt2iFEYNO3xTId5ZaHDritbAOVOFEvHRxlS53RxZwaR
	 dqLBRUt6ONoyF8hFFGlejYpZWClnx4+9Zfgn1t5SuQLZe754O04+b0QPuPstNbJ9ldWP5
	 oONlVqoWGDPMCF57wNZyCjhKuzyJ9nDpRQjfRT0iQie1cpZf7zuf81QCJt++wrY9fzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecmXx3NR;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0880F606A322
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 01:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0880F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecmXx3NR
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f036b17easo1645378eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 18:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460247; x=1793065047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=ecmXx3NRtnKBb0bx3OKSgxIGlOywd+JyxPJp60E/ketB3hMnkmpLkH8L4kcdJeA6Jl
         EMv31nRk4M5/ktlcZJcz0TUpYNZrDTjGmjF1tedEYBM7w+6xPr+Lrn+qPR8G3QZ6JbhG
         NESF27cdh0velfvj+2DrkT1yLnB/vDSgAZOY4mATGCWkyZKYKXVEe9SoJOmfeDb++d4E
         LsU8MtxwGj6M2KGicp3ue91OsgkOef1ZKEnqKl5cto1+sEfHdlu/c4CauXWRFZ7L2FpB
         5HAi4OaYB6E5btRgmlcTXLc2QOcDGhYjgeNwmoMugrTDSGeJXWNPju0Z3o0fQLnWuN15
         jnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460247; x=1793065047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=JPRjEg59WuCTYzYofreDy6SIu2/uy5FOcZ5ScEdx9PMsCzKSmY7S3r5atcAsEUCdPx
         xsJO9MJYguWulvRjWX4MjViT3Sgu+x/tK2GfaC5rfCJVIICaRmOtl7FN4aT6KVTCBa3v
         FMczhlQAHVngjF3KEPWuzUsrLTF/rOIYrosvD6JKxE6KRDDZhNpMPw9LDRrKTofXIhXU
         vhoViBtJ6ZzbbWxmXS14gqMmhUax3lVrTFSjGHknD/5YFkCYZFi43qgSwQspagPvMQH9
         LugiAnaygBjk6g29ZXjgXjD3j6QddV9xE2qsLh69d3Ms8MCFbraEi/6EFkGv7Gi5LBGe
         CAmw==
X-Forwarded-Encrypted: i=1; AKwUvBwBIqVLrMLwxsBTrmfZ05VSFPdbgkmKz5/A4/f1ZTig7PrgLFsA/RcOI47SQvMBscoHXdr1elgmdlpa@vger.kernel.org
X-Gm-Message-State: AFq9FYIFV1DjVjmjwPggfTJ+CyHN8SIBkgLubIPXFNnNKXj/iuO3OKVv
	JyENFkFNPRs4v6d3zPj6FhpknFQEpAVGL4dPR5I36cX2ULs0I3x9OVOl
X-Gm-Gg: AYBFou2vv4WvBdIJulafa5+c04OtrFLrTV0e5eharZDDsBqA+0J4BhlyhmJe82wcPIz
	JZ4SGNOmT2l8QUn0+cB6Ouqy0eP0oMe3kyPWLoWA5AlsIrd6eZ+m8L0dU8VLJhWwNePyeXZ2LtJ
	tqmYMnsZqrH/k8JVBdts4PQXC3ItIozJvyo/wjGTGfgqhuUDhruLn2W9DMlZQDBSYvOTHulO+0x
	R/Pfk7h6Qlb7mJlm4NM3UI+Jo5aC7BdllaLNcFVLGqZ2dNC/QvTHn0WHerQ9YU/FbgjKYR9Q6uW
	Uu80gl2Nk+x3fzzvK046Lmud3zWa3jT5H+ihhkEHJy4wTKk/1kswaqG5VaxuuJ0sYvO1/h1vSvA
	5VlVQkN+oHFHm+TFV7yjr387xWkMx/XmcffFcolM5CbpInuIpY4NnmdU7ORKfK/StrKMglprgw1
	VgrnKDpJKO7sqSg9Uf89UB4Xw+zGDhp27JuTw95LyVZJKIl0Ok5ZokEKrljVJ89tzq/FAInLuWY
	yty/riiWvHs
X-Received: by 2002:a05:7022:120a:b0:171:a066:938e with SMTP id a92af1059eb24-18512c384b3mr12193156c88.21.1792460246891;
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37626819c88.0.2026.10.19.18.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:37:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: watchdog: apple,wdt: Add t6041
 compatible
Message-ID: <1a720dcf-9f67-423d-b998-d0db73f82899@roeck-us.net>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>
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
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>

On Wed, Oct 14, 2026 at 08:56:08AM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t604x (M4 Pro/Max) SoCs is compatible with the
> M1-M4 SoCs. Add "apple,t6041-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
