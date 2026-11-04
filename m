Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781181;
	b=JjEpLwv1u9A54MRiZn0Im3Z1m7DcSNlaRbvWu9vOMTCw0Q5Rc3k3AL6e/jmtiljfEZoo
	 9n4X6k0XRqcox2piU56uLZ3NGajmVowNuvghtB7mDkBVXOMkMtb5VpZznrDZRG87VKHD0
	 aRV4ACN4et99WGrt+kyR71pv6htVPadKDxaCud/f8XoFw1FI9qbqMCY+UBdtdK3pjSpJr
	 sepXGd8+XfdIA4WZcdKnNkODBlcitPagYs35IXdbqfZ6yPW5hEte3MFioLteF5i5oikc5
	 XNQ0iNQIXnLTO4HVMfmwkeNlMFTUi+yk4CXdP1WtU5HYZb+2yM978zXwHFp/FSK5Q+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781181;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v+la3jMKr6nPIrYEiR5T+L2vDOYUs+pDzg8N/ii9g/I=;
	b=lJRZ+0cx4eLBnKSXFPJzL+ldCSu3Wt5y+GETMIIl9OA1Z0sSbIahi8oC56CvOuYBqMyQ
	 LbBkmXBLkUgm7/A6HjqxHX0I94wKkzs7v4rhQztRiPmV6YRYL5QU6j6aYo524PeqXbUiT
	 3MoY3+6jpY73IwO7m4EWdROstLfkOUbfnaVffMS2yfFmT5tQj3GaYhypBOpZQMcrS8aw0
	 kTNal4nTc6AYK59JE35YO8WRpQb9biuJZ0BWyXwl+EdHe6SMDliv9oSnPSlL1x0adA9dj
	 vKfXse+Rrbge+dN6NVObewkw0+tUCi7b1J6vvo4gCrAKPlZsp9TMoKBILVg/yY8yYRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828C606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 08:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0828C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso353480a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 00:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781180; x=1794385980;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+la3jMKr6nPIrYEiR5T+L2vDOYUs+pDzg8N/ii9g/I=;
        b=hZgZH8N4BROTlkb639Xz3tlQJXYGztMB/C5Pd+UzorARZwrbtPehmdrQrb5iVUAZ7L
         0tEyWfR/qb7U0ZzvINVcSUvlFkDRqFZC1vYgMm3MW5iVKECD8ZX/MKIMZCU9Lh6h9/gN
         1ZRV696L49EfnzJRMugwkAwsiE6oiGsDR4CwktIkzrXSsPStpoJXHNkyFVHgHADaIyu5
         fv1kqAYxq6rlD0i+c/o2K4yyLiM8zuXzdekO3Xkvkudws0tdwjd89DyOZE6yyUS0l+Wi
         IGz3yoI3U6/SG8oU2Ed+f4Tu8O5MAldKB3IM2EWRaZEq9yR4PPV832kQYpztGeD2ET+j
         CCOA==
X-Forwarded-Encrypted: i=1; AKwUvBy+pEyZZn1j4uRy5eD5/PXaFkjRtu+ht06/E5WuojKjEcZG+gfc+LdpPRD+qDfOIdhuZxzBwA4G7PD+@vger.kernel.org
X-Gm-Message-State: APuU4Z//mEYZkmQOd03onSSNV+9pca5BibqHftdiKH4YreQFcNisi0qs
	LAh/nKdBu7LpgtoAat3zsEVsnSHDa/rz1CFvrtLN3CGap+5HrSKWQI51PiE0VJkn
X-Gm-Gg: AYBFou04gIuJSEG62DrbyxD06SM69c+TR64kD03aQVrogQRYz36KKejtwKEnUjJxXl8
	6bfitE/Cq3xdCT99WGCFSJQpqQNtx/VefJvtQDYGdq4luoFh9mPXz9mPCBZIEJG83XxXPj7qzrF
	G/Dh/ht3rUlDhmZJbmchQmKMkL/HVbhN6u+01MaF6gJpU+lFU3W2yLd6zSjqX1khpztk9mS3Htr
	UNFegopPryvhIaRDb0j2dHpjYtM6r2geYrJaVXKQUY4GiSeSojtU79L7rS//YrxzW/q5nRT2pNg
	j4xQBmpLhBBRIjzd0zqbVkh1MWpt8DyUX475onAJNm5LPpJh4RPH5NV8WOk86bv7StfdrleIlD2
	AhHv94FdJ1k+PZBIxg9D8SV95mgiTLEdkwq/y363i/JQ5abvZXyTLbc8eRl4rgT58zU6pCqY55Z
	A8906yqeAExYhfN6Stm06Ixoqxopgl/BSCNo/AbdFEgP74C3EWwPV5pyyJY1IHyCODQYe4IuzRQ
	JJ8P3t+QrN21kzbIhlLma2461FC7aJaVGenwBVPsYLGaQ91gc99uBaXQK7Th60FIB7ouW3+kYno
	8ZyT20iaNXcMjfo103h+lpb2Sx1u91M39zjFifUxfxb3ojgczHzyRj3OQT6itOiCvIKe0N+XPy+
	1PYFP1z9DFHVUQNgQ8xm9oBQc+g1QI4tnlvvLWIm+UVo=
X-Received: by 2002:a17:90b:58cb:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3ae896f8320mr12938909a91.18.1793781180233;
        Wed, 04 Nov 2026 00:33:00 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094453532sm2914292a91.3.2026.11.04.00.32.59
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:32:59 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso730618eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 00:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByhHvxg0GfSCWN6cDkRfJoB6hujS2Kap0jMlZPIqGOrC7Opx/3byqMsyeIMjkFicLwCzqQuhLkiD+FG@vger.kernel.org
X-Received: by 2002:a05:7301:f09:b0:35c:ba31:6fef with SMTP id
 5a478bee46e88-36a424438d2mr23103058eec.36.1793781178690; Wed, 04 Nov 2026
 00:32:58 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev> <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
In-Reply-To: <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:32:47 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4-voYM1Uw8+0pYArJoHknyyg5CMB-mbG=qn89agxxYug@mail.gmail.com>
X-Gm-Features: AclHuK9LKKTlOPvX59pIytGyTkFgOT4Kv7Bs2y1OMNJDw7pUXgmS8KoRNSgAgSU
Message-ID: <CAPY4CJ4-voYM1Uw8+0pYArJoHknyyg5CMB-mbG=qn89agxxYug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If you're a co-developer, please add your Co-developed-by: prefixed with
> a list that looks more like:
> [...]
> The above is completely unreadable.

Thanks, v2 will use Co-developed-by with the changes listed that way.

On Wed, Nov 4, 2026 at 3:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Wed, Nov 04, 2026 at 02:21:37AM -0500, Joseph Telaak via B4 Relay wrot=
e:
> > From: Chuanhong Guo <gch981213@gmail.com>
> >
> > Document the GPIO controller found on the Siflower SF19A2890 and other
> > Siflower MIPS and RISC-V SoCs.
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > [jt: from Chuanhong's siflower-7.1 branch; Joseph Telaak as the binding=
's
> >  maintainer, GPL-2.0-only for the deprecated GPL-2.0 SPDX identifier,
> >  example indented by four spaces, commit message, subject]
> > Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> > ---
>
> If you're a co-developer, please add your Co-developed-by: prefixed with
> a list that looks more like:
>
> [Joseph Telaak:
>   - did foo
>   - did bar]
>
> The above is completely unreadable.
>
> Thanks,
> Bartosz
>
