Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585821;
	b=y601hawhtPsxM9zNuD+A5L/K5cgnZ5abxPwDSZ6kIqiasats5OFHeG4zbsYslP2sXiHW
	 mx5V1hsYGLK04MG1WCiHEzBZZvKaEoh/ozX361keBApDtnOHDpCNNnww5S19dUpZ/LnkV
	 3zcfoTOJA4dAJZTD+SVCypctTzxjRoXCOT96Sfc3o+86KcM8ltQWOg4aEiJ50OhHwZ+nc
	 fby75CWK4j67Et3Ade00fIZ53/LvYS020aBZtjzw/XHKEVsk1x74OnC/OrAyHEKv+vQBG
	 48itz6dONZD6FsUebTDaPGl/fmn6Ff73Hqr+KU3b+my1P4BDd3AkB7GlTD83jactsKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585821;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=aOb1JUFJeX8/Ty37TWLdjDq3uADcY0jWX+HnhA6S0I4=;
	b=Mt1tYIO6F2kTrXHS0UORucq5z+1iQk633RDPKC4pDzYZerSJCa7B71hnU8IB2oo9zNWz
	 LdGc8DgMJ31EkRUED0JhLJfiYku019h+GBNlWRHOBHhhWDIyQ9X3uxHocwl/nPrRfIL5R
	 YdrLGScZhxy2DXMbc9VTHXwsrz3TqT15GC1ufw19bOemkROWdCQOHxzMdv4WupqyFcbyz
	 jaL/LA+ARienKmDhb1NPqpgtzFgV7sxKdlyEJgyNZCUx0xtkHthSPYUPsrmQrO/5xEykW
	 +cHSABdTPSJ4xbFAUnVgTyqI39T7j9bOB2XHxH7qVgmiMaPsOjYri2fNCYj5gRil9Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mijJOCOH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9O5oFVTB;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B866D606A324;
	Wed, 21 Oct 2026 12:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B866D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mijJOCOH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9O5oFVTB
Date: Wed, 21 Oct 2026 14:30:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792585818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOb1JUFJeX8/Ty37TWLdjDq3uADcY0jWX+HnhA6S0I4=;
	b=mijJOCOHbtrXaTWwx+tEj5q5uYokpyqlI3Gw+9ZB6lBO9QsO7K4scpJnPKOJaoZTl9yMlG
	VmJjXRM0VzMJB+2VlAL8IWNwH/4jAax0cawPamDDI84J7Qip1u/EF1f23QV6Em81rOVV76
	td852EiW1hWjDEFGY26rp41G5QrC5kIbBcrQ0BrztUAw9Dgz8eV7kB3KhT5biKKfLu78XV
	TbH2OG0sWM+B7bcXoBgpSEtQC0yo5N+wuS2PJOwIQcV83gMpXwQED9jaSz6aaQeK1ncdCv
	TN3SRKtlNlElebmfuW+DEOz7T17XvE+WF9Oz5pzjl8RnfyMjc6ByxAf/bM0XaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792585818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOb1JUFJeX8/Ty37TWLdjDq3uADcY0jWX+HnhA6S0I4=;
	b=9O5oFVTBHnT4VQouTS1SQCJ9kNcXCwzboZSDnbeN0G9ZGOs8LZ3l48rsg7biG/0AmzQIig
	/CXOj7WMnUWJ1zAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: constify struct configfs_attribute
Message-ID: <20261021142956-225001d4-e081-4e06-9c9b-9916d146a104@linutronix.de>
References: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>

On Wed, Oct 21, 2026 at 02:24:29PM +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-virtuser const
> and use the new st_attrs_const field of struct config_item_type.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  drivers/gpio/gpio-virtuser.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

(...)
