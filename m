Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9C8379C55;
	Fri, 22 May 2026 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478730; cv=none; b=jkSzDTBrWNgJzLWjThexyyuH2Z0OcRBcq7uLXDeM6EAJuwm8GW0OTds2T3qWliXdnxRC6ofK4QvhINm/l+xf/jc+sw0O1plGFGS+QSc3dyt/NJT11zZ5VAFNd6slfIgGzwpmIjiNprTeCANoJTvH//jFLbTqEmSf2Qfi/JXNlik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478730; c=relaxed/simple;
	bh=/FFP2iuHfcwfDFia0S2xAzcwjfggLpk4cIP9YA35YsA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ph+hESaYwrsrvhgaddDaekIevocMnj9usWrc5EA0AVK6E/TGogaryLzNshceg4A2zk1fQUAzB2gRikpIqlTGeZfHeGgecvfrE3LQqUqFJ/mGwlgfljerol6uGpH7iGYC17smqjNy8j3s9wFZUVI061BaUmxDJD+2K1HBgbwbjdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1vbcdfI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1vbcdfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870471F000E9;
	Fri, 22 May 2026 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779478729;
	bh=uS2oq0loBkRJyOIpwgzCzSuF1jlb4DUzVSS/1sEFSfo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=f1vbcdfIFkRDeI1g0FtLGiQIX3PlrlZgyLrTdPastCGr81bxyKeBFxbkX/RClk8IY
	 6Dq0pLgzqnU2C4cIrzxdeXQIXUuTBZb2EKt2lNrSQS2gBi5J6tXgb+e4A8j1ZTU2h7
	 Pv1p1LYr8b0sm4NhyOMPB0IDDWOpMo4AC21ACkNbhsFbn9g/p1Zuz1UMXI4QGAfXuW
	 mzjH/d8+ab0rs7NjOYwTdpQnK1iy2MknyNhwlbisFwSrvzSwUpERKxxKalJ9UsOSZI
	 Tjf/AwE5GhveQKBtFQP1tclew24K7RxWkVUkIPlI0ybux3GQ+NWNkSGVl33jROU4wR
	 UmE4k8+xiTwAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A123930FBA;
	Fri, 22 May 2026 19:38:59 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.1-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260522093622.24099-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260522093622.24099-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260522093622.24099-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc5
X-PR-Tracked-Commit-Id: a4fa45c1d980bc2b9837f469119af24a9304a1fc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 99e08debac1a381d57bd50a26e377e27674d91b7
Message-Id: <177947873829.1341212.12178275081450192415.pr-tracker-bot@kernel.org>
Date: Fri, 22 May 2026 19:38:58 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 22 May 2026 11:36:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.1-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/99e08debac1a381d57bd50a26e377e27674d91b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
