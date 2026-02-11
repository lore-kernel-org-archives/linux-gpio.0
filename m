Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A9357A3D;
	Wed, 11 Feb 2026 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770841691; cv=none; b=HS/ehfDC33CAze+WpQYKD4y3696PbkTnx3kqMh/92Wh0BmHjXHPYPjii74vASO099e51GQxSmJXKeJsRsBDR5+cgBUuJQYpw/dgLwWw6GkdGPQOWxsreQgB8lEddqRfFANFCNfzxrPpUANbdkdEyP8SUUfSDXxJi/pS1CWV51ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770841691; c=relaxed/simple;
	bh=jWe/KLigto5fTNilNYxQhh2GO4BZRatUWKFTy7tv/1g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OQGUQw+7/w/eZddZTVJBshUanBb4BV1u+u7hpVTA35hJle1VEzQ6Xl0AXLMwAdvYuweeJ9IgN9AXIz8h0bWhLvof/egAWbemay2HgJchuw8PzN3N5m1NSn9eqDmGlmbJncJ+Suw5AN4m8Y8hPXbSP68S5MycVhd56enevyKcW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xl6uZo8F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xl6uZo8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39AEC4CEF7;
	Wed, 11 Feb 2026 20:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770841690;
	bh=jWe/KLigto5fTNilNYxQhh2GO4BZRatUWKFTy7tv/1g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Xl6uZo8FIQ3IWxAaUX1E2hus25KPcE+57Jdx5+3meCdruCuBTEUaxccUP1+n0IifC
	 zAX/ul9IlKhgkZMoRlkLIKRUnrsgo2wRCHld/a0nihZZ9yCFjCoUp41hu3iVm1fkVd
	 n+I591t+rkg5OFCzYmyoFSrg3eKbLAK0RJSZqXjW1jROrdmFR5EVEVzLEpIsPA4E6Z
	 7T2IydDOZeMFoct+WripEWF2FMsF01aBQmlfN3q9ZNaIGLYn9qcULNOW0Vvn/X9dDI
	 LhPIHFF+lIzvJ2kkyUS8VemOc1TnxmfmOEHt7Xg3ipBMaMQTrhyjRSUk3ngbWaGAFT
	 sP8Zp2lIvxRug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C237F39EF964;
	Wed, 11 Feb 2026 20:28:06 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260210092054.24697-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260210092054.24697-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260210092054.24697-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.0-rc1
X-PR-Tracked-Commit-Id: af9b4a56f0000fb11057e204ddfb05d72ba4dba0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d70178215211a7c73ecabeb55eeb0f8ef002bcab
Message-Id: <177084168542.710910.7357668844733574564.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 20:28:05 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 10 Feb 2026 10:20:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d70178215211a7c73ecabeb55eeb0f8ef002bcab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
