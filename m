Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BA4319617;
	Thu, 13 Aug 2026 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639392; cv=none; b=pmRi8DbAUtJy7wZ4B/8OEI1lxN0VBafYB7ClsO0mDLGx+6F7+s+ewKgFXEmCy5N4tV0KcRMkGuoq+nQnBH7CDT70oOP5xu7z1PJUM0dKUut19uPOqA6v3CfeNVIA4eH88EcsaGavn6C9b5+GGh8RY87y5dnCOdsL6fWC+rwebBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639392; c=relaxed/simple;
	bh=8xJ0hgQAW59g6BA9/OGz+EA7tKhGRu4iaWpK7OOMdYk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nJ8RZfxNMF5Q2f4Y7xqSrkMPFaiGOyuUbPnKzqR3Y+hGgFiP0AjxLvy7Vpu9iLSnws9W2f0WIpK3W5qNgtO7H78phYNWGqPMzuBnBORd5gmmZfCmkDQ5BsNmVUTgpAIGES918O40SmNlbLgriNOlkkobSp791MaPseLcXl/3UIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikbvlEr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikbvlEr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58ED01F00A3E;
	Thu, 13 Aug 2026 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786639366;
	bh=L7iOn2CKF38vRTUbvpDbVHPCHy3zT1Hbn4HP65H7V9M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ikbvlEr6vHodetbXJunaLdEK/e0+fZLphGjAHM7ORs/qgoLtumcgZaUQVNbXD8Sa5
	 Qx1H1UZPjVmW75H1czEmKRokbbSz8hKvlEMiRfUVr+PgN4YFztavVrt8uFd8PGFd/C
	 CW3YxNizNTSdydoaLD5LyebliufdKpJJ2Dwzc9aB5J6sOtsToSZ4f0gmFT8JKCY39C
	 HAMIRJ6CKcgjhEj2JK+29LviapTV7ftLdROotVhG2rugO3gqZd/lvrKpxymbI1mfWD
	 CDsjLGtuafPi8l9N4gspaKagMiz30OvlIx5Z0I1M5P8xHYD0ucxvFK9NCNBFAONfJI
	 rYjiFxrGSWUbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A13380CEE2;
	Thu, 13 Aug 2026 16:42:02 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260813081748.9285-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260813081748.9285-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260813081748.9285-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2
X-PR-Tracked-Commit-Id: 44f3468a0aef1aabdad551898ab7cfa2a9d20e99
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4f5144d37403d529334573ef2a1bb6ca4a2c553
Message-Id: <178663932097.2953617.8645531188655124163.pr-tracker-bot@kernel.org>
Date: Thu, 13 Aug 2026 16:42:00 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 13 Aug 2026 10:17:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4f5144d37403d529334573ef2a1bb6ca4a2c553

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
