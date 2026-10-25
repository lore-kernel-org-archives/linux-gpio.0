Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792909137;
	b=f+xFRdzZYlgHF4dyvf6JRTZwRiqmJzM1/N/826+mHFwbT/0iEs4IMNG0RO8gRIsEKnRp
	 +/1l7NZYK6SYJwWZjRIUmY4MHCg13+NQi2l8FBFI9kxwWIvD2EjwWNBD4FjMW4SbaSS5B
	 exdDtuDgf94rJO0l6OdCzvpiLdHOmB0p09wsG01HPb1ArhUIvNYZBmZimNjjtZd31s4sd
	 OWttpr+WYICRznd2NkgjgUprZxmX6NBMMtf3aSh1e3tMv9En7gAb2tkaQLOOWsd3FEUtY
	 jCkoNbLfUoQOb6W3KVkmJqlwyRUE/uO0XrPp4YZYpgb+I01IlM4mBjpUo47HfZlXfHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792909137;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=7D98QtgrszZ5+cGjZdue2F1EnW/QjNuCfJbqw33kUD8=;
	b=OH6wQL81nNvsDRwaZBKqVfk9D3pebLJ1SnDhWBoq6rvf+IfkU0ldlaqPM6YXpeNOpXhP
	 0C4V0da5UImSSdV/4fPwByg07A3/8EhVltUcz57jyJAsG9MefXmw3F6h84wAMY3+XBM9y
	 YwRAJ6Bq6l7CNJ+PFUE/4o2M+Ykomsew/bdplv4lqhxdFE3vpPnpQVhV99oJupX7E7Mg0
	 OwCl/c2RMvLwG9nCFE9zpBNY5WeO0cbkvZQGDIZIA8WdY6xN1EUtmPtrSwGm0HhZWAkGb
	 A3Mp/VCiyvl/rITkkUEzyjc7g85rfdfZfhHlcSMV1s1OlD/icych5Up73dfeWl7/Ntg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hF6aVuvx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF740606A31A;
	Sun, 25 Oct 2026 06:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hF6aVuvx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62AF1F01825;
	Sun, 25 Oct 2026 06:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792909136;
	bh=7D98QtgrszZ5+cGjZdue2F1EnW/QjNuCfJbqw33kUD8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hF6aVuvx2MTt5NkC3foo3VInBreJwCERWKeVr6mKKEAlDh7o9G+8UnoiSN/FMOkRS
	 a+xX3se2qZr9rzlOnVa7tnK4KCXQzZfLEMu+ISP73vCbx2aSdLoq5z6ONRNPaYJKk9
	 HjfZ2xmiQxEYtJmpdLqknUIi8v4ZxLBuvBa9aZx8uvZKvH1dIqJI9oAM/ZqyCYnZ+L
	 o3SjhVxbs62lIyUaZ8pY9HZ1ZGRN6R8Bi6I5eGtvhZg7YrKfdtYHqOCpNxr1vIUxmK
	 SVSZGLUXqJ1EbT3XBvOr9Na0y+NUyiQ1o7ilv4nQBVPneyLm1ouj7vGFssphGRyh9T
	 Pi8YAIQdJvfJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE5C1392ED67;
	Sun, 25 Oct 2026 06:18:56 +0000 (UTC)
Subject: Re: [GIT PULL] pin control bulk changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAD++jL=OgP757Dzhmwv6xoeMwW8Aey8eCCsTFLfX8isxSPHW0g@mail.gmail.com>
References: <CAD++jL=OgP757Dzhmwv6xoeMwW8Aey8eCCsTFLfX8isxSPHW0g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAD++jL=OgP757Dzhmwv6xoeMwW8Aey8eCCsTFLfX8isxSPHW0g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.4-1
X-PR-Tracked-Commit-Id: f33a24cc012d34f25bb9942681bd478a1757b806
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a8c2facb7b2cef4d110e3b25037bc29703485c71
Message-Id: <179290913539.2017309.13059665732624569834.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2026 06:18:55 +0000
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 23 Oct 2026 00:36:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a8c2facb7b2cef4d110e3b25037bc29703485c71

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
