Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D233C3B7B76;
	Thu, 26 Mar 2026 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513508; cv=none; b=YOzMovPhB/w1EMUFonH6hyLVD+YUB6tnxpiwSke3Al3rwLiflQJiF790JwQdCf8/g6Stp+RnV8lmwPKynHjyNADEQ4gYdqkKCiIGcAgIjxWTA3pEAhQBt4yVZBo2VtfL9FxJXHBX/RhZ24W2L30jUEYMzY+RVUzmg0M+FPwf8xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513508; c=relaxed/simple;
	bh=DtkcM00qstt9ezFR2/CqK/oJyo6OuKnFPtu2O07XpqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/zje0TWRb2YMsnyiO9b8EzAOEX49oAcgY5e7HF1xQngxeBi3jldnDsw/AFe1wrdU3Opy76KZYBjtBdu9xLy9NmqRV2CxAi0jJ2d61Ftjebh7tCv6RY/aCxZ3RFk8oayGhgGwZKccRhYo7TwB1qfKC27oWuY4vSToosPHhZ4cWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ppjz8b3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ppjz8b3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5C6C19423;
	Thu, 26 Mar 2026 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774513508;
	bh=DtkcM00qstt9ezFR2/CqK/oJyo6OuKnFPtu2O07XpqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ppjz8b3O39w7dT29hoR3sKCmgkIf+DqOlifxQMqapBhNE28naqdxi/3+DnIhOk4d8
	 5DZzvwonEiLvkSxieACdn0c2xcxziCT2Jtf2Qv0QQFWU5ma5CA2MelUdSFDtETAu4A
	 W1Jy+c2g6UaqoG5+BhBlLk+K1/6GdVlXLt8JhzfJT9MKc/p8eVcBJnaKE/t/NbmZsS
	 hl2sj0XzGFnorRruh5aKuVjn2gwY3QdmxmK6hmCNfUgE2TvRt4WGAQ/hfAmQL6zbue
	 tzU4yBFNrR4ah5vscigRvs6A47aj840CE0S+q4hMaVrEHKArnMkDSgXzjuv1ZlspO6
	 JNgfWPBIcA64w==
Date: Thu, 26 Mar 2026 09:25:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
Message-ID: <20260326-marvellous-premium-grouse-d1d1ad@quoll>
References: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260325-ipq5210_tlmm-v3-1-3a4b9bb6b1fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325-ipq5210_tlmm-v3-1-3a4b9bb6b1fc@oss.qualcomm.com>

On Wed, Mar 25, 2026 at 01:05:15PM +0530, Kathiravan Thirumoorthy wrote:
> Add device tree bindings for IPQ5210 TLMM block.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

I don't see any differences here and cover letter does not explain that.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof

