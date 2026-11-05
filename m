Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868282;
	b=dG5yYf8N+6JhvT5y1IpuUiIErss80fBZj9EKvEUs5BX5Jkk/ex3ISrHtfRW2fWsLYxCd
	 YU1PqeuLTXe1U/mUJewSAH9UyMVC+Lz0LqJZUhzn1tfdZQPo90vxk3NluJCfUamdWRJg9
	 6sqHMTS1LDMxJAo4bI5tYDfpEYAdLZXBxLQBSC9b5/YzjBJoHcLp7Z1k9aVs4UuoeJoyE
	 PkYpk/NRQvVk/wratU+kHsU60cehMuQcLwTFxicDAch8wF5aEj7QO7SbWTh1BcElF5MmS
	 WnZbQfonYERPMa8JD1iKgyaew52+7+n1au1EWQndGRdkDKYCD3gRvCL61cKBZO0cvig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868282;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=dmo5dguV7kWo5k72dA9HHw5WV79tCB7BB8HeKSQ6b10=;
	b=1Egb4xus3ECFFWUUw63KmBmtT8xhl8GMMD3aPUFTJ8G/xOTqTJ3MfF3CMdX5HjToZjZ+
	 b0ePDfWuGUd8D3otSwJ9hsx9AhxOMlR6Hj9qyMuVmgfGUEoE6xmDoLQeN1nwpTJsM1u7t
	 Qt8Aw+kqsui+4G5iFqSSVQ+7pTl7c4pisX2XwSjX26iFnEJ1kmES4aU4t78D0TLg03Mrg
	 Qccly3PsYuKLKxwWVChALDc50XV0iIUi6rlDy8y3k+ncsVIjqXCeDZ7MZcW4eN/fIaUn/
	 bNCK5j9iynNoDMZCXNPEx6YirYSdZvsO3v/2W4rSYidrU1H8jI8zBP9bERPNUTcjaWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6EP6A+C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B11C6606A31B;
	Thu,  5 Nov 2026 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6EP6A+C
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 774B31F000C1;
	Thu,  5 Nov 2026 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868281;
	bh=dmo5dguV7kWo5k72dA9HHw5WV79tCB7BB8HeKSQ6b10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M6EP6A+Cj+IaFt9HyBWrvQHbWcC/pRljAX5ZGoZBy+uhSMnQZkl+06RtUkNdr6KM9
	 Mcvyf3LrffWqkStTLrqkrhI8aM8UYaAHeRLeGH6ypurkvrbTHcaphBW9wVqPfm+Td2
	 7wbC4WzptmlUNAASWYqDrervI5hLXjjl6ivNVkkhf4V/Gy9epCrmYpQfxiWYW8XHpv
	 xQqzae2/+oT4BRkbPWT0n0DYLT3dNrmf3TsnGN9QRSgdyNGGs9u2yjO/rnOo4B246V
	 5myRfljN8UDHtwmEESoNeN6DEmFyECs0uOazyowLyujh+bfCfcrgNvmmBQZnkJD9x7
	 hziE2KCp6vltg==
Date: Thu, 5 Nov 2026 09:44:37 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Suraj Sonawane <surajsonawane0215@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Message-ID: <cq4chphrrty4iwqhb6qjilm5pxmetwjdogbbru5iobqvrut3ql@pp2gehw644tq>
References: <20261101100030.15744-1-surajsonawane0215@gmail.com>
 <CAD++jLkyETpvCxbvcvSSZ4_ZF6vt20VrLfkVsskibZ3QpceMuQ@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkyETpvCxbvcvSSZ4_ZF6vt20VrLfkVsskibZ3QpceMuQ@mail.gmail.com>

On Thu, Nov 05, 2026 at 09:33:51AM +0100, Linus Walleij wrote:
> On Sun, Nov 1, 2026 at 11:04 AM Suraj Sonawane
> <surajsonawane0215@gmail.com> wrote:
> 
> > LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
> > unnamed, so a device tree cannot select it. SC8280XP already names the
> > same slot ext_mclk1_c.
> >
> > Name the slot on SC7280 and assign it to gpio5. The third slot stays
> > empty; on SC8280XP it is qua_mi2s_data.
> >
> > This file also provides the SM8350 LPASS LPI driver, which uses the
> > same pin table, so the function becomes available on SM8350 as well.
> >
> > Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
> > drives the codec master clock, and ES8388 playback and headset capture
> > work. Not tested on SM8350.
> >
> > Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> 
> I'll wait for a v2 which comes with a DT binding patch.
>

No worries, I'm on it.

Bart
