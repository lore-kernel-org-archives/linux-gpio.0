Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A7242D6B;
	Sat, 13 Jun 2026 00:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781312147; cv=none; b=QyB/YNemlVV4DM04A7QI8S+4icP0QNZcO7fbOYGxGL/3aqg9HYmPfryGVnJWz+BUoO2EXcnUnt/S4HAYu6FObT4tBhrTfRxeFjK+qS3mS4kjgTE10YP/nmNl1md5Ms9gHOKjbmfl9iLtfyLaI/KAroFA3PHJ/RCRPYK+/Tk1gWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781312147; c=relaxed/simple;
	bh=OpIKVSBzzkZnISnemIM/6/VbQRBqVYILK6ykKTpRp30=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DB3FtYPPb6Ku88OS/JU1rUob6GJC0DxFJNehKvEGCbHjZJkLb0EoC7eGMDHWLHqkLw4gb0gwdIzfLmUB5yFDgV1hxxV4xhdto1ysuvs4wmLVyJH17dyFNBmOy2lkdmOpZb4HYnOQ1VIEmC8iVZddjvUOpB6tdSDuzH/0oAyQBnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iY1FSD1A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iY1FSD1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8436F1F000E9;
	Sat, 13 Jun 2026 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781312146;
	bh=070Ab9aCL/P5ZwyX8V2hOi7andK0IuTkwhkXoYutxdI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iY1FSD1ARmwEwEATUacWzlmKmBN6Dq8c6L2d3Rk4/L/KSyeKPqWwv6yBHWz0cjzbO
	 Su4NPmtFV5cfFfTtBw68Dk7U92vMsFY2Lj5Eatz+PoJfcjWS9NEoPOmO33pBQ5Gy+/
	 5StllYy3FG4a0mcZWRgJFOpqUlRy3lwo4mitmkipqHnq+CfHufvws2Kk+XraJArzeF
	 hNri98bWwj8duDW3+Sx6A/0J5C7oXK56crccqBerjMr3H/jewatAzdD7ecsFUmnaqy
	 GkJt7jhCw7GCmM5wggQXhXFBvKh+3ILR0W+Ma2Rkg74EXCeiucJhsMaF9GxCXxQW3f
	 j2D1lkdgXun8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A8839E9607;
	Sat, 13 Jun 2026 00:55:44 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLnB-FROix=2GN+ntrSpHPR5798-3pg6n9BH-uGd8rdX4g@mail.gmail.com>
References: <CAD++jLnB-FROix=2GN+ntrSpHPR5798-3pg6n9BH-uGd8rdX4g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLnB-FROix=2GN+ntrSpHPR5798-3pg6n9BH-uGd8rdX4g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.1-3
X-PR-Tracked-Commit-Id: 3f786abd23951f3f600a62fef42469d9200d5f52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 062871f1371b2e02a272ff5279c6479aff0a37ef
Message-Id: <178131214299.1313529.8603376207927774148.pr-tracker-bot@kernel.org>
Date: Sat, 13 Jun 2026 00:55:42 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 13 Jun 2026 00:21:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/062871f1371b2e02a272ff5279c6479aff0a37ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
