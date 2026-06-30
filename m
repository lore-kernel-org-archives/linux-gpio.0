Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F1525A359;
	Tue, 30 Jun 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831481; cv=none; b=cv0TWjH+zSYUUFSZ9TRu89gh20ma67mGv0OJrIeZl0I1g4sPZoclhmJdmMsawVF5zeJfU1xOvEaakC6G+s36v2gYXW2rFnHdXkxTXWs2BZ9A3SYj0NVVQ8DZO8HVLZf9bhAqLVXq9dg64Mg00MZioSmPYuL38P66Mg8nEMjeHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831481; c=relaxed/simple;
	bh=MO2KMMJz9bNmVTOqCZf4QqFo5B59p63cybsp9Y61isc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HaQ/W9Nmr9fETC8Nb9dYppDCtS2vgeIoH4mJgx3pioUvFeuTuiNSDF0dapym3q5lR7aeM0FPNZNQzcjbKP5KcIPgKZgufAcccahFUIMlDZNPbrqBQjaEVHACaiBeWgKnk6W6OboY9HcSpydaHBnU6rkTFD50pgJVaEXebzg8/OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhzKKDxZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhzKKDxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142EA1F000E9;
	Tue, 30 Jun 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831479;
	bh=MO2KMMJz9bNmVTOqCZf4QqFo5B59p63cybsp9Y61isc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QhzKKDxZmIcs0Lap66Azn2X8AoY3Qu3GSgafvTmWUQPRGlecNX0OGKRJz5gPgQ2j/
	 GmHT+KP9Czr8zNDroW3d2mTvNPu7IAVBbB85seDI+aRaZDPi5gbId482KzKzIVbIBF
	 ZjXy/nrSdwH1JVgztg7S6FlST1RaDJvmdQMGJXsdBo+3Tu+hyz1jCueayWzGz0jaHe
	 s3dv9RKiFxEYgf2jRKpyrjsqN3mcjH5spR3bXULyWgbhBVMI+1VHYEWmB3ivbM7sbE
	 AyJRWNN4RTdMR9PpiA9s0qj/JPF1I74B/uJSTyBomBK2h4UjzekR4gXLtzUc+Jjpn6
	 AgfbhNj7nUYYA==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct
 SPI and GPIO as SPI
In-Reply-To: <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:57:56 +0200
Message-ID: <87h5mkqdmz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
> there are separate domains for direct SPIs and GPIO used as SPIs. Separate

s/are/were/

> domains can be useful in case irqchip want to differentiate both of them.

the irqchip wants

> Since commit unified both the domains there is no way to differentiate.

Since the commit.

> In preparation to add the second level interrupt controller support where
> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not

does not

> seem a good option either which leads to waste of resources.

'either which leads' is not a parseable sentence.

