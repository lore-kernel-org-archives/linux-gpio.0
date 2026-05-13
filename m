Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57FE3B83E3;
	Wed, 13 May 2026 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699383; cv=none; b=qh9lj2LDJavIx/KijxcZZJU2me4h7eBAK99aN/uS9z5vZchmFABrPA540lWclWMMj4n7+xzNZMG38Rx566fxazHXanuYeEht4zfj0qmzOsCsPldL5OOH14MI+rckCXwBB01grPzrJc7NeAVzwjIIL3hhAZx0lgYtRkxsLA0SxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699383; c=relaxed/simple;
	bh=3DRuXLO/vyTluuUCVKw2ymdDOt5XQVOglfZYZ92JnBY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFrNnf7FvG5y4jbbUwElmTkcJSzp9pIcr1R6kWihz+GR/2w9RwZgk1bSfZEAqT63tyqm2GCojubCRQhqcHyIOHzgwdL3Wg+AVeu/946kgeZqCEpovhYqA34x7veoZaPKKTnT8uSPcwVlusKGpdVVJdD27bkVuHd5Ei/bWlZeaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFg901xG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFg901xG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDA6C2BCB7;
	Wed, 13 May 2026 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699383;
	bh=3DRuXLO/vyTluuUCVKw2ymdDOt5XQVOglfZYZ92JnBY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EFg901xG0VaYftg7nXx2corijT7wrLLdQjVFMBwfhqTzup8tgWRKfyI+Ck1CrQIkh
	 VYHub00FBpFUapPM4oMVGdyxoOUp90Bvj55wEBn2KMspbQJAtkq+l4o9YyzlrkarWa
	 z+1FdT9skGvnGm859LZi7f8jXqrckBjs/Z0HydrvZ14hp5z3eea2wCnyflS+XaPZA9
	 hll7FNYADUJ02/dx/L6To9CeOREN9X1N+77iY3OSCN2HKM0bSVbvnW64NyHDKxDTTd
	 lyA8z7UKL4Xk+CeegslPOF58FhHmxQjhF5tp6dB6HT2knNs4oXo+4bultgkZTPLEQs
	 ragDuSjSqcmOA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH v5 0/4] SDM670 LPASS LPI pin controller support
Date: Wed, 13 May 2026 14:09:23 -0500
Message-ID: <177869936446.1496622.13590516840997637362.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 31 Mar 2026 16:06:54 -0400, Richard Acayan wrote:
> This adds support for the LPASS LPI pin controller on SDM670, which
> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
> not sent yet.
> 
> Dependencies:
> - SDM670 Basic SoC thermal zones (devicetree nodes are touching)
>   https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
> - Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
>   https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sdm670: add lpi pinctrl
      commit: c4b423835ee7529854ab39b50cf766bc4c6b4d66

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
