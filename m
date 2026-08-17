Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC09326D4A;
	Mon, 17 Aug 2026 06:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949076; cv=none; b=Pb3H/3ZZhUogixObWKMI4BcrEMZ3VZpKXXyyETRBSiKZkZnPNcBMg5FLAB3ux1ZnA65ADpLs963IZXtGSwI/mBYqli8thUHcl+PmE3dmFqj14ixKeVcwVVeSApkUKmqW52r4KNoysXsBtdEDvNKBk5+3zS7LbF/pNlXRHsuZ4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949076; c=relaxed/simple;
	bh=Msfvgi7qlK4IS4PQwqmbUT3aJ4WpqYrG/ZQAS2N2fNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWAREWJ1XB+gdt43PGrEgKaEFEwc5Yi8QH3ntd7KJHlmv4oB02sOPsIGT+IC1qmpWptCWcHliM2ad3iyVZmE25cWktF61ufukRCoB6GWFCbCEmhkAxfjYcOBsa+WYgx/y9Hmqw6bPnt9usO9Cd0x+Sxf8bVqIiY9yxiT6NvqWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0B4p/lg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0B4p/lg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6731F000E9;
	Mon, 17 Aug 2026 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786949075;
	bh=Wwrt1tSO+ObTIAvJDiC+q9v5Mkn7NyI4zZb78Q+U42k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E0B4p/lgNkDwPetEXebupGsNQaL4XvaxLAu3lKaITjbIshxEm5JE8/kUiDJfX2OQo
	 jfLKyhkvQs9w9HyOmzNoQ7poc8Onwuoa87u6brIkoO8+fdtqEnDif5wVkVVtvR86/Y
	 OI7Ef7HNxyBmBylcEaSBls3zmUy90u0duHvhp2rZ/J2MALsIjSKMTloI3WnZG/ialM
	 DduIC4ztJpSyJk29PoThR/Lk2HxzjeNbH1RAFyZp2RxTkxd+bDzkWJ8IR0ifsZkpoz
	 TMGm3reHioipOVf1ay7erfyiqK51Tsu+jnRdbh3AKFt5AaOiJ2J66850yVqzRB+2u9
	 nBdWDg8TPBqmQ==
Date: Mon, 17 Aug 2026 08:44:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
Message-ID: <20260817-perfect-berserk-sunfish-ef2d5f@quoll>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
 <20260814-cv75-v4-b-v4-1-ef2e83ec0eac@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814-cv75-v4-b-v4-1-ef2e83ec0eac@ambarella.com>

On Fri, Aug 14, 2026 at 02:25:41PM +0800, Long Zhao wrote:
> +          - vin_master_sync
> +          - vsync0
> +          - vsync1
> +          - vsync2
> +          - vsync3
> +          - wdt
> +
> +      groups:
> +        $ref: /schemas/types.yaml#/definitions/string-array

Why are you redefining existing property from pincfg bindings?

Since this cannot be tested by automation, I will not provide final
reviews.

Best regards,
Krzysztof

