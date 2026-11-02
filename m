Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631332;
	b=KO1U9PFoNvhenbc6H078eegTJiLZ0fesz3jg4WZo5y7yRoM2ALv1h1fvbh4yBl6haS7a
	 Bf2XGhkymjUdHU/589pXWchPj9Gscg4ufpOt4dXBpPw09L8Be5nE7u8hXWzHulDH0uJVD
	 ifUb3xgH2WkHmiubXLol419nS4yJ5v8jGuykUaBHFWqz9UM522P+Py/LBDZVOJKUMTo8k
	 tggqpqJaASSwAKaP/dMEGPr05mZSwHOjyBJLFtsYL2C9irJvhmqs/b3OaTnHwsDXbmTVO
	 AOXGWtU6tpxvXvDC3lW+ee5m9spX6KdHZwgEdOIr8JMGz0vUfzoClJ1/vbYx1FwWAZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631332;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=heI/9Sdv9DP55tAOBIpE1yV9BQS049ybJ+Xgfo8fNy4=;
	b=A+O4PWzkqtAhJn5gx1+Mnd+4ldn8UqFqQAY+aFVKhqcb2ujtntMQ++qAKauBcVht9fGg
	 Pae3l3ptBF4l8ZC5GYa4VvOo3FFzkxFsASSM1PKPT8fvWxlIMbeRz9mHAyWHJFuLoHjAh
	 1CUZZ/qCMj6qUZbAzATIJ51JDGhvskawkswUttprBzuXWI4n78JPq8EJLYXx0ehilsqon
	 UtFYSqTg5cyIpAOiuqjvy1y7jjJtNcqGG2XVCUQ4iuD6eUKUF797iSOC+Ac/pIEfa2/VT
	 A1U+L8uozeUENcYTRE5bt9arsLIUPCfFZ6uUGn10jnZqCldyX0a1tdb0F/rOuf0hnWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSx9nHvF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90812606E030;
	Mon,  2 Nov 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSx9nHvF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557041F00A1A;
	Mon,  2 Nov 2026 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631332;
	bh=heI/9Sdv9DP55tAOBIpE1yV9BQS049ybJ+Xgfo8fNy4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XSx9nHvFQfngNju4DjkSqrS3ANJ0GDdI8vjOquvlsX0I/Y5lbvt4YaWQ2WZSvq+Jq
	 8cwloydf2MMB0f5Bd+1Bv/s4iSFIlE+8xUaViPZsrnTx3Kd7JIJWJdEdDcEG7eh8uQ
	 yitziUb4tMKsD2/2kGmQrrmnIFvPrDgb4YuLa2rk1ZLvSOmBrHXFl8O5J6k6cqSLGo
	 BeUzge4h5Zq+zjx0jJJAhRk7f4eWHQdvKglU1tUbK87qyfvGMPNWcxGl0FDtZDQRpj
	 dKE9l/8i+xEBkoE2R7fXnmuXPTjyldAEELAp6R4xMfElO2xTfUu7MdZUKzpoVnGzlt
	 n57uLFJuVbRKw==
Message-ID: <e8add933-e918-40c9-afa7-d66fd589bb9d@kernel.org>
Date: Mon, 2 Nov 2026 15:55:15 +0100
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
Subject: Re: [PATCH] arm64: defconfig: Enable PINCTRL_S32G2
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20261102141635.3768024-1-khristineandreea.barbulescu@oss.nxp.com>
 <2026110233-unlocked-outclass-9584@gregkh>
 <1cb65dfc-78a7-4cdb-bb39-c40b980b2504@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <1cb65dfc-78a7-4cdb-bb39-c40b980b2504@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/11/2026 15:49, Khristine Andreea Barbulescu wrote:
> On 11/2/2026 4:24 PM, Greg Kroah-Hartman wrote:
>> On Mon, Nov 02, 2026 at 03:16:35PM +0100, Khristine Andreea Barbulescu wrote:
>>> Enable the NXP S32G2 pin controller driver in the arm64 defconfig so it
>>> no longer requires a manual "make menuconfig" step. The symbol selects
>>> PINCTRL_S32CC, pulling in the common S32 pin controller support used
>>> across the S32G family.

Well, my standard request - why would we want it? You need to list the
upstream board(s) needing it. We do not develop defconfig for downstream.


Also, odd CC-list, really random.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

>>>
>>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
>>> ---
>>>  arch/arm64/configs/defconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index 7b4985b29b21..545a2b7db8a5 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -704,6 +704,7 @@ CONFIG_PINCTRL_BCM2712=y
>>>  CONFIG_PINCTRL_SKY1=y
>>>  CONFIG_PINCTRL_IMX_SCMI=y
>>>  CONFIG_PINCTRL_IMX91=y
>>> +CONFIG_PINCTRL_S32G2=y
>>
>> Why?  Shouldn't the normal platform-specific defconfig work for this
>> instead?  what defines the arm64 defconfig to require this now for all
>> arm74 platforms?
>>
>> thanks,
>>
>> greg k-h
> 
> Hello Greg,
> 
> ARCH_S32 is already enabled in the arm64 defconfig, but the supported
> S32G boards also depend on this pin controller for their pin muxing.
> Without it, some peripherals never finish probing, so a defconfig kernel
> cannot boot to rootfs on these boards.

Greg has valid point, you did not really address it. Explain why it
should be user-selectable choice in the first place.


Best regards,
Krzysztof
