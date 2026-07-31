Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D811DFFB;
	Mon,  3 Aug 2026 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758756; cv=none; b=mbNr2KFI+f9f8OtbUVZ70u2oflvyNtrOYrwjgHx20hQ4ITFCeRnp5tGRsXE8jbN2Fr1ZNHUyQSGe7qkdC5KpwoUlInE7dFxY9wfweMe7wJKXVUICanAPU0Zfb3vQhPJnAuUt6wDSy2UivUM9i/yCiodJo3ezwqQ+dMkznRQkJ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758756; c=relaxed/simple;
	bh=o9BDYjroSfvjw6WE8VUTd6Zi89w2LPG+xHYD8KX3P9I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xj47M/HtmEvY1BUvgkhsa3Aivb6w/ImOAPlLMSJ2zc7ilJIfdf2XBf2Ce2nQygS/RcVrlWz28T/U8pBar5w8JOJAgpTD1zfU7LyctDZQzfGjJdtkbFiYngOfJiB6PkI9bPEeUcSxRER30psab9uJscS2U/6Q4vNyKZa2QAaceHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Si7N9zre; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Si7N9zre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B932B1F00A3A;
	Mon,  3 Aug 2026 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785758754;
	bh=9JDu+Y0kXE0cIuki0Jpsoq3K8xv49qjhQ8yZxe90Y28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Si7N9zreIbejL2eQ7ytQI2m5sEypUc+eozaAqI+LJbcuypCS0HfBIUJ80yt/FqVWB
	 cdoyUzwn6GKIvWGlBReJFpTe+xKtt/NhFVNsxHnVP/62in7JVAaOkmh6N3tjOX42Y+
	 vMpHevScEROoptD7JyDMPif93BiWNo2Q+io5cmgyXqaYWIC5XRASnSsx4FR3UMCZ4c
	 S1zI+QUq12tiUISY7vKWIiGRRhLwX6ZmUGIzbcQsaVb7oWwa6BWFzT6wbXjeaZKhFU
	 8nIVpcz7IMxLTlF13ss0gpy0ICFPm1JGU8t3mQ1jURGY478oSQcpvq7H5J16AGWGiP
	 dkyNrZdeBdJxA==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 0/5] Subject: [PATCH v6 0/7] ASoC: qcom and
 pinctrl: add LPASS LPR voting and Hawi LPASS LPI support
Message-Id: <178553935171.353541.12577645858362068543.b4-ty@b4>
Date: Sat, 01 Aug 2026 00:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o9BDYjroSfvjw6WE8VUTd6Zi89w2LPG+xHYD8KX3P9I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcIQewSTDm+2N9X7G/ueL8x+82BXIH2i/PCrwF
 1v6fdKeFLKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanCEHgAKCRAk1otyXVSH
 0HDGB/0RSBIfyTLGmxlApye6wypM9TQMVo/vsLP8Mp7edZ5SsfmNk6a3yitankVnffKNo+OV+Lt
 9rA5RvyxS7vDs6COymAyUmvYR3GqENdg0TQk9gW/+Q6byKgDDIRnNOY5CfVGcS8rb2FK0oRJB3B
 vh0eainnp/f4nqwaww4seIxWoB4Pa7EHNro1TwREMvXxMTrvDCBf29lq9bPsMs4yAXp/jPZcL2e
 RQjlXgZH+xJQD6/tXfymdRVh8zN4WPtAFoVz9+Fb5doS3bwdhxlhFEa8sTvHHOygSvAS/WOAHP6
 KmsjN6tXT7OV5XeLdTuQGO/Kj2m+44Vpy7kxPkWXIHQDcIE5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 24 Jul 2026 19:47:03 +0530, Prasad Kumpatla wrote:
> Subject: [PATCH v6 0/7] ASoC: qcom and pinctrl: add LPASS LPR voting and Hawi LPASS LPI support
> 
> This series adds support for LPASS low-power resource (LPR) voting
> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
> platforms such as Hawi.
> 
> On such platforms, LPASS requires LPR resource voting via PRM to keep
> the subsystem active. This is handled by adding a new clock ID and
> support for PARAM_ID_RSC_CPU_LPR in q6prm.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/5] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
      https://git.kernel.org/broonie/sound/c/cdba62ff7413
[2/5] ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for LPASS LPR vote clock
      https://git.kernel.org/broonie/sound/c/037826ea448d
[3/5] ASoC: qcom: q6prm: add support for LPASS LPR resource voting
      https://git.kernel.org/broonie/sound/c/42cc644e071c

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

