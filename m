Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8229748F848;
	Wed, 19 Aug 2026 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787160068; cv=none; b=ZhIqLnVTTSrQ/bk0GcAEiLK58iU0FwSuZ92Qp6/CcvN2L3l9KgG1gVaQmKVKvRaiAvR2LCHNOSkCtm4zKvX4LkA7IjyUekVMYZYbQId0RJ/Gqbd3s8JQmt5oa245huvLg82fGp015AmtXhyH2dtOPSBP2++Ygw0HQSNHWajk7jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787160068; c=relaxed/simple;
	bh=kcah+AjXLuMOAMmlmZZ5tnKUCPX3g4g6LtnKo7Cup9g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YLzuMeXONTdHDIif8g6QUux7c2DTJGDOtKFRUu8DogWB0thHp9m2/PHtwzq44TWmYVGRGA5wjzhw6zDF9J7TVVso5Df+Jrl/Qb74iFhd0AmDD0wiv8vp9ff+v0nA4vNDZcbMaElVq27bEViW6ynE3W6gkodAA118HjfX85ZuuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ft7TvPgS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ft7TvPgS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CED1F32F2A;
	Wed, 19 Aug 2026 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787160062;
	bh=PQwxpZzfETorjv2pj7JodnSNAxMTl/QzQnEDV4ZWeSc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ft7TvPgSxunJt+W1+7nSMKcm0krQ88h2DMNDdH3chtITW+p6Q75w9Yv2Q4pOUFJDF
	 dwPY/nGatNS/qkYbp7DfTntvsxVNLu5GCbGqDbLK1vHH7l7svfjVWeK7+6qE0+JWlo
	 eybaOlDoahwL5iyT7/oEHL2NRY6Ka/w7uMjfwWi5QSntAhgLvRKyYoXcFhdgHPLh5S
	 Az6KsnQZsGP/RwRlZKVZyuuSgodcycTCdF8RREHGyQ947IiqvWpumtQUeg9b8Q+d34
	 m1yYA1nmW/LOhBpKW1Ysqk1s98FuID3RbzTjjWJK6KWPx+Omi60CUcsLcyT8rDc2/K
	 ioNHhDQGBRx5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938BC38119E6;
	Wed, 19 Aug 2026 17:20:14 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v7.3-rc1 - take 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260818123221.61651-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260818123221.61651-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260818123221.61651-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.3-rc1-v2
X-PR-Tracked-Commit-Id: 146cc263e457ff6055fe7829e4f4f4b0b5d5dd86
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7711f4417f1870e4bfbee1a7d501f789255bc7aa
Message-Id: <178716001340.3599392.9714091009844655909.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 17:20:13 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 18 Aug 2026 14:32:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.3-rc1-v2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7711f4417f1870e4bfbee1a7d501f789255bc7aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
