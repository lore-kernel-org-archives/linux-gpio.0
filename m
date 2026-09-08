Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801648E0CE;
	Tue,  8 Sep 2026 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896635; cv=none; b=TgYKG53ezT4kt0DxsTNBn7PA0BgrlnYOtiKCoPbTKKYeS5FzLYeXAL/quKMaV57QUkqDNIdhBBoveXiWlMkmKnG/CPE2dNxM1LwqDEWjYeIT5tHRq/WxJ05y9D8X7xBV7l2XYRPl8i+N8sAcVCJRq2f6smUoDvLGH40D6luu67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896635; c=relaxed/simple;
	bh=H3s2pNS68dE4ODa/jgKCyihtM5QsbUQNcNLq0fMzT1Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fm5Sw906saCizesvCKIW8dw7E0OLljXm5AY4FYSph5z3fOoeA44CAIFagTz4ZJd9dLmNqb7KUXMs2YU2XEFCqQ+Nr4RVpvsR81ndSBAbmDDfvUxUC//IO/2YEx3AYMbEvOsNkozkj8D0t5+o4wl4VXUT+g6HkzKhnzlEJCOVHmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=iLstf5vl; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="iLstf5vl"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 655C71018AA;
	Tue, 08 Sep 2026 21:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788896625;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jxI79bcrUCAFJsDq8avkEkefGVZa5/cLpguSSOm81mo=;
	b=iLstf5vl2QHgwbl1SXbP3HTDvslti1e7t5hkcQWzdBS4xk2nUtTGvzVYbXTGH3Fbn/ju9f
	6gJkZy5jDK6IGDf1EB4TW3wTO8qW8OKSerkNZAUVHDvbdyZEuTb4r/jbMALuJftfMSlAOY
	aE5CVG8WIoB7rQ+wWz9H0XLL4mEWSkdeciLqpjPVJA7dciw/H7s3DUtiaHgNBdZzAhxJ0d
	lY2wHTiHMnYJ3m/gNw1DnmpmNTre2jgTvs/s9/JX5kUtFjmpcRm0H5PFubT2nLA4acPF8E
	8NKRjRwY4DNzDajnIZSxOGtdqpftugjBRra/yFMOMAkFRJaWaFcqZm03/O75Fg==
Message-ID: <4980c91a-fa3e-4508-b929-a4b1af1ead41@nabladev.com>
Date: Tue, 8 Sep 2026 21:43:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] arm64: dts: st: Add support for DH electronics
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org,
 Alexandre TORGUE <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
 <d20ef29a-c27b-484f-98ba-77c85ec2b587@nabladev.com>
Content-Language: en-US
In-Reply-To: <d20ef29a-c27b-484f-98ba-77c85ec2b587@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello one more time,

On 8/25/26 7:56 PM, Marek Vasut wrote:
> Hello Alexandre,
> 
> On 7/11/26 10:59 PM, Marek Vasut wrote:
>> This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
>> STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
>> Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
>> on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
>> STM32MP23xx SoC.
>>
>> The SoM contains the following peripherals:
>> - STPMIC (power delivery)
>> - 4GiB LPDDR4 memory
>> - eMMC and SDIO WiFi module
> Have you had a chance to look at this series ?

I would like to be sure this series does not slip through the cracks.

Thank you for your help !

-- 
Best regards,
Marek Vasut
