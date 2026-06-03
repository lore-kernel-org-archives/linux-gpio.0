Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A533DEC2;
	Wed,  3 Jun 2026 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500790; cv=none; b=iBMM5iictaFGbH4/k414nOn+u/T+vG56hyN1OzJQzr2OC0jAf+uMq14CLYm9Inp5XIw9+wTnQJ+n0RzoAHSzSwIga13+yGVL0RNLMcfNsQXpG2HKUD1PKCGgkXNNkrRsIrYh7+DWnK8wzlaRl8P6JLRU0E6oHijiAl5FWwM0HGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500790; c=relaxed/simple;
	bh=QaoXYUZ1KX+3rTwMZiqjG5bpOAZKziB6V8JGosfvqpE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KSlcLlykKYyoGYDtHwOlk8x70vC/Xsv9KgVtB8Pz2pRytWXu5MbHSwgwl5fgQPedrYxs7ydcU8ZLGzb9mXCu0gybnSSVE5KL+lvFInj5Y3MTL9Lqrf3Ps/D4hSTwuhEd+ogiaTDID58KwyFmE2vardTplf4MxOuI9/DlxpjdDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLjdw6Ol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLjdw6Ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670431F00893;
	Wed,  3 Jun 2026 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500789;
	bh=iV1HV4/JIxJ9K22eiAig7puQk1qXi3wzIYtTmf8/mWA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XLjdw6OlhEt7dGw5U/4Dbaa7aSrqSp9TGJF/dDxhSB4dxmHE/86+t+qtYfHPKNORr
	 V+wcJuvvnMV3tQ0t7Hy82aRj0egH+S5abPWGRCf3oAxitMKHGK1dK1d5fJmoT7GwYS
	 67upp/W7GraNJ0+5M21zClr/s9mpNcHGRKx2byiHB+iauPjdVpH5X3CPvZj4ilkYQl
	 j8kRYF8V5noJB9ZWd6DkER7HRxfACP92rLt2kEVJQhdvperD83HnzKMpR53g4KJtGY
	 5BXp7DQQdWHZSbOYgXkRztoLTAqMtGHGaY5/eOr4AeybASC61y+biLE+rg2lEUUA1F
	 4WK4XwpOEy4yg==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
In-Reply-To: <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 17:33:06 +0200
Message-ID: <871pen7i6l.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
> ---
>  drivers/irqchip/qcom-pdc.c | 193 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 150 insertions(+), 43 deletions(-)

Applying patch _PATCH_v2_1_8_irqchip_qcom_pdc_restructure_version_support.patch
patching file drivers/irqchip/qcom-pdc.c
Hunk #1 FAILED at 21.
Hunk #2 FAILED at 45.
Hunk #3 FAILED at 55.
Hunk #4 succeeded at 61 (offset -8 lines).
Hunk #5 FAILED at 85.
Hunk #6 FAILED at 113.
Hunk #7 succeeded at 206 (offset -10 lines).
Hunk #8 succeeded at 366 (offset -9 lines).
Hunk #9 FAILED at 412.
Hunk #10 succeeded at 436 (offset -10 lines).
Hunk #11 succeeded at 451 (offset -10 lines).
6 out of 11 hunks FAILED -- rejects in file drivers/irqchip/qcom-pdc.c

