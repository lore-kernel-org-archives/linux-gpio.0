Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245594ADDBF
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872371; cv=none; b=HX9jR9rVhkI6L/iMndmFWtrY1BGOQXBNsVTR8iWtAawrAwXdBdTC8jyd7vhqVkjg2GKLpCVlhhfu4LT4H4BJwF1PoKRXSRPjkFQoOJ5F6aVH6NhCL7mO6oBm3QbWEfA21sMnSOLPtoK3buiPRp+0fkbkk7dCNffVmLGXHLfDG74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872371; c=relaxed/simple;
	bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kzYaXlyTK+7FH7kbovzWzCASudaezsK/HLzV9ESbs0/YAOIyR1/h6fVbr+gDFLfW6Dr5IlnG4ld2gpdnx5trcsnN3jfkfcdndVis36zqqdTDQNphOMq7y0WpHy3n+29u0Y29w0mCQJW0x51juXD6wPqUEp+vBXUbiqubs59w6gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbL1xaE0; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbL1xaE0"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a9787a156eso19906641fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 23:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791872368; x=1792477168; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=;
        b=PbL1xaE04in7+jpadT5vv4XsPrLGsmHW6kyB9iz8PQDwf96/u/DXaJWdu29dYTlyF9
         NZbLX1dKT/x+8Ytz2pqiGgvgqgwgCjixA8l5nH765g1+LagEKlPswnlv6StrY7Okqa+3
         NJAUXZQLIVTuv1GFoyna/hDWRx8mfzCxU+C+OPWXAgO/W+ISSuKJ1eOSc6EakQKRiavk
         uL3BfSp/AzfObP+6GSbocPEpuf6l1KSCz33IM58WLFKlx6ZFBGB51xtyi6wO/N1BSKJK
         eH+agbfLM4OkLSHIkdWK2LX/WkeQX6Ap4C3ThmkylXIdRmc8ZkmiXpR0of9tyyCYmLgs
         IFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872368; x=1792477168;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=;
        b=X9tepeJLPF+VSdp8GyMHmzD2149TeS2xWW2hLWU1ZIGso/y3pWWte+8nVFWLrKB5fv
         ZFwjHFJ6Auj2FmGgWgZ/DAi1iGfpavIyulyUVd531bYGdnimEOVkyLLpYrFYT+Z647yO
         PF9rlqIgm3u0irx6ym6O3BM2xIzpAXYN3RrzlKErz0yjM9cSaymaaF884dZQ+GLiuXG3
         hJEFIPtiKJq6V4/wd//0u0De8NeCBPyMufNgxK8JNyRbvLzoW+TIdksjHkII35gL2Mj/
         zXIuDsFaUIMdQNKCUvC8+FmzXIwuLtlbneHIbMvBMewLLNrJPQxY7v0gPeJ2ZNF/EKnn
         t7Hw==
X-Forwarded-Encrypted: i=1; AKwUvBxZbTpMQGkPqbA+dPsY+HyT6BvVtfgq2uwzw99ynBcZpyRIl3gW4cUekOh2RyPeXdrdbXmBDEdTpnj4@vger.kernel.org
X-Gm-Message-State: AFq9FYIrYoLBYxEuTEnSpkmSuNxVIHoXuVLOQiSevRDb02wRttAs22/g
	tVJ3Oaey0e3DCBTsDltLelrCnPDcK4Wgia9pjXH9OTzlvlQUk04nvw08
X-Gm-Gg: AYBFou3DZxAOH2H+v8i/703atJAZ+9wrNHLmt1BbRw7dfk3pueptiQnurOzHvP7cdcJ
	v+WAxp20l7zbB8rjCaX2Ab9x+xdlNEv8aV6sddthhW/AgiskD9Uog9Ppn7vAYuZLnB3nUnZiBfp
	C70FOcvo3gAGq2732CJxx6Me6iiiVjuHo375dceKfSjhZoUgC+r2IhU3Fu/I0uyMFTQjXOM30Yz
	nq3kQet3BnpZAiMkP6K88idlvt5q8QN2ywmwwheFIhKYs07WWDvIbvReDqmsANeDd+fe8aCQ4EY
	5UVc4qWKGb0giITHwkwCtQP66lmijDI4RTa82wudi+Am0gwSS3zlgh9L4DnJq+K3rI9NQG6XZfk
	CKlIr/4vqk22lsgxrKPdtvvdjZ39THyi6NrTskdHgaTSrxxdbpngTyqCD6rQBbEv9RV4qE2eW2F
	wp6gVSMECgLvH2OGhupYOxnktVH1RR/iIuy/ds3GQXAB6uom0+qTx59tkFifPCEZqatNUviwIDS
	F8Dz3zjMEEkPywNsZaHHzDpyWyll4X/bTu/e8ypk5ksQEAMmse5h7gVug==
X-Received: by 2002:a05:651c:211b:b0:3a9:7425:7c33 with SMTP id 38308e7fff4ca-3a9c570c4a9mr29246931fa.28.1791872368005;
        Mon, 12 Oct 2026 23:19:28 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9bff8sm33912331fa.7.2026.10.12.23.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:19:27 -0700 (PDT)
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
Subject: Re: [PATCH v2 10/11] ARM: multi_v7_defconfig: Enable Cortina Systems
 CS75xx GPIO, I2C and TWD watchdog
In-Reply-To: <abe6e89f-2379-4928-a77e-0baee12b23e4@kernel.org>
References: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
 <20261013-b4-cs75xx-s2-v2-10-94f8c0a90cda@gmail.com>
 <abe6e89f-2379-4928-a77e-0baee12b23e4@kernel.org>
Date: Tue, 13 Oct 2026 09:19:25 +0300
Message-ID: <179187236528.3113952.1605165361017352112@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On 13/10/2026 08:13, Krzysztof Kozlowski wrote:
> On 13/10/2026 05:47, Fil Dunsky via B4 Relay wrote:
>> +CONFIG_I2C_CS75XX=y
>
> This should be module.
>
[...]
>> +CONFIG_GPIO_CS75XX=y
>
> This as well.

Will do, both become =m in the next version.

Thanks,
Fil

