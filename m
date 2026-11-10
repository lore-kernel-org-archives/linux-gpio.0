Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323881;
	b=xZg2KAr84a5NtQhnlX8KEpxaJocOTZdAbk5TxDBdV04MvNeZ18L+h0P1ak1Mz9MId67x
	 LalB9NRLJuG43jGGgnbF0z8UIIJhhAKVq/zo+RSKTykU75hWQn2dQfrJmFg2ddifN6cyB
	 Fu+HIW2X6EAwuvT9swkC/BI4IPmctxvGAk+gyvNkREePl6ADXDnF/sIcxGkFHEAxODh8I
	 MO/GmXIq52a1xqjCVvuWBTJZxRCMrOPELr9crgrechpK+x60VrJ0vFkyhVe/oeQDXQts+
	 FB79HXDcLoJAr8M6kmEYthe96VVoq3Cg8u1GPWKDAinkhQkivxRw2CVDzh0NaiSKQRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323881;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tEcehQ20RMmoLwmx+Oyk7uA/7RIWoAQ724K8qPJ4RaQ=;
	b=kxkdSEAGePqGD1Twv+EGwkfP8i5NalGg4lVK9jX24B5I1PobfFsBQ40bnmxGNWDbNHuJ
	 +OsQS13p0LHBTuwsvHywWK6719RkOqPoE4rCBg0kLNdQkfb7/8mK3K2acbR7pxFCsNwUY
	 iALeoNPzEDTrLJB8diT6FQ4MFVPL8ru2oYZSt/4fMpiRa5gBaQvszKMzv1VkYhj4Wq9TL
	 y6kUn6CuqWQHpsQ+G+aCAonyJ1LWif2V/UvD/NFQCwfeG6b7svuu/YLjr9NM3fqabmGAL
	 64wfMpqUfF4Iaz6NdmRJpWh2oEqMqcL7E01hFM0dgcv41zHndBEMiO7KHyv3jWEjk2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cc4xPzMH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8907D606A31C;
	Tue, 10 Nov 2026 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cc4xPzMH
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3C4AF1F0089F;
	Tue, 10 Nov 2026 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794323881;
	bh=tEcehQ20RMmoLwmx+Oyk7uA/7RIWoAQ724K8qPJ4RaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cc4xPzMHDGwlQSg7wnWQZ2OVgKUZMG9937fiKJyazcqbzJxEpRvYVa2QNnqaR1+sj
	 yriyevP+HVYB9+hkUoLAEVtS5+yj5AnHVehXwaIsYijBrxTNfthzmiillulCJxgqPx
	 cGJiuL5PMfsuw0ys2psit77yg/WEtQ04LMUqfyTWNSs7gZ55PWs/rs3V3k9uV5+MSV
	 3/MJ7dc7t58Z10YMyKoFObnLXbxGKCOpDCdPi5aeaT+xyiJXZUKCTWmj/UxmI58bOw
	 TtpfJSTPYtZ2xDNsZoP4f4K+DI9HUqH7TbVY49Eg2a/CE7rwq8ZDlWvp1JkSxCXLeS
	 F1X0a9c2iBcew==
Date: Tue, 10 Nov 2026 16:17:57 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: linusw@kernel.org, jelonek.jonas@gmail.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: line-mux: fix unsigned truncation of property
 count error
Message-ID: <wnumtnn447ikxwfjsfnflbxmx77qmskteldxstubbjsnihjg4h@q4enjdzeyaki>
References: <20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn>
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
In-Reply-To: <20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn>

On Tue, Nov 10, 2026 at 10:57:42PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> device_property_count_u32() returns an int and reports errors with a
> negative errno (e.g. -EINVAL when the "gpio-line-mux-states" property is
> missing).  Storing that into an unsigned int turns -EINVAL into a huge
> value, so the "if (!ngpio)" guard never triggers and struct_size() then
> computes a huge size.  The allocation fails with -ENOMEM, hiding the
> real error; struct_size() saturates on overflow, so this is not an
> undersized allocation on 32-bit builds either.
> 
> Use a signed int for the count, propagate the property-array error, and
> reject a zero count.
> 
> Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
> This patch supersedes 5/5 of the v1 series; 1/5 has been withdrawn and
> 2/5-4/5 are unchanged.
>

When sending a new version of a series, you must include all patches, even if
some of them didn't change. You can't expect maintainers to comb through
lore.kernel.org in search of all the pieces.

Please resend it as a complete series.

Bartosz
