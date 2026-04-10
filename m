Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61E23DF01A;
	Fri, 10 Apr 2026 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839569; cv=none; b=byt3hrOcjy0d1Rq6kEXCXn9Ny51MsbSLXSytKaEuEPs358hVSNBV1zaHEnJ+rkfOIVBoGuGzrOUXb35gLDBWIJKvjFMIsKV87xI4o7F6zkiRZASQT7OuXEMPCpFb2RQ/1SaheBSiQ2D6gOCenZfx8iUMoBIVljUgRM7h8EwrVFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839569; c=relaxed/simple;
	bh=pG8iO9b9QqNErbe2ETM2MHySUzHS8uo1IYSO0wYROpM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=EZMDqweCSef64CGwRRgCHDwbmirEVy5NquWw8peXT1lNPLgv00IwLRoEBpMN9Tr4/F6JccMRjnG9KmKQFyIbQV9fJDAXjR9bU0tiAMN6BcxrJpGRdNfADRI/xREajzeTpf9bat9yCrd3smguKjS1JUW+xm0LnQtVLXcfcGnJ69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxda29CO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxda29CO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A821C19421;
	Fri, 10 Apr 2026 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839569;
	bh=pG8iO9b9QqNErbe2ETM2MHySUzHS8uo1IYSO0wYROpM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jxda29COwbzySdJO4OZJ4hOMnoKqZhgdS6mrL0sgLpqbpa0fcR7TIIOgZ+Uij5hbA
	 g5Kx890Q81jY2SgLdf5MJ5doIBGIH4LQBCBsQYPsxz5jWoRllEfI/beUhOEsU7+XCE
	 2zoEhWTaOfN40AX2oCHkJBYmKTjmErOa1QmLmBRxKNTO5u+UoYV4Y+wjRhaXL2k4Vn
	 YPXnu4mlnDRvtcM0eGI8EaGoEfvbAfJUdm9QH0nkoBq1ZpmiVKMTJZ5UBVfhSWqbRR
	 Dw0YzThdSLRJF7OEKtiSLJmBq+yye2btZS3XuBV/mHGMEeZ6qj7uiwGNxGehV10w/h
	 ydMy6DLcu5MxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CFF3809A87;
	Fri, 10 Apr 2026 16:45:45 +0000 (UTC)
Subject: Re: [GIT PULL] gpio fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260410084210.14239-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260410084210.14239-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260410084210.14239-1-bartosz.golaszewski@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0
X-PR-Tracked-Commit-Id: 57df6923ca53b524d06d2347b896d9de74b3bc86
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 017102b40c34b5a67de46230bdfb06096dd11716
Message-Id: <177583954373.2559624.14837506233893833241.pr-tracker-bot@kernel.org>
Date: Fri, 10 Apr 2026 16:45:43 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 10 Apr 2026 10:42:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/017102b40c34b5a67de46230bdfb06096dd11716

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
