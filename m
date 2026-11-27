Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809501;
	b=RXNznvgFIocuVSRpWujZLSoE4xlfVl1a9dl1dHYDI19lYLQqCd9YckOxurOsGEWLYctz
	 jRVjJFFN092TBANrky0Zo51blwB6PhVYCOXFwpEiryZC34KRsANrK5WUMdYRnKnarquu7
	 Lx5S32WPHcaoRO3XjnlBy1078Cx5ksPgk4JSqlqxlHYN7v78Aiyi3ARsecvPYI3S4u8BL
	 EzfdRuda5Tekt4ellOBl1oRX8YTRHw5ogZXyBtwMYFNCeoBLCL3ysCjgbBxxXs3w5tTL2
	 cPThG5yIxNSF5iLPL+zoydSCiIKyVPq8/TcIPky0b9EflWauLq1RKysKgeXXxlwn/5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809501;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=ZDRnQ+NwPc9rh4R0F6/UdLWkcLhl/FO1upQfLcHJdYo=;
	b=FCsYb8a5J0azrit1xWYTFZqxPMLnz1d8xOA82286I0RYe+Vg+xR2h6ZdkD1MKjaFeBnw
	 CFaZzTOEYrsWpYag2xfqtRjkqYEtAW9OCPf22NoDFu1daAwgX8wVQECR6ouiHtlrRHJD0
	 E415nY2yXXTpQuTOcMwFaG3mnBDvmHRs+7+t7yLOIS4pK2+Ze/8xUpYv9pvqieU5ZZFky
	 oZivillsJSjUASo7IKWfuiovPvlG3VWI877gUZeLLJ/X8txGtuwDZ1Ef8QpkiVLbR0bMf
	 iMptUAl4o+LMx15P3ISJWiICb90EPAA3U7GIfoh2VvMVbXUYJ6r5pUa2WpwpsHANO+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHlSsJkS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A626606A31C;
	Fri, 27 Nov 2026 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHlSsJkS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67781F00897;
	Fri, 27 Nov 2026 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795809500;
	bh=ZDRnQ+NwPc9rh4R0F6/UdLWkcLhl/FO1upQfLcHJdYo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EHlSsJkS1cScPSuMAj09nx7/Fow/rjIsHWB4rcLcbmfdP+GckgaRgG/2oRgkXoJzM
	 aSatusdWklthuiPZ5PcppRxi9aVYa15V3JeDD4AFh+aWLcImI/1mOfphZYytJ6zv0O
	 SkotleY/FhQbIr680km3mfoUMsbCiWUS2tpVMwj3F3ZXGNG7bdPyIol1nn+9tYOByO
	 zUgGTW+LKoLaCYH1ajGOkbpbJcAhcU6FJx+YayIwpD34c1eDjxO4UG1s/t+yNHBvqA
	 s+4fgJEk/yEyOPjharL1Ze5Gpd5MTuk9PAJQSNAzJyhnm6oHj/44UbvWP4Jh9E60hb
	 p/xQ2TOAJdmPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE80D392705F;
	Fri, 27 Nov 2026 19:58:20 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261127085000.18053-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20261127085000.18053-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261127085000.18053-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.4-rc5
X-PR-Tracked-Commit-Id: d8e27d04274746093f8d5a4e909efd9885262166
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3852adbb01116275eadf41c67af5ef68abe9755a
Message-Id: <179580949931.1663999.8785666347017372053.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2026 19:58:19 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 27 Nov 2026 09:49:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3852adbb01116275eadf41c67af5ef68abe9755a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
