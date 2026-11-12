Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508306;
	b=460tOib4pFLB3vMmvBZvFpJKiEiylDxLnT85aX+EH04O3gb+1eHgXsxDDi1AN6eg0bzs
	 MfCPM+2nIjKWWjfGvrqDwMF8JAZwmX/BHfu7gnxGNuZp5mBnyxNa82cfCMXZOjMy9GCpX
	 nnUT7X4iIyNNYoK+JCbygHAWk4jgX7CVuv4dmVYV5Nc5h+gBLWkvtd0MkwjhmT4V+VoXG
	 HhR0aX6mB5TS92mtNLjZOk67tDEQB1204D1swLikBLqzzYnXD6P+gvbLCDKfzb/P2L2Pj
	 dgcVOUTAAZbjft2r8e2oD8tlgNtPfP5Sb47A/iW05++bw8G9anviXfEhZY9WU7b5yHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508306;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=14p9iW6f2s5IGSicHbLZEwYZZU92adoKfuAcHYkuAs0=;
	b=rwVX1xfwLbXbKsRQCaN5VGVtu2eWVSmWyCQsZZ+tvbfaVIW78uhOl3cc6Gl9zhJzeXUD
	 t+WzvSlrlNVWULcZy97APfUYi0qYrOwg99HIIURY0sAB/TgwCnd7o1mH3N1UtvXOHjRMQ
	 sZLw9HSv/hjK4mGzRA0PLjlSzBH8CqSwhBIxMS3JLi/RWzoX5w1KVFgJaB791bG4DRN6J
	 yRZYjFvl6kibL9URpfSnuEIjZI+a/Wyo5F7HvLW8wz9ycZdPeSVAJU+vwOp9100fCSACY
	 xY4TmaIyeSpADXqWnG+Ky8APHQ68pOwGG4Kwsizo0K2evhMTz1ud5v4n2VGJlxe7/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiE58WEm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7F606A332;
	Thu, 12 Nov 2026 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiE58WEm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7361F000C4;
	Thu, 12 Nov 2026 18:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794508306;
	bh=14p9iW6f2s5IGSicHbLZEwYZZU92adoKfuAcHYkuAs0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IiE58WEm1p1kh3ojYhrQQsYwdElmM/NJdHud+wc5AcH3f6t1PmFCOTrp+Aqr0o970
	 AKSJVlScQaHhPzrRDjdTSKKRaRjS8227ZZFVvly4BltUJmGOZKWiY40OjZ+iEemrVI
	 oX7sPyLZfVfVr2Aoy5e1G4WKCVB8jz4jWYhPFcXHeWSpJZkHlh4jWOkdzRElgQTavn
	 EE0AYTOiddCoti4Vac5lVSLPhwUb0Bb3z/E4Ch1VC/Lo2CGgll2+Ihs3N/rJHQsiC6
	 9vmjwuSaz5xfjlajBgYjXscH4TO2z28PG3qXwO4SJVtgQ0x9b+van6dpu5fc731/6C
	 KaMedNtjRHxJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16E2380AAFF;
	Thu, 12 Nov 2026 18:31:45 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261112155506.50717-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20261112155506.50717-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261112155506.50717-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.4-rc3
X-PR-Tracked-Commit-Id: f8a4fdf57cedb9cb3f47d94269ff27fea8e819e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f34775c0c4078189e179977c76d676663d0bf992
Message-Id: <179450830445.582195.108539536010013571.pr-tracker-bot@kernel.org>
Date: Thu, 12 Nov 2026 18:31:44 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 12 Nov 2026 16:55:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f34775c0c4078189e179977c76d676663d0bf992

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
