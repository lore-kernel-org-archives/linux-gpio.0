Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706427;
	b=jxx8tHOGbMRZHnvqajVPT0VPsmkIYz6Asp21akgu7xdpaJGIey8Eh+1hSKhHxu5hWTg/
	 4UxHdCdFMnAmJIgK95nYpE24m0DdZAOetYOYeZI/sH/M2CECfYrDObk5gGK+jH0sYge8F
	 DropI4Y5k63xin+M3g0XZwOaYbJUNMvNDTp6Pz0uKyYJVKiIbtggXGf9P0z4RZwja19rs
	 q3eFt4Dfc/x/bs5xBhPOxcu2D5yGWI8XuQnIANdjEmevzYztLw7CqW4c+nqHyiX4pOaoA
	 vE2xLDLgB0Ii1ON87vTPMArRgu6q/vx3x5Z11ZesvVvneJo8zlUmtHNIWO4H17+3fvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706427;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oyJaOsgyVg7i7yxpvVvv++9mxwF1nRekeAVvZqUnvdY=;
	b=Jxbj1kSoxddtQZ8Q3aINm9SAFJtG7cYnvUrwN8F5qsVkW+0opyN44cDGog+Sjs/3o+H0
	 44DffxC03t/szv5Bt8FzUYTLYwYBNu1EGTADxri7ad3KYKu8bWgVKn0ySfD4GeeA9P40h
	 /VE2Kj3ivbD2wO/96Ornc1smpGiblcfLSQkcAbs1g5V1dAMO9U16KvELBq3cEWTRok//i
	 /aI6Ygp8mgceCKOTiLKEvFH+b9oQ9S38RcGjmNHQVZ8Ae6EQPnuabGkaQnpprPqNa8XF5
	 IjLti05F/AWL/R2lW92mtiI9dOpArV1EdtAo7T/3NlpBLaSFc+BirBKTYGZpFCVg51w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLGOiZwJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF82606A326;
	Tue,  3 Nov 2026 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLGOiZwJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA531F000C1;
	Tue,  3 Nov 2026 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706426;
	bh=oyJaOsgyVg7i7yxpvVvv++9mxwF1nRekeAVvZqUnvdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fLGOiZwJtsEitAbzUlKFcW5d9p7XkcaPwIxaI3jXZAAG7Fdh6jLMYwRVNfWbfjkSO
	 5HWjNfrN495p1IEvlw5iXNsjfkVexPbHeC6diREKCVqL5nIT97WFhpdB2ATv+JSJbN
	 CM84WjJeHHpSRvq569RAhulh7iHiLdVT+yBz6NtpLWkXtANRKIsVIOzqaB3cBMIuYS
	 RRFLDq92c++Kje+nSPx4pd8Dr7kkbbxo4ge15MSqGTV3wLH8RIFm2kzwPFT2o9UJ9L
	 VEceCvgQzL4+NQHSjqJtRaV+UUD47eMKlhXJSFoRN7ejpCqubU2MxAVQbTmlmsPswi
	 fDmef2zvh7YvA==
Date: Tue, 3 Nov 2026 12:47:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Agner <stefan@agner.ch>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 06/11] MAINTAINERS: Update i.MX GPIO entry
Message-ID: <20261103-essential-uber-snail-ff3be7@quoll>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
 <20261103-gpio-vf610-fixes-v2-6-7c71fb36e184@nxp.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-gpio-vf610-fixes-v2-6-7c71fb36e184@nxp.com>

On Tue, Nov 03, 2026 at 07:44:10AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Update i.MX GPIO entry to include VF610 GPIO driver and dt-binding.

Here and in subject - pointless "Update". Everything is update. If
people were using such syntax, then entire `git log --oneline` would be
useful.


Best regards,
Krzysztof

