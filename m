Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C4383320;
	Thu,  3 Sep 2026 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456017; cv=none; b=bc53D83pchjg6vpMaHg5WXZxL0FYsadrCBQjKt1gX52WhVgQNaBxryOhbxq+WEAR3/WnTeEmVk8VqqmmVIAIjQTXkSr52Gm9JsfMWcQT1AbbqxMsg8N05wKHrbtw80WLH4aNC/wwCJfnxLeHdV9FmgXZZgHDOrtTW2wU/l524Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456017; c=relaxed/simple;
	bh=KnKRTI/a1+A2r3fymKhS0OSqumvyBx8E5u4cidFU5AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ro6Nq5RVla8BP+rO6QwqJZvUfRgPxo1KhqlGIfokuVa6MOzCDRdqjfKwgQ2kwQHmXP13KZNMdCxoRDdaJU0MA8j+YhuJSyM1A4X01OUJVmcUQkiOTMDZ/L8GwoW0V9MRpnA6Klxwbfy28NIpCe6xfATXaTPDF0uT5ekKpUKWEdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZDyG0VY4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZDyG0VY4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=j5RnnRxAYofVrHjCxSWTXWkNMHFPj+3czVtEzY/wHPQ=; b=ZDyG0VY43vxC+xJdN6zJrbxJtb
	w2fBl0Drj3mU/+CFj8j1XEsd0Xc38Lgzd+8p6zjdhvYwLkVmwHqUb4C7HTCNCCAT/7qgcTFmwPgXW
	t99RXSWwjHZB3zwZjSUKF3UDOv8XYPWeIoSoiMJFleARv3Qy54OLHIiRMHqA2M5ug5WtchuRXLJAu
	oVhnS1nVxg9yNpT7AlAXM39Jjug1GQAfC55Gpgxfshok05/kcZ5QnIwGBNFPI5QILtSN8umsqYJnN
	40EjPablbCDCO3ZGh0hyKL/o3lHGWJiThhRih/1WVWFmZN7BZREck8yz1Tf1ZSBnPMnHl4awQtzqd
	OtcLsxAg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2B6j-00000000GVO-2LFa;
	Thu, 03 Sep 2026 17:20:13 +0000
Message-ID: <5d699c81-fba0-47ab-a2ab-f4f7dd1f73a2@infradead.org>
Date: Thu, 3 Sep 2026 10:20:13 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: gpio: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260903155345.733244-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260903155345.733244-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/3/26 8:53 AM, Manuel Ebner wrote:
> Balance parentheses.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/gpio/board.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
> index 4ac1e12cf..83b74843e 100644
> --- a/Documentation/driver-api/gpio/board.rst
> +++ b/Documentation/driver-api/gpio/board.rst
> @@ -55,7 +55,7 @@ looked up by the gpiod functions internally) used in the device tree. With above
>  
>  Internally, the GPIO subsystem prefixes the GPIO suffix ("gpios" or "gpio")
>  with the string passed in con_id to get the resulting string
> -(``snprintf(... "%s-%s", con_id, gpio_suffixes[]``).
> +(``snprintf(... "%s-%s", con_id, gpio_suffixes[])``).
>  
>  ACPI
>  ----

-- 
~Randy
