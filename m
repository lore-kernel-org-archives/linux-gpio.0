Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBCA78F2B;
	Wed, 28 Jan 2026 03:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569339; cv=none; b=nFeuaPwBr8lCVl/icXgn0OLMxOQ2u58hWZuazuZmRzWwyWoOC/60liDkkh4SHNiaTvgZsQASeN+LAA9VwZ3/AfpdcaYvJN4Lfn0AkqmsrQPCovGPXDwLhBMtzor2NNr/Qw2olYJ7Ehc82SKBy7Vr0wezTdhO4OO+rWQ4JvoLfp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569339; c=relaxed/simple;
	bh=/fPPEPcwmF3TdH7Q9cOa4teh7j31CwYm2Qus1YwzhtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rfQ+ZckpiOritK1RMJjPxHI3MC8PRzAV09Rkol2K/3MxGPf6kGUMW4YXj85gwCqicECKS9zewA9ErQvBzYWArYZaLzb9tmTt/9Ubnx2MDDpqJv6gtW9v/K5kUfUvJpG1ZFO+63E3J5tby+cHM3fYY96U83YAqCpPki4fT+/7woY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XV+DvkAl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XV+DvkAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90E8C2BCB1;
	Wed, 28 Jan 2026 03:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569339;
	bh=/fPPEPcwmF3TdH7Q9cOa4teh7j31CwYm2Qus1YwzhtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XV+DvkAlwmNQm9QvMt+Q/bf1nQ8qCfkHzvgXEXvvyTM4zNf3FwGFtoGZZiGpN2Byt
	 o/+X9ATo6AIzmbpc0hYgct4hMO2OUuS8ywmb0R94aNA4NevQ+iY09Nn+MewQB96Lxy
	 xU4MHG3Mihth34JQkjviSKC4kzVF9bZkJ1qny8jKIOtDIkJE6W5NsxlW5jl49W9fwo
	 Xn5b9zDHmr7KqHF6uHMKB717qVT1fgFOfSyW1T+CAE7whO3tpwYKIg3m/kTFGQra8K
	 Rct+FsktiojFg2kdZGbGspWJ+UBO1Y9yBJz3lgaR63W0qf1tXpWehV/l+RNzgRLg4m
	 oQFrC9GXrNhfA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
Subject: Re: [PATCH 0/4] ASoC: codec: Remove ak4641/pxa2xx-ac97 and convert
 to GPIO descriptors
Message-Id: <176956933650.1515833.16491235295905220325.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:16 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 22 Jan 2026 20:44:56 +0800, Peng Fan (OSS) wrote:
> The main goal is to convert drivers to use GPIO descriptors. While reading
> the code, I think it is time to remove ak4641 and pxa2xx-ac97 driver,
> more info could be found in commit log of each patch.
> Then only need to convert sound/arm/pxa2xx-ac97-lib.c to use GPIO
> descriptors. Not have hardware to test the pxa2xx ac97.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codec: Remove ak4641
      commit: d7e1f9e84af460c5f1e5352eda8f036000cfcf0a
[2/4] ASoC: codec: Remove pxa2xx-ac97.c
      commit: b094de7810f3c0340a3aebaf6b8fc60c81c0cf91
[3/4] ASoC: pxa2xx-ac97: Remove platform_data
      commit: be829277ef79aa626e952e17030d711bdb6c1eef
[4/4] ASoC: ac97: Convert to GPIO descriptors
      commit: c76d50b71e898694c946993eb3c77f50efa97254

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

