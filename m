Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E00384CC2;
	Mon, 24 Aug 2026 21:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787608716; cv=none; b=KI+o1Dtymdaal8lSzu47G8NMOzFCiHrBRVHz78kl6nL5fBJAH4FDeFZ+2symhbgeczuUSU6NUiAf/HkKLmwu3nAYM6Sm5l807EUJ2GsNXmA8fv0nsTMKNI3OCR+0v/aHdIQ3ktTCmf62Y6qta5o+PNoLJ+f4Sdl1eypUEztviq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787608716; c=relaxed/simple;
	bh=RuqQm8IRNyQOGsIuRmtU8fK/cQFtjfLyX66vvyhwJKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+4Lx6XK3Lr3rmGyyN1XS4pquO+37lrVLAggUlHuJzoJUSeKG5QKYwbGGHpAjPFK3a2Prb6ss78P3OIZZ7IMfj+SXcx/aT40ckIWdZoOMS9yjP5nG7lyUICyCVoCpFIej3hS/8xIYFQLri38edfP1SRRACVHmO6wgQTbBsUDD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=g1liBUpU; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="g1liBUpU"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:9a6:acd5:d8dc:dcdb])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id C4AB52003C3;
	Mon, 24 Aug 2026 23:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787608713;
	bh=RuqQm8IRNyQOGsIuRmtU8fK/cQFtjfLyX66vvyhwJKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1liBUpUCYC3sBIvBDVM+8DLrIrrcLR/FdeCntBle2SgiZzRZp3hKNybIJ3tyDtH8
	 WctAbdGLFGJnIl6wN8XGB/HDI2nZ0FVJmvJcekqxqQb+yf00Pj8Pki1jklQZWAEl1L
	 vuDH/HgGdVEUQl7RcqVBAeHFcIk+w218t53t4KbqB9Xg4DrHUpiS6cgpKcu/y6tf1l
	 Q6hJs2C9CpL6wZYANf6qXa7PMz9wSOOkrcBqQpXPa9s1OaXgJnOLUUogNZYiR1Qp46
	 z8rnThS3yqEoQnRqcksK1GKYOcdQaM/SqqGq14IANU/7oJ1kzad4xv3qNNqVszsPD5
	 bKhLPwCw0r9Vw==
Date: Mon, 24 Aug 2026 23:58:22 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child
 nodes
Message-ID: <aoy-fvFty2LgCamx@L30177.local>
References: <20260824-for-upstream-dt-qoriq-gpio-hog-v1-1-d75923bcecad@free.fr>
 <aoxqEAi0d_hxUxbA@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoxqEAi0d_hxUxbA@lizhi-Precision-Tower-5810>

Hi Frank,

> >   gpio@2310000 (fsl,ls2080a-gpio): 'ethsw-reset-hog', 'flash-reset-hog',
> >   'pltrst-hog', 'thermtrip-hog' do not match any of the regexes:
> >   '^pinctrl-[0-9]+$'
> 
> I agree on this change, but I can't find ethsw-reset-hog in upstream tree
> yet.

It was something from a development branch that I did not properly filter before
sending. I did send a v2 with an updated commit message:
  https://lore.kernel.org/all/20260824-for-upstream-dt-qoriq-gpio-hog-v2-1-58bbc82b881e@free.fr/

Best regards,
  Vincent
