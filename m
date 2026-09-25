Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AA34DF4BA;
	Fri, 25 Sep 2026 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361789; cv=none; b=rfHBydLXqIGdsrnS9XmVLb0pZmrhcs032ZrQL0Hv9RASftK6eKF+PiZhE/DBi6OljZvAXmAzUdJjYi3yi7nTYOh6Ihg3i35eQLdutwrvaq1htQXzIuuwwO2C2XevqucWuazkWj5yM/+ZuIkcJ/FVJ8lXvN5gzWsKJrbkmlJhqy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361789; c=relaxed/simple;
	bh=M3eyXHU774bbNAAr0Ool6V346ffZ2HSmAdOt2axnDuI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YwJOt3FRODGsOUwMnxwx3ZGUXTt3pJt+ur0z3NIPvivhAnqeb7ZkDIIZNb64DiGmRRR5hUPGoAVRTieKjGoXFnCyY7bZHeoCaFjW+5d43kJFhvxAYJCZg9HVhn8InVVpHFDgNSjJbLOaa62JDQNhvs6elrHnwADf6E2hRxcGQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTYmpfFQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTYmpfFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89181F00899;
	Fri, 25 Sep 2026 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790361787;
	bh=dzbhzGtVTo5LDAEE9mIll/R09MKflkhK+1nWaQvoY0k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nTYmpfFQMEgR9Q1RmNNfbjRFX2BbLCGqwRv/DX0IRW3FKTE36ytYYnPfZbekyQ+hN
	 iXRdJzEAl4U4zspuIQfHa9PTHAjrpxHbSXqM3r4d7JAYJr4Q+T30+Xjs/Jpe8srfVm
	 +bM2eb7UcEkUW160qLkUwHbg7w48/xkMhkIyb7JoxCm3bhRsLj/liggYIdUkqPPavs
	 QgVYLPqKkZK+iSgLw4P9c5kTP70ImhRn/WVyUtFvs5S/u6P2mdOuhpOsVfvbMczqlE
	 n3Pg/MudyZH9ZDEdNfb+UhL0GON0VAuAHQBK+xE59FpVieE+kQiJstkgKmApuiJSri
	 7Xb/qx7Mk3bXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC886380820D;
	Fri, 25 Sep 2026 18:41:56 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260925080204.9234-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260925080204.9234-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260925080204.9234-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3-rc5
X-PR-Tracked-Commit-Id: 270437f3fe62516f16482742a7762a075e7a9457
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 80e466f0c8acc545159a1f1fcca62512bf848413
Message-Id: <179036171542.3089752.7845164512566603672.pr-tracker-bot@kernel.org>
Date: Fri, 25 Sep 2026 18:41:55 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 25 Sep 2026 10:02:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/80e466f0c8acc545159a1f1fcca62512bf848413

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
