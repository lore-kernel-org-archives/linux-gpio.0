Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E94B53A8A7
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419996; cv=none; b=O5gXRnw+WxBwaqls3FnAfavYEHTzwe1k7ekgMoVyxaMZBeLHgM/VKhP0Yv/EtxJL3qji9QffO/mL8bYXmDMDD1KUJnO4tWPV6M0Y8QgCU9PLtlp0J+8r5FRk0OgFD8oy//H393OTOlf4h1t9mVxdzXmfpSDIAPQiCYOodhZoWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419996; c=relaxed/simple;
	bh=E7Q6dTwUECG1tsW8iXIY2kM2oZ9V/zvATwwrSPxnnz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqitgNQT5U2cCqPiNEonw5zgq2hkAaxpfpq9e3Z5WoPv29/LACZXeCTXEStGqXMIWZ7L/hGkKeNva44rzSj6rs3E6M5qZ9aH4/xo/PNz5wVnMFDaXX0SIAKIdMbZu4I/3BkKRpu9hzCRSYzYixSmHlz+1vtpTxn6mV++2k08F0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmQ2LiZi; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmQ2LiZi"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc758830601so1493026a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419995; x=1793024795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6G0pIF6Oz4BqkSWLPLSXURO54XftTkHM0K35xUE50eE=;
        b=BmQ2LiZicQKT2P+VglY1IR/TYb1V8ZuioGfW8/IWICyDZFHi7bLG8qWdCtPu2pgaAq
         n9e/JNS2nGFvNRT0MEQ2+VGq4qz8kJKT8teia55nErivYt8dZ+XB8j3QeH32YBt5SPXI
         LicHxBoAd/RgxoM9KvXlZn/l+2KU3NvAMJQ4ZyXTPAZdz5/NKds+kzlI2yyaWK/wJVwo
         4mkLG9Lo0OLC60KjcB+Ceo62t2LpqNpdrOpvV3k03HLvHTRVN9soDQzU8uLIo/JvYwZw
         H6prvBkiTSSGG5jr84s9340ifyFsCJr1tKcFsLFim8vo3yDFBH8I1njiHjsbXMu8qCYm
         Io3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419995; x=1793024795;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6G0pIF6Oz4BqkSWLPLSXURO54XftTkHM0K35xUE50eE=;
        b=xTv3luNnGDrFI3mmNE8Qyh2VNiEHgGpGB78OcJqYopBkX49zorA0E/dRJxOKHCHKs9
         EMMtAR43xo2SuBfzzON2AjiXMPsukARiF4GRx+quOMsAfO+anJHHslhR3wShxGBL7941
         pD/osb4IIqfgUmj+/obxztCyrfNstju6lbnWylrttUZdQST4vE5dqTna4qECcn2PTc5c
         DSuQW5N/+H3wIlJ91WEqGTfaCPKHnbgUECiJxJMUZT/jl0H4aqnGC8XwziRIqv/+y+AN
         wfn74RtCffBw46HNdv3e2SHZp8vILJ62OMA5ldKkK0T7s7ORd/cUt1hGjYrKeQWFUayw
         dXHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGnosjtNf4z1CcHiJaoYYSfYncejYelAZMH5uZ2Eqy0ZxzAlmL4Ql7SvNl50+XcYzoFJaxoTbxzjVK@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6dd3omNCfAshPhUZW3TM5XBwD9+0EuRtU+VCvqkzeX2+g5KO/
	G3hN+w3zGIYQorB7CncoyADaiTCuHCf9UYy3tiuqzoLtRv+HPrxSi1hn
X-Gm-Gg: AYBFou1b21pQgake5WlTY7Cl7Py22iStiX+3pTOCNrcvon3lNxSxJe+8Pe3Jq0Ia4gs
	bAgoNp9Y0Gzf/6zn9P0IHKDsI41b8oqhJataZsH8ECcESvIBrLrerM+ohF8/pgOI6hb9Ij1U3BY
	RC5PcLZQgFWDQbMCkmyk0gTrmdrhJh7iIJqifXzzJ+u9QptgQ/b3e6vRPnMbZb7prJQhTv9a8UV
	TehOiN7V3Dz2pLsWYO3UzvUpoGFHUNvwtbHR1qVv2u95x5cYcj6cvGOrLqvC45NJxFRuyxf23+4
	4gSitx37zgY0TVqs8A7lIc9hN4WTOUZPC1NxwwPI4wI4vLYZgY8+7KFvl409Ts778RS5fEqbiJZ
	YcfZ9Eq5ujQJ4i2AeelasQy87FAZk4DRYu9lNELWa2kByaH89eLmL4gYZunjuDU8ILh3Wzh0+la
	PDOqrLKlKSWHg5TPloV69IQcCZEcqk6YxzFOhohUu/YsUiZqrgGu3A/RFsiyZKfKBsP42UUavjb
	/jQpNjEXEvqWgfQwT7+O7Ph/DhyJg==
X-Received: by 2002:a17:90b:3892:b0:3ac:9d83:885e with SMTP id 98e67ed59e1d1-3acef3aa12bmr7965197a91.52.1792419994293;
        Mon, 19 Oct 2026 07:26:34 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm20449181a91.12.2026.10.19.07.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:26:31 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:26:26 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver
 refused
Message-ID: <20261019142626.GA61014@rigel>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org>
 <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
 <20261015153714.GA105746@rigel>
 <CAMRc=McOWzuqr9qcrbaL4U2_Y==-XfWYo44XVgTkB20JW_5EFw@mail.gmail.com>
 <20261016091420.GA63617@rigel>
 <20261018042546.GA48005@rigel>
 <CAMRc=Mc41umcA5ujMD_YOZUZpfJEvtuE4eBwX0g9nPOAJd7GmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc41umcA5ujMD_YOZUZpfJEvtuE4eBwX0g9nPOAJd7GmA@mail.gmail.com>

On Mon, Oct 19, 2026 at 10:11:06AM -0400, Bartosz Golaszewski wrote:
> On Sun, 18 Oct 2026 06:25:46 +0200, Kent Gibson <warthog618@gmail.com> said:
> > On Fri, Oct 16, 2026 at 05:14:20PM +0800, Kent Gibson wrote:
> >> On Fri, Oct 16, 2026 at 03:23:24AM -0500, Bartosz Golaszewski wrote:
> >> > On Thu, 15 Oct 2026 17:37:14 +0200, Kent Gibson <warthog618@gmail.com> said:
> >
> > Not sure how kosher this is from a kernel perspective, but that is what I was
> > thinking.
> >
> 
> There are some instances of casting an int to atomic_t but given the "aligned"
> attribute in its type definition, I'm not sure if this is fine either. There
> are roughly 100 places where desc->flags is dereferenced under drivers/gpio/.
> All of them would require inspection and rework.
> 

I did try changing the flags to atomic_long_t, but that made all the existing
atomic bitops complain about the type. :(.
Could we add an alignment attribute to the desc flags to match the atcomic_t
so the cast will be robust?

Alternatively if bitops could be made to work seemlessly with atomic_t...

Cheers,
Kent.
