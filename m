Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703777;
	b=X6+vEYmLzGW2D5YYRrd0h2ThPxDe5vOpZ+Sb3/Kzb8hHhYNV4c3Hu/5k3Xl6eChUNeWY
	 4vM9t4vbprMNDSGBlTICQJo0/g1Z3R0dr898DiO0WaPg7q3LWJasVg299pcMP6k1yLCpC
	 yqYH2n802RRZUF+O17bm+s6QzCEAcegpaJK5bwrZvZLFoiz2g5yMcqGpAJAkRxK23IHJ6
	 XCGpVZOH4DgDy07tiVyI0SRoH4N17guRV/ByW/r6RISHf/Rjp17fkNXmIUtzjyR6zdNbA
	 rr4+FmJn91lfEEG/jKVeBf2SUNY3uWllbJdHTyt3lR4gmErXFOwgsn3CPt/N38Wbj5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703777;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LdjOoiXeehWtbpp3joqWYH7KXdOYaDVysqdAR168riw=;
	b=TO9aMFwq93BA3noi3jp7p2bcalodqynuIeV/m2BSpUQZv9040/a9dE+pV9BuV7VrrkrT
	 aFQ2P+kbOoEXxy+vheBJM/RMW+KSYm68r0CQZGwxHqp8phiYZvjTeksQvOBmlNw9xjGgP
	 7amIJgEFRGu5E/pRK6PnIStIHhMWTYnls5OiT85fZlGIcLcBfSHcR0Ci0gVYyGM7rfill
	 tfRS5u6lBXr6DxomAoHL33Vd7SQ8nvv82A4AYOCvI6v0umh4YqhqxHZnV+2aMmV64PDK/
	 Y9qZMzDGbILihNMGrt+jqntP33toN69Ue6LnTEEbj/d0RooQtrYe/Kp9tx6jF91yq5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K6CJl2QJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA15A606A31E;
	Thu, 26 Nov 2026 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K6CJl2QJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7BD1F000EE;
	Thu, 26 Nov 2026 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795703777;
	bh=LdjOoiXeehWtbpp3joqWYH7KXdOYaDVysqdAR168riw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K6CJl2QJWsXD0j/+/kTfHBsoAwFXTr1lVPQFUZVBPQbLLgIpGYSi3snlKZV1ZJna4
	 p5eHKRD0NUw49acsmZzdYbnnk1POswRfjIOKX01S5UzI99EkuyvuDYEMM2HTHrhung
	 pnClODM9+W83DTjryc9V5cCd5Rju8v/D3b965ZG35iooRHEM5VL0GXSltYV0T8WyXP
	 znyxh9akajMrFengZTsJuyFdo+rDC2twMKXI6j3hfrG8tDkQOnxFe/xAl4uUV6/VRX
	 +ef1Kn12Wx4dYMyiDMg40ZleGGtphzU2YTQnFDHDgR6D/Ly7YJ3sO+avcYijhPMxtZ
	 3LA179I4jzP1w==
Message-ID: <36922492-3c87-4587-bf77-acff6ddb1a67@kernel.org>
Date: Thu, 26 Nov 2026 16:36:13 +0200
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
Subject: Re: [PATCH v2 03/10] drm/panel: novatek-nt36672e: Fix the reset GPIO
 polarity
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261126134508.320700-1-vz@kernel.org>
 <20261126134508.320700-4-vz@kernel.org> <sashiko-outbox-235656@kernel.org>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <sashiko-outbox-235656@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 15:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/panel: novatek-nt36672e: missing Fixes trailer for reset
>    GPIO polarity fix
> --
> 
> commit 9b3b20020b17a5e54e69c4e88df2960f428e2e60
> Author: Vladimir Zapolskiy <vz@kernel.org>
> 
>> drm/panel: novatek-nt36672e: Fix the reset GPIO polarity
>>
>> The RESET_N pin of NT36672E panels is an active low signal, however
>> the driver drives the reset GPIO with inverted logical values, thus
>> the reset GPIO has to be described as active high in device trees,
>> which contradicts the panel hardware as well as the panel-common.yaml
>> convention.
>>
>> Fix the driver to assert the reset GPIO to put the panel into reset,
>> and to deassert it to release the panel from reset along with adding
>> a gpiolib-of quirk, which enforces the active low polarity of the
>> NT36672E panel reset GPIO. With the quirk the reset signal levels
>> remain unchanged for dtbs, which describe the reset GPIO as active
>> high, and device trees, which describe it as active low, start to work.
>>
>> To: Linus Walleij <linusw@kernel.org>
>> To: Bartosz Golaszewski <brgl@kernel.org>
>> Cc: linux-gpio@vger.kernel.org
>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> 
> [Severity: Low]
> This fixes the inverted reset GPIO logical polarity from the initial driver
> commit.  Should this include:
> 
>    Fixes: ea4f9975625a ("drm/panel: Add support for Novatek NT36672E panel driver")
> 

It is a false positive report by the Sashiko bot, there is no runtime
problem to be fixed, and backport is not needed.

-- 
Best wishes,
Vladimir
