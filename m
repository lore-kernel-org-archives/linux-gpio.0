Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB72F36492C;
	Thu, 25 Jun 2026 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406196; cv=none; b=I+mVbjXw+hKjXWFQi/aesKIos8bGHytnLumSsxwu8mgJ+MCCrHBVpg02fMpueyT+9ZYlNSFjiShSVOPU1Hg39BJULZ9ruQUvvvD6iAxg85ISiDBQu1hHip67HtpHNJMYKmJZZfCTOtAjBxPhr3ljnBeog+w97yhTm+i/qWRA4nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406196; c=relaxed/simple;
	bh=5tkio6Css7vl1KqZoIL7N70VEEbbiR8MAJ30M3SmSKU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qU4uGNGsLB5PTiyqDFrDQHhs+XF7WxePq99N8WV6JE9tU3kC7kiMvy73Ka/QJqxayEs3vtz0XTBZZlC2PxbYFVhzXtOjBX/fK6Nc+ACMX9NUq6X1uupwWp3A2Z8PqbN/we/ayR/eypsIcgREQJWrgJFeYcNFSEX2ytVT+CKB+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fu1b/gjd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fu1b/gjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24091F000E9;
	Thu, 25 Jun 2026 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782406195;
	bh=nDC1pZMCamUGf34CtUpDLJJFqU1eQbmGuBE9YUPYIew=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fu1b/gjdl5zssXDDaaE5PwFPOCUrEgq5im6j0nxOpDLmWfOAOV8yXAs84kP0N5xVt
	 7bX67D8KWtSBLENO0eyIrPwlRh03y6boASH2e9VEA+kpJrcPwo77JxwcYrHPdJvhRm
	 nNpRnaYcRhq6HZSlgc4lT18uxeLHV108X3xkNEL/Uj0Zf5XwBTcUwShh8B01oyfNN5
	 OyxgD0tzzMlbAmd3bNVvxGo4OuBFabe769uoZpOxm5vrhpLg1uTMMsZSkv9/2+KftO
	 nFsxv83bcreYWLfIfjEgcWlfYg5nRQSrT7sFwvXJt5WgloscwfcoE7NkqjLFHe6XD1
	 0oIKIF7RJT/1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9388E3938789;
	Thu, 25 Jun 2026 16:49:44 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc1
X-PR-Tracked-Commit-Id: 4e8eb6952aa6749726c6c3763ae0032a6332c24f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 962528fef90253aeded29cee20a9b6ff3595fed4
Message-Id: <178240618320.3815539.13760964416755988611.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jun 2026 16:49:43 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 25 Jun 2026 11:07:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/962528fef90253aeded29cee20a9b6ff3595fed4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
