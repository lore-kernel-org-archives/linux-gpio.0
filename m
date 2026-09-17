Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0BC50276C;
	Thu, 17 Sep 2026 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665220; cv=none; b=f8lFlNpcraXBA75P/HTjj0PH4+zYwWeoUrwnBfaZgu6WFgKqqb5g0zwshbR/lCntGKXCsWQ47p+WO6Lb80B4v7iHSQx7jyv1Krrxzbw0tvz4IB50ekhZb2zha/D/AobIiKLfW5IYVtS6jRasyFulE0qY3FLwVrSx/XReEqinm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665220; c=relaxed/simple;
	bh=UoCdH6iMt+ehc/UhL4ak29Jrtjp78LHMetsQ95UDQiI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Nr48JnFhPeqZqv9eWh2roQhK9opTuJbh2zPcuVFMmdGagFS6CEviZ4DJoWbisOMut3/SdwQ1hRUI94P5X2hbhQQPQFl2CpaaQXWv6kkXxyCqXpvWkSyFYPWycMXrtmRAbDqorg/lJC2MYZqVxfLJglRXJ6PiLMvPziOvYNFM5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6b6VjX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6b6VjX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFFB1F0089A;
	Thu, 17 Sep 2026 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789665216;
	bh=2bv8xaoAsr4MV95PUKjzms29S5El0cxacqpKxFpJSvw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=h6b6VjX7vihDeG+zOHjveQ2xy6tk0Nt4qyDgFnIloCiLn/LOdkJ1Iin/qoLyu6Qc/
	 n1HSwk6inLAOPmurnTNcESpB4g/+m0KHwSYIF8IDpvqgGTIBnF864AWlEE0QavL3XV
	 3lcNJ1UzNfFudFJ+qq/x9awU7gsoVDW2X39SxqvINLS8J1iIYn4cu/tp5r8LiVpD37
	 vr9BmBPq+qEyhF/ghHvfJPVKU/LUA27QDPGpNBxNQqAV4ApSmYGFT1Vvp4sXekx9vw
	 9XWISXn7n7AwEfrckVztCjgstlnPZWSC17xxZKUmUZxmOeeg4vYDMjmbWjaZ/LP9Vc
	 gg0ou426Ta3Fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5692B381197E;
	Thu, 17 Sep 2026 17:12:31 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260917093442.6439-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260917093442.6439-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260917093442.6439-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3-rc4
X-PR-Tracked-Commit-Id: 50fd0ada8d37587223001600933270b59cb30e19
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 61cc777ca7a4280568ec3a8f730651d482f46e55
Message-Id: <178966514999.3773542.7243972506912194768.pr-tracker-bot@kernel.org>
Date: Thu, 17 Sep 2026 17:12:29 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 17 Sep 2026 11:34:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/61cc777ca7a4280568ec3a8f730651d482f46e55

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
