Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961714;
	b=kO8ThdQVQIXEPHGslQQWBQHeONAGM7CKAGl+AeZb7NSL/6Hpq2L/krSVkIg3EkcyNVK+
	 aEbUW0Bc6JMXipAyF+9x+5eZ27V/3ZEXTrkxpocV+g2qeN0P3H5dK8U4UqX+qoYjy/EBW
	 i6CuRxWy1+mp+HIx0+JfTp5hkhn0IcRWbhfwm23W//o1vDfCiw3gZ/O3+m6CCzXxpL2u9
	 UlovSjcVuGMg3BHDvRD+5TkLsNm5o/QH8dtmG/B5YDnmd2u+itfXxJN0fZ4hl3zuXt4gP
	 wRAiJd5p4xJAcgnL7ARptlhsPV+Ac9y80nYuAiuVOyy5QW9ww+hzOtikCYY+qxoPkXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961714;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SJABWFH1EbHnsRLCe9XR+V8wGcOmlcJhPflZdLNHQDA=;
	b=GHBi1bcZAf8yQpBXIWojsmXPyT2rl6J50JEyuRICcp3PP+/I1KulK6ekHbk7v9akA7/p
	 cxtTt7izgHQbuP21yTsNetaP2MA6wj/ij/P0v7IAlKsRcX0904Fx0dCm9dTLyl/CeWdWz
	 Cbf69XRLz2/MhAXhlNDSwNl54FdTbOoGZneCX8UvWkWUJmG0ufQI8hS1CfMoHcDbkQoSu
	 WiihU/gOHPcgC5NMLOFd9N5IpA5Ts+dJ0ft3yHaUWylKNIL97O1qT4unxmPdEZi0RXPA4
	 NbquzU0wETRnJ1qzpiE6miRCzk3hYDRbL2tnH5O3JXaLBvvHxq1ULjIRmE9YV9nspCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSX0GmzF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA656606A32C;
	Fri,  6 Nov 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSX0GmzF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211CF1F0089F;
	Fri,  6 Nov 2026 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793961713;
	bh=SJABWFH1EbHnsRLCe9XR+V8wGcOmlcJhPflZdLNHQDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OSX0GmzFsL78c79GWAApstp1Rs+vufda4aTjvhDRo9TCJphSeIL58v/DKG/S3VKX/
	 /hFp5jQAKnDAxpn1NI5dX0uzqa1djmIJi5o3Fk/BjdetUluE79kbR4CpOw9YaLS12M
	 dkJLG7dQS4UjXKN0rgwcae7wj8biVqRC/Nr7EGSNT4DsL2pV4tBnecz0DZCdkCzBXI
	 EfUKIJeq1m1jp7HTzPL0+cjDjrYfxcgHVvA1TgZD7OFVRe9Ye2ugX5qZLEfFOlzJ8S
	 CDJ+qzc7sfywAuOkVnED9YgEw/b/AgxU7lH8ZlHI3J/s0HSGKjNtyRNAqQyRZmwO5+
	 rlZQret8eOc+g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 6B08427E7638;
	Fri, 06 Nov 2026 10:41:50 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 ChiYuan Huang <cy_huang@richtek.com>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Eduardo Candelaria <jedu@slimlogic.co.uk>, 
 Esteban Blanc <eblanc@baylibre.com>, Graeme Gregory <gg@slimlogic.co.uk>, 
 Gyungoh Yoo <jack.yoo@maxim-ic.com>, Jerome Neanne <jneanne@baylibre.com>, 
 Jiale Yao <yaojiale02@163.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, Mal Nadar <m.nirmaladevi@ltts.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Stephen Warren <swarren@nvidia.com>, Uday Khare <udaykhare77@gmail.com>, 
 Wentao Liang <vulab@iscas.ac.cn>, linux-gpio@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261104182148.1176116-1-lee@kernel.org>
References: <20261104182148.1176116-1-lee@kernel.org>
Subject: Re: [PATCH 00/10] regulator: Fix teardown races, reference
 counting, and error handling
Message-Id: <179388678317.2912885.6316009207520321878.b4-ty@b4>
Date: Thu, 05 Nov 2026 13:53:03 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2701; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JHBlqJImt4bRdXCyLfkQzNj9dV04j8BwxbD41vTsen8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLernvJ9Pn+Z2Yz+4ZdM2tlrk/ZGSF8Zc+14i1Kefd2V
 gvYaFh/7yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEDC8wMsy9l3R2odQBZoMM
 sY25bPtcm6bmyqhsmPItgu1Lo+Gr0y8ZGa7EPl3+5F3rJX2PIAcNoTaTz8orevU9BBPO/m7vWNX
 0iA8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 18:20:50 +0000, Lee Jones wrote:
> regulator: Fix teardown races, reference counting, and error handling
> 
> These issues were reported by Sashiko.
> 
> This series addresses ten bugs across the regulator core and regulator
> drivers:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[01/10] regulator: irq_helpers: Clear caller handle in regulator_irq_helper_cancel()
        https://git.kernel.org/broonie/regulator/c/86dd1c48cec2
[02/10] regulator: arizona-ldo1: Avoid double gpiod_put() on enable GPIO
        https://git.kernel.org/broonie/regulator/c/2eb7501c91d3
[03/10] regulator: core: Flush delayed disable_work before releasing supply in regulator_unregister()
        https://git.kernel.org/broonie/regulator/c/e0ce6fe8f235
[04/10] regulator: arizona-micsupp: Cancel check_cp_work on device teardown
        https://git.kernel.org/broonie/regulator/c/e7cbbbfba41d
[05/10] regulator: core: Hold supply device reference until constraints are resolved in regulator_resolve_supply()
        https://git.kernel.org/broonie/regulator/c/b554fe98554c
[06/10] regulator: core: Use ktime_get_boottime() in set_machine_constraints()
        https://git.kernel.org/broonie/regulator/c/f6e7157f9369
[07/10] regulator: bq257xx: Propagate GPIO error in bq257xx_reg_dt_parse_gpio()
        https://git.kernel.org/broonie/regulator/c/a6e1a47ba91c
[08/10] regulator: tps6594-regulator: Fix LDO4 n_voltages in tps6594_ldo_regs
        https://git.kernel.org/broonie/regulator/c/4c03bc1cda05
[09/10] regulator: max8907: Avoid NULL idata dereference in max8907_regulator_probe()
        https://git.kernel.org/broonie/regulator/c/8c7542439d56
[10/10] regulator: rt6190: Check pm_runtime_resume_and_get() return value in rt6190_out_enable()
        https://git.kernel.org/broonie/regulator/c/a94cebd751c5

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

