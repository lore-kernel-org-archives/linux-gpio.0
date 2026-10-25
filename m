Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792909139;
	b=2e9KY8wiECb+0ntkMk2o7Vh3cHVr/pC4JjIfq0UDwD/9NJ/Sv1SH+X66no+zg4JXrsNR
	 ir0Ls5Iklr1fqbArloYsYXEZTTZY2cj94X5Tfxg4ciuJ9NuNjQwkctAabBCAEe5pnlv6o
	 fBFQARYbCD4uQVwKv5ybAD/Pqu8TTHga23A4J3EeH81tO9uleJ957zpRY9tohcBOIVroW
	 bYRMdqIhrGGLk7TE64hGGBaesJm9Aa54Xy2uarF8sEfRhpV24D7y5CffcQdqKMqxPGLdS
	 Kf4dWkvWuzLuIpNMIgtb0yZU9MZbJobnj/P2mSgLv35ZDJ2bMB88HA6Qk2tDnHPMFLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792909139;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=mE80kSeQnRy822DQdzD027tqTiplPDu44C6x00nRUWw=;
	b=y2In7IRE+Ohniz6LZLwT2C/ka54+sf9dEfUvK7+i2Q1KNI9b9tLn3EimvxyTA/vt0Uzc
	 NIxRyJ+0KYhhDBWMhq+LMwtQMoJg5VlMLmApSBR0dyYHh+Y9RsiF8jaVUKcbY0d2T3fZy
	 k4OyGeMCqdao//9wfdQXvTcHWc8fIXg+H+T1Rl5DtewQrPfraUTHO6b70PX5PhJ9kAnFU
	 iEr3PNV6a90869fmkdGjGQSmwxaCW1T88pKes3Pn00CcKYOgYT7IYK67gSVWlVK17WnVk
	 Myo9Y0DeaLqzTxdShXEBj/1x93KBgFB97zYDQdD2aCiJt0/jc5zyZn/EEMRTPSRQkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bQ0en68/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD78606A31E;
	Sun, 25 Oct 2026 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bQ0en68/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81CC1F01825;
	Sun, 25 Oct 2026 06:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792909138;
	bh=mE80kSeQnRy822DQdzD027tqTiplPDu44C6x00nRUWw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bQ0en68/coHZ27ABXrhX1glAPXzitTV2Zliw0uthOETGqTUuMeq+TnYWk+76Qr7AX
	 IOQtZLL2vaEYHpZiGS4ZSGETgvuvZt0SgloZWolRsqHtmlrAIu3aijunm4pLnLiKhP
	 5FsfzB9/qz/2lRg4M6wNi/sSUia9cjJys+D++PEvCJ2BBLkWtNvgC9sojk+aCKKvtt
	 DdwbTCBQaHEqeYtSwu7SPWAWewbvNsSMlARf8WQuGt6xVAdlTQMIsAkqxTzg8vdU+g
	 LDvmMydj2KDOKLK/szgtG+YTakERDv9GGJji8pTzX7DBjKwPWyEJ5yuKBIc/nkN8hE
	 rBetnbJV5JyvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE5E3392ED67;
	Sun, 25 Oct 2026 06:18:58 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261023084131.49264-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20261023084131.49264-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261023084131.49264-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.4-rc1
X-PR-Tracked-Commit-Id: dae739137441667d67fbfcc4d303a0ecc6618662
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9628ee0c2219daaa6374b0c5f5a5c0d55e0e263b
Message-Id: <179290913747.2017309.7425268997146101790.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 06:18:57 +0000
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

The pull request you sent on Fri, 23 Oct 2026 10:41:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9628ee0c2219daaa6374b0c5f5a5c0d55e0e263b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
