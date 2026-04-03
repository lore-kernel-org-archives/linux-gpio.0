Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4209B3D75DE;
	Fri,  3 Apr 2026 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775245974; cv=none; b=EKqQWyvOrMF9Ir5CZi3kgKpP/UsVdKbw16rf2qYYJ41lTcf/UnwY/gmMlL4j8pVEKSFKNXhq0ke1qvmyCmXFsOogDcMYvJwlqGjoltM1oO4ktS/hD9BD6Mnmsb7V62xGquzWz72n3R+dVrQuXID76SPtVWm+sx1OdiZV+0IEiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775245974; c=relaxed/simple;
	bh=sbbkDmE4/BBnc6GMnTcAUtc+2mm80vg/mqmejDcWTSI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BUJ7vOXddkxkBGBI7yNCgsFFI1ve81UAlaQbOTcErf7sC+wFLxj+J5lT0PTWEpqvsOyu9XlfszmLl75URs0fWTmi4iIYeHpTtNdKw24LFdNuzs0SfBERcI189UJJ42tvDLrbECB+z1iayL44h4hdArZOCyonRTKL473hMgeaAzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdnpjR9z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdnpjR9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D384AC19424;
	Fri,  3 Apr 2026 19:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775245973;
	bh=sbbkDmE4/BBnc6GMnTcAUtc+2mm80vg/mqmejDcWTSI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pdnpjR9zWOq9Zc7yrjD0qHeFLT2S4xWrUrkFNySvqMe7VtPcrTgC84poroo5NsiDD
	 u1z53cBIzbMMhmY0U23a1dS2uaa14jeBpUnQI5Q/fjVYcVK+JNU2BJbrbNQXYMgIZp
	 CYp11s640uIXiL3xn/yGeSO37MvaCSmjHkOGAOZpPGZ8zdMoslRzmWsF6zr3Xu2W3z
	 P5Seup0xkeG/C3l81OrK9SvMvp1RHv248+Ctn+UeNNiMafO1+fLtjYi+Iia5QhOJ3K
	 BeDMb1gRI+4OSN5eBIurbAYa8709PrZtxpA6Btu5rsDY7PqD6uatMM2iftTgHBGUcH
	 0m3mCP+0S87rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B49453809A14;
	Fri,  3 Apr 2026 19:52:36 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260403121741.18145-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260403121741.18145-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260403121741.18145-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc7
X-PR-Tracked-Commit-Id: 6b5ef8c88854b343b733b574ea8754c9dab61f41
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 116a3308e1eb0ea59aa248e22ac29d65eb7cd250
Message-Id: <177524595538.1431632.2630520246008081761.pr-tracker-bot@kernel.org>
Date: Fri, 03 Apr 2026 19:52:35 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  3 Apr 2026 14:17:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/116a3308e1eb0ea59aa248e22ac29d65eb7cd250

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
