Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785981;
	b=nWeJLyQnTeIyNLu5exb5Vq6hFKsk4xxn6E2UeLLlhOklCHvDFMJwHH2YuQwfFQ8l+qyx
	 q6eZeFamWfdb7BGyfrKIk+cJnJJ7Ff9wMwSdHOMo590/rF63QoprsXzL105/U2WpyhYX3
	 lGxfaN+XUd7n8+3OXvjjsHkAzUG/iBQks2qjrxXqTPHgIAg95coWh1TDKdNnlxz/5YPTk
	 pYuh9SUCgLN/dJPynHQEMf2T2BkvXq71kQtBnL+ry9n8HemMNXzB+LN4Jn+56J9FIRIoN
	 PZFnT07ZDO13OxKt0TXt7bDwrUB72sOhUfgs2FTiJ9qpvte96eiaLxcYm1MnXbEiUAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785981;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SMFlHtV+zlqVwtQdTGK0fAEDOTs5DiBRVXXXF9T6sG0=;
	b=VpLqJTn7U/KDvm7yAAp4qz8Vr5Z0lvN1bawV/PAK7xUNMvNppHJ5VmxiTOqaEpk8mWXB
	 z/c0WaP4dc2wO7eB7khqwzDzqPWHmN2AGsff38jKI/CHLDb8puh8xJGzSX+6Fz46NF65H
	 ee8o8RT7+7ChdQCqM4dsSnKjnT1WXFkenEEa6TtA8NCpnm8siVbtLqN4i7jKyLdMJzu+E
	 6GvSIzgJHPunZIIpeX8AU3FKOLm+HxygUqR2K80WjsqxDebe9LM/pGEV5k61Fj5jQGuOb
	 hqCtsWVA+ULNZQ4hkgej+nABHE1KL/0WsYyoPXjd+rCsGyzLYCfEEldfgHMspHDNJYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kal2aXNw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 34BB9606A31B;
	Wed,  4 Nov 2026 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kal2aXNw
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3616F1F00919;
	Wed,  4 Nov 2026 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793785980;
	bh=SMFlHtV+zlqVwtQdTGK0fAEDOTs5DiBRVXXXF9T6sG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kal2aXNwdgPfjlApyCFt9izMtjcdbQzvW1+qvZ/c0EqD4Sf6sdy1Q8xFU0myA8j3c
	 Ms4piHvBk6hFdDs5I4YrVIckCOTO3X+yLUSzDmRi6yDu6W4ym09DwqkVe7J6DO8UqW
	 5kHX7W2jRnBaouaE4J0CvoL28Xz12mBYreB+rHFxjahYNhRYjDnqF4se0c0FvJp7lK
	 0An8TNrVWiQkzLtSm+z+wUN/MG5UczFHXtmSbHNPfzwpZHCuquMMS1k6tJF/sPypHl
	 y4asMgBuZUpbiwX1eMJTCLf5QxP2c7bHnBdrRdRVIG2l6tbaTsdQwWsdGbXWCislBW
	 bCF31I6W4ojTg==
Date: Wed, 4 Nov 2026 10:52:57 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: reset lookup flags for each hogged line
Message-ID: <qboynvhfmvltsuopwotpf3sqdwho3qobxmw5qldooedjqodfgy@x4l6hscj5unx>
References: <20261103224339.1180-1-kimjinseob88@gmail.com>
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
In-Reply-To: <20261103224339.1180-1-kimjinseob88@gmail.com>

On Wed, Nov 04, 2026 at 07:43:39AM +0900, Jinseob Kim wrote:
> gpiochip_add_hog() initializes lflags once before iterating over the GPIO
> specifiers. In the non-OF path, an active-low line sets GPIO_ACTIVE_LOW,
> but a later active-high line does not clear it. A single firmware hog
> with mixed polarities therefore configures later active-high lines as
> active-low, including inverting their initial output value.
>

Please split the fix and the test into separate commits. The fix can go
directly upstream while the test will be queued for v7.5.

Thanks,
Bartosz
