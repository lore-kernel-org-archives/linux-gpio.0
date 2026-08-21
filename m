Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFF3750D7
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328228; cv=none; b=hP+4aAY0WUwGWNL8s0ey0KJaHydQAoXCzF/hKl0Ikq2/Z+sINv6BEfnuKgY7sIFgzATQWNxHJ86chsMU9d+6XeQFDst/X2KOindcrjhkJctZ1vQjUFrY+5AoXeAXUFTGb/bH1340vUf7T6TzVCmSxkYkM6PXB1DV0APt10Jk46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328228; c=relaxed/simple;
	bh=Vy2ZJZNGMyLbLm8dFlgEUCw1Cwow/lz5sQ+qvQJvgcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMfUShT91mM0tVsTLXoEqTrr8V+n20XouTGpSvXH+AFxG/lhVbXE776qwcNcZIhQQW3HMY9I0tE5iSNBTJWSMCPD4zoxTYwRxd6Hxl7Mp8ViVmfPHYfNuEZgnxntQcwevNn3RVrY1/tDBQGAcqn5VF+MHBu8fGSiQHD8iC5NkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OJ7OmMj+; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OJ7OmMj+"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-836c8bdac50so17605277b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 09:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787328226; x=1787933026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckvBWrFSwcLwwa+ubcnnacuUkv4EVV++6zpuDA54lvA=;
        b=OJ7OmMj+EAbSu0oTl47nKYBVpapK9/AWe/U1/QD84QD2sWRiKCL+hm6dBPrdGSg7bX
         H+6W/i3bQuq9/om83syVlmGVDRiPTw1yX3SB4p65mPtayK1CILJ/KwRy0PTiItDoxgR1
         F7rr/IkXfr7sPYLC0kEgFcjWhpJL0W4eBL3Jq1fH1gsN4X/hy23BN9vBm+iBT034rEj9
         pR5iRY7ladre+ZWrvYxcv0c1QPSXVMC94A8rkmEU7tnsfKYGZiZBjHVVdsZCxXJ/mRpO
         +gPi2T4ILRU6RtFMvOV43uoESnBV/XHeGVNXcTN0rMvwdq4eiBt0x4Igj+ZZV7nMLrrl
         zwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328226; x=1787933026;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckvBWrFSwcLwwa+ubcnnacuUkv4EVV++6zpuDA54lvA=;
        b=KnO7NZlUXO6ScjJNi3UlCHjjluxKN9OC0ZBR6cM/43xbZKyDh+MSGVLymAbD9cTqLu
         tAMF2VidumZ/cZiwo14zUU8tOFMnjHbfAqC0XRJ/NWivLGpyM4tuVm/jdllCcc8zt3xy
         JF+j/Sm+6A8K8aQEjQdk75g7GWNffafywDM2jvinS1S7ft03UZnH6vMXayk+sedOPhBX
         Ui9gFuKgtg1OyPTQkDTqptNqCihTGJIUIU4rpapkbeqVvZHPl+erMtkaIVIPU6TlP5Rj
         hJkOjXCPvkzbsJ1jr50dUE2rQG/m+8D4UPD2Hvc79wB9QNbbe9SRcRIeuFEbhsh3NkOE
         w3jg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5AMQERBhud93Fv7D8fMtjZz3pvk5qlII2Kh6sn0kCDajKJc4RRo9aEDzjgYpKEAu6WnmChk3ffVFV@vger.kernel.org
X-Gm-Message-State: AFuF++lK1fem14LPJ7SuHpk/+mq4JSlL9lb8iygtA00376xcURxEWztH
	sl3oJzB/lSC3NsOaodQ8OzRxuFFqbf4kJtvQ/q6aZjmcH/XNoeJdaR1pwuLRj52p6xg=
X-Gm-Gg: AR+sD12+3gnbobDZ3+LdQT98GZri7gTNeZLUlnN0q6fVGFpFivnbHXTAqE6jO5K0CKm
	8kTn9g76YtXqSjgM0dpa3CLucJ5aOBOTqykRcLoOvHXQEvWZgUDISFbNxPFIzkf2nL+UZFbm5+G
	Ztz/6rPiSjfyxtsIm6pKDO+0Bdy/tbakvIkHMdP6yw36kbi4pYLodaFpvOWFKDYRBo3yjG3Oofq
	t7Ke2HhgnU+FSvFTkoRyUKqnL7r3IIdg+wboX/WR042s0pz4ySexN/hMwOuv2BgXKcnJnRKs+iL
	HXj8vgHSj3wYJ0xRbrfx3BubtTBQ+yuU7xoxgvla0bwmP17XVCltIge0pnftOXDONzsvDuHvCCJ
	6RSwWmuIItrf0uVxHOi3s6l0bdQo5Qw+IVn6wT52Q7TNO85AJWa1rgGWUIH5rULUj5tqEDB9H0t
	zfbbTop/ugq6MFhNCw+SJnzH4XDDeULc63nMIh3QrYm6hKIdK4LCwEJkEtBZDJAP0f+YWVPqYhN
	fARQbmspNqg45H502ZSdr3mS5TsPgbZhLUC1/ay+Q==
X-Received: by 2002:a05:690c:b96:b0:806:b6ab:a410 with SMTP id 00721157ae682-849ea4fa374mr34419257b3.0.1787328225648;
        Fri, 21 Aug 2026 09:03:45 -0700 (PDT)
Received: from [192.168.1.169] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845195560e1sm44559037b3.46.2026.08.21.09.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:03:45 -0700 (PDT)
Message-ID: <699419a2-31ab-4379-b11f-c77e9e6a750c@baylibre.com>
Date: Fri, 21 Aug 2026 11:03:43 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] iio: adc: adi-axi-adc: Add support for CRC
To: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com>
 <20260821-ad7768-driver-v4-4-bb8fbd06d4eb@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20260821-ad7768-driver-v4-4-bb8fbd06d4eb@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/21/26 9:06 AM, Janani Sunil wrote:
> Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> processing in the AXI ADC backend. CRC provides data integrity verification
> for high-speed ADC data streams, ensuring reliable data transfer between
> the ADC frontend and backend processing systems.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

