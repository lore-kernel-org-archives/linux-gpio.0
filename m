Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7878D405C57;
	Tue, 30 Jun 2026 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818257; cv=none; b=GgjVDZh/Ky9Wz6+rrToQGU9U+TybMxix8OSJ/PeW048Lbqc8/6a8Xxqh9otmgCSprTpL0uRqLDPhvD7bj1vU52SVQDBGmaXsPSz9k8Jrf5Q/LzHkJGGHUqj+8aIo4+d+aPwLbA/E2RSgNP3wDu7oi1jj0PgT6JIIcVKYKCB/AZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818257; c=relaxed/simple;
	bh=SqXDPxuUEPBA6RSGPQDfXuScJrrW+3dJT2lDmkN0Bc8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BV7uYeaRV8pbPDIdZfDagKR4K91ioek7ge3xNAmUcM6ji7eDzxWlRMojXLDE3aERFzi6cUxvcliU42KyREWSYjbG0zWV7RIb6cmxh2UOioRxbYMH6E2Eoo3F4oz18v1l5E4SaKCTpOg0bDocPhzQfkbWjMhI4vvzHXvoOaQlJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+xuuhyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+xuuhyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B68B1F00A3A;
	Tue, 30 Jun 2026 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818256;
	bh=G01esBgZesBaoH21ovsQs/6yWH/r1S5uFxbwi17A41g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=M+xuuhyK8n7fNsnJq8MMHBEZ5d/VEHIlqC5MJcRusdJd8PcVoGOm+4xBLDGK9GjoM
	 DUgzP6kerjpCtMv/f8zq/hGI74D2JamyGssv1TNpdxBSZGNFMni61yWW31bSGZYjgn
	 g+zQqNyVcJnqzSFdhgOWSEvLBndQ+nSqxd9GvH43TiSdzSO6MVLA0vLXQLEx1Nlx8O
	 4L6cDG520LdWv/v2SE65Sdli+aIwL5xMWh73U8+u/pmbCQT9wFEZqq6N8tL/KdLDDr
	 xYBBu3IngAKIdSUKBniPM5yJXoZeYBoovd9HgjRF/H2BPUK/cTB6+DHaCDRLCXtQ8/
	 1O26JUSl9ichw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Diogo Ivo <diogo.ivo@bootlin.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com>
References: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com>
Subject: Re: [PATCH 0/2] ASoC: rt5677: add GPIO get_direction and enable
 standalone compilation
Message-Id: <178275849663.47562.8092746831911734388.b4-ty@b4>
Date: Mon, 29 Jun 2026 19:41:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SqXDPxuUEPBA6RSGPQDfXuScJrrW+3dJT2lDmkN0Bc8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6XNYkjgeq471qkk3vz5/zDsFYlcO0ZlNWdHq
 fXMfOJXuyWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlzQAKCRAk1otyXVSH
 0ItzB/9EVxkas/KX1IrhTPM6HvI7vNLPeq8f2rDBM3fuvsdtzF4tZbQtjwMshVMH/rNeZFKhDyK
 qsVj88o7FieCV2cnfmv+jFa0uh+Fum5/ffcCcSrbcpH2XcVN0clW1emW9N6LW91xZwxr5OaMczO
 dLfVxFNnphWrOaU48x8ep0k33KKe8Wh9O42ayHgwVfBmmEv3ZypjJcSKMp/8DdfGbA2RpGoFbxe
 BCBDztxxwWnRn4Tqqzm09oOICNu2Rwdx6DQ0msz2NVcU50X+Zmvs6XtRFMbEYf3HHZUE0KwbTMb
 z1eCxqv+sqr5ZFqx2Wcrav8E8oXcEkpcbqZ0pswienUGmsi0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 20 Jun 2026 15:50:57 +0200, Diogo Ivo wrote:
> ASoC: rt5677: add GPIO get_direction and enable standalone compilation
> 
> This small series fixes two issues in the RT5677 ASoC codec driver:
> 
> - Patch 1 adds the missing GPIO .get_direction() callback, allowing
>   the direction of GPIO pins to be queried.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: rt5677: Add GPIO .get_direction() callback
      https://git.kernel.org/broonie/sound/c/99e361b2a504
[2/2] ASoC: rt5677: Enable standalone compilation for generic card use
      https://git.kernel.org/broonie/sound/c/a5edc45d9cf6

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

