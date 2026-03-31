Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F9035838A;
	Tue, 31 Mar 2026 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942258; cv=none; b=QgD/WY27xV5AbcUudTF4NSbp7UmcwNZiTZitGhohQcHxf80nr0uJo3Hg14iZGjws995eN0YRaSiLD9apN/M45/0HJP95MrdRQIP6QlQCmb0CJEfc7ZSG9Md0PoP3UswxvXXiCZh9su3gjWxr2SF1X7Lr4NT5YCSGn7YjO3MocV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942258; c=relaxed/simple;
	bh=oR0XVMUIIIvVwnG4/++JwPSLgtRmuoO7mRUzJKY0CJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sptU86j1m6KMYWaiQtgwgu63nPzEHGMpadNO3Gb5ZQEnbU9JVov1hPRVXVi1v3AH4VqNnwKtUSLGGxR+RrQEPP6G3Qeo7UdFvYi8HJPsZuckEJPkV6+Rn94THn9sAtPinLlN/GzcTsnUuig5s+F5cHSdIrHU+h9N82nbMtZUTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kC4R/Lk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kC4R/Lk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048F4C19423;
	Tue, 31 Mar 2026 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774942258;
	bh=oR0XVMUIIIvVwnG4/++JwPSLgtRmuoO7mRUzJKY0CJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kC4R/Lk+bdlb5hmoUtrtogQHRLnsD8K+ZhoQRRU744Bq6wKKlVKzxT4ktFrR3T5mq
	 nN1Xqh+vkZVzyWyFtCj10MGY+XKECkImjmSvhzcc9ABtcKt2ooeH7v7ZI9IalkhQml
	 D8XNYfFbe8nkkDXct+FmLcf9Nj/Duo08D+cS5ZXFmPVTLnaiqiuKI4G34h0k5hBQq6
	 o5zMUIbjxpbAAvOim7FGxTNwK1RIsZUhRzF2jvHjky2faiVKifKCf0Rz8KkPUDkmdG
	 68Pic+dxVlcp1GfivBelS+UNI/UUa9SaDg/7f5XiqnEviFghCcIj/F7zi7dwCJvPKV
	 E6BOQUcl53BXg==
Date: Tue, 31 Mar 2026 09:30:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rric@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: gpio: cavium,thunder-8890: Convert to DT
 schema
Message-ID: <20260331-invisible-certain-albatross-844cff@quoll>
References: <20260330080108.24294-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330080108.24294-1-i.shihao.999@gmail.com>

On Mon, Mar 30, 2026 at 01:31:08PM +0530, Shi Hao wrote:
> Convert Cavium ThunderX GPIO bindings to DT schema.
> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> ---
> 
> v2:
>  - Rename schema file based on compatible string
>  - Wrap commit message body as per kernel patch guidelines
>  - Use appropriate maintainer name and email address in DT schema.
>  - Change commit subject as per guidelines
>  - Fix $id path
>  - Rebased on linux-next
> 
>  Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> ---
>  .../gpio/cavium,thunder-8890-gpio.yaml        | 45 +++++++++++++++++++
>  .../bindings/gpio/gpio-thunderx.txt           | 27 -----------

This binding is odd and not used, so you should follow guidelines I gave
more than a year ago and updated recently and NOT convert it.

Or rather answer - why this cannot be removed instead? What is the
benefit of this binding? Is any other project using it?


Best regards,
Krzysztof

