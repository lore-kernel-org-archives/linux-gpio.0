Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750639;
	b=pry8wATqayHV6KCV21agO/8O87mFzWfAIuGeYiYnGxBkZT/fq3bHG4WqW9MJnq/PkWWV
	 dpco6lPRctcPDNFzQhDCQhw+S7WcevLTKSEHv5CwhD78CE7Rf8MlEoMbow9Z2qqvB5oP1
	 D257t5n1tRXDXfPz00iMsc8ew6Qte29IvbGVdT2Diwy4UePJVTUT5ypjuQv+j8/UKgzzM
	 i/WXf+zEjFGJT6DO1nPsu8OfhLOaopl2g3YtpwHPkbs9eVlY9Ijvr+Lq1hVlrRQCbYYF3
	 g+76opDp1uGpzLSl4TMIdVuQ21s4hUs8E6hD+ADxvCyi5d/t0OTSu3co4PEqo8x64sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750639;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=r3aZNOjnOM/RLfGwhrGPiT6hvhTdWlv8ilJgJsRefAM=;
	b=gvR9DPrszw+7JrUojSoh3LneT3U77jfXMwdT1eb8uXdK7FwZlah02nRX+FOoobNayZ7E
	 mjOP12fHw/xR/V3quymefjaSXHGn2dxKgd3/djBEUaZxXsvpiRYA/FyEPWSOv2Edv7iRE
	 oVyNmT+hc194NINShhq0OaX+7754P93ByS/x0ZZej+sX3fPq1OI3wFzXD3aZmL41EPp9M
	 tCYA47QD7xl2byxKZ6UTXuyPRwEU6V/J3WSHVrjuX6I1QhTKY7WvDNQcgYACIzfz/wMwX
	 /CQALGzo9+xFpU8AU/zC8D5hGXZWTXPcLp3epBziNBs1YATFkYaQ4Xl3KVo2FssUJ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZo2EQLi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF62606A326;
	Wed,  4 Nov 2026 00:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZo2EQLi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFF91F000C1;
	Wed,  4 Nov 2026 00:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793750638;
	bh=r3aZNOjnOM/RLfGwhrGPiT6hvhTdWlv8ilJgJsRefAM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fZo2EQLiQLmXsVQtfqJn9K0aJAup+2b64+8RxhRo9vunFWhP0f2LnKQHxQF+jsoq9
	 skLL8QQNstbHbMWoAoL9jtJR987KfPk06f8u2NQhbZPbnhT4rUj3zzIb7aabqphgsw
	 lEMUzEOvT+LK/YEK8eowLdX3grzTtZqtdNSUU7Lu7YbJSIU7FzCkB3qiqGMHyDCV3W
	 fbWQVkRfPWV8yVphB40+rbhGeYIaf3pvhCVpOB6BWwIF84AcVsNXKIOq9JQE/qIEOg
	 Nw7XAP/beq7POH1eHhlgLNYjc/PFxITfzJUhQEWxYx/1Jn/g4hxH0ypuMUEGfkUK+S
	 sw0u7UOcFF4HQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9671C25D853E;
	Wed, 04 Nov 2026 00:03:56 +0000 (GMT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: pcm3168a: don't request the reset GPIO as
 non-exclusive
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com>
References: <20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 00:03:55 +0000
Message-Id: <179375063580.2186205.641519776071903771.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=515; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/+o8Fyciyj1JLUP/cU7r+cerXZbRxFpxR8o9GIEFfiY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeleV8emy42vjhs06hf5cL5G69Djy7z0LnctSRykT5z
 ysC28+86ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBECp4y/Pc2KJ3q3NR2Wj11
 Tut2zWscrV6CYScfTI6wsZR4b+oQ/ZHhr8T7Dwr75XdEpntemOgfqLU/VYJ9p6jAlMrz2fWrOX9
 kMAAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
> rely on the GPIO shared proxy. All users of this codec driver are ARM64
> and this architecture now enables automatically shared GPIOs for
> everyone. The driver now longer has to care about the sharing so drop
> the flag.

sound/soc/intel/avs/boards/pcm3168a.c would beg to differ about this
being arm64 only, though that only has one CODEC and shouldn't share the
GPIO so it should be fine.

-- 
Mark Brown <broonie@kernel.org>
