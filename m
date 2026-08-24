Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37DC376BCD
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589329; cv=none; b=BPbnVh28J4z3JwT95kCLEBZCrdfaWq+s0cPhaQl/swkN4hHDZYyxxhNdJRhqCzLvhgfopTbldOe+k3Kf76bOLAEG9RUABQXiviXvInfnos7Ghg4cl9omhmkQpghRot7tO+3a+Cdd6mrzwTZGRPpJDtjZpdj5P4+71IBo6AAdjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589329; c=relaxed/simple;
	bh=qCMoQ54FVVti6QDAPHuapDymiJH3wTEhZyz15sHiQyg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=X8PNvu1x08l1dGArF88bd2x10V/rNflGS5juZl8U6ONcFXL+TVmuODGTUmB+zI5934mN3VBJKFvSYNsRDB7yL2OGioqTh7SFVibwjubfqoengbABh74Z+d1vVcO/H6NhKxmkQ0HRQ1YMzYfR22tniI/cEcD83iAot/j2bMRijHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoNdZ6ya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoNdZ6ya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EA81F00A3A;
	Mon, 24 Aug 2026 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589327;
	bh=BfInJdOKQhbzZOhKlsDAUHGKgjjSEUlKxzNv4k4DJG8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=eoNdZ6yaqOBUINHvz+2nluAku6J2KhQmqxEaHmqDsD0akUnlQkQL/QBL04V+GOgB5
	 rRUYWrmommfzm7U7zTAxgAPrrp0P8gkPiYwnLKmmL6SUdTbWmbgD3/YHXiW1lDsnS6
	 6yHytzn+i9kTqxcOF40dWz6PuxeRd2kJaGqeoGfNgbXOigoBXLz5n7qJfyp7NPBsC6
	 /YB5Gisqw/uxC7pIvyOlOraej4QFelrvXMCCww3E8p/LpWe1enjd5cV4d3J5H7YHTH
	 a3zqDDGj4EuRcQxTjQYANnJksH2t76Tj3MzQpxHsmzfWJaUbGA/7EO8fDwdWh4P9et
	 bhel5iL158rQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B8E392446C;
	Mon, 24 Aug 2026 16:34:36 +0000 (UTC)
Subject: Re: [GIT PULL] pin control bulk changes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jLmw5z+=hx_L_CmumKFZQsGjUHTvgjO4rcpj47u9VSre4Q@mail.gmail.com>
References: <CAD++jLmw5z+=hx_L_CmumKFZQsGjUHTvgjO4rcpj47u9VSre4Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jLmw5z+=hx_L_CmumKFZQsGjUHTvgjO4rcpj47u9VSre4Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.3-1
X-PR-Tracked-Commit-Id: d067f0f4c96cb5402a111cf649b7bf9c5771ec74
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf9610f9116d55c5a66ef9f1faecacabd93a9322
Message-Id: <178758927490.3007333.6585417043712341199.pr-tracker-bot@kernel.org>
Date: Mon, 24 Aug 2026 16:34:34 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Aug 2026 11:07:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf9610f9116d55c5a66ef9f1faecacabd93a9322

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
