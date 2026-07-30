Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF65394461;
	Thu, 30 Jul 2026 19:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438947; cv=none; b=q15hk2DjM3HUdn8qg69+DfwjcG2UbsCTRj4aFnTCfAOzuztaYcvG/+IGASyZkvxlxwwOS8+jEVBgV4CGsT1j1YqWP33siaYBFdim+a+bQo1wrJR4XPpkSdG8TQWvBJI2zFe3vE40VXerLRmB1qQexP7a0/GB4T6PiZOpSuUVq9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438947; c=relaxed/simple;
	bh=5PZr+9ee5pnoHCyQIzR18Xfg9NNZAGm3YxFKcZTMNmk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TdvoDGbLtLNMnLytlupsXOmQP4OyahtbV+KpjpOh7X1ozZugwK/nJknoGdPf2JgVdal+l7116kFkrO/SQin48rPmYs8T7W0aEgi4Bd37G64j0S939QvptPKHZHg3WsaIyBbPgpL8tBnQLPv6GOheAUIwkoPCnYDFjp6+BtC0nrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQtVUlJp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQtVUlJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18981F00A3A;
	Thu, 30 Jul 2026 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785438935;
	bh=DGgbl7BXo0LA93oQ607EgIYlFwltYIg8Aw1IsizN4SQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NQtVUlJp11aBhqHqLhlfAHH/uH2lPu+ZIn/wJ4SNsB/SX42Y+RctrlwxSpgNcxCgK
	 vb5rOE/vM9f6S1DMzE/XqXGu1TBdxX1NmzCqgd6/4oPfC/szqqTwOO3q5pdb41kC2U
	 rXxDvp8+ZJbXrZo46uiz5Ws51keFI67QzJ7vEwiopqBqMHQitvYtNCnKGWrL9n34V+
	 4ssXa6dAkecZNFdnpPVpLoWU7TQG71CD+2/6CzXsuOo8AIlzVhxS8vYi6WJrjljRHE
	 H8IEWlG+/5SEnL80qlkyMjfjcCtR96kHKU96CC8PyhsQrRN11XJ/3735LkNKsF+89q
	 ylk5jgmL2a40A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5690F3811A6C;
	Thu, 30 Jul 2026 19:15:00 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.2-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260730075024.7320-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260730075024.7320-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260730075024.7320-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc6
X-PR-Tracked-Commit-Id: a02b8950d619123da64f69b70fe1dadef217dfe4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 110b5cdd5b72bcef01b8d4dfe45d922bdd16de0e
Message-Id: <178543889918.4145507.6621000888575017768.pr-tracker-bot@kernel.org>
Date: Thu, 30 Jul 2026 19:14:59 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jul 2026 09:50:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/110b5cdd5b72bcef01b8d4dfe45d922bdd16de0e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
