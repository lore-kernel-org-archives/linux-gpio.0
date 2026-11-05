Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889664;
	b=oeSi3IhqL/93XqiE/o90xuv5Lx69m6IIXVL3vfou8UqHz4CB2irDGXYFIP0yR7quuZlu
	 v1c2cyPnQJzOy7JL7FhQgLmrlxhOEZUkwBGd4UvxUCI7ORdS14XZG0E5YAxOLw1p86JnV
	 RoXc0xPoe7cgtytwsF1khyiD3fH+doaGYOh7RNAhFz+5joaIMNpDYaSFihcaOonLkHlp9
	 oJskMoFRLv1LEORfG6ynFvoQXk1f06sZU+4/tHpkAS1iFNQLefQNEdrD4qd7gUvrU/Lzz
	 qCmHfY4Ng2vcMSuV8eJ+pJnvsBKTSt0wUOUhMqOS2fv1r004JLG7HoQcVPl3h4vjeQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889664;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ASfPtIf4/g4D0b8rceRY+jLO7SJuXGW96/DCbiFkD1Y=;
	b=NyltMaYQRmLFbPQlXjAgH6M8gFVpQWM9PRb0l59jZJnIEFdOvrnLcZvQVqRV0SE6kGiq
	 p6cERG3lbCBXjMUP92SgDbseeMY/M8IsJ4XgNR/oc2zWQnFosDlYVbkJh4LMAi3nSMaOE
	 qKzgnvfmQYygGQb4qplmDpE7nNK61UQEuC5oV8MuwsdCAaGFjGl83EGbnsuMP0T2YieOf
	 576xuFuY+BI9U9yklO0JVe0ooaJBKZSio3B+3tJDSgh4J2XjKEIR4pKer0QKugG8AoWGS
	 +brYLw+cOs7GCxXNKF1PgVZfYr0yErLBobIa+pHSPihc+d1FXZczsfyYhLtSjlnzVEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMsbcMyw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBC0606A31B;
	Thu,  5 Nov 2026 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMsbcMyw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73441F000C1;
	Thu,  5 Nov 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889663;
	bh=ASfPtIf4/g4D0b8rceRY+jLO7SJuXGW96/DCbiFkD1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eMsbcMywTtrtPVt3U9oDmsABsUda1G/gcuPItqYS7fo12yc2V/R/mkiwCNCa3lPiP
	 YFXxCVZMq9ZRq5FZQgTYFF0s/Wf1+1GSOZj56zQo8lizu/2KTYZ/bjawVicVVGbfpG
	 OBZbsky/ycsdCiNHlvff+5JyTlxLxmiUwl+rV/87b+WETwDNYfHrotdrShCElOFJHE
	 OGAvyVXHCHfhlr20xA0l+KTKXmG12SgW7yVb0h+dh6zx5P4qM5IH8Cxo2rhPys/dK7
	 /88gpb8o9DW9Vgoe0POBQtgy4DmwnAqkpLrQcZynDvZXSBdP4fLZTs8MYNrIbD7MUb
	 3AoH3eg4l6STw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AA82A2795DC8;
	Thu, 05 Nov 2026 14:41:01 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20261105-pcm3168a-non-exclusive-gpios-v2-1-982577248ed6@oss.qualcomm.com>
References: <20261105-pcm3168a-non-exclusive-gpios-v2-1-982577248ed6@oss.qualcomm.com>
Subject: Re: [PATCH v2] ASoC: codecs: pcm3168a: do not request the reset
 GPIO as non-exclusive
Message-Id: <179388122036.2912885.4833618934923117964.b4-ty@b4>
Date: Thu, 05 Nov 2026 12:20:20 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9Tm1jLby67bY2odbMbQsQv1Sc6WvT9/fWpx2cuUKMBE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeTK2175ljzBR9ZtGf/5E7OpdrJZ2+lsggNNmyd2nct
 DnOXZJrOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRngKG/zkHHu8pdjQOTHjz
 02niltOlkvesJz24xnfZckXdrflKGvkMf3jFbYw/FuskXspUrS3Ue79EJv2grXs/78SC0lB2r4P
 +HAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 05 Nov 2026 09:42:25 +0100, Bartosz Golaszewski wrote:
> ASoC: codecs: pcm3168a: do not request the reset GPIO as non-exclusive

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: codecs: pcm3168a: do not request the reset GPIO as non-exclusive
      https://git.kernel.org/broonie/sound/c/d51f9833022b

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

