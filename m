Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365668;
	b=qsUl/c5C2V4Uoq6ujE+mNguz6hwJSF2hXB7CqjvXvvLfzkf3Df3dsc20hH8vbjtPKO1Q
	 Tx3QsXDJ7mBcsQmVu3M9VNIVuQOVW9XY+9vQBEroqjnUhpzIeoYu+WACERQX9OJWMKz3d
	 PsE3bfwjevJWVt0id3uq56r/tVyrCbMmRLEmNfLW6L+URg4XlJaWPM+NYgI5+Z4zRwnuO
	 1ds7IEjVMRRyyBuJ81zF0hb3shraLoWliAGhMiOiAdc5bXqs/P3/Za1vtO+gcMTA9BYpi
	 Xj0qu58Xdr5uVCgEj7aTssDrF1pAA8/uDfCCZx6dZTG6CSum8CJfNPkmopoOw3tljsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
	b=NwuQ992SVCJUqr84TTU/wfDTb+q+2I4P5JeS0L+iXgtCSTHKZH5PldpVhnBExUS5j624
	 f66hS+1ilDfWtYCuklAkBukfmOBE/U6GNSBUI7NUpXzR+l4EbetH2wHNzyFOtwwWUcMu8
	 xc3IjZITNhZfdb77wBzILI6rzL3uvYxIml5nhFZjPb3dA2FuaA/9QP21SBa186/vjmjUM
	 iTUOoecQvWwrCX0NsUuhHkWNLLuuoYe2tPL2VOrhWX3NIquF55o8e5A4//gmVREfor4wf
	 RHuI5c7Ra8dTpVt3tUoN6aQwb7zbssRMRW7ocSVPEgRlILNHH0yy4QoqRsMNCoT+eUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E1606A33C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 13:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055E1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso348013a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793365667; x=1793970467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
        b=kAsJs6idydB45DbKxh0swYdwPWoeUoz1fMSGuSg9Z10c1chhaLoD3NptrwkZkLa8WT
         MQDu5Iguv586MYJ7G0ZC8DGNqd1vZ0N9puv6NuMN80cQa1qur3iLqUZJRGjEIVUkhWKB
         7XrW5G3zFjWjGzpZl+GD78rr14kcNm2HU98isJRTU7hjAslGu5Cb30150/cSqUDwb523
         04wscuBw+kp8Y3+caUYCmfoq5q3eSp1K3mjObUOV7IAk7OaBJAhBvv1wK001+OnCURDa
         BnqqyFvr/lkDI0S8TIpcz+w1RWkBFKthZFRYkm57tJkBwAhVJdy67PyN30grm8vXRg7v
         Y+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365667; x=1793970467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
        b=KRGXYeGAw5pYt6FAubrKCoTYIXli46V5+hQFLlaQYWnJs3/MtMDjj99TPTFBy8VxyF
         zlZSchJwE/1X43uAprGrAJ+AKl3Hm/22G/t8nRD6b89TJQR/UXUbGuqpkVeLklOQNg4f
         6X76dr1UedGI4sYL/2DqJTCY5DdMUFsXKgZcZ0D5DxrGs1Q1bSlJ90oDwJfqrSLMSh5W
         Z0R7RIvUPWSLrb8ITv+l8ET2iIlHFuZnEmpqxbR10P9ui4Y0jZaJCYLztcIIwsExK3gW
         e/PMD4iu+ttrK1DkwLPIx91IYAqJGpHJuhSJyQGCyiZutLstljI6H3Lqek5bz47M2k6P
         OoDA==
X-Forwarded-Encrypted: i=1; AKwUvBzDd8R2BxsNhE+Iu/SWvxgGpfCjJkyEzkFTCpVZJ86ETyn/W4f1m7ItaO4TSa5auNqbakZbtzpCIrZd@vger.kernel.org
X-Gm-Message-State: AFq9FYI/9+d4Y3isaNM1mEluPNcaQ845gTX1IS1pTEbxgRZEoYQb9mQF
	ZA2xNOn1YDi/EIbbU6oexlU6Bl/lpDhVRLuXsoJ5jjSYbGMCExQM12Em5K3+PBg6pStxZKx039F
	TFK39tA4O
X-Gm-Gg: AYBFou0+Ortu3/gHA6+hxEKSTjI1IzfLAPdvSEErHZlAuCCamJ0oUgfIZFtI152BFIT
	lADEWWG7PRt+7CnAYD+bZ/Q6aj86jVcP0FvKSjmXkK3l0f2a79IjDrrL5nbvM4Sl2xo7mR1wqin
	PbrpyPvy0vBbhYZUwHaobCtZR/q2sKyFnLNBXCtNzFz9rZnHtgNsDdjRXSlV0BzLHVa2EBd+vra
	OTIBuYpkJKB0T6rMF2nrczY6mA7PIndaCHebb+CAH2rXzxX9yIZA3f/ARF3KCaS3kWun71X3Lj8
	Ta589Gep4Q2Q9PwRTsBaAE6igikfaL186Nbbt2viPxadWShEFsMY7b+Ror4XY2tLJFBGoD9xTMT
	ZcRYrWHzyfdBl/9K0hQqcoMP5kE2ceF9anbj1PbvyA+3tFXMNyDUSzoGaIQDPUcyOccY0fq3DFw
	Se69jz00glDam+O3vdTSSrg8fkEiXe1/uBN58zfUO20D747Frt7uifWQxFIUtouklddb5oSWsUN
	u/xgipfJC/94L3hpj6tNr3E9fXUr7YCSYB2iq0li9SQvXSyDNTfmYb25UsUOzv/YKGGXEtDT3WX
	qG6ix6i9SDakr+kyd98yZmWbokmEzpxRZ4BdnTRb22k/4Et6OBy3POHo2F5RKLAAKh7QXqEm3sX
	1QvxTPUWa0p/jsk3M
X-Received: by 2002:a17:90b:5243:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3ae89806353mr1634562a91.48.1793365667017;
        Fri, 30 Oct 2026 06:07:47 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm8733413a91.0.2026.10.30.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:07:46 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 20:07:42 +0700
Message-ID: <20261030130742.3211592-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
References: <20261030114705.3159093-1-jjc@jclark.com> <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 13:24:49 +0100, Arnd Bergmann wrote:
> It sounds like the underlying problem should be fixed elsewhere,
> possibly by preventing the deferred probe to be retried each time.

Hi Arnd,

Thanks for the feedback. It looks to me like it is probably possible to
fix this better in the USB core. I will attempt a v2 fix that does this.

James
