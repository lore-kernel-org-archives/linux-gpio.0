Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892233;
	b=CjLx/Xk/Th2Zb93gpvN0c+My+zvdCXdPAEE6dIbGE1B2vURkgDaE96BNHZP+OA6fGbXu
	 PxibT+sFRpDTqcxlNb1cPXsXfG1rYCJfTKi/5NgwMKhDiLNgScSpmXcqTbxEGJhqYHsZA
	 s+ks3BDtOXBrLy1vuOMHL79UssyBv5rzlwpNGJPNNl0/pPp2kElEh5PgkxyoLQV1WLsgK
	 awug/eV4fzCUgn8G9Sqw/6NcLI2yr/+tWiZgORPpQ2l0YQjq9WC3Oa4Ojn7Vg8mXwSlOK
	 DubgcYNMvRQEHRX/vgQHqFLVVg1to2sqdVYmG6bV+SbRJJkTbXnzNK1ByxHAVUow3Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TIi30UMnkbCM4UtGXQM9HLD1fy4eaWCJLQHah5nV8Gg=;
	b=qnNDXjx87FEbcblf1jBMmJhtZ/zmnnjO+4DlZ4kBXfILCovOZWXhCGnqP8QCPb/7tum8
	 sVf3sSbBaUFf0T56mgKdFSi5hTkA6oAe0Ro1DBSUHzwGjjh9KWFQoYg5DxsDd4nZaPvhJ
	 DCuSF8Y8wR8onMQLG1pBuYn8KQdaKxfqGKomzzQM2oEYQUJ62T3kkfP7MNq2owdkp0nMU
	 xZlJ9r0OgnEeqLOITWUttzmojGIb1gCU5BM40BBlLy+4yiMDMdh2TFe/t8TD/MzuC+mOr
	 CMjj4wVz/S8mqcpXOOQeQw9XV4vBHrosEMBy87cKSpYpbRDfQO/AG39erg1sfKKT/8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=np1YlEKo;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EAE606A329
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 05:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1EAE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=np1YlEKo
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so535091c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 21:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794892232; x=1795497032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TIi30UMnkbCM4UtGXQM9HLD1fy4eaWCJLQHah5nV8Gg=;
        b=np1YlEKoqz11tuK/UlAujFNKf0kDw59jGJP6oEJ1lgXt37/I7ZqS4ZyK70VQkMDfDB
         uZn+fAk+F4J4RGlvTRV6kNa7HkxJZSUhj7gIrUpZ3Pzg4+n14GhtUwAOiWukL3fuVyZ0
         7Mw5l03qET0/oxnAhh3eU8XHYRxC3mFlcw58hIlA0OXtk8Wt5C69cDtaVf6Rur9RpeOG
         dRlILS7/NTXsfuueFi1Sov2EVw0PTdK52fNvrGFVwjLz6X1+/mi8V1RuspEoZSiewRNE
         Xc8sQ8K5TcloAI37Thtl4Z9m62fHcdYM0UWzbXLZuz21n6FSuL7OeLKVuhAu3wLxttSD
         hzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892232; x=1795497032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIi30UMnkbCM4UtGXQM9HLD1fy4eaWCJLQHah5nV8Gg=;
        b=K4R6cb6GCFWy2FY91Iey5lfrTZuZKXiM1a6CWS/rUZj0d/HY3YlNaUQmmdLT2JLrrU
         x17+EAd/dUT2uZkrpZVg/f9CHQcLokqFLAnti441RxUFk0UwzshEtjHhJmJNgZAwkiep
         YpTlocqqBJlu7coVursiVv/1jcLu2Q5gCVTpGO8l8Mlb1HEonmFNt6drADfglpIWujL2
         Xv0qyPZniEUVzKqF79BqMumODCmRIQQpdQrQnjwp0i8zZkNepeCLGsNKDAoW3CzE5m0c
         1PcrGJhsXFnkawWgnakDwJfXkx04SS3SV9w5/63Fd/MyoyRinXv6pVBEU+9U7DNzBaCZ
         ZJFA==
X-Forwarded-Encrypted: i=1; AL+hErFdCsYHePwBu62HFnfKvtsUlmqv+4b77BoHA6kwYs2c5k6KDkLUrIERYqGyu3LamhsqKhYgHRheTPTr@vger.kernel.org
X-Gm-Message-State: APuU4Z9I4ROVgvIs2ONKetUe80lUND4eMj0pUY0aQJ0S4t5exID1IjcR
	fIWOJ/h8X42OldOrFwBHlHYLvvFKElp8CWxAGjD7xBsIjmHtPeFTP9tST87Q9jGk5sI=
X-Gm-Gg: AYBFou0GMlUcBCLRf7JAiko8J8EfFET/IobjYqBVGi/adYbsYV8hmdIhFBqzRvy+9Ex
	TMYkzoDtScnhLPPKw+EdREG1OLmzfZO3+aY1YBNyt+NrMl0KSDtJ/cuW81GeaE6klDKcsU5esQR
	coHNuvfJR99OACwuUPPfRyhvc3CbzB1N+wfj3Edp8Mlz5phtqrp//sfkCdW9+qZ+TjeRUmia14r
	ug6aZ6Dr+bNvYmfm+Uc55qsIrK6SngwI7ByX+hAm8vPgES4LPNA90+5k31rhTAd8wYUCjpZqyAF
	emn2b0WHP9JveAS4xr229Q48nJxb9ObgnTRiudyN7aaDC0B/p4mgI0o3CpdOo0k8QoxPvBhKCcn
	FdrJSTNRTiRBmlX21ddncVnkerk/0/L8qwZj+m8eSjui+IXhh368/uHsRmV/bc7GUaUVDbINj5n
	EXqZnqGCRf9G4hLUtcH7oFdSTeSZbuhgV34R3Gq998GrC+8+wOnZ6jkEsl6qOXpTU4MQOFuJiVl
	tlUd8EXDZBIBQvVY9skO2C5NnuX1yu0fFzqHoAsSDQtG+xmovUekvYUbbQwjsCBiM6sv1vwT5Nk
	zj8TgTpw4WhSgp9cB9xQWTc64/a+kgE=
X-Received: by 2002:a05:701b:251b:b0:144:f089:b189 with SMTP id a92af1059eb24-1b50319ce4bmr12633287c88.36.1794892231696;
        Mon, 16 Nov 2026 21:10:31 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm38745543eec.26.2026.11.16.21.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:10:30 -0800 (PST)
Date: Tue, 17 Nov 2026 10:40:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: virtio: compute the line names size in a size_t
Message-ID: <avvhxNXQ3fI73QgD@vireshk-B250M-D3H>
References: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
 <20261104195632.1702765-2-lian@is.s.u-tokyo.ac.jp>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104195632.1702765-2-lian@is.s.u-tokyo.ac.jp>

On 05-11-26, 04:56, Lianjie Wang wrote:
> virtio_gpio_get_names() computes the size of the GET_LINE_NAMES response
> as sizeof(*res) + gpio_names_size in an int, where gpio_names_size is a
> u32 from the config space. A gpio_names_size of 0xffffffff makes the
> size 0, devm_kzalloc() returns ZERO_SIZE_PTR, and reading the status
> byte of the response through it oopses:
> 
>   Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
>   KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
>   RIP: 0010:_virtio_gpio_req+0x2b8/0x550
>   Call Trace:
>    virtio_gpio_probe+0xc2a/0xfc0
>    virtio_dev_probe+0xa7a/0xc50
> 
> Compute the size with struct_size() into a size_t.
> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
> ---
>  drivers/gpio/gpio-virtio.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index 32326d91f33d6..fb7b40eff37dd 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -494,12 +494,13 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
>  	struct device *dev = &vgpio->vdev->dev;
>  	u8 *gpio_names, *str;
>  	const char **names;
> -	int i, ret, len;
> +	size_t len;
> +	int i, ret;
>  
>  	if (!gpio_names_size)
>  		return NULL;
>  
> -	len = sizeof(*res) + gpio_names_size;
> +	len = struct_size(res, value, gpio_names_size);
>  	res = devm_kzalloc(dev, len, GFP_KERNEL);
>  	if (!res)
>  		return NULL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
