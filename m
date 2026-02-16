Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5E42FF161;
	Mon, 16 Feb 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274304; cv=none; b=XV19cpSdEHUF8ecHX7Oe0piQ8WMV11pttoOHQUcwNhHrRPM7UEcNn/G9YrRC01IXXm1UNBFSbJbW0C76VO8rmOFrknyUKPrAOHVQJW7yJNitpssPlVjwt4alVTftdVk4KmCMAB9WBnDlT99OhaGa7WFomTEDvilhE1TlgJL+sX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274304; c=relaxed/simple;
	bh=vGBLvU4ppJ77VrhLa32Z/pHBk1OK6abZqKJ5EBDZJRs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kHZuCkAXhjXpzBQmdkAanTD7+RASOGKTr+OykCMta8NA9BY1JvyUHLXHX0wXbgfJnRln65X3HDsaXhFc7MkCtzsXwlIS2ODyh9m0bx4X12eKzOSerRfDG5DY+yD1T9bxZHLy7pZLXNrnlB1nj1F9SqgTLHH17UvnW46LiWGG5Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5112D8G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5112D8G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45924C116C6;
	Mon, 16 Feb 2026 20:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771274304;
	bh=vGBLvU4ppJ77VrhLa32Z/pHBk1OK6abZqKJ5EBDZJRs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m5112D8GmZaRT9dEjsBu9Htfc5lNOhkD0MRfWLVsGNhJrH2hoHk1dXFXc6wDzvKVg
	 dhBZCJb0XpAx7P15OFW9vsDK9nL9G3CYAiGTimMwEyZakJ641u8Ew45IGuHJhqvdeo
	 PvHNBFa0FizY+dZfbVeG7R+VIyrmhYJz3sXKVNbKq5zI/PL2ZQGzIfh/Nk1lVQoyoo
	 aTGR+1RLZ1IY2WML/0xhU7N9RNjbWsnTLtNBkzRr2mtXDsMy9vxI/qrxjTavHeIVuo
	 C72lAqYZeXQ4YyUar/MaVKIYhdX9tlqBmQjJwJHoGtXqjlaxk3cB4RUWKGznmFQQhF
	 uuafA4N/Nawgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C268C39308C1;
	Mon, 16 Feb 2026 20:38:17 +0000 (UTC)
Subject: Re: [GIT PULL] pin control bulk changes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jL=AQZ3-SXjbHgHPvNppi0iMUHDG0S4uqaQXPs8rk3V5wg@mail.gmail.com>
References: <CAD++jL=AQZ3-SXjbHgHPvNppi0iMUHDG0S4uqaQXPs8rk3V5wg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jL=AQZ3-SXjbHgHPvNppi0iMUHDG0S4uqaQXPs8rk3V5wg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-1
X-PR-Tracked-Commit-Id: 9c5a40f2922a5a6d6b42e7b3d4c8e253918c07a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46a1daac56b3bf1bdbd8b37e6db811f015bc1f4b
Message-Id: <177127429642.3994460.5510856463177338701.pr-tracker-bot@kernel.org>
Date: Mon, 16 Feb 2026 20:38:16 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 16 Feb 2026 11:25:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46a1daac56b3bf1bdbd8b37e6db811f015bc1f4b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
