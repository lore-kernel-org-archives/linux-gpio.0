Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294018;
	b=kTT4ukQJtClzTVNOTLl2PwohppnLfdgv/+YHG51J5oa4V8wI+egaE47rpUfZcV9BRq/k
	 aRGeSmJn4rNj6n+/L/A5SFmJ6LI7DNRSbKblXH95RFn6yiTP6Ro3NwL1lzXYODsxKwpbj
	 k6YZyB7CCT0Cof3UpC4OB1yDfToQWtDXFuXTnFwqBb6IHfFT19T/bP/s2AKKo7CL5sCmc
	 5lCtYQOBIeUdhK5H0w7LWLi5zJH7jgN12FoBQVCCTPePcXhav9oazaaDVyXg0H1Lg/WOh
	 KN5TpOaCfXBtsBAqct2GlmwEPyAndia1dDdl7AUH8RYwJMaV9qopbNuxoBd9qBkw/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294018;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KBAP+JWazOGOCfastfioBRGlItoj95+2iYLwUgECcdg=;
	b=P/UJmXQkNcUiiVB4VElVgd7CKlGLgb43yqFd/kQ5yOlpOZ3NhpU7X/YP2hMwLKSGIX8Q
	 c36NlLdiHh4CGSvmevuBslGojrxKKfFDJNd/fwyHgE+8wNtvTTCRa54DTOatebwN56Lc2
	 WCr5gRWwQA9sACMjWoYY3GBT9OtiVm9smmJg4VOm1S/pn3GcZo8Q1xigjevlmZsqhcuH2
	 5+HmCBDHfhjNkbK9+vdeztjQBkL3wE2wo+xY8krggAU9WgSfKYdNPXgLn4DNL+Hgsserz
	 11hscO6w5IWBbtdaXZwZIn86c9ab3JN+5Lg/1YXnlVjsSSQCTBduEMhUPjsEnmIZp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYCJCo4w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB8606A332
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 20:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYCJCo4w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E3F1F000C0
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 20:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294018;
	bh=KBAP+JWazOGOCfastfioBRGlItoj95+2iYLwUgECcdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WYCJCo4w136y0Fv5X7VFsWrs1eharrpyUYMdpn0pkCL/Ks/7iUSascPrPiKFNzyys
	 uXZJTxXgoHxl90No9O8upE9fnjorLJ0KeMFsP/M6Bs5fpgWm2FrkmiOUvwCBiV02OR
	 juvnnrAAmum2VYuMkQCEibMtal3H4ZhTkbfyM8BDCDyNBP0ryJaGDjQCEBxQHapOMb
	 hIFiMY/QEn7IopwGpLhXG73YHx+AuTzdw23MCewWBuDUKCz75d1uNOTfLtge693PAN
	 xy83diRqxtZol8QGqmpiEbNl2IW8K8LyEneLfJt9rYAtODqfKW1CPAyH1yUZzW03FI
	 dux+IB7cYVNnw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1479be604so1487393e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 12:46:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH4rWntWAfUhypnmeOQKdtpXBzZS/AD8zMvRFTJb70kqPe+SVOD9nMajC16VU/mDyXv3d95Ot+H/L3c@vger.kernel.org
X-Gm-Message-State: APuU4Z/JVQTh+HWf9m4b4sT3Oije9hrNbtAcb5Xe2aggXUe/+mU3/Mh0
	53GLkJKwLeflav115QcHgKPUozLsLGtx8GWI+VC4NMp6LcxpJt8r6msZPTXSq71lzNmGNXyUm84
	Ybw60bZCH4ZykEbSxtNpMBJLg9sKdfHY=
X-Received: by 2002:a05:6512:1042:b0:5c1:4c4a:f026 with SMTP id
 2adb3069b0e04-5c1bc6f633dmr2383041e87.4.1795294017042; Sat, 21 Nov 2026
 12:46:57 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com> <20261110-modest-significant-ostrich-8dd408@quoll>
In-Reply-To: <20261110-modest-significant-ostrich-8dd408@quoll>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:46:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
X-Gm-Features: Aa3M54pkPP-k4Hfm-HVSsCMs91C14Me4yvAKh2ZGSuerCOgY9HmCsGMWje0k63c
Message-ID: <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prasad Sodagudi <quic_psodagud@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:28=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:

> > Add "qcom,remote-owned" boolean flag for egpio capable pins since they =
can
> > be owned by remote island io independently of the selected mux function
> > even if function is non-egpio.
> >
> > Presently egpio is treated as a mux function level decision where as
> > hardware programming guide(hpg) specifies it as pin conf level decision
> > i.e setting egpio bit is independent of selected mux function, the
> > driver/apps claims the ownership of the pin if it's egpio capable in
> > case of mux function being specified as anything other than egpio.
>
> I don't understand this. If the pin is not owned by Linux, then simply
> do not list it. What is the point of listing a pin configuration which
> should be skipped?

We have instances of device trees which are maintained in Linux
being used by e.g. secure world, U-Boot...
So something else is using it perhaps?

But I don't think the device tree should decide system partitioning
like that. I think the boot loader should set gpio-reserved-ranges =3D ...
before passing the devicetree to Linux instead, then pass
other reserved ranges to other operating systems in the
same physical system etc.

Yours,
Linus Walleij
