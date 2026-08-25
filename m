Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ADF35F609;
	Wed, 26 Aug 2026 05:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787722047; cv=none; b=cKCVtIiMFMU38nTFCMTWxGXFUhFGTdhA2Bb3ibQNQ9voYw9RZz1N4H8D0OGFyC0LuMxM1+mVE+oTDya9nNAfyrB1iKCrdMc68R7+7uOUpcC6Gm93kcDOfngQ88mGU2Xf12LMCTx6aV7pwDwzBy2x538UCH1zJ82yvkgayeo4G0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787722047; c=relaxed/simple;
	bh=WJYe3fcvnPj8mlbDSiekeARq+Yxc3zMQ0nDzxey+cH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q49mOARV3fiSnkgAH5d1iPTlBMmPkGjnXI9CJU+Hr0TVNvC0nQ2acF/lPtx2GIfASNJUH9zaKh0gUqJ3c9y8HsEcj2bRa1l75RQ4gr9WgWs5seyaM+wIIAKqVToJvJrIUkl4vhNMY/JqJC2Pk81Q1hMyiyJ5HzRnxtTCREyWaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=efMitylb; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="efMitylb"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C4DA11CDA2;
	Wed, 26 Aug 2026 07:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787722040;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ftjlZDo0T0Z4fcmLNLTufmVcV/26FzcK6vmTiuMBmsM=;
	b=efMitylbiltwT0Qkba2AmQMx5xcY5osyQYUlv6tiJvyDt8wV3CjzMd3etIYIEguXnMvjVE
	nbVJH1Z63lIavQFYsQl/Lf8rnkVpAwA4MZoo4VqxjAOaK+Am2uLQltpS5Oz4WRAV4NCs5V
	IU7/g7W/fTsKlcxyvebq/zHj1ETUoo3oq8rbVBQ+6rVFTUHWY2Sm4gOdXzV16yGFAfzyq+
	96GzjICceKhJcCgHTj0P/7JVWVCPiXRPDSTA+GldnlojZ8UcMenGwaxVmVa/l+zakVFewe
	UW2vYBFKfS55BU1kwdeSjCPFDY6ShFHwrvDGLvSza/CWNgoZkhm5pQhZcnNPfQ==
Message-ID: <d20ef29a-c27b-484f-98ba-77c85ec2b587@nabladev.com>
Date: Tue, 25 Aug 2026 19:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] arm64: dts: st: Add support for DH electronics
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
To: linux-arm-kernel@lists.infradead.org,
 Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Alexandre,

On 7/11/26 10:59 PM, Marek Vasut wrote:
> This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
> STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
> Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
> on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
> STM32MP23xx SoC.
> 
> The SoM contains the following peripherals:
> - STPMIC (power delivery)
> - 4GiB LPDDR4 memory
> - eMMC and SDIO WiFi module
Have you had a chance to look at this series ?
