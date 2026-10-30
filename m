Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359496;
	b=TTAMTw1pCvzeKa1aviuKvf7xG6+RNDHRIwlIb49B6H8BYJslOAUe8qrs1Qd6zO1Sinp9
	 B8g5rvbX6iqU+jCfvPKHkTOrO1HsN6QFRwwL06i3m5MY1GL3Ax5Q08sQ+/qWO1mdTUN7O
	 9l75+pBLOs1l0Huo6pRDb4m9YgTFctSH2PaqeCMP14OTedh0sD9Na88HbIMJ63uRdmamE
	 woMfQfvL0E3MtGrA7FMuhZP3fmvz4nAc+VewIfz77pGZ/LYCooqQVt7TTIeQtjkQfTL6C
	 D6COu/Jn2ToYpYNIkbWqNkZDQYVUPvP4swS/xOCayyKDXSR9IO8N81jaU9K2NzHpJyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359496;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9PzY5mz6ds13WKfBrCOILrAu0H/XBjf4ap+3KvHd3ts=;
	b=e8p9mVmSpIEnkrrMY7IPulinyHrUFAE+3mHt915MDcabqE+mbSXXSD+2OZ+qH9ieFkIQ
	 wmSLtM5DKzKv9suQcC+MAOy61S2Z84aX8rtZ/UQa48WsjlRK676UIm2bY9EQv83L6tWe+
	 p1vTwXoUBET68qU7bHjOxZuxzDV+A2fdIbN6ZQ6/3sRQ5KAMxmVxavfJtH15a30pEOAET
	 dYi3BWQtP33UKJArvk6ACbSNTAzh5YaPqBB5GvDq7B2+XRVcQZEJpSYW6E8h5uIJuZ8Kw
	 yGY9OuWtSNKtSAXsENAQqGp0z8Ina/4uboh4qIHVNx76GJ0h1N5uJBltutG1geyOP3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5SnmHPI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D96606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 11:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5SnmHPI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7691F000C1;
	Fri, 30 Oct 2026 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359496;
	bh=9PzY5mz6ds13WKfBrCOILrAu0H/XBjf4ap+3KvHd3ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D5SnmHPIz+3LE9lNujXnpqEfRPGcOgTz87PCA3OI726oAOb1NqkN2v1jWqrx68W2h
	 MSI1R/FndyQVXuyk1MbgGAg5O0ylkYtAJnHjNDvGSfgWdnVR7FvzFVaOVnnmEHQCzl
	 VCpPIaMWg2Nqyk4kBaI1AL9UhATTfNJtctnbZbehPIF9yH5LuTgl5UCR0BPQ9DXT0y
	 WY2UDSJpqfLlLCuxZ7Pr4/beATM0soEsXzfwwUU+sunnseZAFIt2h8On+psmSvYFwY
	 qGdfV/Cm5/oIHddhjruqoVe/blupTdLPPAJVZ4XZkpiRV0VO8/6KVG1/UkO+UqrNSH
	 RaIpB7J2YctXA==
Date: Fri, 30 Oct 2026 12:24:52 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v3] build: honor default_library for the
 installed libraries
Message-ID: <z6uzdpsuwffjjlca5isgrznpxzlbmfgc5rryvw7keb37r5xogf@aiw7cjkayux6>
References: <20261024123124.3700266-1-yegorslists@googlemail.com>
 <20261030104631.1044556-1-yegorslists@gmail.com>
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
In-Reply-To: <20261030104631.1044556-1-yegorslists@gmail.com>

On Fri, Oct 30, 2026 at 11:46:31AM +0100, Yegor Yefremov wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib,
> libgpiodbus and libgpiosim) are built with both_libraries(), so the
> shared variant is always built, even with -Ddefault_library=static.
> When the toolchain or the environment requests a fully static link
> (e.g. LDFLAGS=-static, as done by Buildroot for static-only builds),
> linking the shared library then fails:
> 
>   FAILED: lib/libgpiod.so.3.1.2
>   [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
> 

This is a reply to a previous thead again. :(

Bart
