Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA504A3F10;
	Thu, 15 Oct 2026 07:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048098; cv=none; b=W6/w91teQWYaARWMPkD+DCJtcBkjTQdxfpTAQweXCjpl0fX+Zpey2DVTx9E/7IEvT3sdgbuCtb0lEL0WtcDgxaL5mYe6MgO0penHnfnmt2sPcU6j+U0StlWO2zfLuUDL1pTHsScZVtHUpr1QnhaYnm0obe3j+ZRLIMfKKZXa+/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048098; c=relaxed/simple;
	bh=V7xLPt0z761xV7UQc+1KBUtoCxFh2IXPptNVmnOnvYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGdWBCmMJuNQICNTxOYWeC/djfNCuxIE93eQThkJjSkfKlyn71k545bQV2ZKSAlvKbSNK44PHv/eh7boI/RGIf4HnAaorOuwEcfsf2P1jwGW/UKq50J674ikpNMjsscAIrn1gPBqLO+VZc85zZ5OCC7CP68Ap0ZbppYgTYQy8b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=b2OFyXMm; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=b2OFyXMm; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="b2OFyXMm";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="b2OFyXMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1792047753; bh=V7xLPt0z761xV7UQc+1KBUtoCxFh2IXPptNVmnOnvYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b2OFyXMmVRbvWhnER25s9dGw8RpxgYcCClvCbRTbQuyTAZ8qoWQU+wmoScR0vNPIO
	 9/12rfww9LTSN9OO48sgMbP3MnISb1fYBCyZycVwJt0JXdcPFk+b8lfgYOPgcOSWyQ
	 akUu8l8aYjP6fQ0ZuoxBwfovCspzdEQClDOdvroQ5hsLV/nHNA0VfIKHaPbgqPIOW8
	 8sTB8ioF0KvlhEVXBPgQ3Q2ZDlMDBd6Q+OPc19PWL5UIP8Cf6IWY67Ri4nYBiMO1mh
	 GQvNinlYLVuwNFB84WgHA9MggSHA22JB0n/stJoWK5aI31ReEjewTb9fEFhSaQc8jR
	 8VeWm4RlOf2jA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 80113404DD3;
	Thu, 15 Oct 2026 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1792047753; bh=V7xLPt0z761xV7UQc+1KBUtoCxFh2IXPptNVmnOnvYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b2OFyXMmVRbvWhnER25s9dGw8RpxgYcCClvCbRTbQuyTAZ8qoWQU+wmoScR0vNPIO
	 9/12rfww9LTSN9OO48sgMbP3MnISb1fYBCyZycVwJt0JXdcPFk+b8lfgYOPgcOSWyQ
	 akUu8l8aYjP6fQ0ZuoxBwfovCspzdEQClDOdvroQ5hsLV/nHNA0VfIKHaPbgqPIOW8
	 8sTB8ioF0KvlhEVXBPgQ3Q2ZDlMDBd6Q+OPc19PWL5UIP8Cf6IWY67Ri4nYBiMO1mh
	 GQvNinlYLVuwNFB84WgHA9MggSHA22JB0n/stJoWK5aI31ReEjewTb9fEFhSaQc8jR
	 8VeWm4RlOf2jA==
Message-ID: <78abcf21-e5ff-4d5e-b1cb-d76bc1536892@mleia.com>
Date: Thu, 15 Oct 2026 10:02:32 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: lpc32xx: check devm_gpiochip_add_data() return
 value
To: Jayaraj Devaraj <jayarajdmit@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261014204331.15383-1-jayarajdmit@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20261014204331.15383-1-jayarajdmit@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20261015_070233_546195_8F2CF9D4 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message. 

On 10/14/26 23:43, Jayaraj Devaraj wrote:
> lpc32xx_gpio_probe() registers each gpio chip with
> devm_gpiochip_add_data() but ignores the return value. If registering
> a chip fails, probe still returns 0, so the driver binds with a chip
> missing and no error is reported.
> 
> Check the return value, print an error naming the failing chip and
> return the error code. Chips registered earlier in the loop are devm
> managed and are removed automatically on failure.
> 
> Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>

Thank you for the change!

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir
